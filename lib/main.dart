
import 'package:flutter/material.dart';
import 'package:sneak\app/model/sneaks.dart';
import 'package:sneak\app/model/sneaks_item.dart';
import 'package:sneak\app/pages/sneak_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ValueNotifier<bool> _notifier = ValueNotifier(true);

  void _onShoesPressed(Sneaks sneaks, BuildContext context) async {
    _notifier.value = false;
    await Navigator.of(context)
        .push(PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
      return FadeTransition(
        opacity: animation1,
        child: SneakDetails(sneaks: sneaks),
      );
    }));
    _notifier.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/images/nike_logo.png',
            height: 40,
          ),
        ),
        body: SafeArea(
            child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, right: 20, left: 20, bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: shoes.length,
                          itemBuilder: (context, index) {
                            final shoesItem = shoes[index];
                            return SneaksItem(
                              sneaks: shoesItem,
                              onTap: () {
                                _onShoesPressed(shoesItem, context);
                              },
                            );
                          }))
                ],
              ),
            ),
            ValueListenableBuilder<bool>(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black.withAlpha(40),
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(12),
                        right: Radius.circular(12),
                      ),
                      color: Colors.white.withAlpha(200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(20),
                          blurRadius: 10,
                          spreadRadius: 10,
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.home),
                        splashRadius: 27,
                        splashColor: Colors.black.withAlpha(200),
                        highlightColor: Colors.lightBlue,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search),
                        splashRadius: 27,
                        splashColor: Colors.black.withAlpha(200),
                        highlightColor: Colors.lightBlue,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border),
                        splashRadius: 27,
                        splashColor: Colors.black.withAlpha(200),
                        highlightColor: Colors.lightBlue,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_bag),
                        splashRadius: 27,
                        splashColor: Colors.black.withAlpha(200),
                        highlightColor: Colors.lightBlue,
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.black.withAlpha(50),
                        backgroundImage:
                            AssetImage('assets/images/nike_logo.png'),
                      )
                    ],
                  ),
                ),
                valueListenable: _notifier,
                builder: (BuildContext context, bool value, Widget? child) {
                  return AnimatedPositioned(
                    duration: Duration(milliseconds: 250),
                    left: 0,
                    right: 0,
                    bottom: value ? 0 : -kToolbarHeight,
                    height: kToolbarHeight,
                    child: child!,
                  );
                }),
          ],
        )),
      ),
    );
  }
}
