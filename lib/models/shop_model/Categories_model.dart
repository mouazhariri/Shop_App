class CategoriesModel {
  bool status;
  CategoriesDataModel data;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = CategoriesDataModel.fromJson(json['data']) ?? '';
  }
}

class CategoriesDataModel {
  int currentPage;
  List<CategoriesData> data = [];

  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((element) {
      data.add(CategoriesData.fromJson(element));
    });
  }
}

class CategoriesData {
  int id;
  String name;
  String image;

  CategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    image = json['image'] ?? '';
  }
}
