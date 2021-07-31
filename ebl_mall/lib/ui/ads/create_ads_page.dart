import 'dart:io';
import 'package:ebl_mall/network/api.dart';
import 'package:ebl_mall/style/style.dart';
import 'package:ebl_mall/tools/custom_flushbar.dart';
import 'package:ebl_mall/widgets/error_network_widget.dart';
import 'package:ebl_mall/widgets/my_elevated_btn.dart';
import 'package:ebl_mall/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'dart:async';
import '../../main.dart';

class CreateAdsPage extends StatefulWidget {
  const CreateAdsPage({Key? key}) : super(key: key);

  @override
  _CreateAdsPageState createState() => _CreateAdsPageState();
}

class _CreateAdsPageState extends State<CreateAdsPage> {
  //
  bool isLoading = true;
  bool isNetworkError = false;
  var _subCategories = [];
  //
  Widget widgetSubCategories() {
    if (isLoading) {
      return Container(child: CircularProgressIndicator());
    }
    if (isNetworkError) {
      return Container(child: ErrorNetworkWidget());
    }
    return Container(
      width: context.width,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        border: Border.all(
          color: Style.customGrey,
        ),
      ),
      child: _subCategories.length == 0
          ? Center(child: CircularProgressIndicator())
          : DropdownButton<String>(
              underline: Container(),
              icon: Icon(Icons.keyboard_arrow_down),
              isExpanded: true,
              // style: TextStyle(),
              isDense: true,
              style: Style.medium(),
              // dropdownColor: Colors.red,

              onChanged: (v) => setState(() => initValueSubCategories = v!),
              hint: Text(initValueSubCategories),
              // value: initValueCategories,
              items: _subCategories.map((subCategory) {
                return DropdownMenuItem<String>(
                  value: subCategory.name,
                  child: Text(subCategory.name ?? '', style: Style.tiny()),
                );
              }).toList(),
            ),
    );
  }

  //
  PreferredSize myAppBar(
      {List<Widget>? actions,
      Widget? title,
      Color? colorIconAppBar,
      bool centerTitle = true,
      bool primary = false,
      Widget? leading,
      double? elevation,
      double? sizeHeightAppBar,
      PreferredSizeWidget? bottom}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(sizeHeightAppBar ?? 55.0),
      child: SafeArea(
        child: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: title,
          centerTitle: centerTitle,
          leading: leading,
          elevation: elevation ?? 0.0,
          primary: primary,
          actions: actions,
          bottom: bottom,
        ),
      ),
    );
  }

  // String initValueCategories = 'الخيول';
  String initValueCategories = 'اختر الفئة الرئيسية';
  String initValueSubCategories = 'اختر الفئة الفرعية';

  List<String>? categories;
  // List<String>? subCategories;

  Future populateMainCategories() async {
    await Future.delayed(Duration(seconds: 3), () {
      categories = <String>[
        'الخيول',
        'الحصان',
        'البعير',
        'أخري',
      ];
      setState(() {});
      //
      dropMainCategoryEmpty = false;
      // التصنيف الفرعي
      // dropSubCategory = true;
      // الفئة الفرعية
      // dropSubClassEmpty = true;
    });
  }

  Future populateSubCategories() async {
    print('populateSubCategories');
    await API.fetchSubCategories(999).then((value) {
      if (value != null) {
        //
        // final List res = json.decode(value)['data'];
        // print('response is $res');
        _subCategories.addAll(value);
        isLoading = false;
        setState(() {});
      }
    }).catchError((error) {
      if (error is SocketException) {
        isLoading = false;
        isNetworkError = true;
        setState(() {});
      }
    });
  }

  // booleans stat
  bool isSort = true, isDetailsAds = false, isWonerAds = false;
  // int numberStepper = 0;

  Padding classificationWidget() {
    final double _width = context.width * 0.90;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ContainerWidget(
        title: 'الاقسام',
        //
        content: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //
              Text('التصنيف', style: Style.labelStyle(fontSize: 15.0)),
              Container(
                width: _width,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  border: Border.all(color: Style.customGrey),
                ),
                child: categories == null
                    ? Center(child: CircularProgressIndicator())
                    : DropdownButton<String>(
                        underline: Container(),
                        icon: Icon(Icons.keyboard_arrow_down),
                        // style: TextStyle(),
                        isExpanded: true,
                        isDense: true,
                        style: Style.medium(),
                        onChanged: (v) =>
                            setState(() => initValueCategories = v!),
                        hint: Text(initValueCategories),
                        // value: initValueCategories,
                        items: categories!.map((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category, style: Style.tiny()),
                          );
                        }).toList(),
                      ),
              ),
              // column sub classification
              SizedBox(height: 20.0),
              Text('التصنيف الفرعي', style: Style.labelStyle()),
              widgetSubCategories(),
              // الفئة الفرعية
              SizedBox(height: 20.0),
              Text('الفئة الفرعية'),
              Container(
                width: context.width,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  border: Border.all(
                    color: Style.customGrey,
                  ),
                ),
                child: categories == null
                    ? Center(child: CircularProgressIndicator())
                    : DropdownButton<String>(
                        underline: Container(),
                        icon: Icon(Icons.keyboard_arrow_down),
                        // style: TextStyle(),
                        isDense: true,
                        isExpanded: true,
                        style: Style.medium(),
                        onChanged: (v) =>
                            setState(() => initValueCategories = v!),
                        hint: Text(initValueCategories),
                        // value: initValueCategories,
                        items: categories!.map((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category, style: Style.tiny()),
                          );
                        }).toList(),
                      ),
              ),
              SizedBox(height: 10.0),
            ]
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.0,
                      horizontal: 10.0,
                    ),
                    child: e,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  bool isExpandedMoreDetailsAds = false;
  bool isExpandedDetailsAds = false;
  //

  // تفاصيل الإعلان
  Padding detailsAds() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              // color: Style.customGrey,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: HexColor('#c4c4c4'),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isExpandedDetailsAds = !isExpandedDetailsAds;
                        });
                      },
                      child: AnimatedSwitcher(
                        duration: Duration(seconds: 2),
                        child: Icon(
                          isExpandedDetailsAds
                              ? Icons.close
                              : Icons.touch_app_rounded,
                        ),
                      ),
                      //
                    ),
                    Text('تفاصيل اللإعلان'),
                  ],
                ),
                Divider(),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: isExpandedDetailsAds ? 470.0 : 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('إسم الإعلان', style: Style.labelStyle()),
                        InputWidget(
                          hint: 'إسم الإعلان ( مثال : جمل فحل أحمر )',
                        ),
                        Text('السعر', style: Style.labelStyle()),
                        InputWidget(
                          textInputType: TextInputType.number,
                          hint: 'السعر المطلوب',
                        ),
                        Text('تفاصيل الإعلان', style: Style.labelStyle()),
                        InputWidget(
                          hint:
                              'وصف الإعلان ( فضلا أضف المذيد من التفاصيل عن منتجك ليتم العثور عليه بسهولة وسرعة )',
                          maxLines: 5,
                        ),
                      ]
                          .map(
                            (e) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: e),
                          )
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding moreDetailsAds() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              // color: Style.customGrey,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: HexColor('#c4c4c4'),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isExpandedMoreDetailsAds = !isExpandedMoreDetailsAds;
                        });
                      },
                      child: Icon(Icons.change_circle),
                    ),
                    Text('تفاصيل اللإعلان'),
                  ],
                ),
                Divider(),
                AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  height: isExpandedMoreDetailsAds ? 600.0 : 0.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('إسم الإعلان', style: Style.labelStyle()),
                        InputWidget(
                          hint: 'إسم الإعلان ( مثال : جمل فحل أحمر )',
                        ),
                        Text('السعر', style: Style.labelStyle()),
                        InputWidget(
                          textInputType: TextInputType.number,
                          hint: 'السعر المطلوب',
                        ),
                        Text('تفاصيل الإعلان', style: Style.labelStyle()),
                        InputWidget(
                          hint:
                              'وصف الإعلان ( فضلا أضف المذيد من التفاصيل عن منتجك ليتم العثور عليه بسهولة وسرعة )',
                          maxLines: 5,
                        ),
                        SizedBox(height: 10.0),
                      ]
                          .map(
                            (e) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: e),
                          )
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  //
  Widget boxDetailsAdsAndImages() {
    return Column(
      children: [
        detailsAds(),
        moreDetailsAds(),
        // if images contain at least one image show gridview with image / multi image
        // otherwise show container select image
        images.length == 0 ? widgetMultiImages() : buildGridView(),
      ],
    );
  }

  @override
  void initState() {
    populateMainCategories();
    populateSubCategories();
    super.initState();
    print('currentStepp is $currentStepp');
  }

  Container _stepper() {
    return Container(
      height: 80.0,
      // color: Colors.red,
      child: Stepper(
        controlsBuilder: (context, {onStepCancel, onStepContinue}) {
          return const SizedBox(height: 0.0);
        },
        // onStepCancel: () {},
        onStepContinue: () {},
        type: StepperType.horizontal,
        currentStep: 0,
        steps: [
          Step(
            isActive: isSort,
            state: StepState.indexed,
            title: Text('التصنيف'),
            content: Container(),
          ),
          Step(
            isActive: isDetailsAds,
            state: StepState.indexed,
            title: Text('تفاصيل الإعلان'),
            content: Container(),
          ),
          Step(
            isActive: isWonerAds,
            state: StepState.indexed,
            title: Text('عن المعلن'),
            content: Container(),
          ),
        ],
      ),
    );
  }

  int currentStepp = 1;
  String txtBtnStepper = 'التالي';
  //
  Widget widgetMultiImages() {
    return ContainerWidget(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'يمكنك إضافة 3 صور لتوضيح منتج بشكل أفضل',
              style: Style.tiny(fontSize: 15.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                3,
                (index) => InkWell(
                  onTap: loadAssets,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      border: Border.all(
                        color: Style.customGrey,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          size: 40.0,
                          color: Style.primaryColor,
                        ),
                        SizedBox(height: 4.0),
                        Text('إضافة صورة', style: Style.tiny()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        title: 'الصور');
  }

  //
  content() {
    switch (currentStepp) {
      case 1:
        return classificationWidget();
      case 2:
        return boxDetailsAdsAndImages();
      case 3:
        return Container(child: Text('about woner|'));
    }

    // if (currentStepp == 1) {
    //   return Container(child: Text('1'));
    // }
    // if (currentStepp == 2) {
    //   return Container(child: Text('2'));
    // }
    // if (currentStepp == 3) {
    //   return Container(child: Text('3'));
    // }
    // return Container(child: Text('no'));
  }

// spreated pease of code multi images
  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';

  Widget buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 2.0,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        //
        return Container(
          margin: EdgeInsets.all(10.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              AssetThumb(
                asset: asset,
                width: 300,
                height: 300,
              ),
              Positioned(
                top: -10.0,
                left: -10.0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      images.removeAt(index);
                    });
                  },
                  child: Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';
    CustomFlushBar.flushbar('msg', context, isError: false);
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 3,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
          doneButtonTitle: "Fatto",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
      CustomFlushBar.flushbar(_error.toString(), context, isError: false);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  // dropdown multi currency

  // التصنيف
  bool dropMainCategoryEmpty = true,
      // التصنيف الفرعي
      dropSubCategory = true,
      // الفئة الفرعية
      dropSubClassEmpty = true;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إضافة إعلان جديد'),
      ),
      body: BodyWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // stepper
              _stepper(),
              // content
              content(),
              // button
              // buildGridView(),
              // ElevatedButton(
              //   child: Text("Pick images"),
              //   onPressed: () {
              //     print('multi images ${images.length}');

              //     loadAssets();
              //   },
              // ),
              MyElevatedBtn(
                margin: EdgeInsets.all(8.0),
                radius: 10.0,
                // width: context.width * 0.90,
                onPressed: () {
                  print('currentStepp $currentStepp');

                  // if (currentStepp >= 0 && currentStepp < 1 ||
                  //     currentStepp < 2) {
                  //   currentStepp += 1;
                  //   isDetailsAds = true;
                  //   txtBtnStepper = 'التالي';
                  //   isWonerAds = false;
                  // }
                  // if (currentStepp == 2) {
                  //   isWonerAds = true;
                  //   currentStepp -= 1;
                  //   txtBtnStepper = 'السابق';
                  // }
                  switch (currentStepp) {
                    case 1:
                      currentStepp += 1;
                      isDetailsAds = true;
                      txtBtnStepper = 'التالي';
                      isWonerAds = false;
                      break;
                    case 2:
                      currentStepp += 1;
                      isDetailsAds = true;
                      txtBtnStepper = 'التالي';
                      isWonerAds = true;
                      break;
                  }
                  setState(() {});
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back),
                    SizedBox(width: 10),
                    Text(
                      txtBtnStepper,
                      style: Style.bold(color: Colors.white, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
