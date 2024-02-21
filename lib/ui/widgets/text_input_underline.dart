import 'package:downloader_handler_flutter/common/colors.dart';
import 'package:flutter/material.dart';

class TextInputUnderline extends StatelessWidget {
  const TextInputUnderline(
      {Key? key,
      required this.textFieldLinkController,
      required this.labelText})
      : super(key: key);
  final String labelText;
  final TextEditingController textFieldLinkController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorWidth: 2.4,
        controller: textFieldLinkController,
        cursorHeight: 18.0,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: labelText,
          prefixIcon: const IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onPressed: null,
            icon: Icon(Icons.link, size: 20.0),
          ),
          suffixIcon: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onPressed: () {
              textFieldLinkController.clear();
            },
            icon: const Icon(Icons.cancel, size: 20.0),
          ),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: AppColors.baseColorLight)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: Theme.of(context).colorScheme.primary)),
        ));
  }
}
