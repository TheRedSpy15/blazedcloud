import 'package:badges/badges.dart' as badges;
import 'package:blazedcloud/pages/files/file_page.dart';
import 'package:blazedcloud/pages/settings/settings.dart';
import 'package:blazedcloud/pages/transfers/transfers.dart';
import 'package:blazedcloud/providers/transfers_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentPageIndexProvider = StateProvider<int>((ref) => 0);

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageIndex = ref.watch(currentPageIndexProvider);
    final downloadStates = ref.watch(downloadStateProvider);
    final uploadStates = ref.watch(uploadStateProvider);
    final transfers = [
      ...downloadStates.where((transfer) => transfer.isDownloading),
      ...uploadStates.where((transfer) => transfer.isUploading)
    ];

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          ref.read(currentPageIndexProvider.notifier).state = index;
        },
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          const NavigationDestination(
            icon: Icon(Icons.folder),
            label: 'Files',
          ),
          NavigationDestination(
            icon: badges.Badge(
                badgeContent: Text("${transfers.length}"),
                showBadge: transfers.isNotEmpty,
                child: const Icon(Icons.cloud_sync)),
            label: 'Transfers',
          ),
          const NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          alignment: Alignment.center,
          child: const FilesPage(),
        ),
        Container(
          alignment: Alignment.center,
          child: const TransfersPage(),
        ),
        Container(
          alignment: Alignment.center,
          child: const SettingsScreen(),
        ),
      ][currentPageIndex],
    );
  }
}
