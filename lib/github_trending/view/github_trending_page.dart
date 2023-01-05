import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repository/github_repository.dart';
import 'package:riverpod_app/app/app.dart';
import 'package:riverpod_app/github_trending/notifier/github_trending_notifier.dart';
import 'package:riverpod_app/github_trending/notifier/github_trending_state.dart';

final githubTrendingProvider = StateNotifierProvider.autoDispose<
    GithubTrendingNotifier, GithubTrendingState>((ref) {
  return GithubTrendingNotifier(
    githubRepository: ref.read(githubRepositoryProvider),
  );
});

class GithubTrendingPage extends StatelessWidget {
  const GithubTrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, widget) {
            debugPrint('build app bar');
            final value = ref
                .watch(githubTrendingProvider.select((value) => value.value));
            return Text(value.toString());
          },
        ),
        actions: [
          Consumer(builder: (context, ref, widget) {
            return IconButton(
              key: const Key('action_btn'),
              onPressed: () {
                _showMenu(context, ref);
              },
              icon: const Icon(Icons.more_vert),
            );
          })
        ],
      ),
      floatingActionButton: const _FloatingButton(),
      body: const GithubTrendingList(),
    );
  }

  void _showMenu(BuildContext context, WidgetRef ref) {
    showMenu<void>(
      context: context,
      position: const RelativeRect.fromLTRB(100, 100, 0, 100),
      items: [
        PopupMenuItem<String>(
          key: const Key('sort_star_menu'),
          value: 'stars',
          child: const Text('Sort by Stars'),
          onTap: () {
            // context.read<GithubTrendingBloc>().add(SortByStars());
            ref.read(githubTrendingProvider.notifier).sortByStars();
          },
        ),
        PopupMenuItem<String>(
          key: const Key('sort_name_menu'),
          value: 'name',
          child: const Text('Sort by Name'),
          onTap: () {
            // context.read<GithubTrendingBloc>().add(SortByName());
            ref.read(githubTrendingProvider.notifier).sortByName();
          },
        ),
        PopupMenuItem<String>(
          key: const Key('randomlist'),
          value: 'name',
          child: const Text('add random list'),
          onTap: () {
            // context.read<GithubTrendingBloc>().add(SortByName());
            ref.read(githubTrendingProvider.notifier).addRandomItemList();
          },
        ),
      ],
    );
  }
}

class _FloatingButton extends StatelessWidget {
  const _FloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, widget) {
        return FloatingActionButton(
          onPressed: () {
            ref.read(githubTrendingProvider.notifier).increment();
          },
        );
      },
    );
  }
}

class GithubTrendingList extends ConsumerWidget {
  const GithubTrendingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('build github list');
    // final status = ref.watch(githubTrendingProvider).githubTrendingStatus;

    ref.listen(
        githubTrendingProvider.select((value) => value.githubTrendingStatus),
        (previous, next) {
      if (next == GithubTrendingStatus.success) {
        debugPrint('hahaha');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('success')),
        );
      }
    });
    final status = ref.watch(
      githubTrendingProvider.select((value) => value.githubTrendingStatus),
    );

    switch (status) {
      case GithubTrendingStatus.initial:
        return const SizedBox.shrink(
          key: Key('initial_sizedbox'),
        );
      case GithubTrendingStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case GithubTrendingStatus.failure:
        return const Center(child: Text('error'));
      case GithubTrendingStatus.success:
        final items = ref.watch(
          githubTrendingProvider.select((value) => value.githubRepoEntity),
        );
        return ItemGithubTrending(
          key: const Key('item_github_trending'),
          items: items!,
        );
    }
  }
}

class ItemGithubTrending extends StatelessWidget {
  const ItemGithubTrending({
    super.key,
    required this.items,
  });

  final List<GithubRepoEntity> items;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // context.read<GithubTrendingBloc>().add(GetGithubTrending());
      },
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          return ItemRepoTile(item: items[i]);
        },
      ),
    );
  }
}

class ItemRepoTile extends StatelessWidget {
  const ItemRepoTile({
    super.key,
    required this.item,
  });

  final GithubRepoEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: item.isOpen
            ? [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  offset: const Offset(0, 5),
                  blurRadius: 5,
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          Consumer(builder: (context, ref, widget) {
            return InkWell(
              onTap: () {
                ref.read(githubTrendingProvider.notifier).openItemTile(item.id);
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 8,
                ),
                child: Row(
                  children: [
                    Image.network(
                      item.avatarUrl,
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.ownerName,
                            // style: GtTextStyle.subtitle2,
                          ),
                          Text(
                            item.repoName,
                            // style: GtTextStyle.bodyText1,
                          ),
                          AnimatedOpacity(
                            opacity: item.isOpen ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 1500),
                            child: Visibility(
                              visible: item.isOpen,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.description,
                                    // style: GtTextStyle.subtitle2.copyWith(
                                    //   fontFamily: FontFamily.pingFangSc,
                                    // ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  _BottomInfo(item: item),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          Visibility(
            visible: !item.isOpen,
            child: const Divider(),
          ),
        ],
      ),
    );
  }
}

class _BottomInfo extends StatelessWidget {
  const _BottomInfo({
    required this.item,
  });

  final GithubRepoEntity item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Container(
              height: 9,
              width: 9,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              item.language,
            )
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        Row(
          children: [
            const SizedBox(
              width: 4,
            ),
            Text(
              item.countStar.toString(),
            )
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        Row(
          children: [
            const SizedBox(
              width: 4,
            ),
            Text(
              item.countFork.toString(),
            )
          ],
        ),
      ],
    );
  }
}
