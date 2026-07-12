import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itiprojectthree/core/helpers/app_color.dart';
import 'package:itiprojectthree/core/widgets/button.dart';
import 'package:itiprojectthree/core/widgets/cart_details.dart';
import 'package:itiprojectthree/core/widgets/title_app_bar.dart';
import 'package:itiprojectthree/cuibts/cubit/get_cart_cubit.dart';

class Carts extends StatelessWidget {
  const Carts({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetCartCubit()..getCart(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: TitleAppBar(title: "Carts"),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<GetCartCubit, GetCartState>(
                  builder: (context, state) {
                    if (state is CartLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is CartFailure) {
                      return Center(child: Text(state.message));
                    }
                    if (state is CartSuccess) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.cart.products.length,
                            itemBuilder: (context, index) {
                              final product = state.cart.products[index];
                              return CartDetails(
                                img: product.thumbnail,
                                title: product.title,
                                subtitle: "Qty: ${product.quantity}",
                                price: product.price.toString(),
                              );
                            },
                          ),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sub-total" , style: TextStyle(fontWeight: FontWeight.w400 , fontSize: 16 , color: AppColor.color808),),
                              Text("${state.cart.total}")
                            ],
                          ),
                          Button(onPressed: (){}, title: "Go to check out")
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
