// Alarm Page
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black,
            leading: TextButton( //TODO: Display this button if there's an Alarm else not
              child: Text(
                'Edit',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                //TODO: Edit Alarms set for delete / Done to cancel
              },
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    //TODO: Add a function for adding an Alarm
                  },
                  icon: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.deepOrange,
                  )),
            ],
            expandedHeight: 90,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 10),
              title: Text('Alarm'),
            ),
          ),
          AlarmPageView(),
        ],
      ),
    );
  }
}

class AlarmPageView extends StatefulWidget {
  const AlarmPageView({Key? key}) : super(key: key);

  @override
  _AlarmPageViewState createState() => _AlarmPageViewState();
}

class _AlarmPageViewState extends State<AlarmPageView> {
  bool status = false;
  List? alarms;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return (alarms == null) ? noAlarms() : alarmsPage();
        },
        childCount: 1,
      ),
    );
  }

  Container noAlarms() {
    return Container(
      height: 400,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Center(
          child: Text(
            'No Alarm',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Container alarmsPage() {
    return Container(
      child: Column(
        children: [
          Divider(
            thickness: 1.0,
            color: Colors.grey[800],
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '06:10',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
                Switch(
                    activeColor: Colors.green,
                    value: status,
                    onChanged: (value) {
                      print('Value : $value');
                      setState(() {
                        status = value;
                      });
                    }),
              ],
            ),
          ),
          Divider(
            thickness: 1.0,
            color: Colors.grey[800],
          ),
        ],
      ),
    );
  }
}
