part of 'crypto_list_bloc.dart';

@immutable
sealed class CryptoListState {}

final class CryptoListInitial extends CryptoListState {}

final class CryptoListLoading extends CryptoListState {}

final class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded({
    required this.coinList,
  });
  final List<CryptoCoin> coinList;
}

final class CryptoListLoadingFailure extends CryptoListState {
  CryptoListLoadingFailure({required this.exception});
  final Object? exception;
}
