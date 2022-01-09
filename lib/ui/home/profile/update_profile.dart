import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfile extends StatefulWidget {
  final String? nama;
  final XFile? image;
  final void Function(
      String? nama,
      XFile? image,
      )? onUpdate;

  const UpdateProfile(
      {Key? key, this.nama,  this.image, @required this.onUpdate})
      : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController?  nama;
  XFile? image;

  Future<void> getImageGalery() async {
    var takeImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (takeImage != null) {
      setState(() {
        image = takeImage;
      });
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    nama = TextEditingController(text: widget.nama);

  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(10),
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              TextFormField(
                controller: nama,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                validator: (val) {
                  return val!.isEmpty
                      ? "FullName tidak boleh kosong"
                      : null;
                },
                style: TextStyle(
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(8.0)),
                  ),
                  labelText: "Masukan Nama Baru",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: getImageGalery,
                child: image != null
                    ? Image.file(
                  File(image!.path),
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  fit: BoxFit.fitWidth,
                )
                    : Text('Klik untuk Menambahkan Gambar',
                style:  TextStyle(
                  color: Colors.red,
                ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 20,
              ),
              MaterialButton(
                color: Colors.blue,
                minWidth: 200,
                textColor: Colors.white,
                onPressed: () {
                  widget.onUpdate!(nama?.text, image!);
                  Navigator.pop(context);
                },
                child: Text('UPDATE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
