import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool readStatus;
  final TextEditingController textController;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.readStatus,
    required this.textController,
    required this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(labelText,
              style: const TextStyle(fontSize: 20, color: Colors.white)),
          const SizedBox(height: 10),
          TextFormField(
              textAlign: TextAlign.center,
              controller: textController,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              readOnly: readStatus,
              onChanged:
                  onChanged, // Passe a função onChanged para o TextFormField
              validator: validator,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 150, 41, 139))),
                enabledBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 150, 41, 139))),
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}
