import 'package:flutter/material.dart';
import 'package:shoeapp/ui/Paymet/pembayarantotal.dart';

class PaymnetPage extends StatefulWidget {
  const PaymnetPage({Key? key}) : super(key: key);

  @override
  _PaymnetPageState createState() => _PaymnetPageState();
}

class _PaymnetPageState extends State<PaymnetPage> {
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
            SizedBox(
              height: 30,
            ),
            Text(
              "Metode Pembayaran",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 14,
              ),
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
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Kartu Kredit/Debit',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      dense: true,
                    ),
                    Divider(),
                    ListTile(
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Color(0xffE55B5B),
                        ),
                      ),
                      title: const Text(
                        'Kartu Kredit',
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PembayaranTotal()));
                      },
                      dense: true,
                    ),
                    Divider(),
                    ListTile(
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Color(0xffE55B5B),
                        ),
                      ),
                      title: const Text(
                        'Kartu Debit',
                      ),
                      onTap: () {},
                      dense: true,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Transfer',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {},
                      dense: true,
                    ),
                    Divider(),
                    ListTile(
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Color(0xffE55B5B),
                        ),
                      ),
                      title: const Text(
                        'Bank BRI',
                      ),
                      onTap: () {},
                      dense: true,
                    ),
                    Divider(),
                    ListTile(
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Color(0xffE55B5B),
                        ),
                      ),
                      title: const Text(
                        'Bank BNI',
                      ),
                      onTap: () {},
                      dense: true,
                    ),
                    Divider(),
                    ListTile(
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Color(0xffE55B5B),
                        ),
                      ),
                      title: const Text(
                        'Bank Mandiri',
                      ),
                      onTap: () {},
                      dense: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
