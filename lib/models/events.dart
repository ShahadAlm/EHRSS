class Event {
  final String imagePath, title, description, date, duration;
  final List categoryIds;

  Event(
      {this.imagePath,
      this.title,
      this.description,
      this.date,
      this.duration,
      this.categoryIds,s});
}

final meeting = Event(
    imagePath: "assest/img/meeting1.jpg",
    title: "Meeting",
    description: "Important meeting",
    duration: "2h",
    date:'5th, May',
    categoryIds: [0, 2]);

final training = Event(
    imagePath: "assest/img/training.png",
    title: "Training course",
    description: "A training course for sallers.",
    duration: "14h",
    date:'22-23 April',
    categoryIds: [0, 3],
    );

final salesCelebration = Event(
    imagePath: 'assest/img/concert.png',
    title: "Sales Celebration",
    description: "Celebrate sales for this year.",
    duration: "5h",
    date:'1st, Dec',
    categoryIds: [0, 1]);

final events = [
  meeting,
  training,
  salesCelebration,
];