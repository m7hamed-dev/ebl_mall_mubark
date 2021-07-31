import 'dart:convert';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:ebl_mall/data/constant.dart';
import 'package:ebl_mall/models/ads_model.dart';
import 'package:ebl_mall/models/category_model.dart';
import 'package:ebl_mall/models/sub_category_model.dart';
import 'package:ebl_mall/network/api.dart';
import 'package:ebl_mall/style/style.dart';
import 'package:ebl_mall/ui/ads/card_ads.dart';
import 'package:ebl_mall/ui/auction/details_auction_page.dart';
import 'package:http/http.dart' as http;
import 'package:ebl_mall/ui/animal/search_animals_page.dart';
import 'package:ebl_mall/ui/banner/banner_page.dart';
import 'package:ebl_mall/widgets/custom_navigation_bottom.dart';
import 'package:ebl_mall/widgets/error_network_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../main.dart';

class MyHomePage extends StatefulWidget {
  //
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Style.scafoldBackground,
      // fab
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.transparent,
      //   onPressed: () => Push.goTo(context, CreateAdsPage()),
      //   child: SpeedDial(
      //     backgroundColor: Style.primaryColor,
      //     icon: Icons.close,
      //     // shape:
      //     //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      //     children: [
      //       SpeedDialChild(
      //         child: Icon(Icons.accessibility),
      //         backgroundColor: Colors.red,
      //         labelBackgroundColor: Colors.black,
      //         label: 'First',
      //         labelStyle: TextStyle(fontSize: 18.0),
      //         onTap: () => Push.goTo(context, CreateAdsPage()),
      //         onLongPress: () => print('FIRST CHILD LONG PRESS'),
      //       ),
      //       SpeedDialChild(
      //         child: InkWell(
      //           onTap: () => Push.goTo(context, CreateAdsPage()),
      //           child: Icon(Icons.accessibility),
      //         ),
      //         backgroundColor: Colors.red,
      //         labelBackgroundColor: Colors.black,
      //         label: 'First',
      //         labelStyle: TextStyle(fontSize: 18.0),
      //         onTap: () => Push.goTo(context, CreateAdsPage()),
      //         onLongPress: () => print('FIRST CHILD LONG PRESS'),
      //       ),
      //     ],
      //     child: MyGradiant(
      //       child: Icon(Icons.add),
      //     ),
      //     // onPressed: () => Push.goTo(context, CreateAdsPage()),
      //   ),
      // ),

      body: BodyWidget(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchWidget(),
              //
              BannerPage(),
              //
              buildTitle('الأقسام الرئيسية'),
              //
              // CategoriesPage(),
              //
              // HomeDropDown(),
              //
              // AnimalsPage(),
              CategoryDropDownSubCategoryAdsPage(),
              //
              // buildTitle('المذيادات'),
              // AuctionsPage(),
              //
            ]
                .map(
                  (e) => Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 12.0),
                      child: e),
                )
                .toList(),
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //
      bottomNavigationBar: FadeInUp(child: CustomBottomNavigationBar()),
    );
  }

  FadeInRight buildTitle(data) {
    return FadeInRight(
      delay: Duration(milliseconds: 1700),
      child: Text(data, style: Style.bold(fontSize: 14.0)),
    );
  }

  FadeInRight searchWidget() {
    return FadeInRight(
      delay: Duration(milliseconds: 900),
      child: Container(
        // height: 60,
        margin: EdgeInsets.only(
          top: 10.0,
          bottom: 0.0,
          right: 10.0,
          left: 10.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: HexColor("#1c000000"),
              blurRadius: 11.0,
              spreadRadius: 0.0,
              offset: Offset(0.0, 1.0),
            )
          ],
        ),
        child: TextFormField(
          onTap: () => Push.goTo(context, SearchAnimalsPage()),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            prefixIcon: Icon(Icons.search, color: Style.primaryColor),
            // hintTextDirection: TextDirection.,
            hintText: ' بحث',
            hintStyle: Style.labelStyle(),
            border: InputBorder.none,
            // isDense: true,
            // icon: Icon(Icons.search),
            // enabledBorder: Decorb,
          ),
        ),
      ),
    );
  }
}

// 3 diffrences in one page => category and dropdwon subcategory and ads
class CategoryDropDownSubCategoryAdsPage extends StatefulWidget {
  const CategoryDropDownSubCategoryAdsPage({Key? key}) : super(key: key);

  @override
  _CategoryDropDownSubCategoryAdsPageState createState() =>
      _CategoryDropDownSubCategoryAdsPageState();
}

