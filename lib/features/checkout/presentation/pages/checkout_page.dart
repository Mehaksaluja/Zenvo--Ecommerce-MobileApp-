import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper_app/features/cart/bloc/cart_bloc.dart';
import 'package:shopper_app/features/cart/bloc/cart_event.dart';
import 'package:shopper_app/features/cart/bloc/cart_state.dart';
import 'package:shopper_app/features/checkout/bloc/checkout_bloc.dart';
import 'package:shopper_app/features/checkout/bloc/checkout_event.dart';
import 'package:shopper_app/features/checkout/bloc/checkout_state.dart';
import 'package:shopper_app/features/checkout/presentation/pages/order_confirmation_page.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Checkout')),
        body: BlocListener<CheckoutBloc, CheckoutState>(
          listener: (context, state) {
            if (state is CheckoutSuccess) {
              // Clear the main cart and navigate to success screen
              context.read<CartBloc>().add(ClearCart());
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderConfirmationPage(),
                ),
                (route) => route.isFirst,
              );
            } else if (state is CheckoutFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, cartState) {
              if (cartState is CartUpdated) {
                final double totalPrice = cartState.cartItems.fold(
                  0,
                  (sum, item) => sum + item['price'],
                );
                return ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    Text(
                      'Order Summary',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    ...cartState.cartItems.map(
                      (item) => ListTile(
                        title: Text(item['title'], maxLines: 1),
                        trailing: Text('\$${item['price']}'),
                      ),
                    ),
                    const Divider(),
                    Text(
                      'Shipping Information',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Full Name'),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Address'),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          '\$${totalPrice.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    BlocBuilder<CheckoutBloc, CheckoutState>(
                      builder: (context, checkoutState) {
                        if (checkoutState is CheckoutLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {
                              context.read<CheckoutBloc>().add(
                                PlaceOrder(
                                  cartItems: cartState.cartItems,
                                  totalPrice: totalPrice,
                                ),
                              );
                            },
                            child: const Text('Place Order'),
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
              return const Center(child: Text('Your cart is empty.'));
            },
          ),
        ),
      ),
    );
  }
}
