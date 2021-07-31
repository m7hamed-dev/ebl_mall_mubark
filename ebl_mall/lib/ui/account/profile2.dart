import 'package:animate_do/animate_do.dart';
import 'package:ebl_mall/data/dummy_data.dart';
import 'package:ebl_mall/main.dart';
import 'package:ebl_mall/models/user_model.dart';
import 'package:ebl_mall/style/style.dart';
import 'package:ebl_mall/ui/account/edit_ptofile_page.dart';
import 'package:ebl_mall/ui/auction/card_auction.dart';
import 'package:ebl_mall/widgets/custom_cached_network_img.dart';
import 'package:flutter/material.dart';

class ProfileTwoPage extends StatelessWidget {
  final UserModel user;
  // final List<Map> collections = [
  //   {"title": "Food joint", "image": 'meal'},
  //   {"title": "Photos", "image": 'assets/images/img_camel.jpg'},
  // ];

  ProfileTwoPage({Key? key, required this.user}) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('ممتلكاتك', style: Style.bold()),
            ),
            Expanded(
              child: yourAnimals(),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildHeader(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 50.0),
      height: 240.0,
      child: Stack(
        children: <Widget>[
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey.shade400,
                  Style.primaryColor,
                ],
                // colors: [Colors.indigo.shade300, Colors.indigo.shade500],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: 40.0, left: 40.0, right: 40.0, bottom: 10.0),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50.0),
                  FadeInLeft(
                    duration: const Duration(milliseconds: 1200),
                    child: Text(
                      user.name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  FadeInRight(
                      duration: const Duration(milliseconds: 1400),
                      child:
                          Text('${user.email ?? 'no email'} | ${user.phone}')),
                  SizedBox(height: 12.0),
                  Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        buildInfo("302", 'data'),
                        buildInfo("302", 'data'),
                        buildInfo("302", 'data'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Material(
              //   elevation: 5.0,
              //   shape: CircleBorder(),
              //   child: CircleAvatar(
              //     radius: 40.0,
              //     backgroundImage: NetworkImage(''),
              //   ),
              // ),
              InkWell(
                onTap: () => Push.goTo(context, EditProfilePage(user: user)),
                child: FadeInLeft(
                  duration: const Duration(milliseconds: 1700),
                  child: Hero(
                    tag: user,
                    child: CustomCachedNetworkImage(
                      width: 80.0,
                      height: 80.0,
                      imageUrl: user.imageUrl,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Expanded buildInfo(count, data) {
    return Expanded(
      child: ListTile(
        title: Text(
          '$count',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(data.toUpperCase(),
            textAlign: TextAlign.center, style: TextStyle(fontSize: 12.0)),
      ),
    );
  }

  Widget yourAnimals() {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      scrollDirection: Axis.vertical,
      itemCount: ClassDummyData.dummyAnimals.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        //
        return CardAuctionAnimal(
          index: index,
          animalMode: ClassDummyData.dummyAnimals[index],
        );
      },
    );
  }
}
