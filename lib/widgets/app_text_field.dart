import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
   const AppTextField({
    Key? key,
    required this.keyboardType,
    required this.label,
    required this.onSaved,
    required this.validator,
    
  }) : super(key: key);

  final TextInputType? keyboardType;
  final String label;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  


  @override
  Widget build(BuildContext context) {
    // const primaryColor = Color(0xff4338CA);
    // const secondaryColor = Color(0xff6D28D9);
    // const accentColor = Color(0xffffffff);
    // const backgroundColor = Color(0xffffffff);
    const errorColor = Color(0xffEF4444);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.1),
              ),
            ],
          ),
          child: TextFormField(
            onSaved: onSaved,
            validator: validator,
            keyboardType: keyboardType,
            style: const TextStyle(fontSize: 12, color: Colors.black),
            decoration: InputDecoration(
              label: Text(label),
              labelStyle: const TextStyle(color: Colors.black),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: errorColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
