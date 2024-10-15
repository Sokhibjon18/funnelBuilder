class PageSettingAlignmentModel {
  final bool isScrollable;
  final int paddingVertical;
  final int paddingHorizontal;

  PageSettingAlignmentModel({
    required this.isScrollable,
    required this.paddingVertical,
    required this.paddingHorizontal,
  });

  PageSettingAlignmentModel.initial()
      : isScrollable = false,
        paddingVertical = 0,
        paddingHorizontal = 0;

  PageSettingAlignmentModel copyWith({
    bool? isScrollable,
    int? paddingVertical,
    int? paddingHorizontal,
  }) {
    return PageSettingAlignmentModel(
      isScrollable: isScrollable ?? this.isScrollable,
      paddingVertical: paddingVertical ?? this.paddingVertical,
      paddingHorizontal: paddingHorizontal ?? this.paddingHorizontal,
    );
  }

  @override
  String toString() {
    return 'PageSettingsAlignmentModel(isScrollable: $isScrollable, paddingVertical: $paddingVertical, paddingHorizontal: $paddingHorizontal)';
  }
}
