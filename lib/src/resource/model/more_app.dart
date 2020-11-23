
class MoreApp {
  MoreApp({
    this.name,
    this.description,
    this.linkdown,
    this.logolink,
    this.linkdownios,
  });

  String name;
  String description;
  String linkdown;
  String logolink;
  String linkdownios;

  factory MoreApp.fromJson(Map<String, dynamic> json) => MoreApp(
    name: json["name"],
    description: json["description"],
    linkdown: json["linkdown"],
    logolink: json["logolink"],
    linkdownios: json["linkdownios"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "linkdown": linkdown,
    "logolink": logolink,
    "linkdownios": linkdownios,
  };

  @override
  String toString() {
    return 'MoreApp{name: $name, description: $description, linkdown: $linkdown, logolink: $logolink, linkdownios: $linkdownios}';
  }
}
