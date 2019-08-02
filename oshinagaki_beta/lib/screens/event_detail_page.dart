import 'package:flutter/material.dart';
import 'package:oshinagaki_beta/models/event_state.dart';

class EventDetailsPage extends StatelessWidget {
  final EventState event;

  EventDetailsPage(this.event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.eventName),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              Text("Event name: " + event.eventName),
              Text("Event place: " + event.place),
              Text("Event date: " + event.date),
            ],
          )
      ),
    );
  }
}
