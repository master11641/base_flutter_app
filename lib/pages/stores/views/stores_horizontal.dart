import 'package:base_flutter_app/pages/stores/stores_controller.dart';
import 'package:base_flutter_app/tools/custom_widgets.dart';
import 'package:base_flutter_app/tools/helper.dart';
import 'package:base_flutter_app/view_models/page_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoresHorizontal extends StatelessWidget {
  StoresHorizontal({Key? key}) : super(key: key);
  final StoreController _storeController = Get.find<StoreController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        height: 100,
        child: ListView.builder(
            itemCount: _storeController.items.length,
            itemBuilder: (context, index) {
              //return _buildItems(_storeController.pages[index]);
              //  return _storeController.pages[index].items.map((e) => _buildItems(e))
              _storeController.calculatePageIndexForeFetch(index);
              return _buildItems(_storeController.items[index], index + 1);
            },
            scrollDirection: Axis.horizontal)));
  }

  Widget _buildItems(Items item, int index) {
    return Card(
        child: Column(
      children: [
        Text(item.title!),
       Expanded(child:  CustomWidgets.imageNetwork(item.imageUrl!),)
       
      ],
    ));
  }
}
