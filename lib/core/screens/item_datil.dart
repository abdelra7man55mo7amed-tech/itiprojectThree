import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:itiprojectthree/core/helpers/app_color.dart';
import 'package:itiprojectthree/core/models/product_model.dart';
import 'package:itiprojectthree/core/screens/carts.dart';
import 'package:itiprojectthree/core/widgets/button.dart';
import 'package:itiprojectthree/core/widgets/title_app_bar.dart';

class ItemDatil extends StatelessWidget {
  ItemDatil({super.key, required this.modelCategoryProduct});
  final ModelCategoryProduct modelCategoryProduct;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TitleAppBar(title: "Details"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          CachedNetworkImage(imageUrl: modelCategoryProduct.productImage),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.only(left: 24, bottom: 20),
            child: Text(
              modelCategoryProduct.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColor.color1a1,
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.only(left: 24),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Padding(padding: EdgeInsets.only(left: 10)),
                Text(
                  "${modelCategoryProduct.rating}",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColor.color1a1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.only(left: 24, bottom: 20),
            child: Text(
              modelCategoryProduct.description,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.color808,
              ),
            ),
          ),
          SizedBox(height: 80),
          Divider(color: AppColor.color808),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "price",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.color808,
                      ),
                    ),
                    Text(
                      "${modelCategoryProduct.price}",
                      style: TextStyle(
                        color: AppColor.color1a1,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 240,
                  padding: EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.color9c9,
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                    ),
                    onPressed: () {
                      AnimatedSnackBar.material(
                        'This a snackbar with info type',
                        type: AnimatedSnackBarType.success,
                        duration: const Duration(seconds: 1),
                        mobilePositionSettings: const MobilePositionSettings(
                          topOnAppearance: 100,
                        ),
                        mobileSnackBarPosition: MobileSnackBarPosition.top,
                        desktopSnackBarPosition:
                            DesktopSnackBarPosition.bottomLeft,
                      ).show(context);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Carts()));
                    },
                    child: Text(
                      "Add to chars",
                      style: TextStyle(
                        color: AppColor.colorfff,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
