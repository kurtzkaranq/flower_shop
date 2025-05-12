class SyncData {
  static final SyncData _singleton = SyncData._internal();
  factory SyncData() {
    return _singleton;
  }
  SyncData._internal();
  String username = '';
}
