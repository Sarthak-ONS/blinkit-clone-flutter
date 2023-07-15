import 'package:ecom/app_colors.dart';
import 'package:flutter/material.dart';

const svgIcons = [
  "https://img.icons8.com/ios/50/wallet--v1.png",
  "https://img.icons8.com/ios/50/filled-chat.png",
  "https://img.icons8.com/dotty/80/token-card-code.png"
];

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 25,
        automaticallyImplyLeading: true,
        title: const Text('Profile'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '9457000000',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 216, 237, 255),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildIconWithLabel(assetName: svgIcons[0], title: 'Wallet'),
                  buildIconWithLabel(assetName: svgIcons[1], title: 'Support'),
                  buildIconWithLabel(assetName: svgIcons[2], title: 'Payments'),
                ],
              ),
            ),

            // User Information
            const Text(
              'YOUR INFORMATION',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
            customListTile(
                icon: Icons.inventory_2_outlined, title: 'Your Orders'),
            customListTile(
                icon: Icons.inventory_2_outlined, title: 'Address Book'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'OTHERS',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
            customListTile(icon: Icons.share, title: 'Share the app'),
            customListTile(icon: Icons.info_outline, title: 'About Us'),
            customListTile(icon: Icons.logout, title: 'Log out'),
          ],
        ),
      ),
    );
  }

  Widget buildIconWithLabel({@required assetName, @required String? title}) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          child: Image.network(assetName),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  Widget customListTile({
    required IconData icon,
    required String title,
  }) {
    return InkWell(
      splashColor: AppColors.greyWhiteColor,
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        margin: const EdgeInsets.symmetric(vertical: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.greyWhiteColor,
                  child: Icon(
                    icon,
                    color: Colors.black45,
                    size: 15,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: Change the Icons From Network to Assets 