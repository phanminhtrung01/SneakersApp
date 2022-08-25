import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneak\app/model/sneaks.dart';

class SneakShopping extends StatefulWidget {
  const SneakShopping({Key? key, this.sneaks}) : super(key: key);
  final Sneaks? sneaks;

  @override
  _SneakShoppingState createState() => _SneakShoppingState();
}

class _SneakShoppingState extends State<SneakShopping>
    with SingleTickerProviderStateMixin {
  static int _a = 0;
  static int _i = 0;
  List<bool> _list = [];
  static bool _check = false;

  final double sizeBox = 170.0;
  final double sizeBox1 = 60.0;
  late AnimationController _controller;
  late Animation _animationButton1;
  late Animation _animationButton2;
  late Animation _animationButton3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (_list.length == 0) _list.addAll(widget.sneaks!.size!.map((e) => false));

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _animationButton1 =
        Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.0,
        0.3,
      ),
    ));
    _animationButton2 =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      reverseCurve: Curves.easeOut,
      parent: _controller,
      curve: Interval(
        0.2,
        0.8,
        curve: Curves.elasticIn,
      ),
    ));
    _animationButton3 =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.65, 1.0, curve: Curves.elasticIn),
    ));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pop();
        _check = false;
        _i = 0;
        _a = 0;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      _check = false;
                      _i = 0;
                      _a = 0;
                    },
                    child: Container(
                      color: Colors.black87,
                    ),
                  ),
                ),
                if (_animationButton2.value != 1)
                  Positioned(
                    bottom: 0,
                    top: size.height * 0.4 +
                        (_animationButton2.value * size.height * 0.4685),
                    left: size.width / 2 -
                        (size.width * _animationButton1.value)
                                .clamp(sizeBox1, size.width) /
                            2,
                    width: (size.width * _animationButton1.value)
                        .clamp(sizeBox1, size.width),
                    child: Stack(
                      children: [
                        TweenAnimationBuilder(
                          curve: Curves.easeOut,
                          tween: Tween<double>(begin: 1.0, end: 0.0),
                          duration: Duration(milliseconds: 200),
                          builder: (context, double value, child) {
                            return Transform.translate(
                              offset: Offset(0.0, value * size.height * 0.6),
                              child: child,
                            );
                          },
                          child: Container(
                            height:
                                (size.height * 0.6 * _animationButton1.value)
                                    .clamp(sizeBox1, size.height * 0.6),
                            width: (size.width * _animationButton1.value)
                                .clamp(sizeBox1, size.width),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: _animationButton1.value == 1
                                    ? Radius.circular(14)
                                    : Radius.circular(40),
                                topRight: _animationButton1.value == 1
                                    ? Radius.circular(14)
                                    : Radius.circular(40),
                                bottomLeft: _animationButton1.value == 1
                                    ? Radius.circular(0)
                                    : Radius.circular(40),
                                bottomRight: _animationButton1.value == 1
                                    ? Radius.circular(0)
                                    : Radius.circular(40),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        widget.sneaks!.images!.first,
                                        height: (_animationButton1.value * 150)
                                            .clamp(49, 150)
                                            .toDouble(),
                                        width: (_animationButton1.value * 150)
                                            .clamp(20, 150)
                                            .toDouble(),
                                      ),
                                      if (_animationButton1.value == 1) ...[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              widget.sneaks!.name!,
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              '\$${widget.sneaks!.currentPrice!.toString()}',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )
                                      ]
                                    ],
                                  ),
                                  if (_animationButton1.value == 1) ...[
                                    Divider(
                                      height: 25,
                                      thickness: 1,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Wrap(
                                      children: [
                                        Image.asset(
                                          'assets/images/feet.png',
                                          height: 25,
                                          width: 25,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'SELECT SIZE',
                                          style: TextStyle(fontSize: 16),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Wrap(
                                      spacing: 10,
                                      runSpacing: 5,
                                      children: widget.sneaks!.size!.map((e) {
                                        if (_check &&
                                            _i < widget.sneaks!.size!.length) {
                                          if (_a == e) {
                                            if (_list[_i]) {
                                              _list[_i] = false;
                                              _check = false;
                                            } else {
                                              _list[_i] = true;
                                            }
                                          } else {
                                            if (_list[_i]) _list[_i] = false;
                                          }
                                        } else if (_i ==
                                            widget.sneaks!.size!.length) {
                                          _i--;
                                        }
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              _i = 0;
                                              _check = true;
                                              _a = e;
                                            });
                                          },
                                          child: Container(
                                            height: 45,
                                            width: 80,
                                            child: Center(
                                              child: Text(
                                                'US $e',
                                                style: TextStyle(
                                                  color: _list[_i]
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                color: _list[_i++]
                                                    ? Colors.black
                                                    : Colors.transparent,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                                border: Border.all(
                                                    color: Colors.black26)),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ]
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                Positioned(
                  left: 0,
                  right: -5,
                  bottom: 10.0 - (_animationButton3.value * 100.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Positioned(
                      child: InkWell(
                        onTap: () => _check ? _controller.forward() : null,
                        child: Container(
                          height: sizeBox1,
                          width: (sizeBox * _animationButton1.value).clamp(
                            sizeBox1,
                            sizeBox,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                            border: Border.all(color: Colors.black26),
                            color: _check ? Colors.black : Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.add_shopping_cart,
                                color: _check ? Colors.white : Colors.black,
                              ),
                              if (_animationButton1.value == 1.0) ...[
                                Text(
                                  'Add To Cart',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color:
                                          _check ? Colors.white : Colors.black),
                                )
                              ]
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}