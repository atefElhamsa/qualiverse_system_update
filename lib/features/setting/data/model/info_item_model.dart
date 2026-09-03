import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class InfoItemModel {
  final IconData iconData;
  final String text;

  InfoItemModel({required this.iconData, required this.text});
}

final List<InfoItemModel> infoItems = [
  InfoItemModel(iconData: PhosphorIconsLight.phone, text: "+1 234 567 890"),
  InfoItemModel(
    iconData: PhosphorIconsLight.envelopeSimple,
    text: "johndoe@gmail.com",
  ),
  InfoItemModel(iconData: PhosphorIconsLight.mapPin, text: "New York,NY"),
];
