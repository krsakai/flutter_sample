import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/repositories/cafe.dart';
import 'package:flutter_application_1/infrastructure/web/core/service.dart';
import 'package:flutter_application_1/infrastructure/repositories/cafe.dart';
import 'package:flutter_application_1/presentation/arguments/cafe_list.dart';
import 'package:flutter_application_1/presentation/arguments/cafe_location_map.dart';
import 'package:flutter_application_1/presentation/pages/home.dart';
import 'package:flutter_application_1/presentation/pages/cafe_list.dart';
import 'package:flutter_application_1/presentation/pages/cafe_location_map.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: <SingleChildWidget>[
          Provider<WebService>(
            create: (BuildContext context) => WebServiceImpl(),
          ),
          Provider<CafeRepository>(
            create: (BuildContext context) => CafeRepositoryImpl(
              webService: Provider.of(context, listen: false),
            ),
          ),
        ],
        child: MaterialApp(
            initialRoute: '/',
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case HomePage.routeName:
                  return MaterialPageRoute<void>(
                    builder: (context) => HomePage.provide(),
                    settings: settings,
                );
                case CafeListPage.routeName:
                  final CafeListPageArguments arguments = settings.arguments as CafeListPageArguments;
                  return MaterialPageRoute<void>(
                    builder: (context) => CafeListPage.provide(arguments),
                    settings: settings,
                );
                case CafeLocationMapPage.routeName:
                  final CafeLocationMapPageArguments arguments = settings.arguments as CafeLocationMapPageArguments;
                  return MaterialPageRoute<void>(
                    builder: (context) => CafeLocationMapPage.provide(arguments),
                    settings: settings,
                );
                 default:
                  return MaterialPageRoute<void>(
                    builder: (context) => HomePage(),
                    settings: settings,
                );
              }
            }
        )
    );
  }
}
