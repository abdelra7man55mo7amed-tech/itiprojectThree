import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itiprojectthree/core/helpers/app_color.dart';
import 'package:itiprojectthree/core/screens/item_datil.dart';
import 'package:itiprojectthree/core/widgets/categorie_item.dart';
import 'package:itiprojectthree/core/widgets/product_item.dart';
import 'package:itiprojectthree/core/widgets/title_page.dart';
import 'package:itiprojectthree/cuibts/cubit/categorie_cubit.dart';
import 'package:itiprojectthree/cuibts/cubit/products_cubit.dart';
import 'package:itiprojectthree/cuibts/cubit/search_cubit.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  String catName = "All";
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CategorieCubit()..getCategories()),
        BlocProvider(create: (_) => ProductsCubit()..getProducts("All")),
        BlocProvider(create: (_) => SearchCubit()),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 59),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitlePage(title: "Discover".tr()),
                  const SizedBox(height: 16),
                  TextField(
                    controller: controller,
                    onChanged: (value) {
                      setState(() {});
                      if (value.isEmpty) {
                        context.read<ProductsCubit>().getProducts(catName);
                      } else {
                        context.read<SearchCubit>().research(value);
                      }
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search, color: AppColor.colorb3b),
                      hintText: "Search".tr(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: AppColor.colore6e),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: AppColor.color9c9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  /// Categories
                  BlocBuilder<CategorieCubit, CategorieState>(
                    builder: (context, state) {
                      if (state is CatLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is CatFail) {
                        return Center(child: Text(state.message));
                      }
                      if (state is CatSuccess) {
                        return SizedBox(
                          height: 70,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.categories.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    catName = state.categories[index];
                                  });
                                  context.read<ProductsCubit>().getProducts(
                                    state.categories[index],
                                  );
                                },
                                child: CategorieItem(
                                  title: state.categories[index],
                                  color: catName == state.categories[index]
                                      ? AppColor.color9c9
                                      : Colors.white,
                                  textColor: catName == state.categories[index]
                                      ? Colors.white
                                      : AppColor.color1a1,
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  Expanded(
                    child: controller.text.isEmpty
                        ? BlocBuilder<ProductsCubit, ProductsState>(
                            builder: (context, state) {
                              if (state is ProductLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (state is ProductSuccess) {
                                return GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 2 / 3,
                                      ),
                                  itemCount: state.products.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemDatil(modelCategoryProduct: state.products[index])));
                                      },
                                      child: ProductItem(
                                        img: state.products[index].thumbnail,
                                        tite: state.products[index].title,
                                        price: "${state.products[index].price}",
                                      ),
                                    );
                                  },
                                );
                              }
                              return const SizedBox();
                            },
                          )
                        : BlocBuilder<SearchCubit, SearchState>(
                            builder: (context, state) {
                              if (state is SearchLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
        
                              if (state is SearchSuccess) {
                                List products = state.data["products"];
                                return GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 2 / 3,
                                      ),
                                  itemCount: products.length,
                                  itemBuilder: (context, index) {
                                    return ProductItem(
                                      img: products[index]["thumbnail"],
                                      tite: products[index]["title"],
                                      price: "${products[index]["price"]}",
                                    );
                                  },
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
