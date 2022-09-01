void main() async {
 
  dataPertama();
  dataKetiga();
  dataKedua();
//   kamarKos(7).then((String data){
//     print(data);
//   }).catchError((error){
//     print("Error");
//     print(error);
//   });
  
  try{
    var hasil = await kamarKos(9).then((String data){
      print(data);
    });
   print("hasil dari await");
    print(hasil);
  }catch (error){
    print(error);
  } finally{
    dataPertama();
  }
  
  try{
    var dataOrder = await createOrderMessage();
    print(dataOrder);
  }catch(error){
    print(error);
  }
}


  void dataPertama(){
    Future.delayed(Duration(seconds: 2),(){
      print("Data Pertama");
    });
  }
  
  void dataKedua(){
    Future((){
      print("Data Kedua");
    });
  }
  
  void dataKetiga(){
   Future((){
      print("Data Ketiga");
    });
  }
  
Future<String> kamarKos (int jumlahKamar) async{
  var kamar = 4;
  return Future((){
    if(kamar > jumlahKamar){
      return("Kamar tersisa $jumlahKamar");
    }else{
      throw ("kamar sudah penuh");
    }
   
  });
}


Future<String> createOrderMessage() async{
  var order = await fetchUserOrder();
return "Hasil dari :  $order";
}


Future<String> fetchUserOrder(){
  return Future.delayed(Duration(seconds: 5), (){
    return 'Sudah Order';
  });
}