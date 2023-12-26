import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/const/text_const.dart';
import 'package:test_app/provider/bottom_bar_view_provider.dart';
import 'package:test_app/provider/cart_view_provider.dart';

import 'cart_view.dart';
import 'home_view.dart';

class BottomBarView extends StatelessWidget {
  BottomBarView({super.key});

  final List<Widget> pages = [
    const HomeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomBarViewProvider>(
        builder: (context, provider, child) {
          return IndexedStack(
            index: 0,
            children: pages,
          );
        },
      ),
      bottomNavigationBar: Consumer<BottomBarViewProvider>(
        builder: (context, provider, child) {
          return BottomNavigationBar(
            currentIndex: provider.currentIndex,
            onTap: (index) {
              provider.setCurrentIndex(index);

              //If the cart is showing and the user taps on the cart icon or home icon, then the cart will be closed.
              if (provider.isCartShowing) {
                Navigator.pop(context);
                provider.setCartStatus(false);
                return;
              }

              //If the cart is not showing and the user taps on the cart icon, then the cart will be opened.
              if (index == 1 && !provider.isCartShowing) {
                showBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const CartView();
                  },
                );
                provider.setCartStatus(true);
              }
            },
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: home,
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    const Icon(Icons.shopping_cart, size: 26),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 1, left: 2, right: 2, top: 0),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${context.watch<CartViewProvider>().combinedList.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                label: cart,
              ),
            ],
          );
        },
      ),
    );
  }
}
