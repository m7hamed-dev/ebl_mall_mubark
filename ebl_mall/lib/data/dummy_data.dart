import 'package:ebl_mall/main.dart';

class ClassDummyData {
  static final List<String> dummyCategories = [
    'قسم الصقور',
    'قسم الإبل',
    'قسم الخيول',
    'قسم المواشي',
  ];
  static final List<AnimalMode> dummyAnimals = List.generate(
    10,
    (index) => AnimalMode(
      phone: '092353022$index',
      imgUrl: 'assets/images/img_camel.jpg',
      name: 'جمل فحل طيب',
      price: 1200,
    ),
  );
  //
}
