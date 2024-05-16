import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String data;
  final int? trimLines;
  final TextAlign? textAlign;
  final String trimCollapsedText;
  final String trimExpandedText;
  final TextStyle? textStyle;
  final TextStyle? textTrimStyle; 

  const ReadMoreText(this.data, {
    super.key,
    this.trimLines,
    this.textAlign,
    this.trimCollapsedText = "",
    this.trimExpandedText = "",
    this.textStyle,
    this.textTrimStyle
  });

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.data,
          textAlign: widget.textAlign,
          style: widget.textStyle,
          maxLines: _isExpanded ? null : widget.trimLines,
          overflow: _isExpanded ? null : TextOverflow.ellipsis,
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded ^= true;
            });
          },
          child: Text(
            _isExpanded ? widget.trimExpandedText : widget.trimCollapsedText,
            style: widget.textTrimStyle
          ),
        ),
      ],
    );
  }
}