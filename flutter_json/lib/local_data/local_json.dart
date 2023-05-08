import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_json/models/car_model.dart';

class LocalJson extends StatefulWidget {
  const LocalJson({super.key});

  @override
  State<LocalJson> createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Json"),
      ),
      body: dataFutureBuilder(),
    );
  }

  FutureBuilder<List<CarModel>> dataFutureBuilder() {
    return FutureBuilder<List<CarModel>>(
        future: arabalarOkuJson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CarModel> arabaListesi = snapshot.data!;
            return ListView.builder(
              itemCount: arabaListesi.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(arabaListesi[index].arabaAdi),
                    subtitle: Text(arabaListesi[index].ulke),
                    leading: const CircleAvatar(),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.hasError.toString(),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<CarModel>> arabalarOkuJson() async {
    try {
      String okunanString = await DefaultAssetBundle.of(context)
          .loadString('assets/data/arabalar.json');

      var jsonObject = jsonDecode(okunanString);

      List arabaListesi = jsonObject;
    
      // Map türünde aldığın şeyi CarModel nesnesine dönüştür.
      List<CarModel> tumArabalar =
          //(jsonObject as List).map((e)=>CarModel.fromMap(e)).toList(); şeklindede yazılabilir.
          jsonObject.map<CarModel>((e) => CarModel.fromMap(e)).toList();
 

      return tumArabalar;
    } catch (e) {
      debugPrint(e.toString());
      return Future.error(e);
    }
  }
}
