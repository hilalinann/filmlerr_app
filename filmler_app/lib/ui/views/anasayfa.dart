import 'package:filmler_app/data/entity/filmler.dart';
import 'package:filmler_app/ui/views/detay_sayfa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<List<Filmler>> filmleriYukle() async{
    var filmlerListesi = <Filmler>[];
    var u1 = Filmler(id: 1, ad: "Django", resim: "django.png", fiyat: 24);
    var u2 = Filmler(id: 2, ad: "Interstellar", resim: "interstellar.png", fiyat: 32);
    var u3 = Filmler(id: 3, ad: "Inception", resim: "inception.png", fiyat: 16);
    var u4 = Filmler(id: 4, ad: "The Hateful Eight", resim: "thehatefuleight.png", fiyat: 28);
    var u5 = Filmler(id: 5, ad: "The Pianist", resim: "thepianist.png", fiyat: 18);
    var u6 = Filmler(id: 7, ad: "Anadoluda", resim: "anadoluda.png", fiyat: 10);
    filmlerListesi.add(u1);
    filmlerListesi.add(u2);
    filmlerListesi.add(u3);
    filmlerListesi.add(u4);
    filmlerListesi.add(u5);
    filmlerListesi.add(u6);
    return filmlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filmler"),),
      body: FutureBuilder<List<Filmler>>(
          future: filmleriYukle(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              var filmlerListesi = snapshot.data;
              return GridView.builder(
                itemCount: filmlerListesi!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1/1.8,
                ),
                itemBuilder: (context, indeks){
                  var film = filmlerListesi[indeks];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: film)));
                    },
                    child: Card(
                      color: Colors.blueGrey,
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("resimler/${film.resim}"),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("${film.fiyat} ₺", style: const TextStyle(fontSize: 24),),
                              ElevatedButton(onPressed: (){
                                print("${film.ad} sepete eklendi.");
                              }, child: const Text("Sepete Ekle")),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }else{
              return const Center();
            }
          }
      ),
    );
  }
}
