// ignore_for_file: depend_on_referenced_packages

import 'package:galeri_lukisan/app/modules/detail_lukisan/widget/product_carousel.dart';
import 'package:galeri_lukisan/helper/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/product.dart';
import '../../../routes/app_pages.dart';

class DetailLukisanView extends StatefulWidget {
  final Product product;
  DetailLukisanView({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailLukisanView> createState() => _DetailLukisanViewState();
}

class _DetailLukisanViewState extends State<DetailLukisanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductCarouselSlider(
                images: widget.product.images,
              ),
              SizedBox(
                height: 1.sh,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.sh),
                child: Text(
                  widget.product.name,
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(12, 26, 48, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 2.sh,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.sh),
                child: Text(
                  NumberFormat.currency(
                    locale: 'id',
                    decimalDigits: 0,
                    symbol: 'Rp ',
                  ).format(widget.product.price),
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(254, 58, 48, 1),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 2.sh,
              ),
              Padding(
                padding: EdgeInsets.all(1.sh),
                child: Text(
                  'Deskripsi',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(12, 26, 48, 1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1.sh),
                child: Text(
                  widget.product.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(54, 105, 201, 1),
                  ),
                ),
              ),
              SizedBox(
                height: 2.sh,
              ),
              Padding(
                padding: EdgeInsets.all(1.sh),
                child: Text(
                  'Pelukis',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(12, 26, 48, 1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1.sh),
                child: Text(
                  widget.product.pelukis,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(54, 105, 201, 1),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1.sh),
                child: Text(
                  'Ukuran',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(12, 26, 48, 1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1.sh),
                child: Text(
                  widget.product.ukuran ?? "Tidak diketahui",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(54, 105, 201, 1),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1.sh),
                child: Text(
                  'Tema',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(12, 26, 48, 1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1.sh),
                child: Text(
                  widget.product.tema ?? "Tidak diketahui",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(54, 105, 201, 1),
                  ),
                ),
              ),
              SizedBox(
                height: 2.sh,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(
          2.sh,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                _openWhatsApp();
              },
              child: Text("Hubungi Admin"),
            ),
            SizedBox(
              width: 2.sh,
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Get.offAllNamed(AppPages.DASHBOARD, arguments: 3);
            //   },
            //   child: Text("Beli"),
            // ),
          ],
        ),
      ),
    );
  }
}

void _openWhatsApp() async {
  var url = 'https://wa.me/82380599958';
  await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
}
