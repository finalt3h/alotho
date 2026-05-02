class ServiceCategory {
  const ServiceCategory({
    required this.id,
    required this.name,
    required this.iconName,
    required this.description,
  });

  final String id;
  final String name;
  final String iconName;
  final String description;

  ServiceCategory copyWith({
    String? id,
    String? name,
    String? iconName,
    String? description,
  }) {
    return ServiceCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      iconName: iconName ?? this.iconName,
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceCategory &&
          id == other.id &&
          name == other.name &&
          iconName == other.iconName &&
          description == other.description;

  @override
  int get hashCode => Object.hash(id, name, iconName, description);
}
