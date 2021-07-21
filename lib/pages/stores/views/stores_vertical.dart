import 'package:base_flutter_app/pages/stores/stores_controller.dart';
import 'package:base_flutter_app/tools/custom_widgets.dart';
import 'package:base_flutter_app/view_models/page_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoresVerticalPage extends StatefulWidget {
  StoresVerticalPage({Key? key}) : super(key: key);

  @override
  _StoresVerticalPageState createState() => _StoresVerticalPageState();
}

class _StoresVerticalPageState extends State<StoresVerticalPage> {
  StoreController _storeController = Get.find<StoreController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => GridView.builder(
            itemCount: _storeController.items.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              _storeController.calculatePageIndexForeFetch(index);
              return _buildCard(_storeController.items[index], context);
            })));
  }
}

Widget _buildCard(StoreItem item, BuildContext context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: 180,
              height: 180,
              color: Colors.red,
              child: CustomWidgets.imageNetwork(item.imageUrl!),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Opacity(
                opacity: 0.7,
                child: Container(
                  height: 30,
                  color: Colors.black,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          item.title!,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    ),
  );
}
