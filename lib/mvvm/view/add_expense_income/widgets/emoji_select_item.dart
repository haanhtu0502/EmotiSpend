import 'package:emoti_spend/core/design_system/app_text_style.dart';
import 'package:emoti_spend/mvvm/data/enum/emotion.dart';
import 'package:flutter/material.dart';

class EmojiSelectItem extends StatefulWidget {
  const EmojiSelectItem({
    super.key,
    required this.item,
    this.isSelect = false,
    required this.onSelect,
  });

  final Emotion item;
  final bool isSelect;
  final void Function(Emotion item) onSelect;

  @override
  State<EmojiSelectItem> createState() => _EmojiSelectItemState();
}

class _EmojiSelectItemState extends State<EmojiSelectItem> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        widget.onSelect(widget.item);
      },
      child: Transform.scale(
        scale: widget.isSelect ? 1.1 : 1,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            // horizontal: 16,
          ),

          decoration: BoxDecoration(
            color: widget.isSelect ? null : const Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(16),
            gradient: widget.isSelect
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFFE4E6), // from-pink-100
                      Color(0xFFE9D5FF), // to-purple-100
                    ],
                  )
                : null,
          ),
          child: Column(
            children: [
              Text(widget.item.toEmoji, style: const TextStyle(fontSize: 24)),
              const SizedBox(height: 4),
              Text(
                widget.item.toText,
                style: AppTextStyles.titleSmall.copyWith(
                  color: theme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
