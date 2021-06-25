class Produk {
  int id;
  String judulIklan;
  int danaNeed;
  int danaCollected;
  String url;
  String cerita;
  Produk(
      {this.id,
      this.judulIklan,
      this.danaNeed,
      this.danaCollected,
      this.url,
      this.cerita});
  factory Produk.fromJson(Map<String, dynamic> obj) {
    return Produk(
        id: obj['id'],
        judulIklan: obj['judulIklan'],
        danaNeed: obj['danaNeed'],
        danaCollected: obj['danaCollected'],
        url: obj['url'],
        cerita: obj['cerita']);
  }
}
