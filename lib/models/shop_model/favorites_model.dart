class FavoritesModel {
  bool status;
  Null message;
  Data data;

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    this.data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int currentPage;
  List<FavoritesData> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  Null nextPageUrl;
  String path;
  int perPage;
  Null prevPageUrl;
  int to;
  int total;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<FavoritesData>();
      json['data'].forEach((v) {
        data.add(new FavoritesData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class FavoritesData {
  int id;
  Product product;

  FavoritesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = Product.fromJson(json['product']) ?? '';
  }
}

class Product {
  int id;
  dynamic price;
  dynamic oldPrice;
  int discount;
  String image;
  String name;
  String description;

  Product(
      {this.id,
      this.price,
      this.oldPrice,
      this.discount,
      this.image,
      this.name,
      this.description});

  Product.fromJson(Map<String, dynamic> json) {
    this.id = json['id'] ?? 0;
    this.price = json['price'] ?? '';
    this.oldPrice = json['old_price'] ?? '';
    this.discount = json['discount'] ?? '';
    this.image = json['image'] ?? '';
    this.name = json['name'] ?? '';
    this.description = json['description'] ?? '';
  }
}
