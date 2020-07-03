import 'package:flutter/material.dart';
import 'package:classroom_leds/model/scene.dart';
import 'package:classroom_leds/util/navigation_util.dart';
import 'package:classroom_leds/util/server_util.dart';
import 'package:classroom_leds/widget/scene_list_widget.dart';

class ScenesPage extends StatefulWidget {
  @override
  _ScenesPageState createState() => _ScenesPageState();
}

class _ScenesPageState extends State<ScenesPage> {
  Future<List<Scene>> sceneList;

  @override
  void initState() {
    super.initState();
    sceneList = fetchScenesFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Classroom LEDs"),
      ),
      body: FutureBuilder<List<Scene>>(
              future: sceneList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SceneListWidget(snapshot.data);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
              ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        onPressed: () => onAddButtonPressed(context),
        label: Text("Add"),
      ),
    );
  }

  void onAddButtonPressed(BuildContext context) async {
    final result = null; //await navigateToAddScenePage(context);

    if (result != null && result is Scene) {
      setState(() {
        //sceneList.add(result);
      });
    }
  }
}
