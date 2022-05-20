class CryptoModel {

  const CryptoModel({
  required this.symbol,
  required this.name,
  required this.image,
  required this.current_price,
  required this.atl,
  required this.last_updated,
  required this.price_change_percentage_24h
  });

  final String symbol;
  final String name;
  final String image;
  final num current_price;
  //final double? price_change_24h;
  final num atl;
  final String last_updated;
  final  num price_change_percentage_24h;
  }


