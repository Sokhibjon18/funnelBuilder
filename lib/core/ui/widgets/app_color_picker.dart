// import 'package:flutter/material.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:web_funnel/core/constants/app_colors.dart';
// import 'package:web_funnel/core/gen/strings.dart';
// import 'package:web_funnel/core/ui/widgets/common_textfield.dart';
//
// class AppColorPicker extends StatefulWidget {
//   const AppColorPicker({super.key});
//
//   @override
//   State<AppColorPicker> createState() => _AppColorPickerState();
// }
//
// class _AppColorPickerState extends State<AppColorPicker> {
//   TextEditingController colorTextController = TextEditingController();
//   TextEditingController alphaTextController = TextEditingController();
//
//   Color currentColor = Color(0xFFFFFFFF);
//
//   @override
//   Widget build(BuildContext context) {
//     alphaTextController.text = currentColor.alpha.toString();
//     return Dialog(
//       child: Container(
//         width: 450,
//         height: 260,
//         padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: AppColors.sidebarBackground,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Expanded(
//               child: ColorPicker(
//                 pickerColor: currentColor,
//                 onColorChanged: (color) {
//                   setState(() {
//                     currentColor = color;
//                   });
//                   alphaTextController.text = color.alpha.toString();
//                 },
//                 colorPickerWidth: 200,
//                 pickerAreaHeightPercent: 0.7,
//                 enableAlpha: true,
//                 displayThumbColor: true,
//                 paletteType: PaletteType.hsvWithHue,
//                 labelTypes: [],
//                 pickerAreaBorderRadius: const BorderRadius.all(Radius.circular(10)),
//                 hexInputController: colorTextController,
//                 portraitOnly: true,
//               ),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     Strings.color,
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.textPrimary,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     children: [
//                       Expanded(
//                         flex: 2,
//                         child: CommonTextfield(
//                           prefixIcon: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 10),
//                                 child: Text(
//                                   '#',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColors.textPrimary,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           controller: colorTextController,
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         flex: 1,
//                         child: CommonTextfield(
//                           suffixIcon: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 '%',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColors.textPrimary,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           controller: alphaTextController,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
