import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/cv_chayma/DrawerPageC.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

// Import other pages or widgets if any

class MyApp extends StatefulWidget {
  final BuildContext context; // Add context here

  MyApp({Key? key, required this.context}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;
  Locale _locale = Locale('en');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Color surfaceColor = Color.fromARGB(32, 255, 255, 255);
    // ignore: unused_local_variable
    Color primaryColor = Colors.pink.shade400;
    return MaterialApp(
      title: 'CV Project',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      theme: _themeMode == ThemeMode.dark
          ? MyAppThemeConfing.dark().getTheme(_locale.languageCode)
          : MyAppThemeConfing.light().getTheme('fr'),
      home: MyHomePageC(
        toggleThemeMOde: () {
          setState(() {
            if (_themeMode == ThemeMode.dark)
              _themeMode = ThemeMode.light;
            else
              _themeMode = ThemeMode.dark;
          });
        },
        selectedLanguageChanged: (_Languge newSelectedByUser) {
          setState(() {
            _locale=newSelectedByUser==_Languge.en?
            Locale('en'):
            Locale('fr');
          });
        },
      ),
    );
  }
}

class MyAppThemeConfing {
  static const String faprimaryFontFamiy = 'Yekan';
  final Color primaryTextColor;
  final Color primaryColor = Colors.pink.shade400;
  final Color secondrayTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appColor;
  final Brightness brightness;

  MyAppThemeConfing.dark()
      : primaryTextColor = Colors.white,
        secondrayTextColor = Colors.white70,
        surfaceColor = Color(0x0dffffff),
        backgroundColor = Color.fromARGB(255, 30, 30, 30),
        appColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfing.light()
      : primaryTextColor = Colors.grey.shade900,
        secondrayTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = Color(0x0d000000),
        backgroundColor = Colors.white,
        appColor = Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  ThemeData getTheme(String languageCode) {
    return ThemeData(
      primarySwatch: Colors.pink,
      primaryColor: primaryColor,
      brightness: brightness,
      dividerTheme: (DividerThemeData(color: Colors.white)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryColor)),
      ),
      dividerColor: surfaceColor,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle:TextStyle(fontSize: 14,fontWeight:FontWeight.normal) ,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: surfaceColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(backgroundColor: appColor),
      textTheme: languageCode == 'en' ? enPrimaryTextTheme : faprimaryTextTheme,
    );
  }

  TextTheme get enPrimaryTextTheme => GoogleFonts.latoTextTheme(TextTheme(
    bodyText1: TextStyle(fontSize: 15, color: secondrayTextColor),
    bodyText2: TextStyle(fontSize: 16, color: primaryTextColor),
    headline6:
    TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
    subtitle1: TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: primaryTextColor),
  ));
  TextTheme get faprimaryTextTheme => TextTheme(
      bodyText1: TextStyle(
        fontSize: 15,
        height: 1.5,
        color: secondrayTextColor,
        fontFamily: faprimaryFontFamiy,
      ),
      caption: TextStyle(fontFamily: faprimaryFontFamiy),
      bodyText2: TextStyle(
          fontSize: 16,
          height: 1.5,
          color: primaryTextColor,
          fontFamily: faprimaryFontFamiy),
      headline6: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: primaryTextColor,
          fontFamily: faprimaryFontFamiy),
      subtitle1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: primaryTextColor,
          fontFamily: faprimaryFontFamiy),
      button: TextStyle(fontFamily:faprimaryFontFamiy)
  );
}

class MyHomePageC extends StatefulWidget {
  final Function() toggleThemeMOde;
  final Function(_Languge _languge) selectedLanguageChanged;

  MyHomePageC({super.key, required this.toggleThemeMOde,required this.selectedLanguageChanged});

  @override
  State<MyHomePageC> createState() => _MyHomePageCState();
}

enum _SkillType {
  angular,
  springboot,
  bootstrap,
  java,
  python,
}

enum _Languge {
  en,
  fr,
}

class _MyHomePageCState extends State<MyHomePageC> {
  _SkillType _skill = _SkillType.angular;
  _Languge _languge = _Languge.en;
  void _updateSelectSkill(_SkillType skillType) {
    setState(() {
      this._skill = skillType;
    });
  }

  void _updateSelectedLanguage(_Languge languge) {
    widget.selectedLanguageChanged(languge);
    setState(() {
      _languge = languge;
    });
  }


