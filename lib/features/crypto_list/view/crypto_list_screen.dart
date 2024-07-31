import 'package:crypto_coins_list/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_coins_list/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});
  @override
  State<CryptoListScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CryptoListScreen> {
  // List<CryptoCoin>? _cryptoCoinList;

  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    // _loadCryptocoins();
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currencies List'),
      ),
      body: BlocBuilder<CryptoListBloc, CryptoListState>(
        bloc: _cryptoListBloc,
        builder: (context, state) {
          if (state is CryptoListLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemCount: state.coinList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final coin = state.coinList[i];
                return CryptoCoinTile(coin: coin);
              },
            );
          }
          if (state is CryptoListLoadingFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Something went wrong',
                    style: theme.textTheme.headlineMedium,
                  ),
                  Text(
                    'Something went wrong',
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      // (_cryptoCoinList == null)
      //     ? const Center(child: CircularProgressIndicator())
      //     : ListView.separated(
      //         padding: const EdgeInsets.only(top: 16),
      //         itemCount: _cryptoCoinList!.length,
      //         separatorBuilder: (context, index) => const Divider(),
      //         itemBuilder: (context, i) {
      //           final coin = _cryptoCoinList![i];
      //           return CryptoCoinTile(coin: coin);
      //         },
      //       ),
    );
  }

  // Future<void> _loadCryptocoins() async {
  //   _cryptoCoinList = await GetIt.I<AbstractCoinsRepository>().getCoinsList();
  //   setState(() {});
  // }
}
