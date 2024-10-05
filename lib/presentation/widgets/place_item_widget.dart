// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/my_colors.dart';

import 'package:flutter_maps/data/model/places_suggestion.dart';

class PlaceItemWidget extends StatelessWidget {
  final PlacesSuggestion suggestion;
  const PlaceItemWidget({
    super.key,
    required this.suggestion,
  });

  @override
  Widget build(BuildContext context) {
    var subTitle = suggestion.description
        .replaceAll(suggestion.description.split(',')[0], '');
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.blue,
              ),
              child: const Icon(
                Icons.place,
                color: MyColors.blue,
              ),
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${suggestion.description.split(','[0])}\n',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: subTitle.substring(2), 
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
