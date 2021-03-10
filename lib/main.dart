import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz1/halamandua.dart';

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
              Container(
                //container
                padding: EdgeInsets.all(5.0), //mengatur jarak
                child: TextFormField(
                  //membuat text form(kolom yang bisa diisi)
                  controller: inputpjController, //memanggil controller
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ], //validasi hanya digit
                  keyboardType: TextInputType.number, //tipe keyboard
                  decoration: new InputDecoration(
                      //dekorasi textformfield
                      hintText:
                          "Masukkan Panjang Ruangan(meter)", //text pada textformfield
                      icon: Icon(Icons.home_outlined), //icon pada textformfield
                      border: OutlineInputBorder(
                          //border pada textformfield
                          borderRadius: new BorderRadius.circular(
                              2.0))), //border pada textformfield
                ),
              ),
              Container(
                //container
                padding: EdgeInsets.all(5.0), //mengatur jarak
                child: TextFormField(
                  //membuat text form(kolom yang bisa diisi)
                  controller: inputlbController, //memanggil controller
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ], //validasi hanya digit
                  keyboardType: TextInputType.number, //tipe keyboard
                  decoration: new InputDecoration(
                      //dekorasi textformfield
                      hintText:
                          "Masukkan Lebar Ruangan(meter)", //text pada textformfield
                      icon: Icon(Icons.home_outlined), //icon pada textformfield
                      border: OutlineInputBorder(
                          //border pada textformfield
                          borderRadius: new BorderRadius.circular(
                              2.0))), //border pada textformfield
                ),
              ),
              Container(//container
                padding: EdgeInsets.only(top: 23.0),//padding untuk mengatur jarak hanya atas saja
                child: Text(//child yang berisi text
                  'Pilih Ukuran Ubin',//text
                  textAlign: TextAlign.center,//agar text berada di tengah atau center
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),//style pada text
                ),
              ),
              Container(//container
                child: DropdownButton<String>(//child yang berisi berisi dropdown button
                  items: listItem.map((String value) {//digunakan untuk pilihan list pada dropdown
                    return DropdownMenuItem<String>(
                      value: value,//mengatur value
                      child: Text(value),//text pada dropdown yang berisi value 
                    );
                  }).toList(),//untuk listnya
                  value: _newValue,//memperbarui value atau memilih value
                  onChanged: dropDownOnChanged,//memanggil fungsi agar dapat mengganti atau memilih list
                ),
              ),
              Container(//container
                margin: EdgeInsets.only(top: 20, bottom: 20),//mengatur jarak dengan margin atas dan bawah
                child: Column(//child berisi kolom
                  mainAxisAlignment: MainAxisAlignment.center,//mainAxis untuk mengatur jarak kebawah
                  children: [
                    Text(
                      "Anda Membutuhkan Ubin Sebanyak",//text
                      style: TextStyle(//untuk textstyle seperti bold dan ukuran font
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    Text(
                      _result.toStringAsFixed(1),//menampilkan result yang sudah diproses hitung
                      style: TextStyle(fontSize: 30),//style text untuk result
                    ),
                    Text(
                      "Biji",//text
                      style: TextStyle(fontSize: 20.0),//style text
                    ),
                  ],
                ),
              ),
              Container(//container untuk button
                width: 150,//mengatur lebar button
                height: 50,//mengatur tinggi button
                child: RaisedButton(//membuat raised button
                  onPressed: perhitunganRumus,//memanggil fungsi perhitunganRumus jika diklik buttonnya
                  child: Text("Hitung Ubin"),//text 
                  splashColor: Colors.white10,//efek jika diklik ada warna putih
                  textColor: Colors.black,//warna pada text button
                  color: Colors.blueGrey,//warna buttonnya
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Float(),//memanggil kelas Float
      ),
    );
  }
}

class Float extends StatelessWidget {
  const Float({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(//membuat button tipe floating
      onPressed: () {  Navigator.push(//jika di pencet atau diklik akan berpindah halaman
        context,
        MaterialPageRoute(builder: (context) => new haldua()//menyetting halaman yang dituju
        ),
      );
      },
      child: Icon(Icons.perm_media),//memberi ikon pada buttonnya
      backgroundColor: Colors.blueGrey,//warna background untuk buttonnya
    );
  }
}
