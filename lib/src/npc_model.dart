class NPC {
  NPC.fromJson(Map<String, dynamic> json) {
    if (json['path'] is String) {
      name = (json['path'] as String).split('/').lastOrNull?.split('.').firstOrNull?.replaceAll('_', ' ');
    }
  }

  String? name;
  String? transcripts;

  void updateFromJson(Map<String, dynamic> json) {
    if (json['data'] is String) transcripts = json['data'] as String;
  }
}
