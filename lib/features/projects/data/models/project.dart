// ignore_for_file: public_member_api_docs, sort_constructors_first
class Project {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String url;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.url,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
      url: json['url'],
    );
  }
}
