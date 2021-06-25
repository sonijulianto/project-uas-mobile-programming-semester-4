class Donasi {
  int id;
  String name;
  String imageUrl;
  String kategori;
  bool isPopular;

  Donasi(
      {this.id,
      this.name,
      this.imageUrl,
      this.kategori,
      this.isPopular = false});
}
