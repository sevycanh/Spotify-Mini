import 'package:app/presentation/home/cubit/news_songs_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/song/get_news_songs.dart';
import '../../../service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();
    returnedSongs.fold((l) {
      emit(NewsSongsLoadFailure());
    }, (data) {
      emit(NewsSongsLoaded(songs: data));
    });
  }
}
