// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Donativos extends StatefulWidget {
  final double? donativos;
  final double? totalPaypal;
  final double? totalTarjeta;
  Donativos({
    Key? key,
    @required this.donativos,
    this.totalPaypal,
    this.totalTarjeta,
  }) : super(key: key);

  @override
  _DonativosState createState() => _DonativosState();
}

class _DonativosState extends State<Donativos> {
  var groupIcons = {
    0: "assets/icons/paypal.png",
    1: "assets/icons/tarjeta_de_credito.png",
  };

  @override
  Widget build(BuildContext context) {
    // print("Donativos obtenidos: ${widget.donativos}");
    return Scaffold(
      appBar: AppBar(title: Text("Donativos obtenidos")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              leading: Image.asset(
                "${groupIcons[0]}",
                height: 48,
                width: 48,
              ),
              title: Text("${widget.totalPaypal}"),
            ),
            ListTile(
              leading: Image.asset(
                "${groupIcons[1]}",
                height: 48,
                width: 48,
              ),
              title: Text("${widget.totalTarjeta}"),
            ),
            Divider(),
            Text("Total: ${widget.donativos}"),
          ],
        ),
      ),
    );
  }
}