class _CategoryDropDownSubCategoryAdsPageState
    extends State<CategoryDropDownSubCategoryAdsPage> {
  // part category
  bool isLoadingCategories = true;
  bool isInternetError = false;
  List<CategoryModel> _categories = [];
  int selectedIndex = 0;
  int selectedCategoryID = 0;
  int? selectedSubCategoryID;
  String selectedCategoryName = '';
  double radius = 45.0;

  Widget widgetCategories() {
    if (isLoadingCategories) {
      return ShimmerCategory();
    }
    if (isInternetError) {
      return Container(child: ErrorNetworkWidget());
    }
    if (_categories.length == 0) {
      return Center(child: Text('no categoty'));
    }
    return FadeInRight(
      child: Container(
        height: 60.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          // shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  selectedCategoryID = _categories[index].id;
                  selectedCategoryName = _categories[index].name;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: 60.0,
                width: 100.0,
                margin: EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:
                      selectedIndex == index ? Style.heighOrang : Colors.white,
                  borderRadius: BorderRadius.circular(
                      selectedIndex == index ? 50.0 : radius),
                  boxShadow: [
                    BoxShadow(
                      color: HexColor("#1c000000"),
                      blurRadius: 11.0,
                      spreadRadius: 0.0,
                      offset: Offset(0.0, 3.0),
                    )
                  ],
                ),
                child: Text(
                  _categories[index].name,
                  style: TextStyle(
                    color: index == selectedIndex ? Colors.white : Colors.black,
                    fontSize: 13.0,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future fetchCategories() async {
    // print('populateCategories');
    await API.fetchCategories().then((categories) async {
      isLoadingCategories = false;

      if (categories != null) {
        _categories.addAll(categories);
      }
      selectedCategoryName = _categories.length > 0 ? _categories[0].name : '';
      setState(() {});
    }).catchError((error) {
      if (error is SocketException) {
        isLoadingCategories = false;
        isInternetError = true;
        setState(() {});
      }
    });
  }

  // part 2 : populate dropdown subCategory
  var initCategoryName = '';
  var subCategoriesName = [];

  // part 3 : Get Ads By SubCategoryID
  Widget widgetAds() {
    return subCategoriesName.isNotEmpty
        ? Container(
            child: Text('no null'),
          )
        : Container(
            child: Text(' null'),
          );
  }

  //
  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  // build
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      child: Column(
        children: [
          widgetCategories(),
          populateSubCategoriesDropDown(),
          // widgetAds()
          // widgetDropDownSubCategory(),
        ],
      ),
    );
  }

  Future<List<SubCategory>> _future() async {
    try {
      http.Response response = await http.get(
          Uri.parse(Constant.baseUrl + 'SubCatogery/index/$selectedIndex'));

      if (response.statusCode == 200) {
        final subCategoryModel = subCategoryModelFromJson(response.body);
        return subCategoryModel.data;
      } else if (response.statusCode != 200) {
        return [];
      }
      return [];
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Datum>> _futureAds(subCategoryID) async {
    try {
      http.Response response = await http
          .get(Uri.parse(Constant.baseUrl + 'SubCatogery/show/$subCategoryID'));
      //28

      if (response.statusCode == 200) {
        final adsModel = adsModelFromJson(response.body);
        return adsModel.data;
      } else if (response.statusCode != 200) {
        return [];
      }
      return [];
    } catch (e) {
      return Future.error(e);
    }
  }

//
  FutureBuilder populateSubCategoriesDropDown() {
    //
    return FutureBuilder<List<SubCategory>>(
      future: _future(),
      builder:
          (BuildContext context, AsyncSnapshot<List<SubCategory>> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          //
          if (snapshot.data!.length == 0) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'لاتوجد أقسام فرعية في  \n ($selectedCategoryName)',
                  style: Style.medium(),
                ),
              ),
            );
          }
          //
          return Column(
            children: [
              // dropdown
              Container(
                height: 45.0,
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.symmetric(vertical: 4.9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  border: Border.all(color: Style.customGrey),
                ),
                child: DropdownButton<SubCategory>(
                  underline: Container(),
                  icon: Icon(Icons.keyboard_arrow_down),
                  isExpanded: true,
                  isDense: true,
                  style: Style.medium(),
                  onChanged: (v) {
                    setState(() {
                      initCategoryName = v!.name;
                      selectedSubCategoryID = v.id;
                      print('selectedSubCategoryID $selectedSubCategoryID');
                    });
                  },
                  hint: Text(
                    initCategoryName,
                    style: Style.medium(color: Colors.black),
                  ),
                  items: snapshot.data!.map((value) {
                    return DropdownMenuItem<SubCategory>(
                      value: value,
                      child: Text(
                        value.name,
                        style: Style.medium(color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
              ),
              // all ads
              FutureBuilder<List<Datum>>(
                future: _futureAds(selectedSubCategoryID),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Datum>> snapshot) {
                  // print('snapshot.data is ${snapshot.data!}');

                  if (snapshot.hasData && snapshot.data != null) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 2.9,
                        crossAxisCount: 2,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardAds(adsModel: snapshot.data![index]);
                      },
                    );
                  }
                  return Text('lodading ads ......');
                },
              ),
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
