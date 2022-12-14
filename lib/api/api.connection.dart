import 'package:uzitailor/pages/pages.dart';

class API {
  static const hostConnect = "http://192.168.18.6/uzitailor/API/";
  static const hostConnect2 = "http://10.211.84.146/uzitailor/API/";

  static const Login = "$hostConnect2/login1.php";
  static const Register = "$hostConnect2/register.php";
  static const validate = "$hostConnect2/validate.php";
  static const edit = "$hostConnect2/edit.php";
  static const namabarang = "$hostConnect2/select_barang.php";
  static const selecttrx = "$hostConnect2/select_transaksiKonfirmasi.php";
  static const selecttrx2 = "$hostConnect2/select_transaksiProses.php";
  static const selecttrx3 = "$hostConnect2/select_transaksiPending.php";
  static const selecttrx4 = "$hostConnect2/select_transaksiSelesai.php";
  static const selecttanggal = "$hostConnect2/select_tanggal.php";
  static const selectfaktur = "$hostConnect2/select_faktur.php";
  static const inserttrx = "$hostConnect2/trx.php";
  static const insertdetailtrx = "$hostConnect2/detail_trx.php";
  static const selectRiwayat = "$hostConnect2/select_riwayat.php";

  static const hist =
      "http://192.168.18.6.localhost/uzitailor/API/cek_login.php";
}
