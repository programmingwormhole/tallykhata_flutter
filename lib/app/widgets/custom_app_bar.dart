import 'package:tallykhata/exports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final bool automaticallyImplementLeading;

  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.automaticallyImplementLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplementLeading,
      title: title,
      centerTitle: false,
      leading: leading ??
          (automaticallyImplementLeading == false
              ? null
              : IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                )),
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 1),
        child: Divider(
          color: Colors.black.withOpacity(.080),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
