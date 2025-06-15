class NotificationUser {
  final int id;
  final int notificationId;
  final int userId;

  NotificationUser({
    required this.id,
    required this.notificationId,
    required this.userId,
  });

  factory NotificationUser.fromJson(Map<String, dynamic> json) {
    return NotificationUser(
      id: json['id'],
      notificationId: json['notification_id'] ?? 0,
      userId: json['user_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'notification_id': notificationId,
      'user_id': userId,
    };
  }
}