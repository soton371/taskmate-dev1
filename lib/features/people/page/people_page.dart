import 'package:flutter/material.dart';
import '../widget/people_view.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Member"),
      ),
      body: PeopleView()
    );
  }
}
