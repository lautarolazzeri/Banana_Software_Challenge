import "package:dio/dio.dart";
import "package:flutter/material.dart";

//all constants are exported here for easy access from anywhere
const appColor = Color(0xFF9E007E);
const white = Colors.white;
const grey = Colors.grey;
const colorError = Colors.red;
const api = 'https://dummyjson.com';
final dio = Dio();