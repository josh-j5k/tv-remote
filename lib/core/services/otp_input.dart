import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpInput extends StatefulWidget {
  final int length;
  final double fieldWidth;
  final double fieldHeight;
  final double spacing;
  final TextStyle? textStyle;
  final InputDecoration? decoration;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChanged;
  final bool autoFocus;
  final bool obscureText;
  final Color? fillColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;

  const OtpInput({
    super.key,
    this.length = 6,
    this.fieldWidth = 50,
    this.fieldHeight = 60,
    this.spacing = 10,
    this.textStyle,
    this.decoration,
    this.onCompleted,
    this.onChanged,
    this.autoFocus = true,
    this.obscureText = false,
    this.fillColor,
    this.focusedBorderColor,
    this.enabledBorderColor,
  });

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  List<String> _values = [];

  @override
  void initState() {
    super.initState();
    _values = List.filled(widget.length, '');
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );
    _focusNodes = List.generate(widget.length, (index) => FocusNode());

    if (widget.autoFocus && _focusNodes.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNodes[0].requestFocus();
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.length > 1) {
      // Handle paste
      _handlePaste(index, value);
      return;
    }

    setState(() {
      _values[index] = value;
    });

    if (value.isNotEmpty && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    String otpValue = _values.join();
    widget.onChanged?.call(otpValue);

    if (otpValue.length == widget.length) {
      widget.onCompleted?.call(otpValue);
    }
  }

  void _handlePaste(int startIndex, String pastedText) {
    // String digitsOnly = pastedText.replaceAll(RegExp(r'\D'), '');

    for (
      int i = 0;
      i < pastedText.length && (startIndex + i) < widget.length;
      i++
    ) {
      int currentIndex = startIndex + i;
      setState(() {
        _values[currentIndex] = pastedText[i];
        _controllers[currentIndex].text = pastedText[i];
      });
    }

    int nextIndex = (startIndex + pastedText.length).clamp(
      0,
      widget.length - 1,
    );
    _focusNodes[nextIndex].requestFocus();

    String otpValue = _values.join();
    widget.onChanged?.call(otpValue);

    if (otpValue.length == widget.length) {
      widget.onCompleted?.call(otpValue);
    }
  }

  void _onKeyEvent(int index, KeyEvent event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        _controllers[index].text.isEmpty &&
        index > 0) {
      _focusNodes[index - 1].requestFocus();
      setState(() {
        _values[index - 1] = '';
        _controllers[index - 1].clear();
      });
      widget.onChanged?.call(_values.join());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        widget.length,
        (index) => Padding(
          padding: EdgeInsets.only(
            right: index < widget.length - 1 ? widget.spacing : 0,
          ),
          child: SizedBox(
            width: widget.fieldWidth,
            height: widget.fieldHeight,
            child: KeyboardListener(
              focusNode: FocusNode(),
              onKeyEvent: (event) => _onKeyEvent(index, event),
              child: TextField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                textAlign: TextAlign.center,
                // keyboardType: TextInputType,
                maxLength: 1,
                obscureText: widget.obscureText,
                style:
                    widget.textStyle ??
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                decoration:
                    widget.decoration ??
                    InputDecoration(
                      counterText: '',
                      filled: true,
                      contentPadding: EdgeInsets.zero,
                      fillColor: widget.fillColor ?? Colors.grey[100],
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: widget.enabledBorderColor ?? Colors.grey[300]!,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: widget.focusedBorderColor ?? Colors.blue,
                          width: 2,
                        ),
                      ),
                    ),
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter,
                ],
                onChanged: (value) => _onChanged(index, value),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
