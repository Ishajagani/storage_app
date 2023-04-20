import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData extends StatefulWidget {
  const LocalData({Key? key}) : super(key: key);

  @override
  State<LocalData> createState() => _LocalDataState();
}

class _LocalDataState extends State<LocalData> {
  SharedPreferences? prefs;
  String? stringData = "";
  int? intData = 0;
  bool? boolData = false;
  double? ratioData = 0.0;
  List<String>? skillsData = [];

  setInstant() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    setInstant();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Data Base"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                prefs!.setString("name", "Esha Jagani");
                prefs!.setBool("isCorrect", true);
                prefs!.setDouble("ratio", 0.1);
                prefs!.setInt("number", 1423);
                prefs!.setStringList("Skills", [
                  "communication",
                  "TeamWork",
                  "Organization",
                  "Problem-Solving",
                  "Flexibility",
                  "Leadership"
                ]);
              },
              child: const Text("Set Data"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                stringData = prefs!.getString("name");
                intData = prefs!.getInt("number");
                boolData = prefs!.getBool("isCorrect");
                ratioData = prefs!.getDouble("ratio");
                skillsData = prefs!.getStringList("Skills");
              },
              child: const Text("Get Data"),
            ),
            const SizedBox(height: 15),
            Text(
              stringData!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              intData!.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              boolData!.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              ratioData!.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              skillsData!.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// stringData = prefs!.getString("name");
// intData = prefs!.getInt("number");

// if (prefs!.containsKey("first_name")) {
//   debugPrint("Data");
//
//   setState(() {});
// } else {
//   debugPrint("No Data found");
// }
