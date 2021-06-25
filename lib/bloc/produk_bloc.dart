import 'dart:convert';
import 'package:submission_flutter_pemua/helpers/api.dart';
import 'package:submission_flutter_pemua/helpers/api_url.dart';
import 'package:submission_flutter_pemua/model/produk.dart';

class ProdukBloc {
  static Future<List<Produk>> getProduks() async {
    String apiUrl = ApiUrl.listProduk;

    var response = await Api().get(apiUrl);

    var jsonObj = json.decode(response.body);

    List<dynamic> listProduk = (jsonObj as Map<String, dynamic>)['data'];

    List<Produk> produks = [];

    for (int i = 0; i < listProduk.length; i++) {
      produks.add(Produk.fromJson(listProduk[i]));
    }

    return produks;
  }

  static Future addProduk({Produk produk}) async {
    String apiUrl = ApiUrl.createProduk;

    var body = {
      "judulIklan": produk.judulIklan,
      "danaNeed": produk.danaNeed.toString(),
      "danaCollected": produk.danaCollected.toString(),
      "url": produk.url,
      "cerita": produk.cerita,
    };

    var response = await Api().post(apiUrl, body);

    var jsonObj = json.decode(response.body);

    return jsonObj['status'];
  }

  static Future<bool> updateProduk({Produk produk}) async {
    String apiUrl = ApiUrl.updateProduk(produk.id);

    var body = {
      "judulIklan": produk.judulIklan,
      "danaNeed": produk.danaNeed.toString(),
      "danaCollected": produk.danaCollected.toString(),
      "url": produk.url,
      "cerita": produk.cerita,
    };

    print("Body : $body");

    var response = await Api().post(apiUrl, body);

    var jsonObj = json.decode(response.body);

    return jsonObj['data'];
  }

  static Future<bool> deleteProduk({int id}) async {
    String apiUrl = ApiUrl.deleteProduk(id);

    var response = await Api().delete(apiUrl);

    var jsonObj = json.decode(response.body);

    return (jsonObj as Map<String, dynamic>)['data'];
  }
}
