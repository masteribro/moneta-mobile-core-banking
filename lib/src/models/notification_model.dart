class NotificationModel {
  final int id;
  final String title;
  final String description;
  final String status;
  final NotificationType type;
  final NotificationUser user;

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.type,
    required this.user,
  });

  factory NotificationModel.fromJson(Map<String, dynamic>? json) {
    return NotificationModel(
      id: json?['id'] ?? 0,
      title: json?['title'] ?? '',
      description: json?['description'] ?? '',
      status: json?['status'] ?? '',
      type: NotificationType.fromJson(json?['type']),
      user: NotificationUser.fromJson(json?['user']),
    );
  }
}

class NotificationType {
  final int id;
  final String name;

  NotificationType({
    required this.id,
    required this.name,
  });

  factory NotificationType.fromJson(Map<String, dynamic>? json) {
    return NotificationType(
      id: json?['id'] ?? 0,
      name: json?['name'] ?? '',
    );
  }
}

class NotificationUser {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final bool pin;

  NotificationUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.pin,
  });

  factory NotificationUser.fromJson(Map<String, dynamic>? json) {
    return NotificationUser(
      id: json?['id'] ?? 0,
      name: json?['name'] ?? '',
      email: json?['email'] ?? '',
      phone: json?['phone'] ?? null,
      pin: json?['pin'] ?? false,
    );
  }
}