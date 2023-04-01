class CoinData {
  CoinData({
    required this.name,
    required this.code,
    required this.price,
    required this.coin,
    required this.icon,
  });

  String name;
  String code;
  String price;
  String coin;
  String icon;

  factory CoinData.fromJson(Map<String, dynamic> json) => CoinData(
        name: json["name"],
        code: json["code"],
        price: json["price"],
        coin: json["coin"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "price": price,
        "coin": coin,
        "icon": icon,
      };
}


// FutureBuilder<List<CoinData>>(
//           future: getApiData(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Container(
//                       height: 20,
//                       width: 20,
//                       color: Colors.red,
//                       child: Center(
//                         child: Text(snapshot.data![index].code),
//                       ),
//                     );
//                   });
//             } else if (snapshot.hasError) {
//               return Text(snapshot.hasError.toString());
//             }
//             return CircularProgressIndicator();
//           }),