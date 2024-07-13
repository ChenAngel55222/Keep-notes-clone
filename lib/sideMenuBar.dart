import 'package:flutter/material.dart';
import 'package:keep_notes/colors.dart';
import 'package:keep_notes/settings.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: backgroundColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Text(
                  "Google Keep",
                  style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Divider(
                color: white.withOpacity(0.3),
              ),
              sectionOne(),
              SizedBox(height: 5),
              sectionTwo(),
              SizedBox(height: 5),
              sectionSettings(),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionOne() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(Colors.orangeAccent.withOpacity(0.3)),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
        ),
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(
                Icons.lightbulb,
                size: 25,
                color: white.withOpacity(0.7),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Notes",
                style: TextStyle(
                  color: white.withOpacity(0.7),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTwo() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
        ),
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(
                Icons.archive_outlined,
                size: 25,
                color: white.withOpacity(0.7),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Archive",
                style: TextStyle(
                  color: white.withOpacity(0.7),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionSettings() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Settings()),
          );
        },
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(
                Icons.settings_outlined,
                size: 25,
                color: white.withOpacity(0.7),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Settings",
                style: TextStyle(
                  color: white.withOpacity(0.7),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
