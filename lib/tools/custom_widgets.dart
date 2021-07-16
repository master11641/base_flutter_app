import 'package:flutter/material.dart';

class CustomWidgets{
  static Widget imageNetwork(String imageUrl){
   return Image.network(imageUrl, fit: BoxFit.fill, loadingBuilder:
          (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
            child: CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
              : null,
        ));
      });
  }
}