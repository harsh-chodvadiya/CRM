import 'dart:convert';

import 'package:crm/src/constant/api.dart';
import 'package:crm/src/model/leads.dart';
import 'package:http/http.dart';
import 'package:nexus/nexus.dart';

class LeadsController {
  static Future<List<Lead>> leads() async {
    try {
      final Response response = await post(
        Uri.parse(API.leads),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImVtYWlsIjoiamVzaW5nLmNoYXZkYUBzYXJ2YWRoaS5jb20iLCJpZCI6M30sImlhdCI6MTcyMjA2MzkxNiwiZXhwIjoxNzIyMTUwMzE2fQ.kX2pDq1rJahFLb3tL30uJB7Crevigqtq4u2if4d3rNc',
        },
        body: json.encode({
          "status": "",
          "fromDate": "2024-03-15",
          "toDate": "2025-06-17",
          "contact": ""
        }),
      );
      if (response.statusCode == 200) {
        LeadData lead = LeadData.fromJson(jsonDecode(response.body));
        return lead.data;
      } else {}
    } catch (e) {
      Nexus.log('$e', logType: Log.error);
    }
    return [];
  }
}
