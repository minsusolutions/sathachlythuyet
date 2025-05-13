import 'package:equatable/equatable.dart';

class SettingLiciense extends Equatable {
  final String title;
  final String description;
  final String image;

  const SettingLiciense({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [title, description, image];
}
