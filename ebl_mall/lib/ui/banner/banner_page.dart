import 'dart:convert';
import 'dart:io';
import 'package:ebl_mall/network/api.dart';
import 'package:ebl_mall/ui/auction/details_auction_page.dart';
import 'package:ebl_mall/widgets/error_network_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import '../../main.dart';
import 'shimmer_banner.dart';

class BannerPage extends StatefulWidget {
  //
  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  //
  bool isLoading = true;
  bool isNetworkError = false;
  var _banners = [];
  //
  Widget body() {
    if (isLoading) {
      return ShimmerBanner();
    }
    if (isNetworkError) {
      return Center(child: ErrorNetworkWidget());
    }

    return Swiper(
      itemCount: _banners.length,
      itemBuilder: (BuildContext context, int index) {
        //
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
          ),
          // child: SvgPicture.asset(
          //   'assets/svgs/img_banner_svg.svg',
          //   fit: BoxFit.fitWidth,
          //   clipBehavior: Clip.antiAlias,
          // ),
          child: CustomCachedNetworkImage(
            width: double.infinity,
            imageUrl: _banners[index]['thumbnailUrl'],
            isCircleShape: false,
          ),
        );
      },

      // indicatorLayout: PageIndicatorLayout.COLOR,
      autoplay: true,

      // control: SwiperControl(),
      loop: true,
      viewportFraction: 0.8,
      scale: 0.9,
      // layout: SwiperLayout.STACK,

      pagination: SwiperPagination(
        // alignment: Alignment.bottomCenter,
        builder: SwiperPagination.dots,
        margin: EdgeInsets.only(top: 10.0),
      ),
      // indicatorLayout: PageIndicatorLayout.COLOR,
    );
  }

  Future fetchBanners() async {
    await API.fetchBanners().then((value) {
      if (value != null) {
        //
        final List res = json.decode(value);
        for (var i = 0; i < 5; i++) {
          print('index is $i');
          _banners.add(res[i]);
        }
        isLoading = false;
        setState(() {});
      }
    }).catchError((error) {
      isLoading = false;
      isNetworkError = true;
      if (error is SocketException) {
        isLoading = false;
        isNetworkError = true;
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchBanners();
  }

  // biuld ui
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.25,
      width: context.width,
      child: body(),
    );
  }
}
