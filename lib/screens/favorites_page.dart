import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/favorite_provider.dart';
import 'package:store/widgets/custom_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});
  static String id = 'FavoritesPage';

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favoriteItems = favoriteProvider.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: favoriteItems.isEmpty
          ? const Center(
              child: Text('You have no favorite items yet.'),
            )
          : GridView.builder(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
              itemCount: favoriteItems.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 100,
              ),
              itemBuilder: (context, index) {
                return CustomCard(product: favoriteItems[index]);
              },
            ),
    );
  }
}
