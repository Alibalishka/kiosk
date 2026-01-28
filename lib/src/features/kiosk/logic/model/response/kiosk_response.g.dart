// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kiosk_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KioskResponse _$KioskResponseFromJson(Map<String, dynamic> json) =>
    KioskResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : KioskDatum.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KioskResponseToJson(KioskResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

KioskDatum _$KioskDatumFromJson(Map<String, dynamic> json) => KioskDatum(
      kiosk: json['kiosk'] == null
          ? null
          : Kiosk.fromJson(json['kiosk'] as Map<String, dynamic>),
      idleTimeout: (json['idle_timeout'] as num?)?.toInt(),
      connection: json['connection'] == null
          ? null
          : Connection.fromJson(json['connection'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$KioskDatumToJson(KioskDatum instance) =>
    <String, dynamic>{
      'kiosk': instance.kiosk,
      'idle_timeout': instance.idleTimeout,
      'connection': instance.connection,
      'token': instance.token,
    };

Connection _$ConnectionFromJson(Map<String, dynamic> json) => Connection(
      kioskId: (json['kiosk_id'] as num?)?.toInt(),
      itemId: (json['item_id'] as num?)?.toInt(),
      connectedAt: json['connected_at'] == null
          ? null
          : DateTime.parse(json['connected_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: (json['id'] as num?)?.toInt(),
      item: json['item'] == null
          ? null
          : KioskItem.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConnectionToJson(Connection instance) =>
    <String, dynamic>{
      'kiosk_id': instance.kioskId,
      'item_id': instance.itemId,
      'connected_at': instance.connectedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
      'item': instance.item,
    };

KioskItem _$KioskItemFromJson(Map<String, dynamic> json) => KioskItem(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] == null
          ? null
          : Address.fromJson(json['name'] as Map<String, dynamic>),
      description: json['description'] == null
          ? null
          : Address.fromJson(json['description'] as Map<String, dynamic>),
      userId: json['user_id'],
      reasonId: json['reason_id'],
      organizationId: (json['organization_id'] as num?)?.toInt(),
      userAddressId: json['user_address_id'],
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      catalogId: (json['catalog_id'] as num?)?.toInt(),
      gotN8N: (json['got_n8_n'] as num?)?.toInt(),
      slug: json['slug'] as String?,
      reviewAvg: json['review_avg'],
      type: (json['type'] as num?)?.toInt(),
      source: json['source'] as String?,
      publishedAt: json['published_at'],
      status: (json['status'] as num?)?.toInt(),
      isActive: json['is_active'] as bool?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      cityId: (json['city_id'] as num?)?.toInt(),
      position: (json['position'] as num?)?.toInt(),
      maxKioskConnections: (json['max_kiosk_connections'] as num?)?.toInt(),
    );

Map<String, dynamic> _$KioskItemToJson(KioskItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'user_id': instance.userId,
      'reason_id': instance.reasonId,
      'organization_id': instance.organizationId,
      'user_address_id': instance.userAddressId,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'catalog_id': instance.catalogId,
      'got_n8_n': instance.gotN8N,
      'slug': instance.slug,
      'review_avg': instance.reviewAvg,
      'type': instance.type,
      'source': instance.source,
      'published_at': instance.publishedAt,
      'status': instance.status,
      'is_active': instance.isActive,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'city_id': instance.cityId,
      'position': instance.position,
      'max_kiosk_connections': instance.maxKioskConnections,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      ru: json['ru'] as String?,
      en: json['en'] as String?,
      kk: json['kk'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'ru': instance.ru,
      'en': instance.en,
      'kk': instance.kk,
    };

Kiosk _$KioskFromJson(Map<String, dynamic> json) => Kiosk(
      id: (json['id'] as num?)?.toInt(),
      deviceId: json['device_id'] as String?,
      name: json['name'],
      model: json['model'] as String?,
      batteryLevel: json['battery_level'],
      batteryStatus: json['battery_status'],
      networkLevel: json['network_level'],
      networkType: json['network_type'],
      screenStatus: json['screen_status'],
      status: json['status'] as String?,
      image: json['image'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$KioskToJson(Kiosk instance) => <String, dynamic>{
      'id': instance.id,
      'device_id': instance.deviceId,
      'name': instance.name,
      'model': instance.model,
      'battery_level': instance.batteryLevel,
      'battery_status': instance.batteryStatus,
      'network_level': instance.networkLevel,
      'network_type': instance.networkType,
      'screen_status': instance.screenStatus,
      'status': instance.status,
      'image': instance.image,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
