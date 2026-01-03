import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/providers/favorite_provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/screens/favorites_page.dart';
import 'package:store/widgets/custom_card.dart';
import 'package:store/widgets/shimmer_custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePAge';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Fetch products after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
  }

  Future<void> _refreshProducts() async {
    await Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Consumer<FavoriteProvider>(
          builder: (context, favorite, child) {
            final iconButton = IconButton(
              iconSize: 30,
              onPressed: () {
                Navigator.pushNamed(context, FavoritesPage.id);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            );

            if (favorite.items.isEmpty) {
              return iconButton;
            }

            return Badge(
              label: Text(favorite.items.length.toString()),
              child: iconButton,
            );
          },
        ),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              final cartIcon = IconButton(
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.cartPlus,
                  color: Colors.black,
                ),
              );

              if (cart.itemCount == 0) {
                return cartIcon;
              }

              return Badge(
                label: Text(cart.itemCount.toString()),
                child: cartIcon,
              );
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Trend Store',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
        child: RefreshIndicator(
          onRefresh: _refreshProducts,
          child: Consumer<ProductProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading && provider.products.isEmpty) {
                return GridView.builder(
                    itemCount: 10, // Or any number that fits your screen
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 100,
                    ),
                    itemBuilder: (context, index) {
                      return const ShimmerCustomCard();
                    });
              }

              if (provider.products.isEmpty) {
                return const Center(
                  child: Text('No products found.'),
                );
              }

              return AnimationLimiter(
                child: GridView.builder(
                    itemCount: provider.products.length,
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 100,
                    ),
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        columnCount: 2,
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: CustomCard(
                                product: provider.products[index]),
                          ),
                        ),
                      );
                    }),
              );
            },
          ),
        ),
      ),
    );
  }
}
