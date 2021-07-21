class PageModel<T extends  JsonConvertable> {
  bool? hasMore;
  int? page;
  int? total;
  List<T>? items;
 
  PageModel({this.hasMore, this.page, this.total, this.items});

  PageModel.fromJson(Map<String, dynamic> json, T valueObject) {
    hasMore = json['hasMore'];
    page = json['page'];
    total = json['total'];
    if (json['items'] != null) {
      
      items = <T>[];
      json['items'].forEach((v) {
       // items!.add(new Items.fromJson(v));
       items!.add(  valueObject.fromJson(v) as T);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasMore'] = this.hasMore;
    data['page'] = this.page;
    data['total'] = this.total;
    if (this.items != null) {
      data['items'] = this.items!.map(( v ) => v.toJson()).toList();
    }
    return data;
  }
}
abstract class JsonConvertable{
  JsonConvertable fromJson(Map<String, dynamic> json);
   Map<String, dynamic> toJson();
}
class StoreItem implements JsonConvertable{
  int? id;
  String? title;
  String? imageUrl;
  String? address;
  String? logoImageUrl;
  bool? isFreeDeliveryExist;
  int? tcategoryStoreId;

  StoreItem(
      {this.id,
      this.title,
      this.imageUrl,
      this.address,
      this.logoImageUrl,
      this.isFreeDeliveryExist,
      this.tcategoryStoreId});
@override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['address'] = this.address;
    data['logoImageUrl'] = this.logoImageUrl;
    data['isFreeDeliveryExist'] = this.isFreeDeliveryExist;
    data['tcategoryStoreId'] = this.tcategoryStoreId;
    return data;
  }

  @override
  JsonConvertable fromJson(Map<String, dynamic> json) {
    return StoreItem()
    ..id = json['id']
    ..title = json['title']
    ..imageUrl = json['imageUrl']
    ..address = json['address']
    ..logoImageUrl = json['logoImageUrl']
    ..isFreeDeliveryExist = json['isFreeDeliveryExist']
    ..tcategoryStoreId = json['tcategoryStoreId'];
  }
}