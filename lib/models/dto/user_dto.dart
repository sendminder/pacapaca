class UserDTO {
  final int id;
  final String email;
  final String nickname;
  final bool isActive;
  final bool isBlocked;
  final String? profileImageUrl;
  final int? points;

  const UserDTO({
    required this.id,
    required this.email,
    required this.nickname,
    required this.isActive,
    required this.isBlocked,
    this.profileImageUrl,
    this.points,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) => UserDTO(
        id: json['id'],
        email: json['email'],
        nickname: json['nickname'],
        isActive: json['is_active'],
        isBlocked: json['is_blocked'],
        profileImageUrl: json['profile_image_url'],
        points: json['points'],
      );
}
