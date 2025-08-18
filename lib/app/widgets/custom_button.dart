import 'package:tallykhata/exports.dart';

enum ButtonType {
  DISABLED,
  ENABLED,
  SOFT,
  BORDER,
}

class CustomButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final ButtonType buttonType;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.label,
    this.onTap,
    this.buttonType = ButtonType.ENABLED,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isDisabled = buttonType == ButtonType.DISABLED;

    return InkWell(
      onTap: isDisabled ? null : onTap,
      child: Container(
        width: MediaQueryUtils.width,
        decoration: BoxDecoration(
          color: AppColors.PRIMARY.withOpacity(
            isDisabled ? .25 : 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: isDisabled && isLoading
                        ? AppColors.PRIMARY
                        : Colors.white,
                  ),
                )
              : Text(
                  'পরবর্তী',
                  style: TextStyle(
                    color: Colors.white.withOpacity(
                      isDisabled ? .8 : 1,
                    ),
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
        ),
      ),
    );
  }
}
