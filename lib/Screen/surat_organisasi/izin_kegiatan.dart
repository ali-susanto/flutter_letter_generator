import 'package:e_letter/helper/ToPdf/surat_organisasi/izin_kegiatan_pdf.dart';
import 'package:e_letter/Model/surat_organisasi/model_izin_organisasi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../helper/ToPdf/pdf_manager.dart';
import '../../Model/activity/activity_model.dart';
import '../../Widgets/datePicker.dart';
import '../../Widgets/textfield.dart';
import '../activity/activity_viewModel.dart';

class IzinKegiatanOrganisasi extends StatefulWidget {
  const IzinKegiatanOrganisasi({Key? key}) : super(key: key);

  @override
  State<IzinKegiatanOrganisasi> createState() => _IzinKegiatanOrganisasiState();
}

class _IzinKegiatanOrganisasiState extends State<IzinKegiatanOrganisasi> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  var nama = TextEditingController();
  var jenis = TextEditingController();
  var noTlp = TextEditingController();
  var website = TextEditingController();

  var alamat = TextEditingController();
  var noSurat = TextEditingController();
  var lampiran = TextEditingController();
  var perihal = TextEditingController();
  var acara = TextEditingController();
  var tempatAcara = TextEditingController();
  var tglAcara = TextEditingController();
  var waktu = TextEditingController();
  var penerima = TextEditingController();
  var ketua = TextEditingController();

  var tempatSurat = TextEditingController();
  var tglSurat = TextEditingController();
  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 5 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff261865),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff261865),
          title: const Text('Surat Izin Kegiatan Organisasi'),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: ListView(
                  children: [
                    Stepper(
                        type: StepperType.vertical,
                        currentStep: _currentStep,
                        physics: const ScrollPhysics(),
                        onStepTapped: (step) => tapped(step),
                        onStepContinue: continued,
                        onStepCancel: cancel,
                        steps: <Step>[
                          Step(
                              title: const Text('Kop Surat'),
                              content: Column(
                                children: [
                                  TextFieldItem(
                                      controller: nama,
                                      hintText: 'OSIS SMK Maju',
                                      label: 'Nama Instansi'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: jenis,
                                      hintText:
                                          'Organisasi Siswa Intra Sekolah',
                                      label: 'Jenis Instansi'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: noTlp,
                                      hintText: '0812424321',
                                      label: 'Nomor Tlp/ Hp'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: website,
                                      hintText: 'www.website.com',
                                      label: 'Website'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: alamat,
                                      hintText:
                                          'Jl. Agus salim No.5 Purwokerto',
                                      label: 'Alamat'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                              isActive: _currentStep >= 0,
                              state: _currentStep >= 1
                                  ? StepState.complete
                                  : StepState.disabled),
                          Step(
                              title: const Text('Nomor, Lampiran, hal'),
                              content: Column(
                                children: [
                                  TextFieldItem(
                                      controller: noSurat,
                                      hintText: 'QWT/22/2022',
                                      label: 'Nomor Surat'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: lampiran,
                                      hintText: '1/-(tidak ada)',
                                      label: 'Jumlah Lampiran'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: perihal,
                                      hintText: 'Permohonan Izin',
                                      label: 'Perihal'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                              isActive: _currentStep >= 0,
                              state: _currentStep >= 2
                                  ? StepState.complete
                                  : StepState.disabled),
                          Step(
                              title: const Text('Informasi Kegiatan'),
                              content: Column(
                                children: [
                                  TextFieldItem(
                                      controller: acara,
                                      hintText: 'Malam Keakraban',
                                      label: 'Nama Acara'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFieldItem(
                                      controller: tempatAcara,
                                      hintText: 'Lapangan',
                                      label: 'Tempat Acara'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  DatePicker(
                                      controller: tglAcara,
                                      label: 'Tanggal Acara',
                                      hintText: 'hh-BB-tttt'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ListTile(
                                      title: TextFormField(
                                        controller: waktu,
                                        decoration: InputDecoration(
                                          labelText: 'Waktu acara',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          hintText: '09:00',
                                        ),
                                      ),
                                      trailing: ElevatedButton(
                                          onPressed: () async {
                                            final TimeOfDay? timeOfDay =
                                                await showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                    initialEntryMode:
                                                        TimePickerEntryMode
                                                            .dial);
                                            if (timeOfDay != null &&
                                                timeOfDay != TimeOfDay.now()) {
                                              setState(() {
                                                waktu.text = timeOfDay.hour
                                                        .toString() +
                                                    ':' +
                                                    timeOfDay.minute.toString();
                                              });
                                            }
                                          },
                                          child:
                                              const Icon(Icons.timer_rounded)))
                                ],
                              ),
                              isActive: _currentStep >= 0,
                              state: _currentStep >= 3
                                  ? StepState.complete
                                  : StepState.disabled),
                          Step(
                              title: const Text('Penerima Surat'),
                              content: Column(
                                children: [
                                  TextFieldItem(
                                      controller: penerima,
                                      hintText: 'Kepala Sekolah',
                                      label: 'Penerima Surat')
                                ],
                              ),
                              isActive: _currentStep >= 0,
                              state: _currentStep >= 4
                                  ? StepState.complete
                                  : StepState.disabled),
                          Step(
                              title: const Text('Pengesahan'),
                              content: Column(
                                children: [
                                  TextFieldItem(
                                      controller: ketua,
                                      hintText: 'Dia',
                                      label: 'Ketua Panitia'),
                                ],
                              ),
                              isActive: _currentStep >= 0,
                              state: _currentStep >= 5
                                  ? StepState.complete
                                  : StepState.disabled),
                          Step(
                              title: const Text('Waktu dan Tempat'),
                              content: Column(
                                children: [
                                  TextFieldItem(
                                      controller: tempatSurat,
                                      hintText: 'Jawa Tengah',
                                      label: 'Tempat Diterbitkan Surat'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  DatePicker(
                                    controller: tglSurat,
                                    label: 'Tanggal Terbit Surat',
                                    hintText: DateTime.now().toString(),
                                  )
                                ],
                              ),
                              isActive: _currentStep >= 0,
                              state: _currentStep >= 6
                                  ? StepState.complete
                                  : StepState.disabled),
                        ]),
                    ElevatedButton(
                        onPressed: () async {
                          //export ke pdf
                          var data = ModelIzinKegiatan(
                              namaInstansi: nama.text.toString(),
                              jenisInstansi: jenis.text.toString(),
                              noTlp: noTlp.text.toString(),
                              alamat: alamat.text.toString(),
                              website: website.text.toString(),
                              noSurat: noSurat.text.toString(),
                              lampiran: lampiran.text.toString(),
                              perihal: perihal.text.toString(),
                              namaAcara: acara.text.toString(),
                              tempat: tempatAcara.text.toString(),
                              tglAcara: tglAcara.text.toString(),
                              waktu: waktu.text.toString(),
                              penerima: penerima.text.toString(),
                              ketua: ketua.text.toString(),
                              tempatTerbit: tempatSurat.text.toString(),
                              tglTerbit: tglSurat.text.toString());
                          if (_formKey.currentState!.validate()) {
                            final pdfFile =
                                await PdfIzinKegiatan.generate(data);

                            PdfManager.openFile(pdfFile);

                            var activity = ActivityModel(
                                title: 'Surat undangan',
                                createdDate:
                                    DateFormat('dd-MM-yyyy  hh:mm:ss a')
                                        .format(DateTime.now()));
                            Provider.of<ActivityViewModel>(context,
                                    listen: false)
                                .addActivity(activity);
                          }

                          //menambahkan activity
                        },
                        child: const Text('Buat Surat'))
                  ],
                ),
              ),
            )));
  }
}
