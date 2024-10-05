import 'package:bloc/bloc.dart';
import 'package:flutter_maps/data/model/places_suggestion.dart';
import 'package:flutter_maps/data/repo/map_repo.dart';
import 'package:meta/meta.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final MapRepo mapRepo;
  MapsCubit(this.mapRepo) : super(MapsInitial());

  void emitPlaceSuggestions(String place, String sessionToken) {
    mapRepo.fetchRepo(place, sessionToken).then(
      (suggestions) {
        if (suggestions.isNotEmpty) {
          emit(PlacesLoaded(suggestions));
        } else {
          emit(PlacesEmpty()); // أو emit(PlacesError("No suggestions found"));
        }
      },
    ).catchError((error) {
      emit(PlacesError(error.toString())); // معالجة الأخطاء
    });
  }
}
