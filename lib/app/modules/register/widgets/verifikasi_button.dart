// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class VerifikasiButton extends StatelessWidget {
//   const VerifikasiButton(
//       {Key? key,
//       required this.metode,
//       required this.body,
//       required this.image,
//       required this.function})
//       : super(key: key);

//   final String metode;
//   final String body;
//   final String image;
//   final Function() function;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (() =>
//           Get.to(() => VerificationAccountTimerView(), arguments: body)),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             color: CustomColor
//                 .btnVerifBorder, //                   <--- border color
//             width: 1.5,
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: 5.sw,
//             vertical: 4.2.sw,
//           ),
//           child: Row(
//             children: [
//               Image.asset(
//                 image,
//                 height: 3.sh,
//               ),
//               SizedBox(
//                 width: 4.sw,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AutoSizeText(
//                     metode,
//                     style: CustomFonts.poppinsRegular14
//                         .copyWith(fontSize: context.isTablet ? 22 : 14),
//                     minFontSize: 10,
//                     maxLines: 4,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   LoginDaftarTextView(
//                     title: body,
//                     styleText: CustomFonts.poppinsRegular10
//                         .copyWith(fontSize: context.isTablet ? 20 : 10),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
