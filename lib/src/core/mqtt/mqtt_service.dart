import 'dart:convert';
import 'dart:developer';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:qr_pay_app/src/features/kiosk/service/device_id_service.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';

class MqttService {
  final List<String> brokers = ['91.147.110.78', '91.147.110.36'];
  final String username = 'kiosk_piosk_01';
  final String password = '12345678';
  final String clientId = 'kiosk_client_${DateTime.now().millisecondsSinceEpoch}';

  MqttServerClient? _client;
  bool _intentionallyDisconnected = false;
  bool _isConnecting = false;

  Future<void> connect() async {
    if (_isConnecting) return;
    _isConnecting = true;
    _intentionallyDisconnected = false;
    
    for (String broker in brokers) {
      try {
        log('Attempting to connect to MQTT broker: $broker');
        _client = MqttServerClient(broker, clientId);
        _client!.logging(on: false);
        _client!.keepAlivePeriod = 20;
        _client!.onDisconnected = onDisconnected;
        _client!.onConnected = onConnected;
        _client!.onSubscribed = onSubscribed;
        
        final deviceId = await const DeviceIdService().getOrCreate();
        final tenantId = sl<HostStorage>().getHost() ?? 'sandyq';
        final lwtTopic = 'tenants/$tenantId/kiosks/$deviceId/lwt';

        final connMess = MqttConnectMessage()
            .withClientIdentifier(clientId)
            .startClean()
            .withWillQos(MqttQos.atLeastOnce)
            .withWillTopic(lwtTopic)
            .withWillMessage('offline')
            .withWillRetain();
            
        _client!.connectionMessage = connMess;

        await _client!.connect(username, password);

        if (_client!.connectionStatus!.state == MqttConnectionState.connected) {
          log('MQTT Connected successfully to $broker!');
          
          final commandTopic = 'tenants/$tenantId/kiosks/$deviceId/command';
          final responseTopic = 'tenants/$tenantId/kiosks/$deviceId/command/response';

          _client!.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
            final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
            final String pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
            final topic = c[0].topic;
            log('MQTT: Received message on topic <$topic>: $pt');

            try {
              if (topic == commandTopic) {
                final Map<String, dynamic> data = jsonDecode(pt);
                final correlationId = data['correlation_id'];
                final command = data['command'];

                final responsePayload = {
                  "correlation_id": correlationId,
                  "status": "acknowledged",
                  "result": null,
                  "result_type": null,
                  "message": null,
                };
                
                publish(responseTopic, jsonEncode(responsePayload));
                log('Command "$command" received and acknowledged');
              }
            } catch (e) {
              log('MQTT: Error parsing incoming command: $e');
            }
          });

          _isConnecting = false;
          return; // Connected successfully, exit the loop
        } else {
          log('MQTT Connection failed, state is ${_client!.connectionStatus!.state}');
          _client!.disconnect();
        }
      } catch (e) {
        log('Exception connecting to broker $broker: $e');
        _client?.disconnect();
      }
    }
    
    _isConnecting = false;
    if (!_intentionallyDisconnected) {
      log('Failed to connect to all provided MQTT brokers. Retrying in 5 seconds...');
      Future.delayed(const Duration(seconds: 5), () {
        connect();
      });
    }
  }

  void onConnected() async {
    try {
      log('MQTT: Connected');
      // Subscribe to topics here if needed
      
      final deviceId = await const DeviceIdService().getOrCreate();
      final tenantId = sl<HostStorage>().getHost() ?? 'sandyq';
      final lwtTopic = 'tenants/$tenantId/kiosks/$deviceId/lwt';
      final commandTopic = 'tenants/$tenantId/kiosks/$deviceId/command';
      log('MQTT LWT Topic: $lwtTopic');

      _client?.subscribe(commandTopic, MqttQos.atLeastOnce);
      log('MQTT: Subscribed to $commandTopic');

      final builder = MqttClientPayloadBuilder();
      builder.addString('online');
      _client?.publishMessage(lwtTopic, MqttQos.atLeastOnce, builder.payload!, retain: true);
      log('MQTT: Published "online" birth message');
    } catch (e) {
      log('Exception in MQTT onConnected: $e');
    }
  }

  void onDisconnected() {
    log('MQTT: Disconnected');
    
    if (_isConnecting) {
      // Игнорируем вызов onDisconnected, если мы находимся в процессе подключения,
      // так как метод connect() сам обработает неудачу и попробует следующий IP.
      return;
    }
    
    if (_intentionallyDisconnected) {
      log('MQTT: Intentionally disconnected, not reconnecting.');
      return;
    }
    log('MQTT: Unintentional disconnect, attempting failover/reconnect in 5 seconds...');
    Future.delayed(const Duration(seconds: 5), () {
      connect();
    });
  }

  void onSubscribed(String topic) {
    log('MQTT: Subscribed to $topic');
  }

  void publish(String topic, String message, {bool retain = false}) {
    if (_client?.connectionStatus?.state != MqttConnectionState.connected) {
      log('MQTT: Cannot publish, not connected');
      return;
    }
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    _client?.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!, retain: retain);
    log('MQTT: Published to $topic: $message');
  }
  
  void disconnect() {
    log('MQTT: Disconnecting...');
    _intentionallyDisconnected = true;
    _client?.disconnect();
  }
}

