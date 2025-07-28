import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper_app/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:shopper_app/features/wishlist/bloc/wishlist_event.dart';
import 'package:shopper_app/features/wishlist/bloc/wishlist_state.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(product['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['title'],
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${product['price']}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  bool isWishlisted = false;
                  if (state is WishlistUpdated) {
                    isWishlisted = state.wishlistItems.any(
                      (item) => item['id'] == product['id'],
                    );
                  }

                  return CircleAvatar(
                    backgroundColor: Colors.white.withValues(alpha: 0.8),
                    child: IconButton(
                      icon: Icon(
                        isWishlisted ? Icons.favorite : Icons.favorite_border,
                        size: 22,
                        color: isWishlisted ? Colors.red : Colors.black,
                      ),
                      onPressed: () {
                        if (isWishlisted) {
                          context.read<WishlistBloc>().add(
                            RemoveFromWishlist(product),
                          );
                        } else {
                          context.read<WishlistBloc>().add(
                            AddToWishlist(product),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
