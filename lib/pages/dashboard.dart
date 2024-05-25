import 'dart:io';
import 'dart:ui';

import 'package:badges/badges.dart' as badges;
import 'package:blazedcloud/generated/l10n.dart';
import 'package:blazedcloud/pages/files/file_page.dart';
import 'package:blazedcloud/pages/settings/settings.dart';
import 'package:blazedcloud/pages/sync/sync.dart';
import 'package:blazedcloud/pages/transfers/transfers.dart';
import 'package:blazedcloud/providers/transfers_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentPageIndexProvider = StateProvider<int>((ref) => 0);

class Dashboard extends ConsumerWidget {
  final PageController pageController = PageController(initialPage: 0);

  Dashboard({super.key});

  ClipRRect bottomNavBar(BuildContext context, WidgetRef ref,
      int currentPageIndex, List<Object> transfers) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: NavigationBar(
          backgroundColor:
              Theme.of(context).colorScheme.surface.withOpacity(0.9),
          onDestinationSelected: (int index) {
            ref.read(currentPageIndexProvider.notifier).state = index;
            if (pageController.hasClients) pageController.jumpToPage(index);
          },
          selectedIndex: currentPageIndex,
          destinations: <NavigationDestination>[
            NavigationDestination(
              icon: const Icon(Icons.folder),
              label: S.of(context).files,
            ),
            NavigationDestination(
              icon: badges.Badge(
                  badgeContent: Text("${transfers.length}"),
                  showBadge: transfers.isNotEmpty,
                  child: const Icon(Icons.cloud_sync)),
              label: S.of(context).transfers,
            ),
            if (Platform.isAndroid)
              NavigationDestination(
                icon: const Icon(Icons.camera_alt),
                label: S.of(context).cameraSync,
              ),
            NavigationDestination(
              icon: const Icon(Icons.settings),
              label: S.of(context).settings,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageIndex = ref.watch(currentPageIndexProvider);
    final downloadStates = ref.watch(downloadStateProvider);
    final uploadStates = ref.watch(uploadStateProvider);
    final transfers = [
      ...downloadStates.where((transfer) => transfer.isDownloading),
      ...uploadStates.where((transfer) => transfer.isUploading)
    ];

    return LayoutBuilder(builder: (context, constraints) {
      final wide = constraints.maxWidth > constraints.maxHeight;

      return Scaffold(
        extendBody: true,
        bottomNavigationBar: wide
            ? null
            : bottomNavBar(context, ref, currentPageIndex, transfers),
        body: Row(
          children: <Widget>[
            if (wide) ...sideNavRail(context, ref, transfers),
            Expanded(
              child: selectedPageView(context, ref),
            ),
          ],
        ),
      );
    });
  }

  PageView selectedPageView(BuildContext context, WidgetRef ref) {
    return PageView.builder(
        itemCount: Platform.isAndroid ? 4 : 3,
        onPageChanged: (index) {
          ref.read(currentPageIndexProvider.notifier).state = index;
        },
        controller: pageController,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const FilesPage();
          } else if (index == 1) {
            return const TransfersPage();
          } else if (index == 2 && Platform.isAndroid) {
            return const SyncPage();
          } else {
            return const SettingsScreen();
          }
        });
  }

  List<Widget> sideNavRail(
      BuildContext context, WidgetRef ref, List<Object> transfers) {
    return [
      Stack(
        children: [
          NavigationRail(
            selectedIndex: ref.watch(currentPageIndexProvider),
            labelType: NavigationRailLabelType.all,
            onDestinationSelected: (int index) {
              ref.read(currentPageIndexProvider.notifier).state = index;
              pageController.jumpToPage(index);
            },
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(
                icon: const Icon(Icons.folder),
                label: Text(S.of(context).files),
              ),
              NavigationRailDestination(
                icon: badges.Badge(
                    badgeContent: Text("${transfers.length}"),
                    showBadge: transfers.isNotEmpty,
                    child: const Icon(Icons.cloud_sync)),
                label: Text(S.of(context).transfers),
              ),
              if (Platform.isAndroid)
                NavigationRailDestination(
                  icon: const Icon(Icons.camera_alt),
                  label: Text(S.of(context).cameraSync),
                ),
              NavigationRailDestination(
                icon: const Icon(Icons.settings),
                label: Text(S.of(context).settings),
              ),
            ],
          ),
        ],
      ),
      const VerticalDivider(thickness: 1, width: 1),
    ];
  }
}
