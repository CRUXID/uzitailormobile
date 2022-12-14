import 'dart:convert';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:uzitailor/model/tanggal.dart';
import 'package:uzitailor/model/tracking.dart';

import 'package:uzitailor/shared/shared.dart';

import '../api/api.connection.dart';
import '../main.dart';
import '../model/barang.dart';
import '../model/tracking.dart';
import '../model/trx.dart';
import '../model/user.dart';
import 'package:uzitailor/pref/current_user.dart';
import '../pref/user_pref.dart';
import '../model/faktur.dart';
import '../model/riwayat.dart';

part 'welcome_pages.dart';
part 'login_page.dart';
part 'register_page.dart';
part 'dashboard_page.dart';
part 'home_page.dart';
part 'transaksi_page.dart';
part 'setting_page.dart';
part 'tracking_page.dart';
part 'riwayat_page.dart';
part 'faktur_page.dart';
