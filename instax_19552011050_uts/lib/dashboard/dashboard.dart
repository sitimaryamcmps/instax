import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:instax_19552011050_uts/data.dart';
import 'package:instax_19552011050_uts/dashboard/search.dart';
import 'package:instax_19552011050_uts/item_detail/deskripsi_produk.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  static final ProdukList _produkList = ProdukList();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //define it
      create: (_) => Search(_produkList.produk),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          shape: Border(
            bottom: BorderSide(
              color: Colors.grey[700]!,
              width: 1,
            ),
          ),
          leading: Container(
            margin: const EdgeInsets.all(7.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange.shade800,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ),
          title: Image.asset(
            'images/banner.png',
            width: 100,
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(7.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Consumer<Search>(builder: (_, findProvider, __) {
                return TextFormField(
                  controller: findProvider.textEditingController,
                  onTap: () {
                    FocusScope.of(context).requestFocus(
                      findProvider.focusNode,
                    );
                  },
                  onChanged: findProvider.operation,
                  onEditingComplete: () {
                    findProvider.find = false;
                    FocusScope.of(context).unfocus();
                  },
                  focusNode: findProvider.focusNode,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    focusColor: Color(0XFF0A9EA2),
                    contentPadding: EdgeInsets.all(16.0),
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                    hintText: '  Search',
                    border: InputBorder.none,
                  ),
                );
              }),
            ),
            const SizedBox(height: 15.0),
            Consumer<Search>(
              builder: (context, findProvider, child) {
                List<ProdukList> listData =
                    findProvider.find ? findProvider.list : _produkList.produk;
                if (listData.isEmpty) {
                  return const Center(
                    child: Text('No items match your search'),
                  );
                }
                return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: findProvider.find
                      ? findProvider.list.length
                      : _produkList.produk.length,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 15.0),
                      child: _buildList(
                        context: context,
                        produkList: listData[index],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList({
    required BuildContext context,
    required ProdukList produkList,
  }) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          width: MediaQuery.of(context).size.width - 60,
          decoration: BoxDecoration(
            color: Color(produkList.warna!),
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Limited Edition',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Instax',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: produkList.tipe!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: '\$',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: produkList.harga!.toStringAsFixed(2),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return DeskripsiProduk(produkList);
                      },
                    ),
                  );
                },
                child: Text(
                  'Buy',
                  style: TextStyle(
                    color: Color(
                      produkList.warna!,
                    ),
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 20.0,
          bottom: 20.0,
          child: Image.asset(
            produkList.gambar!,
            height: 150.0,
          ),
        ),
      ],
    );
  }
}
