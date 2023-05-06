import 'package:angelus/widgets/pages/angelus_screen/angelus_screen.dart';
import 'package:angelus/widgets/pages/angelus_screen/statistics_screen/statistics_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/blocs/statistics_bloc/statistics_bloc.dart';
import 'AutoCloseDrawer.dart';

class AngelusApp extends StatefulWidget{
  const AngelusApp({super.key});

  @override
  State<AngelusApp> createState() => _AngelusAppState();
}

class _AngelusAppState extends State<AngelusApp> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = AngelusScreen();
        break;
      case 1:
        page = Placeholder();
        break;
      case 2:
        page = StatisticsScreen();
        break;
      default:
        throw UnimplementedError("no widget for $selectedIndex");
    }
    return LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Angelus"),
              backgroundColor: Theme
                  .of(context)
                  .colorScheme
                  .primary,
            ),

            drawer: AutoCloseDrawer(width: 100, onOptionTapped: onTapped,),
            body: Row(
                children: [
                  Expanded(
                      child: Container(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .primaryContainer,
                        child: page,
                      )
                  ),

                ]
            ),
          );
        }
    );
  }

  void onTapped(int indexTapped) {
    setState(() {
      selectedIndex = indexTapped;
    });
  }

  void onPrayPressed() {
    BlocProvider.of<StatisticsBloc>(context).add(
      PrayedCounterIncrement(),
    );
  }
}