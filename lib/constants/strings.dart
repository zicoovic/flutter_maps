import 'package:flutter_maps/data/model/places_suggestion.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

const loginScreen = '/login_screen';
const otpScreen = '/otp-screen';
const mapScreen = '/map-screen';
const googleMapApiKey = 'AIzaSyCxLvebPnaXGHayp8aA5HLHZkyrLZEaZic';
const String suggestionBaseURL =
    'https://maps.googleapis.com/maps/api/place/autocomplete/json';

FloatingSearchBarController controller = FloatingSearchBarController();
List<PlacesSuggestion> places = [];
