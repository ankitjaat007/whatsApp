// ==================
class ChatData_model {
  String dp, name, subtitle;
  ChatData_model(this.dp, this.name, this.subtitle);
  ChatData_model.From_model_list(Map<String, dynamic> json)
      : dp = json['dp'] ?? '',
        name = json['name'] ?? '',
        subtitle = json['subtitle'] ?? '';
}

// ====================
// ====================
// ====================
class Wallpaper_model {
  String name;
  List<String> image;
  Wallpaper_model(this.name, this.image);
  Wallpaper_model.FromModelList(Map<String, dynamic> json)
      : name = json['name'] ?? "",
        image = json['images'] == null
            ? []
            : (json['images'] as List).map((e) => e.toString()).toList();
}
