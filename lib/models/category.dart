
import 'package:flutter/material.dart';

class Category {
  final int categoryId;
  final String name;
  final IconData icon;

  Category({this.categoryId, this.name, this.icon});
}

final allCategory = Category(
  categoryId: 0,
  name: "All",
  icon: Icons.search,
);

final eventCategory = Category(
  categoryId: 1,
  name: "Events",
  icon: Icons.music_note,
);

final meetingCategory = Category(
  categoryId: 2,
  name: "Meeting",
  icon: Icons.location_on,
);

final trainingCategory = Category(
  categoryId: 3,
  name: "Training",
  icon: Icons.assignment,
);


final categories = [
  allCategory,
  eventCategory,
  meetingCategory,
  trainingCategory,
];