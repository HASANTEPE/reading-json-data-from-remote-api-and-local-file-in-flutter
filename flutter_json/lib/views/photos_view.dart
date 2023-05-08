import 'package:flutter/material.dart';

import 'package:flutter_json/models/my_model.dart';
import 'package:flutter_json/services/services.dart';

class PhotosView extends StatelessWidget {
  const PhotosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: dataFutureBuilder(),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: const Text("Model Page"),
    );
  }

  FutureBuilder<List<PhotoModel>> dataFutureBuilder() {
    return FutureBuilder<List<PhotoModel>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PhotoModel> myModelList = snapshot.data!;
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  var oankiModel = myModelList[index];
                  return Card(
                    child: Column(
                      children: [
                        Expanded(flex: 1, child: Text(oankiModel.title)),
                        Expanded(
                          flex: 5,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(oankiModel.url),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
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
}
