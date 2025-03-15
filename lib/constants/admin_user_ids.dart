class AdminUserIds {
  static const int maxAdminUserId = 20;

  static bool isAdminUserId(int userId) {
    return userId <= maxAdminUserId;
  }
}
