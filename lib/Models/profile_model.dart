class ProfileModel {
  final List<List<String>> snaps;
  final List<String> bookmark;
  final List<String> likes;
  final List<String> actorNames;
  final List<String> profession;
  final List<String> duration;
  final List<String> fees;
  final List<String> about;
  final List<String> ratings;

  ProfileModel({
    required this.ratings,
    required this.snaps,
    required this.bookmark,
    required this.likes,
    required this.actorNames,
    required this.profession,
    required this.duration,
    required this.fees,
    required this.about,
  });
}
