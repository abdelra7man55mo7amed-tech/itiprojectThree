import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/helpers/app_color.dart';
class CartDetails extends StatefulWidget {
  const CartDetails({
    super.key,
    required this.img,
    required this.title,
    required this.subtitle,
    required this.price,
  });
  final String img;
  final String title;
  final String subtitle;
  final String price;
  @override
  State<CartDetails> createState() => _CartDetailsState();
}
class _CartDetailsState extends State<CartDetails> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColor.color808
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CachedNetworkImage(
              imageUrl: widget.img,
              width: 83,
              height: 79,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColor.color1a1,
                        ),
                      ),
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColor.color808,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        widget.price,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColor.color808,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.delete,
                      color: Color(0xffED1010),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          setState(() {
                            count++;
                          });
                        }, icon: Icon(Icons.add)),
                        Text("${count}"),
                        IconButton(onPressed: (){
                          setState(() {
                            if(count == 1)return;
                            count--;
                          });
                        }, icon: Icon(Icons.remove)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}