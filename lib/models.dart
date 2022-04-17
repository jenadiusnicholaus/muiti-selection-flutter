//  this model goingto help us to hold all taken stacks name
class TechStacks {
  String? name;
  TechStacks({this.name});
  factory TechStacks.fromJson(Map<dynamic, String> json) {
    return TechStacks(name: json['name']);
  }
}
