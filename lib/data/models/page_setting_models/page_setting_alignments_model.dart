class PageSettingAlignmentModel {
  final bool isScrollable;
  final int paddingVertical;
  final int paddingHorizontal;

  PageSettingAlignmentModel({
    required this.isScrollable,
    required this.paddingVertical,
    required this.paddingHorizontal,
  });

  @override
  String toString() {
    return 'PageSettingsAlignmentModel(isScrollable: $isScrollable, paddingVertical: $paddingVertical, paddingHorizontal: $paddingHorizontal)';
  }
}
