import 'package:cached_network_image/cached_network_image.dart';
import 'package:cartizy_app/feature/home/domain/entities/products_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.product});
  final ProductsEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: product.images[0],
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
                width: double.infinity,
                height: 240,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 5,
                right: 5,
                child: SvgPicture.asset(
                  'assets/icons/icon-favourite.svg',
                  height: 25,
                  width: 25,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Text(
            product.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'EGP ${product.price}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

const String imageTest = 'https://i.imgur.com/QkIa5tT.jpeg';
