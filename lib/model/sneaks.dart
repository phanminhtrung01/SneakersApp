class Sneaks {
  final String? name;
  final double? oldPrice;
  final double? currentPrice;
  final int? idSneak;
  final int? color;
  final List<int>? size;
  final List<String>? images;

  Sneaks({
    this.name, this.oldPrice, this.color,this.size,
    this.currentPrice, this.idSneak, this.images
  });

}

final shoes = <Sneaks>[
  Sneaks(
    name: 'AIR MAX 90 EZ BLACK',
    currentPrice: 149,
    oldPrice: 299,
    idSneak: 90,
    color: 0xFFF6F6F6,
    size: [6, 7, 8, 9, 10],
    images: [
      'assets/images/shoes1_1.png',
      'assets/images/shoes1_2.png',
      'assets/images/shoes1_3.png',
    ]
  ),
  Sneaks(
      name: 'AIR MAX 270 GOLD',
      currentPrice: 199,
      oldPrice: 349,
      idSneak: 270,
      color: 0xFFFCF5EB,
      size: [7, 8, 10],
      images: [
        'assets/images/shoes2_1.png',
        'assets/images/shoes2_2.png',
        'assets/images/shoes2_3.png',
      ]
  ),
  Sneaks(
      name: 'AIR MAX 95 RED',
      currentPrice: 299,
      oldPrice: 399,
      idSneak: 95,
      color: 0xFFFEEFEF,
      size: [6, 8, 9, 10],
      images: [
        'assets/images/shoes3_1.png',
        'assets/images/shoes3_2.png',
        'assets/images/shoes3_3.png',
      ]
  ),
  Sneaks(
      name: 'AIR MAX 98 EZ BLUE',
      currentPrice: 290,
      oldPrice: 399,
      idSneak: 98,
      color: 0xFFFDF3FE,
      size: [6, 7, 9, 10, 11, 12, 14],
      images: [
        'assets/images/shoes4_1.png',
        'assets/images/shoes4_2.png',
        'assets/images/shoes4_3.png',
      ]
  )
];