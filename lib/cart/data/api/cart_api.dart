import 'package:riverpod_app/cart/data/models/item.dart';

class CartApi {
  Future<List<Toko>> getListCart() async {
    return Future.delayed(const Duration(seconds: 1)).then((_) {
      final item = <Toko>[
        const Toko(
          namaToko: 'toko 1',
          idToko: 1,
          barangs: [
            Barang(
              namaBarang: 'barang 1',
              idBarang: 1,
              harga: 1000,
              isBarangChecked: false,
              stok: 1,
            ),
            Barang(
              namaBarang: 'barang 2',
              idBarang: 2,
              harga: 2000,
              isBarangChecked: false,
              stok: 1,
            ),
          ],
        ),
        const Toko(
          namaToko: 'toko 2',
          idToko: 2,
          barangs: [
            Barang(
              namaBarang: 'barang 3',
              idBarang: 3,
              harga: 1400,
              isBarangChecked: false,
              stok: 1,
            ),
            Barang(
              namaBarang: 'barang 4',
              idBarang: 4,
              harga: 4000,
              isBarangChecked: false,
              stok: 1,
            ),
          ],
        ),
      ];
      return item;
    });
  }
}
