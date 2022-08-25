import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneak\app/Transactions/shake_transaction.dart';
import 'package:sneak\app/model/sneaks.dart';
import 'package:sneak\app/pages/sneak_shopping.dart';

class SneakDetails extends StatelessWidget {
  final Sneaks sneaks;

  SneakDetails({Key? key, required this.sneaks}) : super(key: key);

  Future<void> _openSneakShopping(BuildContext context) async {
    _notifier.value = false;
    await Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation1, animation2) {
          return FadeTransition(
            opacity: animation1,
            child: SneakShopping(sneaks: sneaks),
          );
        }));
    _notifier.value = true;
  }

  final ValueNotifier<bool> _notifier = ValueNotifier(false);

  Widget _buildPageView(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.5,
      child: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: [
          Positioned.fill(
              child: Hero(
            tag: 'background ${sneaks.name}',
            child: Container(
              color: Color(sneaks.color!),
            ),
          )),
          Align(
            alignment: Alignment.topCenter,
            child: ShakeTransaction(
              duration: Duration(milliseconds: 1400),
              difference: 20,
              child: Hero(
                tag: 'numbers ${sneaks.name}',
                child: Material(
                  color: Colors.transparent,
                  child: FittedBox(
                    child: Text(
                      sneaks.idSneak.toString(),
                      style: TextStyle(
                          fontSize: 100,
                          color: Colors.black.withAlpha(10),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
          PageView.builder(
            itemBuilder: (context, index) {
              //final tag = index == 0 ? 'images
              // ${sneaks.name}' : 'images ${sneaks.name} $index';
              return Container(
                alignment: Alignment.center,
                child: index == 0
                    ? ShakeTransaction(
                        child: Hero(
                          tag: 'images ${sneaks.name}',
                          child: Image.asset(
                            sneaks.images![index],
                            fit: BoxFit.contain,
                            height: 250,
                            width: 250,
                          ),
                        ),
                      )
                    : Hero(
                        tag: 'images ${sneaks.name}',
                        child: Image.asset(
                          sneaks.images![index],
                          fit: BoxFit.contain,
                          height: 250,
                          width: 250,
                        ),
                      ),
              );
            },
            itemCount: sneaks.images!.length,
          ),
        ],
      ),
    );
  }

  Widget _buildColumn() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShakeTransaction(
            axis: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sneaks.name!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${sneaks.oldPrice.toString()}',
                      style: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black,
                          decorationStyle: TextDecorationStyle.double,
                          decorationThickness: 1,
                          color: Colors.red),
                    ),
                    Text(
                      '\$${sneaks.currentPrice.toString()}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ShakeTransaction(
            axis: Axis.horizontal,
            duration: Duration(milliseconds: 1100),
            child: Text('AVAILABLE SIZES'),
          ),
          SizedBox(
            height: 20,
          ),
          ShakeTransaction(
            axis: Axis.horizontal,
            duration: Duration(milliseconds: 1200),
            child: Wrap(
              spacing: 40,
              children: [
                Text(
                  'US ${sneaks.size![0]}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'US ${sneaks.size![1]}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'US ${sneaks.size![2]}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Text('INFORMATION'),
          SizedBox(
            height: 10,
          ),
          Text(
            'The ${sneaks.name} Men\'s Shoe is inspired by \Phan \Minh \Trung',
            maxLines: 2,
            style: TextStyle(
              decoration: TextDecoration.underline,
              shadows: [
                Shadow(
                    blurRadius: 10.0,
                    offset: Offset(1, -2),
                    color: Colors.black.withAlpha(100)),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _notifier.value = true;
    });

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          'assets/images/nike_logo.png',
          height: 40,
        ),
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
                child: Column(
              children: [
                _buildPageView(context),
                _buildColumn(),
              ],
            )),
            ValueListenableBuilder<bool>(
                valueListenable: _notifier,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 70.0,
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                        heroTag: 'favorite',
                        onPressed: () {},
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.black,
                        ),
                      ),
                      FloatingActionButton(
                        heroTag: 'shopping',
                        onPressed: () => _openSneakShopping(context),
                        backgroundColor: Colors.black.withOpacity(0.8),
                        elevation: 0,
                        child: Icon(
                          Icons.shopping_bag_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                builder: (context, value, child) {
                  return AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    left: 0,
                    right: 0,
                    bottom: value ? 0 : -kToolbarHeight * 2.5,
                    child: child!,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
