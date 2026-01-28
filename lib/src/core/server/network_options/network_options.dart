class NetworkOptions {
  NetworkOptions({this.onReceiveProgress, this.onSendProgress});
  void Function(int, int)? onReceiveProgress;
  void Function(int, int)? onSendProgress;
}
