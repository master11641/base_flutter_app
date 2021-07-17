

import 'package:base_flutter_app/pages/stores/stores_controller.dart';
import 'package:base_flutter_app/tools/custom_widgets.dart';
import 'package:base_flutter_app/view_models/page_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoresHorizontal extends StatefulWidget {
  StoresHorizontal({Key? key}) : super(key: key);

  @override
  _StoresHorizontalState createState() => _StoresHorizontalState();
}

class _StoresHorizontalState extends State<StoresHorizontal>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  final StoreController _storeController = Get.find<StoreController>();
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _animationController!.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        height: 100,
        child: ListView.builder(
            itemCount: _storeController.items.length,
            itemBuilder: (context, index) {
              _storeController.calculatePageIndexForeFetch(index);
              return _buildItems(_storeController.items[index], index);
            },
            scrollDirection: Axis.horizontal)));
  }

  Widget _buildItems(Items item, int index) {
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController!,
        curve: Interval((1 / 9) * 3, 1.0,  curve: Curves.fastOutSlowIn)));
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        print(_animation!.value);
        return FadeTransition(
          opacity: _animation!,    
          child: Transform(
             transform: Matrix4.translationValues(
                  0.0, 30 * (1.0 - _animation!.value),30 * (1.0 - _animation!.value)),
            child: Card(
                child: Column(
              children: [
                Text(item.title!),
                Expanded(
                  child: CustomWidgets.imageNetwork(item.imageUrl!),
                )
                //Expanded(child:  )
              ],
            )),
          ),
        );
      },
    );

  }

}
