import 'package:flutter/material.dart';


class ProductDetails extends StatefulWidget {
   final image;
   final title;
   final description;
   final category;
   final price;

   ProductDetails({super.key,
     required this.image,
  required   this.title,
    required this.description,
     required this.category,
     required this.price
   });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Row(
          children: [
            Text('ProductDetails'),
            SizedBox(width: 60,),
            Icon(Icons.shopping_cart_sharp),
            SizedBox(width: 20,),
            Icon(Icons.more_vert_outlined)
          ],

        ),
      centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
SizedBox(height: 30,),
          Container(
            child: Image(
              height: 260,
              width: double.infinity,
              image: NetworkImage(widget.image.toString()),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(widget.title,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 21) ),
                SizedBox(height: 10,),
                Text(widget.category,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16) ),
                  SizedBox(height: 10,),
                  Text(widget.description,style: TextStyle( fontSize: 14) ),
                  SizedBox(height: 10,),
                  Row(children: [Icon(Icons.star),Icon(Icons.star),Icon(Icons.star),Icon(Icons.star)],),
                  SizedBox(height: 10,),
                  Text("\$${widget.price} ",style: TextStyle( fontSize: 24,fontWeight: FontWeight.bold) ),

              ],),
            ),
          )

        ],),
      ),
      
    );
  }
}
