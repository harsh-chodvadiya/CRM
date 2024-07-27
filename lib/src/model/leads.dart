class LeadData {
  bool success;
  List<Lead> data;
  int count;
  String message;

  LeadData({
    required this.success,
    required this.data,
    required this.count,
    required this.message,
  });

  factory LeadData.fromJson(Map<String, dynamic> json) => LeadData(
        success: json["success"],
        data: List<Lead>.from(json["data"].map((x) => Lead.fromJson(x))),
        count: json["count"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "count": count,
        "message": message,
      };
}

class Lead {
  int id;
  String title;
  String description;
  int contactId;
  int status;
  DateTime date;
  DateTime dueDate;
  int assignedById;
  String notes;
  AssignedBy contact;
  AssignedBy assignedBy;
  String contactName;
  String assignedName;

  Lead({
    required this.id,
    required this.title,
    required this.description,
    required this.contactId,
    required this.status,
    required this.date,
    required this.dueDate,
    required this.assignedById,
    required this.notes,
    required this.contact,
    required this.assignedBy,
    required this.contactName,
    required this.assignedName,
  });

  factory Lead.fromJson(Map<String, dynamic> json) => Lead(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        contactId: json["contactId"],
        status: json["status"],
        date: DateTime.parse(json["date"]),
        dueDate: DateTime.parse(json["dueDate"]),
        assignedById: json["assignedById"],
        notes: json["notes"],
        contact: AssignedBy.fromJson(json["contact"]),
        assignedBy: AssignedBy.fromJson(json["assignedBy"]),
        contactName: json["contactName"],
        assignedName: json["assignedName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "contactId": contactId,
        "status": status,
        "date": date.toIso8601String(),
        "dueDate": dueDate.toIso8601String(),
        "assignedById": assignedById,
        "notes": notes,
        "contact": contact.toJson(),
        "assignedBy": assignedBy.toJson(),
        "contactName": contactName,
        "assignedName": assignedName,
      };
}

class AssignedBy {
  String name;

  AssignedBy({required this.name});

  factory AssignedBy.fromJson(Map<String, dynamic> json) =>
      AssignedBy(name: json["name"]);

  Map<String, dynamic> toJson() => {"name": name};
}
