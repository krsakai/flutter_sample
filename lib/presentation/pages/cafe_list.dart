import 'package:flutter_application_1/domain/entities/cafe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_1/presentation/arguments/cafe_list.dart';
import 'package:flutter_application_1/presentation/arguments/cafe_location_map.dart';
import 'package:flutter_application_1/presentation/model/cafe_list.dart';
import 'package:flutter_application_1/presentation/pages/cafe_location_map.dart';

class CafeListPage extends StatelessWidget {
  const CafeListPage() : super();

  static const routeName = '/cafeList';

  static Widget provide(CafeListPageArguments arguments) => ChangeNotifierProvider<CafeListPageModel>(
    create: (BuildContext context) => CafeListPageModel(
      cafeRepository: Provider.of(context, listen: false),
      lat: arguments.lat,
      lon: arguments.lon
    )..initialize(),
    child: const CafeListPage()
  );

  @override
  Widget build(BuildContext context) {
    final CafeListPageModel model = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('近場のカフェ一覧'),
      ),
      body: ListView.builder(
        itemCount: model.cafeList.length,
        itemBuilder: (BuildContext context, int index) {
          return PictureCard(model.cafeList[index]);
        },
      ),
    );
  }
}

class PictureCard extends StatelessWidget {

  final Cafe cafe;

  PictureCard(this.cafe);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () async {
          await Navigator.pushNamed<void>(
            context, 
            CafeLocationMapPage.routeName,
            arguments: CafeLocationMapPageArguments(
              lat: cafe.lat,
              lon: cafe.lon,
              name: cafe.name,
              ),
            );
        },
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                leading: Image.network(cafe.iconUrl),
                title: Text(cafe.name),
                subtitle: Text(cafe.vicinity),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Image.network((cafe.photoUrl ?? 
                  "https://image.shutterstock.com/image-vector/picture-vector-icon-no-image-600w-1350441335.jpg?key=") + 
                  const String.fromEnvironment("GOOGLE_API_KEY"))
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("評価"),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text((cafe.rating ?? 0).toString())
                  )
                ])
            ],
          ),
        ),
      ),
    );
  }
}
