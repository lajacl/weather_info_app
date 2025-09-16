import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(length: 4, child: _TabsNonScrollableDemo()),
    );
  }
}

class _TabsNonScrollableDemo extends StatefulWidget {
  @override
  __TabsNonScrollableDemoState createState() => __TabsNonScrollableDemoState();
}

class __TabsNonScrollableDemoState extends State<_TabsNonScrollableDemo>
    with SingleTickerProviderStateMixin, RestorationMixin {
  late TabController _tabController;
  final RestorableInt tabIndex = RestorableInt(0);
  @override
  String get restorationId => 'tab_non_scrollable_demo';
  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        tabIndex.value = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // For the To do task hint: consider defining the widget and name of the tabs here
    final tabs = ['By City', 'Tab 2', 'Tab 3', 'Tab 4'];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Weather'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: [for (final tab in tabs) Tab(text: tab)],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // hint for the to do task:Considering creating the different for different tabs
          TabContentOne(),
          TabContentTwo(),
          TabContentThree(),
          TabContentFour(),
        ],
      ),
    );
  }
}

class TabContentOne extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<TabContentOne> {
  final TextEditingController _cityController = TextEditingController();

  String cityName = "City: --";
  String temperature = "Temperature: --";
  String condition = "Condition: --";

 // Function to simulate fetching weather
  void _simulateWeatherFetch() {
    final String enteredCity = _cityController.text.trim();
    if (enteredCity.isEmpty) return;

    final random = Random();

    // Random temperature between 15 and 30
    final int temp = 15 + random.nextInt(16);

    // Random condition
    final conditions = ["Sunny", "Cloudy", "Rainy"];
    final String randomCondition =
        conditions[random.nextInt(conditions.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _cityController,
            decoration: InputDecoration(
              labelText: "Enter city name",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _simulateWeatherFetch,
            child: Text("Fetch Weather"),
          ),
          SizedBox(height: 24),
          Text(cityName, style: TextStyle(fontSize: 18)),
          Text(temperature, style: TextStyle(fontSize: 18)),
          Text(condition, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class TabContentTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class TabContentThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class TabContentFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
