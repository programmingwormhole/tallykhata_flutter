import 'package:tallykhata/exports.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData? leadingIcon;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.leadingIcon,
    this.onChanged,
    this.inputFormatters,
    this.prefixText,
    this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        prefixText: prefixText,
        prefixStyle: TextStyle(
          color: Colors.black.withOpacity(.5),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: leadingIcon == null ? null : Icon(leadingIcon),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.black.withOpacity(.3),
          fontSize: 14,
          fontWeight: FontWeight.w600
        ),
        hintStyle: TextStyle(
            color: Colors.black.withOpacity(.3),
        ),
        hintText: hintText,
        floatingLabelStyle: const TextStyle(
          color: AppColors.PRIMARY,
        ),
      ),
    );
  }
}
