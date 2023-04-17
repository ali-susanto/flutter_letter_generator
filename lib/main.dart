import 'package:e_letter/screen/activity/activity_viewModel.dart';
import 'package:e_letter/screen/desktop/home/home_screen_desktop.dart';
import 'package:e_letter/screen/surat_organisasi/izin_kegiatan.dart';
import 'package:e_letter/screen/surat_organisasi/undangan.dart';
import 'package:e_letter/screen/surat_pekerjaan/surat_pengunduran.dart';
import 'package:e_letter/screen/surat_umum/form_izin_ortu.dart';
import 'package:e_letter/screen/surat_umum/form_surat_kuasa.dart';
import 'package:e_letter/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/mobile/home/home_screen_mobile.dart';
import 'screen/content/content_viewModel.dart';
import 'screen/surat_pekerjaan/surat_izin_kerja.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ContentViewModel()),
      ChangeNotifierProvider(create: (_) => ActivityViewModel())
    ], child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initialRoute: '/',
      routes: {
        //'/': (_) => const HomeScreen(),
        '/form_pengunduran': (_) => const FormPengunduran(),
        '/form_undangan': (_) => const UndanganScreen(),
        '/form_izin': (_) => const ScreenIzinOrtu(),
        '/form_surat_kuasa': (_) => const SuratKuasaScreen(),
        '/form_izin_Kerja': (_) => const SuratIzinKerja(),
        '/form_izin_kegiatan': (_) => const IzinKegiatanOrganisasi()
      },
      debugShowCheckedModeBanner: false,
      title: 'E-Letter',
      theme: ThemeData(
          primaryColor: const Color(0xff261865), primarySwatch: Colors.pink),
      home: const Scaffold(
        body: ResponsiveLayout(
            mobileBody: HomeScreenMobile(), desktopBody: HomeScreenDesktop()),
      ),
    );
  }
}
