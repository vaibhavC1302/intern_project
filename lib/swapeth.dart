import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intern_project/coindata.dart';
import 'package:intern_project/variables.dart';
import 'package:slide_to_act/slide_to_act.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabcontroller = TabController(length: 2, vsync: this);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff1E1E1E),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getHeight(context, 42),
            ),
            const Text(
              "Swap ETH",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: getHeight(context, 14),
            ),
            const Text(
              "Ethereum Main Network",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: getHeight(context, 49),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff222529),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: getHeight(context, 20),
                            ),
                            const Text(
                              "Select an asset",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: getHeight(context, 35),
                            ),
                            Container(
                              height: getHeight(context, 40),
                              width: getWidth(context, 328),
                              decoration: const BoxDecoration(
                                color: Color(0xff111013),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(27),
                                ),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getHeight(context, 34),
                            ),
                            const Text(
                              "Popular tokens",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: getHeight(context, 20),
                            ),
                            Expanded(
                              child: FutureBuilder(
                                  future: getApiData(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              leading: CircleAvatar(
                                                child: Image.network(
                                                    snapshot.data![index].icon),
                                              ),
                                              title: Text(
                                                snapshot.data![index].name
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white),
                                              ),
                                              subtitle: Text(
                                                  snapshot.data![index].code
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white)),
                                              trailing: Text(
                                                snapshot.data![index].price
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white),
                                              ),
                                            );
                                          });
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  }),
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                alignment: Alignment.center,
                height: getHeight(context, 104),
                width: getWidth(context, 341),
                margin: EdgeInsets.symmetric(horizontal: getWidth(context, 24)),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.5,
                      style: BorderStyle.solid,
                      color: Colors.white10),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Image.network(
                        "https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png"),
                  ),
                  title: const Text(
                    "ETH",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  // subtitle: const Text("1254",
                  //     style: const TextStyle(
                  //         fontSize: 11,
                  //         fontWeight: FontWeight.w400,
                  //         color: Colors.white)),
                  trailing: const Text(
                    "1254",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getHeight(context, 6),
            ),
            Container(
              alignment: Alignment.center,
              height: getHeight(context, 99),
              width: getWidth(context, 341),
              decoration: const BoxDecoration(
                color: Color(0xff262D34),
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  child: Image.network(
                      "https://s2.coinmarketcap.com/static/img/coins/64x64/3890.png"),
                ),
                title: const Text("MATIC"),
                // trailing: ,
              ),
            ),
            SizedBox(
              height: getHeight(context, 90),
            ),
            Container(
              child: TabBar(
                controller: _tabcontroller,
                tabs: const [
                  Text(
                    "Slippage",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Details",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getHeight(context, 30),
            ),
            Container(
              width: getWidth(context, 341),
              height: getHeight(context, 158),
              child: TabBarView(controller: _tabcontroller, children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: getWidth(context, 33)),
                  decoration: const BoxDecoration(
                    color: Color(0xff222529),
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  child: Slider(
                    divisions: 100,
                    value: 0.1,
                    onChanged: (value) {},
                    min: 0,
                    max: 10,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: getWidth(context, 20),
                      vertical: getHeight(context, 28)),
                  width: getWidth(context, 341),
                  height: getHeight(context, 158),
                  decoration: const BoxDecoration(
                    color: Color(0xff222529),
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rate",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff878787)),
                          ),
                          Text("1 AVAX = 1.16 OKB")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Slippage tolerance",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff878787))),
                          Text("1.29%")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Estimated Fees",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff878787))),
                          Text("0.076 ETH")
                        ],
                      )
                    ],
                  ),
                )
              ]),
            ),
            SizedBox(height: getHeight(context, 48)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(context, 48)),
              child: const SlideAction(
                innerColor: Colors.white,
                outerColor: Color(0xff1E1E1E),
                elevation: 0,
                text: "Slide to pay",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<CoinData>> getApiData() async {
  var url = Uri.parse("http://139.59.57.191:5000/user/getCryptoList");
  final response = await http.get(url);
  var body;
  if (response.statusCode == 200) {
    body = json.decode(response.body);
    List<dynamic> jsonResponse = body['data'];
    return jsonResponse.map((e) => CoinData.fromJson(e)).toList();
  } else {
    throw Exception("error");
  }
}
