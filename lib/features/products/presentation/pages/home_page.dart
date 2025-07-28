import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper_app/features/cart/bloc/cart_bloc.dart';
import 'package:shopper_app/features/cart/bloc/cart_state.dart';
import 'package:shopper_app/features/cart/presentation/pages/cart_page.dart';
import 'package:shopper_app/features/products/bloc/product_bloc.dart';
import 'package:shopper_app/features/products/bloc/product_event.dart';
import 'package:shopper_app/features/products/bloc/product_state.dart';
import 'package:shopper_app/features/products/presentation/pages/product_detail_page.dart';
import 'package:shopper_app/features/products/presentation/widgets/product_card.dart';
import 'package:shopper_app/features/wishlist/presentation/pages/wishlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // State for managing category selection
  final List<String> categories = [
    'All',
    'Electronics',
    'Jewelery',
    "Men's clothing",
    "Women's clothing",
  ];
  String selectedCategory = 'All';

  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose(); // Don't forget to dispose of it!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Provide the ProductBloc and fetch all products initially
    return BlocProvider(
      create: (context) => ProductBloc()..add(FetchAllProducts()),
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  'Zenvo',
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(color: Colors.white),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Home'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart_outlined),
                title: const Text('My Cart'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite_border),
                title: const Text('My Wishlist'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WishlistPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            // Main scrolling view that combines all sections
            return CustomScrollView(
              slivers: [
                _buildSliverAppBar(context),
                SliverToBoxAdapter(child: _buildHeroSection(context)),
                SliverToBoxAdapter(
                  child: _buildSectionHeader(context, "New Arrivals"),
                ),
                SliverToBoxAdapter(child: _buildHorizontalProductList(state)),

                // --- RE-INTRODUCED CATEGORY FILTERS ---
                SliverToBoxAdapter(
                  child: _buildSectionHeader(context, "Categories"),
                ),
                SliverToBoxAdapter(child: _buildCategoryChips(context)),

                SliverToBoxAdapter(
                  child: _buildSectionHeader(context, "All Products"),
                ),
                _buildProductGrid(state),
              ],
            );
          },
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      title: Text(
        'Zenvo',
        style: Theme.of(
          context,
        ).textTheme.headlineSmall?.copyWith(color: Colors.white),
      ),
      floating: true,
      snap: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search products...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (query) {
              // Add the search event to the BLoC
              context.read<ProductBloc>().add(SearchProducts(query));
            },
          ),
        ),
      ),
      actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            int itemCount = 0;
            if (state is CartUpdated) {
              itemCount = state.cartItems.length;
            }
            return Badge(
              label: Text('$itemCount'),
              isLabelVisible: itemCount > 0,
              child: IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  );
                },
              ),
            );
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    // This widget is unchanged
    return Container(
      height: 250,
      margin: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=2940&auto=format&fit=crop',
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Summer Sale',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Up to 50% off on selected items',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Shop Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 24.0,
        bottom: 12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          if (title == "New Arrivals")
            Text(
              'View All',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildHorizontalProductList(ProductState state) {
    if (state is ProductSuccess) {
      return SizedBox(
        height: 280,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.products.length > 5 ? 5 : state.products.length,
          itemBuilder: (context, index) {
            final product = state.products[index];
            return SizedBox(
              width: 180,
              child: Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 16.0 : 8.0,
                  right: index == 4 ? 16.0 : 8.0,
                ),
                child: ProductCard(
                  product: product,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(product: product),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      );
    }
    return const SizedBox.shrink(); // Return an empty box if products aren't loaded yet
  }

  Widget _buildCategoryChips(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = categories[index] == selectedCategory;
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 16.0 : 0, right: 12.0),
            child: ChoiceChip(
              label: Text(categories[index]),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    selectedCategory = categories[index];
                  });
                  if (selectedCategory == 'All') {
                    context.read<ProductBloc>().add(FetchAllProducts());
                  } else {
                    context.read<ProductBloc>().add(
                      FilterProductsByCategory(selectedCategory),
                    );
                  }
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductGrid(ProductState state) {
    if (state is ProductLoading) {
      return const SliverToBoxAdapter(
        child: Center(heightFactor: 5, child: CircularProgressIndicator()),
      );
    }
    if (state is ProductFailure) {
      return SliverToBoxAdapter(child: Center(child: Text(state.message)));
    }
    if (state is ProductSuccess) {
      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.75,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => ProductCard(
              product: state.products[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailPage(product: state.products[index]),
                  ),
                );
              },
            ),
            childCount: state.products.length,
          ),
        ),
      );
    }
    return const SliverToBoxAdapter(
      child: Center(child: Text('Something went wrong.')),
    );
  }
}
