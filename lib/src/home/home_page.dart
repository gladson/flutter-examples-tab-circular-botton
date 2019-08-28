import 'package:flutter/material.dart';

import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  CircularBottomNavigationController _navigationBottomController;

  List<TabItem> tabItens = List.of([
    TabItem(
      Icons.assessment, 
      "Add Fase 1", 
      Colors.blueAccent,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold
      )
    ),
    TabItem(
      Icons.bubble_chart, 
      "Add Fase 2", 
      Colors.redAccent,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold
      )
    )
  ]);

  @override
  void initState() {
    _navigationBottomController = CircularBottomNavigationController(selectedPos);
    super.initState();
  }

  @override
  void dispose() {
    _navigationBottomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(
              bottom: bottomNavBarHeight
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: bottonNav(),
          )
        ],
      ),
    );
  }

  Widget bodyContainer() {
    Color selectedColor = tabItens[selectedPos].circleColor;
    String slogan;

    switch (selectedPos) {
      case 0:
        slogan = "Fase 1";
        break;
      case 1:
        slogan = "Fase 2";
        break;
    }

    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: selectedColor,
        child: Center(
          child: Text(
            slogan,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
        ),
      ),
      onTap: () {
        // _navigationBottomController.value == tabItens.length - 1 ? 
        //   _navigationBottomController.value = 0 : _navigationBottomController.value ++;
      },
    );
  }

  Widget bottonNav() {
    return CircularBottomNavigation(
      tabItens,
      controller: _navigationBottomController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      animationDuration: Duration(
        milliseconds: 300
      ),
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
          print(_navigationBottomController.value);
        });
      },
    );
  }

}
