// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_maps/data/model/places_suggestion.dart';
import 'package:flutter_maps/data/web/places_web_services.dart';

class MapRepo {
  PlacesWebServices placesWebServices;
  MapRepo({
    required this.placesWebServices,
  });

  Future<List<PlacesSuggestion>> fetchRepo(
      String place, String sessionToken) async {
    final suggestion =
        await placesWebServices.fetchSuggestions(place, sessionToken);
    return suggestion
        .map<PlacesSuggestion>((suggest) => PlacesSuggestion.fromJson(suggest))
        .toList();
  }
}
