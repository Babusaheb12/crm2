import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:workmanager/workmanager.dart';

import '../../Controller/AgentController/Authcontroller.dart';

/// TOP-LEVEL FUNCTION FOR WORKMANAGER CALLBACK
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((dynamic task, dynamic inputData) async {
    print('✅ Background Task Running...');

    try {
      final Iterable<CallLogEntry> callLogs = await CallLog.get();
      final filteredLogs = callLogs.where((entry) => entry.number == '+9190981444014');

      for (CallLogEntry entry in filteredLogs) {
        print('📞 NUMBER: ${entry.number}, NAME: ${entry.name}');
      }

      return Future.value(true);
    } catch (e, s) {
      print('❌ Error: $e');
      print(s);
      return Future.value(false);
    }
  });
}
final AuthController authController = Get.find<AuthController>();

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true, // Debug mode on
  );
  runApp(MyApp());
}

/// Example widget for call log plugin
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Iterable<CallLogEntry> _callLogEntries = <CallLogEntry>[];

  @override
  Widget build(BuildContext context) {
    const TextStyle mono = TextStyle(fontFamily: 'monospace');
    final List<Widget> children = <Widget>[];

    for (CallLogEntry entry in _callLogEntries) {
      if (entry.number == '+919081444014') {
        children.add(
          Column(
            children: <Widget>[
              const Divider(),
              //Text('C.M. NUMBER: ${entry.cachedMatchedNumber}', style: mono),
              Text('NUMBER     : ${entry.number}', style: mono),
              //Text('NAME       : ${entry.name}', style: mono),
              Text('DATE       : ${DateTime.fromMillisecondsSinceEpoch(entry.timestamp ?? 0)}', style: mono),
              Text('DURATION   : ${entry.duration}', style: mono),
              //Text('SIM NAME   : ${entry.simDisplayName}', style: mono),
              const Divider(),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        );
      }
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Call Log Example')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      final Iterable<CallLogEntry> result = await CallLog.query();

                      // 🛑 Filter the results before updating UI
                      setState(() {
                        _callLogEntries = result.where((entry) => entry.number == '+919081444014');
                      });
                    },
                    child: const Text('Get Calls for +919081444014'),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      print("⏳ Registering Background Task...");

                      Workmanager().registerOneOffTask(
                        "uniqueTaskId", // Unique Task Name
                        'simpleTask',
                        existingWorkPolicy: ExistingWorkPolicy.replace,
                      ).then((_) {
                        print("✅ Background task registered successfully!");
                      }).catchError((error) {
                        print("❌ WorkManager Task Registration Failed: $error");
                      });
                      final Iterable<CallLogEntry> result = await CallLog.query();
                      List<String> numbers = result
                          .where((entry) => entry.number != null)
                          .map((entry) => entry.number!)
                          .toSet()
                          .toList();

                      print("📤 Sending to API: $numbers");

                      //await authController.getCallMultiPle(multiplecall: numbers);
                    },
                    child: const Text('Fetch in Background'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: children),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
