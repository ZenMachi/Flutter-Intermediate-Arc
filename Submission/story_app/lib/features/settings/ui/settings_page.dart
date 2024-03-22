import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/authentication/data/local/auth_local_data_source.dart';
import 'package:story_app/features/settings/provider/settings_provider.dart';
import 'package:story_app/localization/localization.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final content = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(content.titleAppBarSettings),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(content.textDarkMode),
            trailing: Switch.adaptive(
              value: context.watch<SettingsProvider>().isDark,
              onChanged: (value) =>
                  context.read<SettingsProvider>().toggleTheme(value),
            ),
          ),
          ListTile(
            title: Text(content.textLanguage),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(
                Icons.language_rounded,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            trailing: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: context.watch<SettingsProvider>().locale,
                items: AppLocalizations.supportedLocales.map((Locale locale) {
                  final name = getString(locale, context);

                  return DropdownMenuItem(
                    value: locale,
                    child: Text(name),
                    onTap: () {
                      context.read<SettingsProvider>().setLocale(locale);
                    },
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
          ),
          ListTile(
            title: Text(content.textLogout),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(
                Icons.logout_rounded,
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

  static String getString(Locale locale, BuildContext context) {
    final content = AppLocalizations.of(context)!;
    switch (locale.languageCode) {
      case 'en':
        return content.languageEN;
      case 'id':
        return content.languageID;
      default:
        return content.languageEN;
    }
  }

// List<DropdownMenuItem> _dropdownMenuItem() {
//   return [
//     DropdownMenuItem(child: Text)
//   ];
// }
}
