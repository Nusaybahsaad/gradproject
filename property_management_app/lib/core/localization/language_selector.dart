import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'language_provider.dart';

class LanguageSelector extends ConsumerWidget {
  final Color? color;

  const LanguageSelector({super.key, this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(languageProvider);

    return IconButton(
      icon: Text(
        currentLocale.languageCode == 'en' ? 'عربي' : 'English',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color ?? Theme.of(context).primaryColor,
        ),
      ),
      onPressed: () {
        ref.read(languageProvider.notifier).toggleLanguage();
      },
      tooltip: 'Change Language',
    );
  }
}
