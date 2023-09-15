import 'package:flutter/material.dart';
import 'package:resume_bilder/views/contect.dart';
import 'package:resume_bilder/constant.dart';
import 'package:resume_bilder/views/ruseme.dart';
Resume resume=Resume();
List<Map> menuList = [
  {
    "icon": Icons.quick_contacts_dialer,
    "name": "Contact Info",
    "route_name": contact,
  },
  {
    "icon": Icons.business_center,
    "name": "Carrier Objective",
    "route_name": carrierobjective
  },
  {
    "icon": Icons.person,
    "name": "Persional Details",
    "route_name": persional_detail,
  },
  {
    "icon": Icons.school,
    "name": "Education",
    "route_name": education,
  },
  {
    "icon": Icons.manage_accounts,
    "name": "Experiences",
    "route_name": experiences,
  },
  {
    "icon": Icons.workspace_premium,
    "name": "Technical Skills",
    "route_name": Techinical,
  },
  {
    "icon": Icons.library_books,
    "name": "Interest/Hobbies  ",
    "route_name": hobbies,
  },
  {
    "icon": Icons.plagiarism_rounded,
    "name": "Projects",
    "route_name": projects,
  },
  {
    "icon": Icons.redeem,
    "name": "Achievements",
    "route_name": archivment,
  },
  {
    "icon": Icons.handshake,
    "name": "References",
    "route_name": refrences,
  },
  {
    "icon": Icons.description,
    "name": "Declaration",
    "route_name": declaration,
  },
];