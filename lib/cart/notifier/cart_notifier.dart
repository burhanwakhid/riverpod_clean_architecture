import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/cart/data/api/cart_api.dart';
import 'package:riverpod_app/cart/data/models/item.dart';
import 'package:riverpod_app/cart/notifier/cart_state.dart';

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(const CartState.initial()) {
    getCart();
  }

  // using dummy api
  final _cartApi = CartApi();

  Future<void> getCart() async {
    state = const CartState.loading();

    try {
      final items = await _cartApi.getListCart();
      state = CartState.success(tokos: items);
    } catch (e) {
      state = const CartState.failure();
    }
  }

  void selectBarangInAllToko({
    required bool valueChecked,
  }) {
    final newItems = state.tokos!.map<Toko>((e) {
      final newBarang = e.barangs.map<Barang>((s) {
        return s.copyWith(isBarangChecked: valueChecked);
      }).toList();

      return e.copyWith(barangs: newBarang);
    }).toList();

    state = state.copyWith(
      tokos: newItems,
      isSelectAllBarangInAllToko: valueChecked,
    );
  }

  void selectBarang({
    required int idToko,
    required int idBarang,
    required bool valueChecked,
  }) {
    final newItems = state.tokos!.map<Toko>((e) {
      if (e.idToko == idToko) {
        final newBarang = e.barangs.map<Barang>((s) {
          if (s.idBarang == idBarang) {
            return s.copyWith(isBarangChecked: valueChecked);
          } else {
            return s;
          }
        }).toList();

        return e.copyWith(barangs: newBarang);
      } else {
        return e;
      }
    }).toList();

    state = state.copyWith(tokos: newItems);
  }

  void selectAllBarangInOneToko(
    int idToko,
    bool valueChecked,
  ) {
    final newItems = state.tokos!.map<Toko>((e) {
      if (e.idToko == idToko) {
        final newBarang = e.barangs.map<Barang>((s) {
          return s.copyWith(isBarangChecked: valueChecked);
        }).toList();

        return e.copyWith(barangs: newBarang);
      } else {
        return e;
      }
    }).toList();

    state = state.copyWith(tokos: newItems);
  }

  void addStockBarang({
    required int idToko,
    required int idBarang,
  }) {
    final newItems = state.tokos!.map<Toko>((e) {
      if (e.idToko == idToko) {
        final newBarang = e.barangs.map<Barang>((s) {
          if (s.idBarang == idBarang) {
            return s.copyWith(stok: s.stok + 1);
          } else {
            return s;
          }
        }).toList();

        return e.copyWith(barangs: newBarang);
      } else {
        return e;
      }
    }).toList();

    state = state.copyWith(tokos: newItems);
  }

  void decrementStockBarang({
    required int idToko,
    required int idBarang,
  }) {
    final newItems = state.tokos!.map<Toko>((e) {
      if (e.idToko == idToko) {
        final newBarang = e.barangs.map<Barang>((s) {
          if (s.idBarang == idBarang) {
            return s.copyWith(stok: s.stok - 1);
          } else {
            return s;
          }
        }).toList();

        return e.copyWith(barangs: newBarang);
      } else {
        return e;
      }
    }).toList();

    state = state.copyWith(tokos: newItems);
  }
}

final cartProvider =
    StateNotifierProvider.autoDispose<CartNotifier, CartState>((ref) {
  return CartNotifier();
});
