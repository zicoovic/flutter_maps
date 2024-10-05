part of 'maps_cubit.dart';

@immutable
sealed class MapsState {}

final class MapsInitial extends MapsState {}

final class PlacesLoaded extends MapsState {
  final List<PlacesSuggestion> places;

  PlacesLoaded(this.places);
}

class PlacesEmpty extends MapsState {}

class PlacesError extends MapsState {
  final String message;
  PlacesError(this.message);
}
