import 'package:movie_app/src/domain/domain.dart';

class TrailerModel extends TrailerEntity {
  const TrailerModel({
    super.key,
    super.id,
  });

  factory TrailerModel.fromJson(Map<String, dynamic> json) => TrailerModel(
        key: json['key'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['key'] = key;
    data['id'] = id;
    return data;
  }
}
