import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/atom-one-dark.dart';
import 'package:flutter_highlighter/themes/github.dart';
import 'package:google_fonts/google_fonts.dart';

/// A dark-themed code card with a copy button.
class CodeSnippet
    extends StatefulWidget {
  const CodeSnippet(
      {super.key,
      required this.code});

  final String
      code;

  @override
  State<CodeSnippet>
      createState() =>
          _CodeSnippetState();
}

class _CodeSnippetState
    extends State<
        CodeSnippet> {
  bool
      _copied =
      false;

  void
      _copy() {
    Clipboard.setData(
        ClipboardData(text: widget.code));
    setState(() =>
        _copied = true);
    Future.delayed(
        const Duration(seconds: 2),
        () {
      if (mounted) {
        setState(() => _copied = false);
      }
    });
  }

  @override
  Widget build(
      BuildContext
          context) {
    final bool
        isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration:
          BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF6F8FA),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? const Color(0xFF333333) : const Color(0xFFD0D7DE),
        ),
      ),
      child:
          Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF2D2D2D) : const Color(0xFFEBEEF2),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Row(
              children: [
                Text(
                  'Dart',
                  style: TextStyle(
                    color: isDark ? const Color(0xFF858585) : const Color(0xFF57606A),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: _copy,
                  child: Row(
                    children: [
                      Icon(
                        _copied ? Icons.check : Icons.copy,
                        size: 14,
                        color: _copied ? const Color(0xFF4CAF50) : (isDark ? const Color(0xFF858585) : const Color(0xFF57606A)),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _copied ? 'Copied!' : 'Copy',
                        style: TextStyle(
                          fontSize: 11,
                          color: _copied ? const Color(0xFF4CAF50) : (isDark ? const Color(0xFF858585) : const Color(0xFF57606A)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Code
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(16),
            child: HighlightView(
              widget.code.trim(),
              language: 'dart',
              theme: isDark ? atomOneDarkTheme : githubTheme,
              padding: EdgeInsets.zero,
              textStyle: GoogleFonts.firaCode(
                fontSize: 13,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
