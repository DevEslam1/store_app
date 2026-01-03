import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCustomCard extends StatelessWidget {
  const ShimmerCustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 50,
                color: Color.fromRGBO(158, 158, 158, 0.1),
                spreadRadius: 20,
                offset: Offset(10, 10),
              ),
            ]),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 16,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 16,
                          color: Colors.white,
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            top: -60,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