  Future<void> _launchMaps() async {
    const url = 'https://www.google.com/maps/place/34%C2%B047\'52.4%22N+10%C2%B051\'43.7%22E/@34.7979,10.8615073,160m/data=!3m2!1e3!4b1!4m13!1m8!3m7!1s0x1301cd9d764d9d35:0x2d1facfa6538671!2sSidi+Mansour!3b1!8m2!3d34.7845139!4d10.8141096!16s%2Fg%2F121g7czk!3m3!8m2!3d34.7979!4d10.862151!5m1!1e1?hl=fr&entry=ttu';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(localization.profileTitle),
          actions: [
            SizedBox(
              width: 8,
            ),

            InkWell(
              onTap: widget.toggleThemeMOde,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                child: Icon(Icons.light_mode_outlined),
              ),
            ),
          ],
        ),
        drawer: DrawerPageC(),

        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/profile.jpg',
                          width: 60,
                          height: 60,
                        )),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            localization.name,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(localization.job),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: _launchMaps,
                                child: Row(
                                  children: [
                                    Icon(
                                      size: 16,
                                      CupertinoIcons.location,
                                      color: Theme.of(context).textTheme.bodyText1!.color,
                                    ),
                                    SizedBox(width: 6),
                                    Container(
                                      width: 200,
                                      child:
                                      Text(
                                        localization.location,
                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      CupertinoIcons.heart,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                child: Text(
                  localization.summary,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(localization.selectedLanguage),
                    CupertinoSlidingSegmentedControl<_Languge>(
                        groupValue: _languge,
                        thumbColor: Theme.of(context).colorScheme.primary,
                        children: {
                          _Languge.en: Text(
                            localization.enLanguage,
                            style: TextStyle(fontSize: 14),
                          ),
                          _Languge.fr: Text(
                            localization.frLanguage,
                            style: TextStyle(fontSize: 14),
                          ),
                        },
                        onValueChanged: (value) {
                          if (value != null) _updateSelectedLanguage(value);
                        })
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      localization.skills,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    Icon(
                      CupertinoIcons.chevron_down,
                      size: 12,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Center(
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Skills(
                      title: 'Angular',
                      path: 'assets/R.png',
                      shodowcolor: Colors.redAccent,
                      isActivite: _skill == _SkillType.angular,
                      type: _SkillType.angular,
                      onTap: () {
                        _updateSelectSkill(_SkillType.angular);
                      },
                    ),
                    Skills(
                      title: 'Spring Boot',
                      path: 'assets/S.png',
                      shodowcolor: Colors.green,
                      isActivite: _skill == _SkillType.springboot,
                      type: _SkillType.springboot,
                      onTap: () {
                        _updateSelectSkill(_SkillType.springboot);
                      },
                    ),
                    Skills(
                      title: 'Bootstrap',
                      path: 'assets/B.png',
                      shodowcolor: Colors.deepPurpleAccent,
                      isActivite: _skill == _SkillType.bootstrap,
                      type: _SkillType.bootstrap,
                      onTap: () {
                        _updateSelectSkill(_SkillType.bootstrap);
                      },
                    ),
                    Skills(
                      title: 'Java',
                      path: 'assets/java.png',
                      shodowcolor: Colors.brown,
                      isActivite: _skill == _SkillType.java,
                      type: _SkillType.java,
                      onTap: () {
                        _updateSelectSkill(_SkillType.java);
                      },
                    ),
                    Skills(
                      title: 'Python',
                      path: 'assets/P.png',
                      shodowcolor: Colors.blue,
                      isActivite: _skill == _SkillType.python,
                      type: _SkillType.python,
                      onTap: () {
                        _updateSelectSkill(_SkillType.python);
                      },
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 12),
              Center(
                child: Container(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _launchURL('https://github.com/Chaymahadded');
                        },
                        child: Image.asset(
                          'assets/G.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL('https://www.linkedin.com/in/haddedchayma');
                        },
                        child: Image.asset(
                          'assets/Linkedin.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.mail),
                        onPressed: () {
                          _launchEmail('chaimahadded8@gmail.com');
                        },
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ));
  }
}
// Fonction pour ouvrir un lien URL
void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Impossible de lancer $url';
  }
}

// Fonction pour ouvrir l'application de messagerie avec un destinataire spécifié
void _launchEmail(String email) async {
  final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email,
  );
  String url = _emailLaunchUri.toString();
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Impossible d\'envoyer un email à $email';
  }
}


class Skills extends StatelessWidget {
  final _SkillType type;
  final String title;
  final String path;
  final Color shodowcolor;
  final bool isActivite;
  final Function() onTap;
  const Skills({
    super.key,
    required this.title,
    required this.path,
    required this.shodowcolor,
    required this.isActivite,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius defulltborderRadius = BorderRadius.circular(12);
    return InkWell(
      borderRadius: defulltborderRadius,
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActivite
            ? BoxDecoration(
          color: Theme.of(context).dividerColor,
          borderRadius: defulltborderRadius,
        )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: shodowcolor, blurRadius: 12),
                ]),
                child: Image.asset(path, height: 40, width: 40)),
            const SizedBox(
              height: 8,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
