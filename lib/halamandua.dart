import 'package:flutter/material.dart';//mengimport material


class haldua extends StatelessWidget {// membuat kelas baru dengan stateless widget
  
  @override

  final List ubin = [
    //list ubin yang ditampilkan
    "Ubin Keramik",
    "Ubin Porselen",
    "Ubin Batu Alam",
    "Ubin Kaca",
    "Ubin Exotis",
    "Ubin Tegel",
    "Ubin Marmer",
    "Ubin Granit",
    "Ubin Travertine",
    "Ubin PVC"
  ];

  final List gambar = [
    //list gambar online
    "https://www.99.co/blog/indonesia/wp-content/uploads/2018/08/jenis-ubin-1.jpg",
    "https://www.99.co/blog/indonesia/wp-content/uploads/2018/08/iStock-466183935.jpg",
    "https://www.99.co/blog/indonesia/wp-content/uploads/2018/08/iStock-857573314.jpg",
    "https://www.99.co/blog/indonesia/wp-content/uploads/2018/08/jenis-ubin-4.jpg",
    "https://www.99.co/blog/indonesia/wp-content/uploads/2018/08/jenis-ubin-6.jpg",
    "https://www.99.co/blog/indonesia/wp-content/uploads/2018/08/jenis-ubin-9.jpg",
    "https://i0.wp.com/dekoruma.blog/wp-content/uploads/2017/12/Desain-Lantai-1.jpg?w=800&ssl=1",
    "https://i0.wp.com/dekoruma.blog/wp-content/uploads/2017/12/Desain-Lantai-3-2329138940-1513746131780.jpg?w=800&ssl=1",
    "https://i2.wp.com/dekoruma.blog/wp-content/uploads/2017/12/Desain-Lantai-Travertine-3019439471-1513722634519.jpg?resize=1024%2C721&ssl=1",
    "https://i2.wp.com/dekoruma.blog/wp-content/uploads/2017/12/Desain-Lantai-4-347554655-1513746495636.jpg?w=1000&ssl=1"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Macam Ubin"), //untuk title pada appbar
      ),
      body: ListView.builder(
        //menggunakan list builder
        itemBuilder: (context, index) {
          //untuk item builder
          return Card(
            //membuat card
            child: ListTile(
                title: Text(ubin[index],
                    style: TextStyle(
                        fontSize: 30)), //untuk mengambil judul serta text style
                subtitle: Text('ini gambar dari ' +
                    ubin[index]), //untuk text dibawah judul
                leading: CircleAvatar(
                  //dekorasi gambar
                  child: Image.network(gambar[index]), // memanggi list gambar
                )),
          );
        },
        itemCount: ubin.length, //panjang item
      ),
    );
  }
}
