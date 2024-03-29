import 'package:angelus/logic/blocs/statistics_bloc/statistics_bloc.dart';
import 'package:angelus/services/notification_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticsBloc, int>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Statistics"),
                backgroundColor: Theme
                    .of(context)
                    .colorScheme
                    .primary,
              ),
            body: Column(children: [
                    Expanded(child: Text("Prayed ${state} times")),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: onPressed, child: Text("Reset Prayer Counter")))
            ])
          );
        });
  }
  onPressed(){
    BlocProvider.of<StatisticsBloc>(context).add(
      PrayerCounterClearIncrement(),
    );
  }
}
