import 'package:equatable/equatable.dart';

class Toko extends Equatable {
  const Toko({
    required this.namaToko,
    required this.idToko,
    required this.barangs,
  });

  final String namaToko;
  final int idToko;

  final List<Barang> barangs;

  bool get isChecked => _getIsChecked();

  @override
  List<Object> get props => [namaToko, idToko, barangs];

  Toko copyWith({
    String? namaToko,
    int? idToko,
    bool? isTokoChecked,
    List<Barang>? barangs,
  }) {
    return Toko(
      namaToko: namaToko ?? this.namaToko,
      idToko: idToko ?? this.idToko,
      barangs: barangs ?? this.barangs,
    );
  }

  bool _getIsChecked() {
    final items =
        barangs.where((element) => element.isBarangChecked == false).toList();

    return items.isNotEmpty ? false : true;
  }
}

class Barang extends Equatable {
  const Barang({
    required this.namaBarang,
    required this.idBarang,
    required this.harga,
    required this.isBarangChecked,
    required this.stok,
  });

  final String namaBarang;
  final int idBarang;
  final int harga;
  final bool isBarangChecked;
  final int stok;
  int get totalHargaXstok => stok * harga;

  @override
  List<Object> get props =>
      [namaBarang, idBarang, harga, isBarangChecked, stok];

  Barang copyWith({
    String? namaBarang,
    int? idBarang,
    int? harga,
    bool? isBarangChecked,
    int? stok,
  }) {
    return Barang(
      namaBarang: namaBarang ?? this.namaBarang,
      idBarang: idBarang ?? this.idBarang,
      harga: harga ?? this.harga,
      isBarangChecked: isBarangChecked ?? this.isBarangChecked,
      stok: stok ?? this.stok,
    );
  }
}
