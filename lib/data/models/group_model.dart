class GroupModel {
  final String groupName;
  final int companyId;

  GroupModel({
    required this.groupName,
    required this.companyId,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      groupName: json['group_name'] as String,
      companyId: json['company_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'group_name': groupName,
      'company_id': companyId,
    };
  }
}
