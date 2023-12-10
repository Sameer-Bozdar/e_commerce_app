import 'package:ecommerce_app/view/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';
import '../viewModel/storeViewModel.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StoreViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 60,),
            Text('PRODUCTS'),
            SizedBox(width: 60,),
            Icon(Icons.shopping_cart_sharp),
            SizedBox(width: 20,),
            Icon(Icons.more_vert_outlined)
          ],
        ),

      ),
      body: Consumer<StoreViewModel>(
        builder: (context, value, child) {
          return GridView.builder(
              itemCount: value.apiResponse.data?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 350, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                switch (value.apiResponse.status) {
                  case Status.LOADING:
                    return const Center(child: CircularProgressIndicator());
                  case Status.COMPLETED:
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails(image: value.apiResponse.data![index].image.toString(),
                          title: value.apiResponse.data![index].title.toString(),
                            description: value.apiResponse.data![index].description.toString(),
                            category: value.apiResponse.data![index].category
                                .toString(),
                            price: value.apiResponse.data![index].price
                                .toString(),
                          )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200, // shadow color
                                offset: Offset(0.0,
                                    2.0), // offset in the x and y directions
                                blurRadius: 0.2, // blur radius
                                spreadRadius: 1.0, // spread radius
                              ),
                            ],
                            // color: Colors.orange,
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Image(
                                    image: NetworkImage(
                                      value.apiResponse.data![index].image
                                          .toString(),
                                    ),
                                    width: 150, // specify the width
                                    height: 120, // specify the height
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            value.apiResponse.data![index].title
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(value
                                              .apiResponse.data![index].category
                                              .toString()),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 7),
                                          child: Text('Available : 300'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            "\$${value.apiResponse.data![index].price}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        )
                                      ]),
                                ],
                              )),
                        ),
                      ),
                    );

                  case Status.ERROR:
                    return Center(
                        child: Text(value.apiResponse.message.toString()));
                  default:
                    const Text('');
                }
                return Container(
                  child: const Text('no data '),
                );
              });
        },
        // );
        // },
      ),
    );
  }
}
