

import 'package:equatable/equatable.dart';
import 'package:movie_app/src/movies/crypto_model.dart';

abstract class CryptoState extends Equatable {}

class InitialState extends CryptoState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CryptoState {
  @override
  List<Object> get props => [];
}

class LoadedState extends CryptoState {
  LoadedState(this.coins);

  final List<CryptoModel> coins;

  @override
  List<Object> get props => [coins];
}

class ErrorState extends CryptoState {
  @override
  List<Object> get props => [];
}
