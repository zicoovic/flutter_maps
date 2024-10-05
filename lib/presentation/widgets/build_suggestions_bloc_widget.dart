import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/cubit/maps/maps_cubit.dart';
import 'package:flutter_maps/presentation/widgets/build_places_list_widget.dart';

import '../../constants/strings.dart';

// ignore: must_be_immutable
class BuildSuggestionsBlocWidget extends StatelessWidget {
  const BuildSuggestionsBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        if (state is PlacesLoaded) {
          places = state.places;
          if (places.isNotEmpty) {
            return BuildPlacesListWidget(places);
          } else {
            return Container();
          }
        } else if (state is PlacesEmpty) {
          return const Center(child: Text("No suggestions found."));
        } else if (state is PlacesError) {
          return Center(child: Text(state.message));
        } else {
          return Container();
        }
      },
    );
  }
}
