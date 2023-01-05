import 'package:equatable/equatable.dart';
import 'package:riverpod_app/cart/data/models/item.dart';

enum CartStatus { initial, loading, success, failure }

class CartState extends Equatable {
  const CartState.__({
    this.cartStatus = CartStatus.initial,
    this.tokos,
    this.isSelectAllBarangInAllToko = false,
  });
  const CartState.initial() : this.__();

  const CartState.loading() : this.__(cartStatus: CartStatus.loading);

  const CartState.success({
    required List<Toko> tokos,
  }) : this.__(
          cartStatus: CartStatus.success,
          tokos: tokos,
        );

  const CartState.failure() : this.__(cartStatus: CartStatus.failure);

  final CartStatus cartStatus;
  final List<Toko>? tokos;
  final bool isSelectAllBarangInAllToko;
  bool get isSelectAllBarangInAllToko2 => _getIsSelectAllBarang();
  int get totalHarga => _getTotalHarga();

  @override
  List<Object?> get props => [cartStatus, tokos, isSelectAllBarangInAllToko];

  CartState copyWith({
    CartStatus? cartStatus,
    List<Toko>? tokos,
    bool? isSelectAllBarangInAllToko,
  }) {
    return CartState.__(
      cartStatus: cartStatus ?? this.cartStatus,
      tokos: tokos ?? this.tokos,
      isSelectAllBarangInAllToko:
          isSelectAllBarangInAllToko ?? this.isSelectAllBarangInAllToko,
    );
  }

  int _getTotalHarga() {
    int harga = 0;
    if (tokos != null) {
      for (Toko toko in tokos!) {
        for (Barang br in toko.barangs) {
          if (br.isBarangChecked) {
            harga = harga + br.totalHargaXstok;
          }
        }
      }
      return harga;
    } else {
      return 0;
    }
  }

  bool _getIsSelectAllBarang() {
    final s = <bool>[];
    if (tokos != null) {
      for (Toko toko in tokos!) {
        for (Barang br in toko.barangs) {
          s.add(br.isBarangChecked);
        }
      }

      return s.contains(false) ? false : true;
    } else {
      return false;
    }
  }
}
