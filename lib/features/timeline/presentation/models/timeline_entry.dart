import 'package:flutter/material.dart';

/// Một mục hiển thị trên timeline (đã map từ read model sang dữ liệu UI).
class TimelineEntry {
  final String? id;
  final String time;
  final String title;
  final String? body;
  final String? mood;
  final String? location;
  final List<String> tags;
  final Widget? leadingIcon;
  final Widget? thumbnail;
  final DotVariant dot;
  final bool bookmarked;

  const TimelineEntry({
    this.id,
    required this.time,
    required this.title,
    this.body,
    this.mood,
    this.location,
    this.tags = const [],
    this.leadingIcon,
    this.thumbnail,
    this.dot = DotVariant.primary,
    this.bookmarked = false,
  });
}

enum DotVariant { primary, secondary }
