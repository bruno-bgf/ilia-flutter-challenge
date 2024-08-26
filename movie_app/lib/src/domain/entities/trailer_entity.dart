import 'package:equatable/equatable.dart';

class TrailerEntity extends Equatable {
  final int? id;
  final String? key;

  const TrailerEntity({
    required this.id,
    required this.key,
  });

  @override
  List<Object?> get props => [
        id,
        key,
      ];
}
