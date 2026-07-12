import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/helpers/app_color.dart';

class ProductItem extends StatelessWidget{
  ProductItem({super.key , required this.img , required this.tite , required this.price});
  final String img;
  final String tite;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:BorderRadius.all(Radius.circular(15)) ,
            child:CachedNetworkImage(imageUrl: img , width: 161,height: 174,),
          ),
          SizedBox(height: 8,),
          Expanded(child: Text(tite , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w600 , color: AppColor.color1a1),)),
          Text(price , style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w500 , color: AppColor.color808),)
        ],
      ),
    );
  }
}