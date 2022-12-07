import 'package:uzitailor/pages/pages.dart';

class API {
  static const hostConnect = "http://192.168.18.125/uzitailor/API/";
  static const hostConnect2 = "http://192.168.18.125/uzitailor/API/";

  static const Login = "$hostConnect2/login1.php";
  static const Register = "$hostConnect2/register.php";
  static const validate = "$hostConnect2/validate.php";
  static const edit = "$hostConnect2/edit.php";
  static const namabarang = "$hostConnect2/select_barang.php";
  static const selecttrx = "$hostConnect2/select_transaksiKonfirmasi.php";
  static const selecttrx2 = "$hostConnect2/select_transaksiProses.php";
  static const selecttrx3 = "$hostConnect2/select_transaksiPending.php";
  static const selecttrx4 = "$hostConnect2/select_transaksiSelesai.php";

  static const hist =
      "http://192.168.18.6.localhost/uzitailor/API/cek_login.php";
}
