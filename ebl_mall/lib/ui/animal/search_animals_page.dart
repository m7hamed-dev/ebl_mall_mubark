import 'dart:convert';
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:ebl_mall/network/api.dart';
import 'package:ebl_mall/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class SearchAnimalsPage extends StatefulWidget {
  //
  const SearchAnimalsPage({Key? key}) : super(key: key);
  @override
  _SearchAnimalsPageState createState() => _SearchAnimalsPageState();
}

class _SearchAnimalsPageState extends State<SearchAnimalsPage> {
  bool isLoading = true;
  bool isInternetError = false;

  Future simulationData() async {
    return await API.fetchMainCategories().then((value) {
      if (value != null) {
        final data = json.decode(value)['data'];
        names.addAll(data);
        isLoading = false;
        setState(() {});
      }
    }).catchError((error) {
      if (error is SocketException) {
        isInternetError = true;
        isLoading = false;
        setState(() {});
      }
    });
  }

  List names = [];
  List filtterNames = [];
  //
  Widget _body() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    if (isInternetError) {
      return Center(child: Text('internet error !!'));
    }
    //
    filtterNames = searchController!.text.isEmpty
        ? names
        : filtterNames
            .where((e) => searchController!.text.contains(e['name']))
            .toList();
    //
    return ListView.builder(
      itemCount: filtterNames.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(elevation: 5.0, child: Text(filtterNames[index]['name']));
      },
    );
  }

  //
  @override
  void initState() {
    searchController = TextEditingController();
    simulationData();
    super.initState();
  }

  TextEditingController? searchController;
  //
  int get countOfResult => names.length > 0 ? names.length : 0;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(),
      body: FadeInUp(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: InputWidget(
                  controller: searchController,
                  onChange: (v) {
                    // print(v);
                    setState(() {});
                  },
                  prefixIcon: InkWell(
                    onTap: () {
                      if (searchController!.text.isNotEmpty) {
                        searchController!.clear();
                        setState(() {});
                      }
                    },
                    child: Icon(searchController!.text.isEmpty
                        ? Icons.search
                        : Icons.close),
                  ),
                ),
              ),
              searchController!.text.isNotEmpty
                  ? Expanded(child: Text('$countOfResult'))
                  : const SizedBox(width: 0.0, height: 0.0),
              Expanded(
                flex: 6,
                child: _body(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController!.dispose();
    super.dispose();
  }
}
