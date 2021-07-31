import 'package:ebl_mall/models/user_model.dart';
import 'package:ebl_mall/ui/auction/details_auction_page.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  final UserModel user;
  const EditProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Hero(
              tag: user,
              child: CustomCachedNetworkImage(
                imageUrl: user.imageUrl,
                isCircleShape: true,
                width: 80.0,
                height: 80.0,
              ),
            ),
            Text(user.name),
            Text(user.email ?? ''),
          ],
        ),
      ),
    );
  }
}
