
class BandModel{

  String id;
  String name;
  int votes;

  BandModel({
    this.id,
    this.name, 
    this.votes
  });

  factory BandModel.fromJSON(Map<String, dynamic> json)
  =>BandModel(id:json['id'], name:json['name'], votes:json['votes']);
}