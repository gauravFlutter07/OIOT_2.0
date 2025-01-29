import '../../imports.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final settingsController =
        Provider.of<SettingsController>(context, listen: false);
    final settingsControllerWatch = context.watch<SettingsController>();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: padding10,
          child: Column(
            children: [
              CustomHeader(title: AppLocalizations.of(context)!.appTitle),
              const Divider(),
              SizedBox(
                height: height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      height: height * 0.075,
                      width: width * 0.94,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: DropdownButton<ThemeMode>(
                            elevation: 6,
                            isExpanded: true,
                            value: settingsControllerWatch.themeMode,
                            borderRadius: BorderRadius.circular(10),
                            dropdownColor: const Color(0xFFEEEEEE),
                            underline: Container(
                              height: 0,
                              color: Colors.transparent,
                            ),
                            onChanged: (value) {
                              settingsController.updateThemeMode(value);
                            },
                            items: const [
                              DropdownMenuItem(
                                value: ThemeMode.system,
                                child: Text('System Theme',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xFFA8A8A8),
                                    )),
                              ),
                              DropdownMenuItem(
                                value: ThemeMode.light,
                                child: Text('Light Theme',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xFFA8A8A8),
                                    )),
                              ),
                              DropdownMenuItem(
                                value: ThemeMode.dark,
                                child: Text('Dark Theme',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xFFA8A8A8),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      height: height * 0.075,
                      width: width * 0.94,
                      decoration: BoxDecoration(
                          color: const Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: DropdownButton<Locale>(
                            isExpanded: true,
                            value: settingsController.language,
                            onChanged: (value) {
                              settingsController.updateLanguage(value);
                            },
                            borderRadius: BorderRadius.circular(10),
                            dropdownColor: const Color(0xFFEEEEEE),
                            underline: Container(
                              height: 0,
                              color: Colors.transparent,
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: Locale('en'),
                                child: Text('English',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xFFA8A8A8),
                                    )),
                              ),
                              DropdownMenuItem(
                                value: Locale('te'),
                                child: Text('Telugu',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xFFA8A8A8),
                                    )),
                              ),
                              DropdownMenuItem(
                                value: Locale('kn'),
                                child: Text(
                                  'Kannada',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xFFA8A8A8),
                                  ),
                                ),
                              ),
                              // DropdownMenuItem(
                              //   value: Locale('hi'),
                              //   child: Text(
                              //     'Hindi',
                              //     style: TextStyle(
                              //       fontSize: 17,
                              //       color: Color(0xFFA8A8A8),
                              //     ),
                              //   ),
                              // ),
                              DropdownMenuItem(
                                value: Locale('mr'),
                                child: Text(
                                  'Marathi',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xFFA8A8A8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
