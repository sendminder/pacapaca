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

  UserDTO copyWith({
    int? id,
    String? email,
    String? nickname,
    bool? isActive,
    bool? isBlocked,
    String? profileImageUrl,
    int? points,
  }) =>
      UserDTO(
        id: id ?? this.id,
        email: email ?? this.email,
        nickname: nickname ?? this.nickname,
        isActive: isActive ?? this.isActive,
        isBlocked: isBlocked ?? this.isBlocked,
        profileImageUrl: profileImageUrl ?? this.profileImageUrl,
        points: points ?? this.points,
      );
}
