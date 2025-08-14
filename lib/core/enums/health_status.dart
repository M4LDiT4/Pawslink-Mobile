import 'package:flutter/material.dart';
enum AnimalHealthStatus {
  healthy,
  minorIssues,
  sick,
  critical,
  recovering,
  deceased
}

extension HealthStatusColor on AnimalHealthStatus {
  Color get color {
    switch (this) {
      case AnimalHealthStatus.healthy:
        return Colors.green;           // Positive, stable
      case AnimalHealthStatus.minorIssues:
        return Colors.yellow.shade700; // Caution
      case AnimalHealthStatus.sick:
        return Colors.orange;          // Warning
      case AnimalHealthStatus.critical:
        return Colors.red;             // Urgent
      case AnimalHealthStatus.recovering:
        return Colors.blueAccent;      // Improvement
      case AnimalHealthStatus.deceased:
        return Colors.grey.shade600;   // Inactive / Final
    }
  }
}


