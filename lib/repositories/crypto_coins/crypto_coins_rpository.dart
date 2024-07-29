import 'package:crypto_coins_list/repositories/crypto_coins/abstrct_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:dio/dio.dart';

class CryptoCoinsReposiroey implements AbstractCoinsRepository {
  CryptoCoinsReposiroey({required this.dio});
  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,AID,EUR,ETH,DOV,CAG,SOL,BNB,&tsyms=USD,EUR,',
    );

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map(
      (e) {
        final usdData =
            (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
        final price = usdData['PRICE'];
        final imageUrl = usdData['IMAGEURL'];
        return CryptoCoin(
          name: e.key,
          priceInUSD: price,
          imageUrl: 'http://www.cryptocompare.com/$imageUrl',
        );
      },
    ).toList();
    return cryptoCoinsList;
  }
}
