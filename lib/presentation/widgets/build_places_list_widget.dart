import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/strings.dart';
import 'package:flutter_maps/data/model/places_suggestion.dart';
import 'package:flutter_maps/presentation/widgets/place_item_widget.dart';

// ignore: must_be_immutable
class BuildPlacesListWidget extends StatelessWidget {
  BuildPlacesListWidget(this.places, {super.key});
  List<PlacesSuggestion> places;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            controller.close();
          },
          child: PlaceItemWidget(
            suggestion: places[index],
          ),
        );
      },
      itemCount: places.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
    );
  }
}
