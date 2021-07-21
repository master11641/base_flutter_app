import 'package:base_flutter_app/constants/urls.dart';
import 'package:base_flutter_app/services/net_service.dart';
import 'package:base_flutter_app/view_models/page_model.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
  final pages = <PageModel>[];
 final items = <StoreItem>[].obs;
  final itemsPerPage = 10;
  final currentPage = 0.obs;
  StoreController() {
    fetchData();
  }
  Future<void> fetchData() async {
    if(pages.length!=0 && pages.last.hasMore==false){return;}
    var response = await NetService.fetchJsonData(Urls.storesUrl +
        "ItemsInPage=$itemsPerPage&PageNumber=${(currentPage.value + 1)}");
    PageModel pageModel = PageModel.fromJson(response,new StoreItem());
    pageModel.items!.forEach((element) {
      items.add(element as StoreItem);
    });
    pages.add(pageModel);
    currentPage.value++;
  }

  Future calculatePageIndexForeFetch(int itemIndex) async {   
       if((itemIndex +2) == items.length ){
         fetchData();
    }
  }
}
