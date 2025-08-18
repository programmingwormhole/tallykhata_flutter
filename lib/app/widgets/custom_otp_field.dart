import 'package:tallykhata/exports.dart';

class OtpField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;

  const OtpField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 50,
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(.15),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(.15),
            ),
          ),
        ),
      ),
    );
  }
}
