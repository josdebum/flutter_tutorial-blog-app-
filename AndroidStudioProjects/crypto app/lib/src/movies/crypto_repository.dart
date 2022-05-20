

import 'package:dio/dio.dart';

import 'crypto_model.dart';

class MovieRepository {
  const MovieRepository(this.client);

  final Dio client;

  Future<List<CryptoModel>> getMovies() async {
    try {
      final url =
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';

      final response = await client.get(url);


      final coins = List<CryptoModel>.of(
      response.data.map<CryptoModel>(
            (json) => CryptoModel(
            symbol: json['symbol'],
            name: json ['name'],
            image: json ['image'],
            current_price: json ['current_price'],
            atl: json ['atl'],
            last_updated: json ['last_updated'],
            price_change_percentage_24h: json['price_change_percentage_24h']

        ),));


      return coins;
    } catch (e) {
      throw e;
    }
  }
}
