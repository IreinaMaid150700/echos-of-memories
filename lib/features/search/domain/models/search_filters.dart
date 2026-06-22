import 'package:equatable/equatable.dart';

/// Value object describing an active search query.
class SearchFilters extends Equatable {
  final String? text;
  final String? moodId;

  const SearchFilters({this.text, this.moodId});

  @override
  List<Object?> get props => [text, moodId];
}
