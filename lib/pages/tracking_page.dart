part of 'pages.dart';

class Tracking extends StatefulWidget {
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking>
    with SingleTickerProviderStateMixin {
  late int currentTab;
  late TabController _tabController = new TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: SecondaryColor,
                automaticallyImplyLeading: false,
                title: TabBar(
                  controller: _tabController,
                  indicatorColor: primaryColor,
                  tabs: [
                    Tab(text: "Konfirmasi"),
                    Tab(text: "Proses"),
                    Tab(text: "Selesai"),
                    Tab(text: "Riwayat"),
                  ],
                )),
            body: TabBarView(controller: _tabController, children: [
              Center(
                child: Text('konfirmasi'),
              ),
              Center(
                child: Text('Proses'),
              ),
              Center(
                child: Text('Selesai'),
              ),
              Center(
                child: Text('Riwayat'),
              ),
            ])));
  }
}
