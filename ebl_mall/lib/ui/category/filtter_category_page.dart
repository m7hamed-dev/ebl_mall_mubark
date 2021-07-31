import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:ebl_mall/models/sub_category_model.dart';
import 'package:ebl_mall/network/api.dart';
import 'package:ebl_mall/style/style.dart';
import 'package:ebl_mall/ui/animal/card_animal.dart';
import 'package:ebl_mall/widgets/error_network_widget.dart';
import 'package:flutter/material.dart';
import 'package:ebl_mall/main.dart';

//
class FiltterCategoryPage extends StatefulWidget {
  //
  const FiltterCategoryPage(
      {Key? key, required this.categoryName, required this.categoryID})
      : super(key: key);

  // properties
  final int categoryID;
  final String categoryName;

  @override
  _FiltterCategoryPageState createState() => _FiltterCategoryPageState();
}

class _FiltterCategoryPageState extends State<FiltterCategoryPage> {
  //
  bool isLoading = true;
  bool isNetworkError = false;
  List<SubCategory> _subCategories = [];
  String selectedValue = 'selectedValue';
  //
  Widget widgetSubCategories() {
    if (isLoading) {
      return Container(child: CircularProgressIndicator());
    }
    if (isNetworkError) {
      return Center(child: ErrorNetworkWidget());
    }
    return Container(
      width: context.width,
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(3.0),
      //   border: Border.all(
      //     color: Style.customGrey,
      //   ),
      // ),
      child: _subCategories.length == 0
          ? Center(child: Text('no result'))
          : FadeInUp(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                scrollDirection: Axis.vertical,
                itemCount: _subCategories.length,
                // physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  //
                  return Text(_subCategories[index].name);
                  // return CardAnimal(
                //   index: index,
                  //   category: _subCategories[index],
                  // );
                },
              ),
            ),
    );
  }

  Future populateSubCategories() async {
    await API.fetchSubCategories(widget.categoryID).then((value) {
      if (value != null) {
        //
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

  @override
  void initState() {
    populateSubCategories();
    super.initState();
  }

  var initValueCategories = '';
  // build
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: Column(
        children: [
          Container(
            // height: 100,
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              border: Border.all(color: Style.customGrey),
            ),
            child: _subCategories.length < 0
                ? Center(child: CircularProgressIndicator())
                : DropdownButton<String>(
                    underline: Container(),
                    icon: Icon(Icons.keyboard_arrow_down),
                    // style: TextStyle(),
                    isExpanded: true,
                    isDense: true,
                    style: Style.medium(),
                    onChanged: (v) => setState(() => initValueCategories = v!),
                    hint: Text(initValueCategories),
                    // value: initValueCategories,
                    items: _subCategories.map((SubCategory subCategory) {
                      return DropdownMenuItem<String>(
                        value: subCategory.name,
                        child: Text(subCategory.name, style: Style.tiny()),
                      );
                    }).toList(),
                  ),
          ),
          widgetSubCategories(),
        ],
      ),
    );
  }
}
