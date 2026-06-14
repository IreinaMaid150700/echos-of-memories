import 'package:flutter/material.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/features/timeline/presentation/models/timeline_entry.dart';
import 'package:music_app/features/timeline/presentation/widgets/timeline_chips.dart';
import 'package:music_app/features/timeline/presentation/widgets/timeline_theme.dart';

/// Card mặc định hiển thị nội dung một [TimelineEntry].
class TimelineCard extends StatelessWidget {
  final TimelineEntry entry;
  final MemoriaTimelineTheme theme;

  const TimelineCard({super.key, required this.entry, required this.theme});

  @override
  Widget build(BuildContext context) {
    final t = theme;
    final cardBg = t.cardColor ?? context.themeColors.surface;
    final cardBorderCol = t.cardBorderColor ?? context.themeColors.borderSubtle;
    final cardBorderW = t.cardBorderWidth > 0 ? t.cardBorderWidth : 1.0;
    final cardShadows =
        t.cardShadow ??
        [
          BoxShadow(
            color: context.themeColors.primary.withValues(alpha: 0.08),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ];
    final textStyleCaption =
        t.captionStyle ??
        context.textTheme.bodySmall?.copyWith(
          color: context.themeColors.textMuted,
        ) ??
        const TextStyle(fontSize: 12, color: Color(0xFFA08070));

    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(t.cardRadius),
        border: Border.all(color: cardBorderCol, width: cardBorderW),
        boxShadow: cardShadows,
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
                  color: textStyleCaption.color,
                ),
                const SizedBox(width: 3),
                Flexible(
                  child: Text(
                    entry.location!,
                    style: textStyleCaption,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
          if (entry.tags.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 5,
              children: entry.tags
                  .map((tag) => TimelineTagChip(label: tag, theme: t))
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
    final textStyleBody =
        t.bodyStyle ??
        context.textTheme.bodyMedium?.copyWith(
          color: context.themeColors.textSecondary,
          height: 1.5,
        ) ??
        const TextStyle(fontSize: 12.5, color: Color(0xFF6B4F3A), height: 1.5);
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
                  style: textStyleBody,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              if (entry.mood != null) ...[
                const SizedBox(height: 7),
                TimelineMoodChip(label: entry.mood!, theme: t),
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
    final textStyleBody =
        t.bodyStyle ??
        context.textTheme.bodyMedium?.copyWith(
          color: context.themeColors.textSecondary,
          height: 1.5,
        ) ??
        const TextStyle(fontSize: 12.5, color: Color(0xFF6B4F3A), height: 1.5);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TitleRow(entry: entry, theme: t),
        if (entry.body != null) ...[
          const SizedBox(height: 5),
          Text(
            entry.body!,
            style: textStyleBody,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        if (entry.mood != null) ...[
          const SizedBox(height: 7),
          TimelineMoodChip(label: entry.mood!, theme: t),
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
    final textStyleTitle =
        t.titleStyle ??
        context.textTheme.titleMedium?.copyWith(
          color: context.themeColors.textPrimary,
          fontWeight: FontWeight.bold,
        ) ??
        const TextStyle(
          fontSize: 14.5,
          fontWeight: FontWeight.w700,
          color: Color(0xFF2C1810),
          height: 1.3,
        );
    final fallbackDotColorA = context.themeColors.primary;
    final bookmarkCol = t.dotColorA ?? fallbackDotColorA;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Text(entry.title, style: textStyleTitle)),
        if (entry.bookmarked) ...[
          const SizedBox(width: 6),
          Icon(Icons.bookmark_rounded, color: bookmarkCol, size: 17),
        ],
      ],
    );
  }
}
