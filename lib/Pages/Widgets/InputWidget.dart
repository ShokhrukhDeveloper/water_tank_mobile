import 'package:flutter/material.dart';
class InputWidget extends StatefulWidget {
  final String title;
  final TextEditingController? controller;
   final bool isPassword;
   InputWidget({Key? key, required this.title, this.controller,  this.isPassword=false}) : super(key: key);
  bool showPassword=false;
  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.showPassword,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword?GestureDetector(
            onTap:()=> setState(() {
              widget.showPassword= !widget.showPassword;
            }),
            child: Icon(widget.showPassword?Icons.visibility_off_outlined:Icons.visibility)):null,
        labelText: widget.title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),

        )
      ),
    );
  }
}
