import 'package:flutter/material.dart';


import '../../models/shopping_model.dart';
import '../button/add_to_cart_button.dart';
import '../shopping_home_details/shopping_home_details.dart';
import 'image_widgets.dart';

class ShoppingHomeTile extends StatelessWidget {
  final ShoppingHomeModel shoppingHomeModel;
  const ShoppingHomeTile({Key? key, required this.shoppingHomeModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShoppingHomeDetails(
              shoppingHomeModel: shoppingHomeModel,
            ),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageWidget(imageUrl: shoppingHomeModel.image!),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                shoppingHomeModel.title!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rs. ${shoppingHomeModel.price}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      Text(
                        ' ${shoppingHomeModel.rating?.rate ?? 0}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const AddToCartButton(),
          ],
        ),
      ),
    );
  }
}
