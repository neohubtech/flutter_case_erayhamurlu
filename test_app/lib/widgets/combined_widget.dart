import 'package:flutter/material.dart';
import 'package:test_app/model/combined_model.dart';
import 'package:test_app/provider/cart_view_provider.dart';
import 'package:provider/provider.dart';

class CombinedWidget extends StatelessWidget {
  CombinedWidget({
    super.key,
    required this.combinedModel,
  });

  final CombinedModel combinedModel;
  final ValueNotifier<bool> isSelected = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        combinedModel.imageUrl,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
      ),
      title: Row(
        children: [
          Text(combinedModel.name, style: const TextStyle(fontSize: 15)),
          const Text(" - "),
          Text(combinedModel.type, style: const TextStyle(fontSize: 11)),
        ],
      ),
      subtitle: Text(combinedModel.explanation, style: const TextStyle(fontSize: 11)),
      trailing: ValueListenableBuilder<bool>(
        valueListenable: isSelected,
        builder: (context, value, child) {
          return IconButton(
            onPressed: () {
              if (isSelected.value) {
                context.read<CartViewProvider>().removeCombinedList(combinedModel);
              } else {
                context.read<CartViewProvider>().addCombinedList(combinedModel);
              }
              isSelected.value = !isSelected.value;
            },
            icon: value ? const Icon(Icons.check_box_rounded) : const Icon(Icons.check_box_outline_blank_rounded),
          );
        },
      ),
    );
  }
}
