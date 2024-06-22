class MindModel {
  String mind;
  String auther;

  MindModel({required this.auther, required this.mind});

  factory MindModel.fromJson(Map<String, dynamic> json) {
    return MindModel(
      auther: json['auther'] ?? "Hech kim",
      mind: json['mind'] ?? "Hech kimgapirmadi",
    );
  }

  toJson() {
    return {"auther": auther, "mind": mind};
  }
}
