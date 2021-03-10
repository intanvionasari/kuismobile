import 'package:flutter/material.dart';//mengimport material pada flutter
import 'package:flutter/services.dart';//mengimport service pada flutter
import 'widget/dropdown.dart';//mengimport class dropdown
import 'widget/floatingbtn.dart';//mengimport class floatingbtn
import 'widget/hasil.dart';//mengimport class hasil
import 'widget/inputlebar.dart';//mengimport class inputlebar
import 'widget/inputpanjang.dart';//mengimport class inputpanjang
import 'widget/raisedbtn.dart';////mengimport class raisedbtn
import 'widget/textpertama.dart';////mengimport class textpertama

void main() {//fungsi agar project dapat di run
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // memakai statefulwidget karena widget ada perubahan
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputPanjang = 0; //membuat variable
  double _inputLebar = 0; //membuat variable
  final inputpjController = TextEditingController(); //membuat controller
  final inputlbController = TextEditingController(); //membuat controller

  var listItem = ["30X30", "40X40", "50X50"]; //variable pada list
  List<String> listViewItem = List<String>(); //untuk list item
  String _newValue = "30X30"; // variable value
  double _result = 0; // variable result

  void dropDownOnChanged(String changeValue) {
    //fungsi untuk dropdown
    setState(() {
      _newValue = changeValue;//fungsi untuk mengubah value pada dropdown
    });
  }

  void perhitunganRumus() {
    //fungsi untuk mengitung rumus
    setState(() {
      _inputPanjang = double.parse(inputpjController.text);
      _inputLebar = double.parse(inputlbController.text);
      if (_newValue == "30X30") {
        //perhitungan jika ukuran keramik 30x30
        _result = ((_inputPanjang * 100) * (_inputLebar * 100)) / 900;
      } else if (_newValue == "40X40") {
        //perhitungan jika ukuran keramik 40x40
        _result = ((_inputPanjang * 100) * (_inputLebar * 100)) / 1600;
      } else //perhitungan jika ukuran keramik 50x50
        _result = ((_inputPanjang * 100) * (_inputLebar * 100)) / 2500;
     });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //menghilankan banner debug
      title: 'Aplikasi Menghitung Ubin', //title aplikasi
      theme: ThemeData(
        primarySwatch: Colors.grey, // warna tema
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,//digunakan agar tidak overflowed
        appBar: AppBar(
          title: Text("HomeSweetHome"), //title tampilan kanan atas aplikasi
        ),
        body: Container(
          //container
          margin: EdgeInsets.all(5), //mengatur jarak
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, //mengatur jarak
            children: [
              Image.network(//mengambil gambar secara online
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd1eki1ZC4-4f7wgcG480nrY9Vc1SYuJx-3g&usqp=CAU',
                  width: 200.0,//mengatur lebar gambar
                  height: 150.0),//mengatur tinggi gambar
              Inputpanjang(inputpjController: inputpjController),//memanggil kelas Inputpanjang serta controllernya
              Inputlebar(inputlbController: inputlbController),//memanggil kelas Inputlebar serta controllernya
              Textpertama(),//memanggil kelas textpertama
              Dropdown(listItem: listItem, newValue: _newValue,dropDownOnChanged: dropDownOnChanged),//memanggil kelas dropdown dan fungsinya
              Hasil(result: _result),//memanggil kelas hasil 
              Raisedbtn(perhitunganRumus: perhitunganRumus,),//memanggil kelas raisedbtn beserta fungsi perhitugan rumus
            ],
          ),
        ),
        floatingActionButton: Float(),//memanggil kelas Float yang berisi berpindah ke halaman selanjutnya
      ),
    );
  }
}



