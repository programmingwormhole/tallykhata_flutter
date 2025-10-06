import 'package:tallykhata/app/widgets/custom_app_bar.dart';
import 'package:tallykhata/exports.dart';
import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(
          'নতুন কাস্টমার/সাপ্লায়ার',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    // Profile Picture & User Type
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            print('Choose file');
                          },
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              const CircleAvatar(
                                radius: 24,
                                backgroundImage: NetworkImage(
                                    'https://cdn.vectorstock.com/i/500p/29/53/gray-silhouette-avatar-for-male-profile-picture-vector-56412953.jpg'),
                              ),
                              Container(
                                height: 22,
                                width: 22,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFe1e1e1),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 15,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: radioButton('customer', 'কাস্টমার'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: radioButton('supplier', 'সাপ্লায়ার'),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // Add From Phonebook Button
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xFFf2f2f2)),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.perm_contact_calendar_outlined,
                              color: Colors.black,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'ফোনবুক থেকে যোগ করি',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // User Info
                    Column(
                      children: [
                        CustomTextField(
                          labelText: 'নাম',
                          hintText: 'নাম লিখুন',
                          leadingIcon: Icons.person_outline,
                          onChanged: (value) => controller.name.value = value,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          labelText: 'মোবাইল নম্বর',
                          hintText: 'মোবাইল নম্বর লিখুন',
                          leadingIcon: Icons.phone_outlined,
                          onChanged: (value) => controller.phone.value = value,
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              CustomButton(
                label: 'নিশ্চিত',
                buttonType:
                    controller.name.isNotEmpty && controller.phone.isNotEmpty
                        ? ButtonType.ENABLED
                        : ButtonType.DISABLED,
                isLoading: controller.isLoading.value,
                onTap: () => controller.addCustomerOrSupplier(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget radioButton(String value, String label) {
    bool isSelected = controller.selectedValue.value == value;

    return InkWell(
      onTap: () => controller.selectedValue.value = value,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isSelected ? AppColors.PRIMARY : Colors.black.withOpacity(.15),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Radio(
              activeColor: AppColors.PRIMARY,
              value: value,
              groupValue: controller.selectedValue.value,
              onChanged: (newValue) {
                controller.selectedValue.value = newValue!;
              },
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? AppColors.PRIMARY : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
