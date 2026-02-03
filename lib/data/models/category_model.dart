class CategoryModel {
  final String catgoryName;
  final int companyId;

  CategoryModel({required this.catgoryName, required this.companyId});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      catgoryName: json['group_name'] as String,
      companyId: json['company_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {'catgory_Name': catgoryName, 'company_id': companyId};
  }
}
