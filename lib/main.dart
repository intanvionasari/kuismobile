import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
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
  double _tigapuluh = 0; //membuat variable
  double _empatpuluh = 0; //membuat variable
  double _limapuluh = 0; //membuat variable
  final inputpjController = TextEditingController(); //membuat controller  
  final inputlbController = TextEditingController(); //membuat controller


  var listItem = ["30X30", "40X40", "50X50"]; //variable pada list
  List<String> listViewItem = List<String>(); //untuk list item
  String _newValue = "30X30"; // variable value
  double _result = 0; // variable result

  void dropDownOnChanged(String changeValue) {
    //fungsi untuk dropdown
    setState(() {
      _newValue = changeValue;
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
      listViewItem.add(
          "Ruangan Anda jika dipasang keramik ukuran $_newValue cm, maka membutuhkan keramik sebanyak : $_result biji");
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
        appBar: AppBar(
          title: Text("HomeSweetHome"), //title tampilan kanan atas aplikasi
        ),
        body: Container(//container
          padding: EdgeInsets.only( bottom:20.0),//mengatur jarak
          margin: EdgeInsets.all(15),//mengatur jarak
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,//mengatur jarak
            children: [
              Image.network('https://4.bp.blogspot.com/-siKbotN6Ids/U3AyMMN60OI/AAAAAAAAAQ8/Coeenl_4BSw/s1600/rumah-bagus-murah.png'),//gambar dari internet
              Container(//container
                padding: EdgeInsets.all(11.0),//mengatur jarak
                child: TextFormField(//membuat text form(kolom yang bisa diisi)
                  controller: inputpjController,//memanggil controller
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],//validasi digit
                  keyboardType: TextInputType.number,//tipe keyboard
                  decoration: new InputDecoration(//dekorasi textformfield
                      hintText: "Masukkan Panjang Ruangan",//text pada textformfield
                      icon: Icon(Icons.home_outlined),//icon pada textformfield
                      border: OutlineInputBorder(//border pada textformfield
                      borderRadius: new BorderRadius.circular(5.0))),//border pada textformfield
                ),
              ),
              
              Container(//container
                padding: EdgeInsets.all(11.0),//mengatur jarak
                child: TextFormField(//membuat text form(kolom yang bisa diisi)
                  controller: inputlbController,//memanggil controller
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],//validasi digit
                  keyboardType: TextInputType.number,//tipe keyboard
                  decoration: new InputDecoration(//dekorasi textformfield
                      hintText: "Masukkan Lebar Ruangan",//text pada textformfield
                      icon: Icon(Icons.home_outlined),//icon pada textformfield
                      border: OutlineInputBorder(//border pada textformfield
                      borderRadius: new BorderRadius.circular(5.0))),//border pada textformfield
                ),
              ),
              
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.perm_media),
          backgroundColor: Colors.blueGrey,
        ),
      ),
    );
  }
}
