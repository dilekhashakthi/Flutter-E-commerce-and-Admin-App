import 'package:e_commerce_app/models/cart_model.dart';
import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/widgests/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuantityBottomSheetWidget extends StatelessWidget {
  final CartModel cartModel;

  const QuantityBottomSheetWidget({super.key, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          height: 6,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: 25,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  cartProvider.updateQty(
                    productID: cartModel.productID,
                    qty: index + 1,
                  );
                  Navigator.pop(context);
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SubtitleTextWidget(label: "${index + 1}"),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
