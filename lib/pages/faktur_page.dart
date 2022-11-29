part of 'pages.dart';

class faktur extends StatefulWidget {
  const faktur({super.key});

  @override
  State<faktur> createState() => _fakturState();
}

class _fakturState extends State<faktur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faktur"),
        backgroundColor: SecondaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ListTile(
            title: Text("No Pesanan"),
          )
        ],
      ),
    );
  }
}
