// class ChangeFavoriteModel{
//   bool status;
//   String message;
//   ChangeFavoriteModel.fromJson(Map<String,dynamic>json){
//     status=json['status'];
//     message=json['message'];
//
//   }}
class ChangeFavoritesModel {
  bool status;
  String message;

  ChangeFavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? '';
    message = json['message'] ?? '';
  }
}
