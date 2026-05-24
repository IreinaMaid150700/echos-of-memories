import 'package:equatable/equatable.dart';

class IntroductionContentModel extends Equatable {
  final String? title;

  final List<String> description;

  final String? animationPath;

  const IntroductionContentModel({
    this.title,
    this.description = const [],
    this.animationPath,
  });

  @override
  List<Object?> get props => [title, description, animationPath];
}
