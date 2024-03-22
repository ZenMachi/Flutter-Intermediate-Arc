import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/authentication/data/local/auth_local_data_source.dart';
import 'package:story_app/features/authentication/provider/auth_provider.dart';
import 'package:story_app/features/settings/provider/settings_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: const Text('Dark'),
            trailing: Switch.adaptive(
              value: context.watch<SettingsProvider>().isDark,
              onChanged: (value) =>
                  context.read<SettingsProvider>().toggleTheme(value),
            ),
          ),
          ListTile(
            title: const Text('Logout'),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            onTap: () async {
              final localDataSource = AuthLocalDataSource();
              await localDataSource.logout();
              await localDataSource.deleteUser();
              if (context.mounted) context.goNamed(Routes.login);
            },
          ),
        ],
      ),
    );
  }
}
