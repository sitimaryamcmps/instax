import 'package:flutter/material.dart';
import 'package:instax_19552011050_uts/data.dart';

class DeskripsiProduk extends StatelessWidget {
  final ProdukList produkList;
  const DeskripsiProduk(this.produkList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        shape: Border(
            bottom: BorderSide(
          color: Colors.grey[700]!,
          width: 1,
        )),
        leading: Container(
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Color(produkList.warna!),
              width: 1,
            ),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(produkList.warna!),
            ),
          ),
        ),
        title: Image.asset(
          'images/banner.png',
          width: 100,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(6.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30.0),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                produkList.gambar!,
                width: MediaQuery.of(context).size.width / 1.5,
              ),
            ),
            const SizedBox(height: 30.0),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Instax',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: produkList.tipe!,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(
                        produkList.warna!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              'Be real and fun with the INSTAX MINI 7+. Cool design, colorful and compact, this instant camera is fun and easy to use. Point and shoot and give your day some fun!',
              style: TextStyle(),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              'Point & Shoot',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              'The Mini 7+ is easy to use! Simply point and shoot! With its exposure control adjustment and 60mm fixed-focus lens, the Mini 7+ makes it easy for you to be creative and live in the moment.',
              style: TextStyle(),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              'Mini But With Full-Size Memories',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              'Pop it in your wallet, stick it to your wall – the INSTAX Mini film brings you instant 2 x 3 sized photos you can show and tell. '
              'Using professional high-quality film technology (as you’d expect from Fujifilm), your festival frolicking, sun worshipping, crowd surfing memories that you print will transport you right back into that moment.',
              style: TextStyle(),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              'Mini Film',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              'Mini moments with maximum impact. What’s your next mini moment?',
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              'Plenty of Great Color Choices',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              'Available in five awesome colors: Lavender, Seafoam Green, Coral, Light Pink & Light Blue.',
              style: TextStyle(),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              'The Mini 7+ Has Your Back!-',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              'Depending upon the weather conditions, you can easily control brightness to obtain a great picture.',
              style: TextStyle(),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              'Fun All The Time!',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              'Live in the moment and enjoy your Mini 7+, and give your day some instant fun!',
              style: TextStyle(),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15.0),
        height: 80,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey[700]!,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$ ${produkList.harga!.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(produkList.warna!),
                padding: const EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 0,
              ),
              onPressed: () {},
              child: const Text(
                'Buy Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
