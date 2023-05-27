import 'package:galeri_lukisan/app/modules/home/widget/product_grid.dart';
import 'package:galeri_lukisan/app/modules/home/widget/product_loading_grid.dart';
import 'package:galeri_lukisan/helper/controllers.dart';
import 'package:galeri_lukisan/helper/helpers.dart';
import 'package:flutter/material.dart';
import 'package:galeri_lukisan/helper/list.dart';
import 'package:get/get.dart';
import '../../../data/models/product.dart';
import '../controllers/home_controller.dart';
import '../widget/category.dart';
import '../widget/search_bar.dart';

class HomeView extends GetView<HomeController> {
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Galeri Lukisan',
          style: TextStyle(
            color: Color.fromRGBO(21, 46, 86, 1),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(),
            Divider(
              thickness: 0.4,
              indent: 2.sh,
              endIndent: 2.sh,
              color: Colors.grey.withOpacity(0.5),
            ),
            Category(
              product: homeController.productList,
            ),
            // Divider(
            //   thickness: 0.4,
            //   indent: 2.sh,
            //   endIndent: 2.sh,
            //   color: Colors.grey.withOpacity(0.5),
            // ),
            SizedBox(
              height: 2.sh,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.sh,
              ),
              child: Obx(
                () => homeController.isProductLoading.value
                    ? ProductLoadingGrid()
                    : homeController.productList.isNotEmpty
                        ? ProductGrid(products: homeController.productList)
                        : Center(
                            child: Text('Lukisan TIdak Ditemukan'),
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Category extends StatelessWidget {
//   const Category({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       itemCount: product.tema?.length ?? 0,
//       itemBuilder: (BuildContext context, int index) {
//         final tema = product.tema?[index];
//         return Padding(
//           padding: EdgeInsets.all(8),
//           child: Text(tema ?? ''),
//         );
//       },
//     );
//   }
// }

// class SearchBar extends StatelessWidget {
//   final controller = Get.put(HomeController());
//   SearchBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 6.sh,
//       margin: EdgeInsets.only(
//         left: 2.sh,
//         right: 2.sh,
//         bottom: 2.sh,
//         top: 6.sh,
//       ),
//       child: TextField(
//         onSubmitted: (val) {
//           controller.getProductFilter(keyword: val);
//         },
//         textAlign: TextAlign.start,
//         textAlignVertical: TextAlignVertical.center,
//         decoration: InputDecoration(
//           fillColor: Color.fromRGBO(100, 100, 100, 1),
//           contentPadding: EdgeInsets.all(1.5.sh),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           hintText: "Search Product",
//           hintStyle: TextStyle(color: Color.fromRGBO(196, 197, 196, 1)),
//           hintTextDirection: TextDirection.ltr,
//           suffixIcon: Icon(
//             Icons.search,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CategoryChip extends StatelessWidget {
//   final String categoryName;
//   final Color categoryColor;

//   CategoryChip({
//     required this.categoryName,
//     required this.categoryColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Handle category tap
//         // print('Selected category: $categoryName');
//         homeController.getProductFilter(keyword: categoryName);
//       },
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: Container(
//           width: 100,
//           color: categoryColor,
//           padding: EdgeInsets.all(8),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Icon(categoryIcon, color: Colors.white, size: 40),
//               // SizedBox(height: 8),
//               Text(
//                 categoryName,
//                 style:
//                     TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
