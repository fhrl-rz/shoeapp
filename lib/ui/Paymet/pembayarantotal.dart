import 'package:flutter/material.dart';
import 'package:shoeapp/ui/Paymet/bayarsuccess.dart';

class PembayaranTotal extends StatefulWidget {
  const PembayaranTotal({Key? key}) : super(key: key);

  @override
  _PembayaranTotalState createState() => _PembayaranTotalState();
}

class _PembayaranTotalState extends State<PembayaranTotal> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: "Poppins"),
      child: Scaffold(
        backgroundColor: Color(0xffFDF0F3),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Image.asset("images/arrow_back.png"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Pembayaran',
            style: TextStyle(
              color: Color(0xff141414),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          children: [
            Text(
              "Kartu Kredit",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total :"),
                          Text("Rp. 750.000.-"),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Shipping :"),
                          Text("Rp.0"),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Pembayaran",
                            style: TextStyle(
                              color: Color(0xff52B69A),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Rp.750.000.-",
                            style: TextStyle(
                              color: Color(0xff52B69A),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Checkbox(
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                  Text(
                      "Dengan menekan tombol, Anda telah menyetujui\n Syarat & Ketentuan dan Kebijakan Privasi",
                      style: TextStyle(
                        fontSize: 9,
                      )),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessOrder()));
                  },
                  child: Text('Bayar'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffE96E6E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
