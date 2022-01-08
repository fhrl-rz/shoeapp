import 'package:dio/dio.dart';

Dio dio = Dio();

const String baseUrl = "http://192.168.10.21/shoe/index.php/api";
const String imageUrl = "http://192.168.10.21/shoe/image_shoe/";
const String apiLogin = "$baseUrl/loginCustomer";
const String apiRegister = "$baseUrl/registerCustomer";
const String apiProfile = "$baseUrl/getProfile";
const String apiProduk = "$baseUrl/getProduk";
const String apiKeranjang = "$baseUrl/addItemKeranjang";
const String apigetKeranjang = "$baseUrl/getKeranjang";
const String apiJordan = "$baseUrl/getJordan";
const String apiAdidas = "$baseUrl/getAdidas";
const String apiNike = "$baseUrl/getNike";
