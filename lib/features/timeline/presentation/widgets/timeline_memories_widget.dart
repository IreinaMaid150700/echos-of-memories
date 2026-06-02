import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/router/app_routers.dart';
import 'package:music_app/features/timeline/presentation/cubit/timeline_cubit.dart';

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

// ────────────────────────────────────────────────────────────────
// 2. THEME
// ────────────────────────────────────────────────────────────────

class MemoriaTimelineTheme {
  final Color dotColorA;
  final Color dotColorB;
  final double dotRadius;
  final double dotBorderWidth;
  final Color dotBorderColor;
  final bool dotGlow;
  final Color lineColor;
  final double lineWidth;
  final bool lineGradient;
  final Color cardColor;
  final double cardRadius;
  final EdgeInsets cardPadding;
  final List<BoxShadow> cardShadow;
  final Color cardBorderColor;
  final double cardBorderWidth;
  final TextStyle titleStyle;
  final TextStyle bodyStyle;
  final TextStyle timeStyle;
  final TextStyle captionStyle;
  final Color tagBackground;
  final Color tagBorder;
  final Color tagForeground;
  final double chipRadius;
  final Color moodBackground;
  final Color moodBorder;
  final Color moodForeground;
  final Color moodIconColor;
  final double timeColumnWidth;
  final double dotColumnWidth;
  final double cardDotGap;
  final double entrySpacing;
  final double dotTopOffset;

  const MemoriaTimelineTheme({
    this.dotColorA = const Color(0xFFC05231),
    this.dotColorB = const Color(0xFF6B8F71),
    this.dotRadius = 6,
    this.dotBorderWidth = 2,
    this.dotBorderColor = const Color(0xFFF5EFE6),
    this.dotGlow = true,
    this.lineColor = const Color(0xFFE8C4B0),
    this.lineWidth = 1.5,
    this.lineGradient = true,
    this.cardColor = Colors.white,
    this.cardRadius = 16,
    this.cardPadding = const EdgeInsets.all(14),
    this.cardShadow = const [
      BoxShadow(color: Color(0x12C05231), blurRadius: 14, offset: Offset(0, 4)),
      BoxShadow(color: Color(0x0A000000), blurRadius: 4, offset: Offset(0, 1)),
    ],
    this.cardBorderColor = Colors.transparent,
    this.cardBorderWidth = 0,
    this.titleStyle = const TextStyle(
      fontSize: 14.5,
      fontWeight: FontWeight.w700,
      color: Color(0xFF2C1810),
      height: 1.3,
    ),
    this.bodyStyle = const TextStyle(
      fontSize: 12.5,
      color: Color(0xFF6B4F3A),
      height: 1.5,
    ),
    this.timeStyle = const TextStyle(
      fontSize: 11.5,
      fontWeight: FontWeight.w600,
      color: Color(0xFFC05231),
    ),
    this.captionStyle = const TextStyle(fontSize: 12, color: Color(0xFFA08070)),
    this.tagBackground = const Color(0xFFFDF7F2),
    this.tagBorder = const Color(0xFFE8D5C8),
    this.tagForeground = const Color(0xFF8A6A58),
    this.chipRadius = 20,
    this.moodBackground = const Color(0xFFFDF7F2),
    this.moodBorder = const Color(0xFFE0CFC5),
    this.moodForeground = const Color(0xFF7A5C4A),
    this.moodIconColor = const Color(0xFF6B8F71),
    this.timeColumnWidth = 68,
    this.dotColumnWidth = 22,
    this.cardDotGap = 10,
    this.entrySpacing = 18,
    this.dotTopOffset = 4,
  });
}

class MemoriaTimeline extends StatelessWidget {
  final List<TimelineEntry> entries;
  final MemoriaTimelineTheme theme;
  final Widget Function(BuildContext, TimelineEntry, MemoriaTimelineTheme)?
  cardBuilder;
  final Widget Function(
    BuildContext,
    TimelineEntry,
    MemoriaTimelineTheme,
    Color,
  )?
  dotBuilder;

