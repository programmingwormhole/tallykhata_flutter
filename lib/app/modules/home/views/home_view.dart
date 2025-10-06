import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tallykhata/app/widgets/customer_list_tile.dart';
import 'package:tallykhata/exports.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PRIMARY,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQueryUtils.width * .4,
              height: 22,
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              decoration: BoxDecoration(
                color: AppColors.WHITE,
                borderRadius: BorderRadius.circular(60),
              ),
              child: const Center(
                child: Text(
                  'Programming Wormhole',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'স্ট্যান্ডার্ড',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: AppColors.WHITE,
              ),
            ),
          ],
        ),
        actions: [
          Column(
            children: [
              SvgPicture.asset(
                SvgManager.messageTop,
                color: AppColors.WHITE,
                height: 25,
                width: 25,
              ),
              const Text(
                'ইনবক্স',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: AppColors.WHITE,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            children: [
              SvgPicture.asset(
                SvgManager.support,
                color: AppColors.WHITE,
                height: 25,
                width: 25,
              ),
              const Text(
                'হেল্প',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: AppColors.WHITE,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            // Top Banner
            Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.BLACK.withOpacity(.1),
                    blurRadius: 4,
                  ),
                ],
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://www.tallykhata.com/wp-content/uploads/2025/01/Website-Banner-TK-Gold.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Menu
            const SizedBox(
              height: 20,
            ),

            GridView.custom(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              primary: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              childrenDelegate: SliverChildListDelegate(
                [
                  _menuItem(
                    icon: SvgManager.businessFilled,
                    title: 'মাল্টি ব্যবসা',
                    color: 0xFF2f722d,
                  ),
                  _menuItem(
                    icon: SvgManager.stock,
                    title: 'স্টক হিসাব',
                    color: 0xFF971d36,
                  ),
                  _menuItem(
                    icon: SvgManager.notes,
                    title: 'ব্যবসার নোট',
                    color: 0xFFd3884f,
                  ),
                  _menuItem(
                    icon: SvgManager.bell,
                    title: 'গ্রুপ তাগাদা',
                    color: 0xFF2f722d,
                  ),
                  _menuItem(
                    icon: SvgManager.superQr,
                    title: 'সুপার QR',
                    color: 0xFF971d36,
                  ),
                  _menuItem(
                    icon: SvgManager.upload,
                    title: 'ডাটা ব্যাকআপ',
                    color: 0xFF2f722d,
                  ),
                  _menuItem(
                    icon: SvgManager.message,
                    title: 'টালি-মেসেজ',
                    color: 0xFF971d36,
                  ),
                  _menuItem(
                    icon: SvgManager.cashBox,
                    title: 'ক্যাশবক্স',
                    color: 0xFFd3884f,
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 5,
            ),

            const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: AppColors.PRIMARY,
                        ),
                      ),
                      Text(
                        'মোট পাবো',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: VerticalDivider(),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'মোট দেবো',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),

            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.withOpacity(.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'খোঁজ',
                          prefixIcon: const Icon(Icons.search)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey.withOpacity(.1),
                  ),
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    SvgManager.filter,
                  ),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey.withOpacity(.1),
                  ),
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    SvgManager.download,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 15,
            ),

            StreamBuilder(
              stream: FirebaseService.to.firestore
                  .collection('customers')
                  .where('created_by_phone',
                      isEqualTo:
                          FirebaseService.to.auth.currentUser!.phoneNumber)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  print(snapshot.error);
                  return Text(snapshot.error.toString());
                }

                final customers = snapshot.data!.docs
                    .where((user) => user['user_type'] == 'customer')
                    .toList();

                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'কাস্টমার ${customers.length} / সাপ্লায়ার ${snapshot.data!.docs.length - customers.length}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'পাবো',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              TextSpan(
                                text: ' / ',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'দেবো',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: snapshot.data!.docs.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return CustomerListTile(
                          person: snapshot.data!.docs[index].data(),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(Routes.ADD);
        },
        backgroundColor: AppColors.PRIMARY,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        icon: const Icon(
          Icons.person_add,
          size: 16,
          color: Colors.white,
        ),
        label: const Text(
          'নতুন কাস্টমার/সাপ্লায়ার',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
    );
  }

  Widget _menuItem({
    required String icon,
    required String title,
    required int color,
  }) {
    return Column(
      children: [
        SvgPicture.asset(
          icon,
          height: 35,
          width: 35,
          color: Color(color).withOpacity(.8),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        )
      ],
    );
  }
}
