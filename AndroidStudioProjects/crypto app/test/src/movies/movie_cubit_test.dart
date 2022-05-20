import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/src/movies/crypto_cubit.dart';
import 'package:movie_app/src/movies/crypto_model.dart';
import 'package:movie_app/src/movies/crypto_repository.dart';
import 'package:movie_app/src/movies/crypto_state.dart';

class MockRepository extends Mock implements MovieRepository {}

void main() {
  late MockRepository movieRepository;
  late MoviesCubit moviesCubit;

  final movies = [
    MovieModel(title: 'title 01', urlImage: 'url 01', overview: ""),
    MovieModel(title: 'title 02', urlImage: 'url 02', overview: ""),
  ];

  setUp(() {
    movieRepository = MockRepository();
    when(() => movieRepository.getMovies()).thenAnswer(
      (_) async => movies,
    );
  });

  test('Emits movies when repository answer correctly', () async {
    moviesCubit = MoviesCubit(repository: movieRepository);

    await expectLater(
      moviesCubit.stream,
      emits(
        LoadedState(movies),
      ),
    );
  });
}
