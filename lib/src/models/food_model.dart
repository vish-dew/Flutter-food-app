class Food {
  final String id;
  final String name;
  final String imagePath;
  final String description;
  final String category;
  final double price; //changed double to dynamic
  final double discount; //changed double to dynamic
  final double ratings;

  Food(
      {this.id,
      this.name,
      this.imagePath,
      this.description,
      this.category,
      this.price,
      this.discount,
      this.ratings,
      String imagepath,
      title});
}