  const MemoriaTimeline({
    super.key,
    required this.entries,
    this.theme = const MemoriaTimelineTheme(),
    this.cardBuilder,
    this.dotBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(entries.length, (i) {
        return _TimelineRow(
          entry: entries[i],
          isLast: i == entries.length - 1,
          theme: theme,
          cardBuilder: cardBuilder,
          dotBuilder: dotBuilder,
        );
      }),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  final TimelineEntry entry;
  final bool isLast;
  final MemoriaTimelineTheme theme;
  final Widget Function(BuildContext, TimelineEntry, MemoriaTimelineTheme)?
  cardBuilder;
  final Widget Function(
    BuildContext,
    TimelineEntry,
    MemoriaTimelineTheme,
    Color,
  )?
  dotBuilder;

  const _TimelineRow({
    required this.entry,
    required this.isLast,
    required this.theme,
    this.cardBuilder,
    this.dotBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final t = theme;
    final dotColor = entry.dot == DotVariant.primary
        ? t.dotColorA
        : t.dotColorB;

    return GestureDetector(
      onTap: () async {
        if (entry.id != null) {
          await context.router.push(MomentDetailRoute(momentId: entry.id!));
          if (context.mounted) {
            context.read<TimelineCubit>().loadMoments();
          }
        }
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: isLast ? 0 : t.entrySpacing),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: t.timeColumnWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: t.dotTopOffset),
                    Text(
                      entry.time,
                      style: t.timeStyle.copyWith(color: dotColor),
                    ),
                    if (entry.leadingIcon != null) ...[
                      const SizedBox(height: 5),
                      entry.leadingIcon!,
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: t.dotColumnWidth,
                child: Column(
                  children: [
                    SizedBox(height: t.dotTopOffset),
                    dotBuilder != null
                        ? dotBuilder!(context, entry, t, dotColor)
                        : _DefaultDot(theme: t, color: dotColor),
                    if (!isLast)
                      Expanded(
                        child: Center(
                          child: Container(
                            width: t.lineWidth,
                            decoration: BoxDecoration(
                              gradient: t.lineGradient
                                  ? LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        dotColor.withOpacity(0.4),
                                        t.lineColor,
                                      ],
                                    )
                                  : null,
                              color: t.lineGradient ? null : t.lineColor,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(width: t.cardDotGap),
              Expanded(
                child: cardBuilder != null
                    ? cardBuilder!(context, entry, t)
                    : _DefaultCard(entry: entry, theme: t),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DefaultDot extends StatelessWidget {
  final MemoriaTimelineTheme theme;
  final Color color;
  const _DefaultDot({required this.theme, required this.color});

  @override
  Widget build(BuildContext context) {
    final d = theme.dotRadius * 2;
    return Container(
      width: d,
      height: d,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          color: theme.dotBorderColor,
          width: theme.dotBorderWidth,
        ),
        boxShadow: theme.dotGlow
            ? [
                BoxShadow(
                  color: color.withOpacity(0.4),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
    );
  }
}

class _DefaultCard extends StatelessWidget {
  final TimelineEntry entry;
  final MemoriaTimelineTheme theme;
  const _DefaultCard({required this.entry, required this.theme});

  @override
  Widget build(BuildContext context) {
    final t = theme;
    return Container(
      decoration: BoxDecoration(
        color: t.cardColor,
        borderRadius: BorderRadius.circular(t.cardRadius),
        border: t.cardBorderWidth > 0
            ? Border.all(color: t.cardBorderColor, width: t.cardBorderWidth)
            : null,
        boxShadow: t.cardShadow,
      ),
      padding: t.cardPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          entry.thumbnail != null
              ? _CardWithThumbnail(entry: entry, theme: t)
              : _CardTextOnly(entry: entry, theme: t),
          if (entry.location != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 12,
                  color: t.captionStyle.color,
                ),
                const SizedBox(width: 3),
                Text(entry.location!, style: t.captionStyle),
              ],
            ),
          ],
          if (entry.tags.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 5,
              children: entry.tags
                  .map((tag) => _TagChip(label: tag, theme: t))
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }
}

class _CardWithThumbnail extends StatelessWidget {
  final TimelineEntry entry;
  final MemoriaTimelineTheme theme;
  const _CardWithThumbnail({required this.entry, required this.theme});

  @override
  Widget build(BuildContext context) {
    final t = theme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(width: 80, height: 80, child: entry.thumbnail),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TitleRow(entry: entry, theme: t),
              if (entry.body != null) ...[
                const SizedBox(height: 5),
                Text(
                  entry.body!,
                  style: t.bodyStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              if (entry.mood != null) ...[
                const SizedBox(height: 7),
                _MoodChip(label: entry.mood!, theme: t),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _CardTextOnly extends StatelessWidget {
  final TimelineEntry entry;
  final MemoriaTimelineTheme theme;
  const _CardTextOnly({required this.entry, required this.theme});

  @override
  Widget build(BuildContext context) {
    final t = theme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TitleRow(entry: entry, theme: t),
        if (entry.body != null) ...[
          const SizedBox(height: 5),
          Text(
            entry.body!,
            style: t.bodyStyle,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        if (entry.mood != null) ...[
          const SizedBox(height: 7),
          _MoodChip(label: entry.mood!, theme: t),
        ],
      ],
    );
  }
}

class _TitleRow extends StatelessWidget {
  final TimelineEntry entry;
  final MemoriaTimelineTheme theme;
  const _TitleRow({required this.entry, required this.theme});

  @override
  Widget build(BuildContext context) {
    final t = theme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Text(entry.title, style: t.titleStyle)),
        if (entry.bookmarked) ...[
          const SizedBox(width: 6),
          Icon(Icons.bookmark_rounded, color: t.dotColorA, size: 17),
        ],
      ],
    );
  }
}

class _MoodChip extends StatelessWidget {
  final String label;
  final MemoriaTimelineTheme theme;
  const _MoodChip({required this.label, required this.theme});

  @override
  Widget build(BuildContext context) {
    final t = theme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: t.moodBackground,
        borderRadius: BorderRadius.circular(t.chipRadius),
        border: Border.all(color: t.moodBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.eco, size: 10, color: t.moodIconColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.5,
              color: t.moodForeground,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;
  final MemoriaTimelineTheme theme;
  const _TagChip({required this.label, required this.theme});

  @override
  Widget build(BuildContext context) {
    final t = theme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: t.tagBackground,
        borderRadius: BorderRadius.circular(t.chipRadius),
        border: Border.all(color: t.tagBorder),
      ),
      child: Text(
        "#$label",
        style: TextStyle(fontSize: 11.5, color: t.tagForeground),
      ),
    );
  }
}
