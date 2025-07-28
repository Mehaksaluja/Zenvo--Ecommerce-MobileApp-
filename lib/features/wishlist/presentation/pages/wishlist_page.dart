import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper_app/features/products/presentation/widgets/product_card.dart';
import 'package:shopper_app/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:shopper_app/features/wishlist/bloc/wishlist_state.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Wishlist',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistInitial ||
              (state is WishlistUpdated && state.wishlistItems.isEmpty)) {
            return const Center(child: Text('Your wishlist is empty.'));
          }
          if (state is WishlistUpdated) {
            return GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.75,
              ),
              itemCount: state.wishlistItems.length,
              itemBuilder: (context, index) {
                final product = state.wishlistItems[index];
                return ProductCard(product: product);
              },
            );
          }
          return const Center(child: Text('Something went wrong.'));
        },
      ),
    );
  }
}
