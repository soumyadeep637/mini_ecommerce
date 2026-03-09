import 'package:flutter/material.dart';
import 'package:mini_ecommerce/presentation/button/add_to_cart_button.dart';

import '../../models/shopping_model.dart';
import '../widgets/image_widgets.dart';

class ShoppingHomeDetails extends StatefulWidget {
  final ShoppingHomeModel shoppingHomeModel;
  const ShoppingHomeDetails({super.key, required this.shoppingHomeModel});

  @override
  State<ShoppingHomeDetails> createState() => _ShoppingHomeDetailsState();
}

class _ShoppingHomeDetailsState extends State<ShoppingHomeDetails> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details',style: TextStyle(fontWeight: FontWeight.w600),),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 0.02)),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ImageWidget(imageUrl: widget.shoppingHomeModel.image!),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('M.R.P: \Rs. ${widget.shoppingHomeModel.price!.toString()}',
                              style:
                              const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow, size: 16,),
                              const SizedBox(width: 5,),
                              Text('${widget.shoppingHomeModel.rating!.rate!.toString()}')
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(widget.shoppingHomeModel.title!,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(widget.shoppingHomeModel.description!,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const AddToCartButton(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
