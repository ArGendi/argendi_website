
import 'dart:ui';

import 'package:AG/tabe3/cubits/products/products_cubit.dart';
import 'package:AG/tabe3/models/product.dart';
import 'package:AG/tabe3/view/screens/products/product_details.dart';
import 'package:flutter/material.dart';


class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  @override
  Widget build(BuildContext context) {
    late ImageProvider<Object> x;
    if(widget.product.image != null){
      x = NetworkImage(widget.product.image!);
    }
    else{
      x = AssetImage("assets/images/deafult.jpeg");
    }
    return GestureDetector(
      onTap: (){
        ProductsCubit.get(context).filteredProducts 
              = ProductsCubit.get(context).products;
        Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetails(product: widget.product,)));
      },
      child: Container(
          width: 120,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: x,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: Text(
                        "${widget.product.price} LE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}