class CategoreModel{
  final String name;
  CategoreModel({required this.name});
  factory CategoreModel.fromJson(Map<String , dynamic> json){
    return CategoreModel(
      name: json['name']
    );
  }
}