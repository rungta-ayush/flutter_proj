//for districts
import 'package:flutter/material.dart';
import 'package:kaushalkar_gok/helper/district_names.dart';
import 'package:kaushalkar_gok/model/districtModel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<disNameModel> names1 = new List<disNameModel>();
  bool _loading = true;
  @override
  getNames() async {
    districtNames disnameClass = districtNames();
    await disnameClass.getDisNames();
    names1 = disnameClass.names;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Districts",
                style: TextStyle(color: Colors.redAccent),
              )
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: _loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                child: ListView.builder(
                  itemCount: names1.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return BlogTile(
                      id: names1[index].distID,
                      dname: names1[index].distName,
                    );
                  },
                ),
              ));
  }
}

class BlogTile extends StatelessWidget {
  final int id;
  final String dname;
  BlogTile({@required this.id, @required this.dname});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[Text(dname), Text(id.toString())],
      ),
    );
  }
}
