import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sneak\app/model/sneaks.dart';

class SneaksItem extends StatelessWidget {
  final Sneaks? sneaks;
  final VoidCallback? onTap;
  const SneaksItem({Key? key, this.sneaks, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const itemHeight = 335.0;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets
            .symmetric(vertical: 10.0),
        child: SizedBox(
          height: itemHeight,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Hero(
                tag: 'background ${sneaks!.name}',
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(sneaks!.color!),
                    borderRadius: BorderRadius
                        .all(Radius.circular(20)),
                  ),
                ),
              ),
              Hero(
                tag: 'numbers ${sneaks!.name}',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    sneaks!.idSneak.toString(),
                    style: TextStyle(
                        fontSize: 100,
                        color: Colors.black.withAlpha(10),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: itemHeight * 0.6,
                  child: Hero(
                    tag: 'images ${sneaks!.name}',
                    child: Image(
                      image: AssetImage(sneaks!.images!.first),
                    ),
                  ),

                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 220),
                child: Text(
                  sneaks!.name!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 250.0),
                child: Column(
                  children: [
                    Text(
                      '\$${sneaks!.oldPrice!.toString()}',
                      style: TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.favorite_outline_rounded),
                          ),
                          Text(
                            '\$${sneaks!.currentPrice!.toString()}',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900
                            ),
                          ),
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.add_shopping_cart),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}