class VideoModel {
  String? key;
  String? id;

  VideoModel({
    this.key,
    this.id,
  });

  VideoModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['key'] = key;
    data['id'] = id;
    return data;
  }
}
