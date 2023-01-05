import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/cart/cart.dart';
import 'package:riverpod_app/cart/data/models/item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _Body(),
      bottomNavigationBar: const _BottomNav(),
    );
  }
}

class _BottomNav extends ConsumerWidget {
  const _BottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final harga = ref.watch(
      cartProvider.select((value) => value.totalHarga),
    );
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextButton(
        onPressed: () {},
        child: Text('Total: $harga'),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(
      cartProvider.select((value) => value.cartStatus),
    );

    switch (status) {
      case CartStatus.initial:
        return const SizedBox.shrink(
          key: Key('initial_sizedbox'),
        );
      case CartStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case CartStatus.failure:
        return const Center(child: Text('error'));
      case CartStatus.success:
        final items = ref.watch(
          cartProvider.select((value) => value.tokos),
        );
        return Column(
          children: [
            const _Header(),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: items!.length,
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                ),
                itemBuilder: (context, index) {
                  final it = items[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CheckboxListTile(
                        value: it.isChecked,
                        onChanged: (val) {
                          ref
                              .read(cartProvider.notifier)
                              .selectAllBarangInOneToko(
                                it.idToko,
                                val!,
                              );
                        },
                        title: Text(it.namaToko),
                      ),
                      for (Barang barang in it.barangs)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CheckboxListTile(
                                value: barang.isBarangChecked,
                                onChanged: (val) {
                                  ref.read(cartProvider.notifier).selectBarang(
                                        idToko: it.idToko,
                                        idBarang: barang.idBarang,
                                        valueChecked: val!,
                                      );
                                },
                                title: Text(barang.namaBarang),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text('Harga: ${barang.harga}'),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      ref
                                          .read(cartProvider.notifier)
                                          .addStockBarang(
                                            idToko: it.idToko,
                                            idBarang: barang.idBarang,
                                          );
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                  Text(barang.stok.toString()),
                                  IconButton(
                                    onPressed: barang.stok == 1
                                        ? null
                                        : () {
                                            ref
                                                .read(cartProvider.notifier)
                                                .decrementStockBarang(
                                                  idToko: it.idToko,
                                                  idBarang: barang.idBarang,
                                                );
                                          },
                                    icon: const Icon(Icons.remove),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                    ],
                  );
                },
              ),
            ),
          ],
        );
    }
  }
}

class _Header extends ConsumerWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(
      cartProvider.select((value) => value.isSelectAllBarangInAllToko2),
    );
    return Column(
      children: [
        CheckboxListTile(
          value: value,
          onChanged: (val) {
            ref.read(cartProvider.notifier).selectBarangInAllToko(
                  valueChecked: val!,
                );
          },
          title: const Text('select All'),
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
