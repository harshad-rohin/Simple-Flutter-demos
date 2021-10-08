class BirdsDataModel{
  //data Type
  int? id;
  String? name;
  String? imageURL;
  String? description;

  // constructor
  BirdsDataModel(
      {
        this.id,
        this.name,
        this.imageURL,
        this.description
      });

  //method that assign values to respective datatype variables
  BirdsDataModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name =json['name'];
    imageURL = json['imageUrl'];
    description = json['description'];
  }
}