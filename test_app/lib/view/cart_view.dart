import 'package:flutter/material.dart';
import 'package:test_app/const/text_const.dart';
import 'package:test_app/provider/cart_view_provider.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewProvider>(
      builder: (BuildContext context, CartViewProvider value, Widget? child) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: value.combinedList.isEmpty
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: Colors.grey[200],
                  child: const Center(
                    child: Text(noItemInCart),
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: Colors.grey[200],
                  child: ListView.builder(
                    itemCount: value.combinedList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(
                          value.combinedList[index].imageUrl,
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                        ),
                        title: Row(
                          children: [
                            Text(value.combinedList[index].name, style: const TextStyle(fontSize: 15)),
                            const Text(" - "),
                            Text(value.combinedList[index].type, style: const TextStyle(fontSize: 11)),
                          ],
                        ),
                        subtitle: Text(value.combinedList[index].explanation, style: const TextStyle(fontSize: 11)),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
