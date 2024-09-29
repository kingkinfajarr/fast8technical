import 'package:fast8technical/cores/constants/app_assets.dart';
import 'package:fast8technical/cores/constants/app_color.dart';
import 'package:fast8technical/cores/extensions/currency_extension.dart';
import 'package:flutter/material.dart';

class CardExplore extends StatelessWidget {
  final String? image;
  final String title;
  final int price;
  final int? discountPct;
  final int? discountPrice;

  const CardExplore({
    super.key,
    this.image,
    required this.title,
    required this.price,
    this.discountPct,
    this.discountPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: clrGray.withOpacity(0.3),
        highlightColor: clrGray.withOpacity(0.1),
        onTap: () {},
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 140,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(imgGrab),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if ((discountPct ?? 0) > 0) ...[
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        price.toIdr(),
                        style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                          color: clrGray,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '$discountPct% OFF',
                        style: TextStyle(
                          fontSize: 12,
                          color: clrRed,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '${discountPrice?.toIdr()}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
              if (discountPct == 0) ...[
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    price.toIdr(),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
