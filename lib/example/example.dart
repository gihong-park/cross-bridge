import 'package:_04_health_check/class/enum.dart';
import 'package:_04_health_check/class/model/record/recordModel.dart';
import 'package:_04_health_check/class/model/workout/workout.dart';
import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class RecordDTO {
  RecordDTO(
      {required this.date,
      required this.type,
      required this.name,
      required this.hashtags});
  DateTime date;
  String type;
  String name;
  List<String> hashtags;
}

final records = [
  RecordDTO(
    date: DateTime.now().subtract(const Duration(days: 0)),
    type: "EMOM",
    name: "Body Shock",
    hashtags: ["row", "bbjo", "powerclean"],
  ),
  RecordDTO(
    date: DateTime.now().subtract(const Duration(days: 1)),
    type: "EMOM",
    name: "Body Shock1",
    hashtags: ["row", "bbjo", "powerclean"],
  ),
  RecordDTO(
    date: DateTime.now().subtract(const Duration(days: 2)),
    type: "EMOM",
    name: "Body Shock2",
    hashtags: ["row", "bbjo", "powerclean"],
  ),
  RecordDTO(
    date: DateTime.now().subtract(const Duration(days: 3)),
    type: "EMOM",
    name: "Body Shock3",
    hashtags: ["row", "bbjo", "powerclean"],
  ),
  RecordDTO(
    date: DateTime.now().subtract(const Duration(days: 4)),
    type: "EMOM",
    name: "Body Shock4",
    hashtags: ["row", "bbjo", "powerclean"],
  ),
  RecordDTO(
    date: DateTime.now().subtract(const Duration(days: 5)),
    type: "EMOM",
    name: "Body Shock5",
    hashtags: ["row", "bbjo", "powerclean"],
  ),
  RecordDTO(
    date: DateTime.now().subtract(const Duration(days: 6)),
    type: "EMOM",
    name: "Body Shock",
    hashtags: ["row", "bbjo", "powerclean"],
  ),
  RecordDTO(
    date: DateTime.now().subtract(const Duration(days: 7)),
    type: "EMOM",
    name: "Body Shock6",
    hashtags: ["row", "bbjo", "powerclean"],
  ),
  RecordDTO(
    date: DateTime.now().subtract(const Duration(days: 8)),
    type: "EMOM",
    name: "Body Shock7",
    hashtags: ["row", "bbjo", "powerclean"],
  ),
  RecordDTO(
    date: DateTime.now().subtract(const Duration(days: 9)),
    type: "EMOM",
    name: "Body Shock8",
    hashtags: ["row", "bbjo", "powerclean"],
  ),
  RecordDTO(
    date: DateTime.now().subtract(const Duration(days: 10)),
    type: "EMOM",
    name: "Body Shock9",
    hashtags: ["row", "bbjo", "powerclean"],
  ),
];

const List<String> movements = [
  'Air squats',
  'Back squats',
  'Front squats',
  'Overhead squats',
  'Pistols (one-legged squats)',
  'Box jumps',
  'Deadlifts',
  'Sumo deadlift high pulls',
  'Power cleans',
  'Squat cleans',
  'Hang cleans',
  'Push presses',
  'Push jerks',
  'Split jerks',
  'Thrusters',
  'Wall balls',
  'Kettlebell swings',
  'Snatches',
  'Overhead snatches',
  'Pull-ups',
  'Chest-to-bar pull-ups',
  'Bar muscle-ups',
  'Ring muscle-ups',
  'Toes-to-bar',
  'Knees-to-elbows',
  'Handstand push-ups',
  'Box dips',
  'Ring dips',
  'Push-ups',
  'Handstand holds',
  'Double-unders (jump rope)',
  'Rowing',
  'Running',
  'Assault bike',
  'Wall climbs',
  'Burpees',
  'Turkish get-ups',
  "Farmer's carries",
  'Sled pushes',
  'Sled pulls',
];
