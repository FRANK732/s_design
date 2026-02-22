import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      if (mounted)
        setState(() => _copied = false);
    });
  }

  @override
  Widget build(
      BuildContext
          context) {
    return Container(
      decoration:
          BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF333333)),
      ),
      child:
          Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Toolbar
          Container(
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: const BoxDecoration(
              color: Color(0xFF2D2D2D),
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Row(
              children: [
                const Text(
                  'Dart',
                  style: TextStyle(
                    color: Color(0xFF858585),
                    fontSize: 11,
                    fontFamily: 'monospace',
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
                        color: _copied ? const Color(0xFF4CAF50) : const Color(0xFF858585),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _copied ? 'Copied!' : 'Copy',
                        style: TextStyle(
                          fontSize: 11,
                          color: _copied ? const Color(0xFF4CAF50) : const Color(0xFF858585),
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
            child: SelectableText(
              widget.code.trim(),
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 13,
                color: Color(0xFFD4D4D4),
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
