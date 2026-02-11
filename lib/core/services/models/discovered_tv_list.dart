class DiscoveredTvList {
  String? friendlyName;
  String? scheme;
  int? port;
  String? host;
  bool isConnected;
  DiscoveredTvList({
    required this.friendlyName,
    required this.host,
    required this.isConnected,
    required this.port,
    required this.scheme,
  });
}
