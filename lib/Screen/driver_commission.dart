import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Helper/Color.dart';
import '../Helper/Session.dart';
import '../Helper/String.dart';
import '../Model/get_transaction_model.dart';
import 'package:http/http.dart' as http;

class DriverCommission extends StatefulWidget {
  const DriverCommission({Key? key}) : super(key: key);

  @override
  State<DriverCommission> createState() => _DriverCommissionState();
}

class _DriverCommissionState extends State<DriverCommission> {
  bool isToday = false;
  bool isAll = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightWhite,
      appBar: getAppBar("Driver Collection", context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        isAll = true;
                        isToday = false;
                      });
                    },
                    child: Text("All",
                      style: TextStyle(
                          fontSize: 18
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: isAll ? primary : white,
                      onPrimary: isAll ? white : primary,
                      maximumSize: Size(200, 50),
                      minimumSize: Size(150, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        isToday = true;
                        isAll = false;
                      });
                    },
                    child: Text("Today",
                      style: TextStyle(
                          fontSize: 18
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: isToday ? primary : white,
                      onPrimary: isToday ? white : primary,
                      maximumSize: Size(200, 50),
                      minimumSize: Size(150, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                  )
                ],
              ),
            ),

            isAll == true
                ? FutureBuilder(
                future: getDriverTransaction("all"),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  GetTransactionModel? model = snapshot.data;
                  if (snapshot.hasData) {
                    return model!.error == false
                        ? ListView.builder(
                        itemCount: model.data!.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          String date = DateFormat('dd-MM-yyyy').format(DateTime.parse(model.data![index].tDate.toString()));
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 0,
                              margin: EdgeInsets.all(5.0),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(4),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Text(
                                                  "User Id" + " - ",
                                                  style: TextStyle(color: Colors.grey),
                                                ),
                                                Text(
                                                  "${model.data![index].userId}",
                                                  style: TextStyle(color: black),
                                                ),
                                              ],
                                            ),
                                            // Spacer(),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.person,
                                                  size: 14,
                                                  color: secondary,
                                                ),
                                                Text(
                                                  "Driver Name" + " - ",
                                                  style: TextStyle(color: Colors.grey),
                                                ),
                                                Text(
                                                  "${model.data![index].username}",
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: black),
                                                ),
                                              ],
                                            ),
                                            // Spacer(),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.account_balance_wallet_outlined,
                                              size: 14,
                                              color: secondary,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Transaction Amount" + " - ",
                                                  style: TextStyle(color: Colors.grey),
                                                ),
                                                Text(
                                                  "$CUR_CURRENCY ${model.data![index].amount}",
                                                  style: TextStyle(color: black),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.chat,
                                              size: 14,
                                              color: secondary,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  " " + "Message" + ": ",
                                                  style: TextStyle(color: Colors.grey),
                                                ),
                                                Container(
                                                  width: 220,
                                                  child: Text(
                                                    "${model.data![index].message}",
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(color: black,),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.date_range,
                                              size: 14,
                                              color: secondary,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  " " + "Date" + ": ",
                                                  style: TextStyle(color: Colors.grey),
                                                ),
                                                Text(
                                                  "$date",
                                                  style: TextStyle(color: black),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () async {},
                              ),
                            ),
                          );
                        }
                    )
                        : Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        child: Center(child: Text("NO TRANSACTION FOUND!!"),)
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        child: Center(child: Icon(Icons.error_outline))
                    );
                  } else {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        child: Center(child: CircularProgressIndicator())
                    );
                  }
                })
                : SizedBox(),

            isToday != true ? SizedBox() : FutureBuilder(
                future: getDriverTransaction("today"),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  GetTransactionModel? model1 = snapshot.data;
                  if (snapshot.hasData) {
                    return model1!.error == false
                        ? ListView.builder(
                        itemCount: model1.data!.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          String date = DateFormat('dd-MM-yyyy').format(DateTime.parse(model1.data![index].tDate.toString()));
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 0,
                              margin: EdgeInsets.all(5.0),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(4),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Text(
                                                  "User Id" + " - ",
                                                  style: TextStyle(color: Colors.grey),
                                                ),
                                                Text(
                                                  "${model1.data![index].userId}",
                                                  style: TextStyle(color: black),
                                                ),
                                              ],
                                            ),
                                            // Spacer(),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.person,
                                                  size: 14,
                                                  color: secondary,
                                                ),
                                                Text(
                                                  "Driver Name" + " - ",
                                                  style: TextStyle(color: Colors.grey),
                                                ),
                                                Text(
                                                  "${model1.data![index].username}",
                                                  // maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: black),
                                                ),
                                              ],
                                            ),
                                            // Spacer(),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.account_balance_wallet_outlined,
                                              size: 14,
                                              color: secondary,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Transaction Amount" + " - ",
                                                  style: TextStyle(color: Colors.grey),
                                                ),
                                                Text(
                                                  "$CUR_CURRENCY ${model1.data![index].amount}",
                                                  style: TextStyle(color: black),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.chat,
                                              size: 14,
                                              color: secondary,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  " " + "Message" + ": ",
                                                  style: TextStyle(color: Colors.grey),
                                                ),
                                                Container(
                                                  width: 220,
                                                  child: Text(
                                                    "${model1.data![index].message}",
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(color: black,),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.date_range,
                                              size: 14,
                                              color: secondary,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  " " + "Date" + ": ",
                                                  style: TextStyle(color: Colors.grey),
                                                ),
                                                Text(
                                                  "$date",
                                                  style: TextStyle(color: black),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () async {},
                              ),
                            ),
                          );
                        }
                    )
                        : Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        child: Center(child: Text("NO TRANSACTION FOUND!!"),));
                  } else if (snapshot.hasError) {
                    print("Error msg == ${snapshot.error}");
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        child: Center(child: Icon(Icons.error_outline)));
                  } else {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        child: Center(child: CircularProgressIndicator()));
                  }
                })
          ],
        ),
      ),
    );
  }

  Future<GetTransactionModel?> getDriverTransaction(String type) async {
    var request = http.MultipartRequest('POST', getDriverTransactionApi);
    request.fields.addAll({
      'filter_type': '$type'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(request);
    print(request.fields);
    if (response.statusCode == 200) {
      final str = await response.stream.bytesToString();
      print(str);
      return GetTransactionModel.fromJson(json.decode(str));
    }
    else {
      return null;
    }
  }
}
