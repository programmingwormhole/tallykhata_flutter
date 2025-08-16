import 'package:tallykhata/exports.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData leadingIcon;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(leadingIcon),
        labelText: labelText,
        hintText: hintText,
        floatingLabelStyle: const TextStyle(
          color: AppColors.PRIMARY,
        ),
      ),
    );
  }
}
