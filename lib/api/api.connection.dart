import 'package:uzitailor/pages/pages.dart';

class API {
  static const hostConnect = "http://192.168.18.6/uzitailor/API/";
  static const hostConnect2 = "http://172.20.10.4/uzitailor/API/apibaru/";

  static const Login = "$hostConnect2/login1.php";
  static const Register = "$hostConnect2/register.php";
  static const validate = "$hostConnect2/validate.php";
  static const edit = "$hostConnect2/edit.php";
  static const namabarang = "$hostConnect2/select_barang.php";
  static const selecttanggal = "$hostConnect2/select_tanggal.php";
  static const selectfaktur = "$hostConnect2/select_detailFaktur.php";
  static const inserttrx = "$hostConnect2/trx.php";
  static const insertdetailtrx = "$hostConnect2/detail_trx.php";
  static const selectRiwayat = "$hostConnect2/select_detailRiwayat.php";
  static const status1 = "$hostConnect2/selectkonfirmasi.php";
  static const status2 = "$hostConnect2/selectproses.php";
  static const status3 = "$hostConnect2/selectselesai.php";
  static const status4 = "$hostConnect2/selectriwayat.php";

  static const hist =
      "http://192.168.18.6.localhost/uzitailor/API/cek_login.php";
}
