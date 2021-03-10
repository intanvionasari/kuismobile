
import 'package:flutter/material.dart';
import 'package:quiz1/halamandua.dart';

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