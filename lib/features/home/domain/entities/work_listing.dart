class WorkListing {
  const WorkListing({
    required this.id,
    required this.title,
    required this.categoryName,
    required this.area,
    required this.visibleInCategory,
    required this.viewCount,
    required this.contactCount,
    required this.postedAt,
    required this.statusLabel,
  });

  final String id;
  final String title;
  final String categoryName;
  final String area;
  final String visibleInCategory;
  final int viewCount;
  final int contactCount;
  final DateTime postedAt;
  final String statusLabel;

  WorkListing copyWith({
    String? id,
    String? title,
    String? categoryName,
    String? area,
    String? visibleInCategory,
    int? viewCount,
    int? contactCount,
    DateTime? postedAt,
    String? statusLabel,
  }) {
    return WorkListing(
      id: id ?? this.id,
      title: title ?? this.title,
      categoryName: categoryName ?? this.categoryName,
      area: area ?? this.area,
      visibleInCategory: visibleInCategory ?? this.visibleInCategory,
      viewCount: viewCount ?? this.viewCount,
      contactCount: contactCount ?? this.contactCount,
      postedAt: postedAt ?? this.postedAt,
      statusLabel: statusLabel ?? this.statusLabel,
    );
  }
}
