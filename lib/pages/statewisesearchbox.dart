import 'package:flutter/material.dart';
import 'package:covidtracker/pages/statewiseparticularloadingpage.dart';

class Datasearchforstate extends SearchDelegate<String> {
  List city; // particular =[] sorted country names
  List recentcity;
  String page;

  Datasearchforstate(this.city, this.page, this.recentcity);

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //show results based on selection
    return Scaffold(
      appBar: AppBar(
        title: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone searches for something
    final suggestionlist = query.isEmpty
        ? recentcity
        : city
            .where((p) =>
                p.startsWith(query[0].toUpperCase() + query.substring(1)))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  StateWiseParticularloadingpage(country:suggestionlist[index].toString(),page:page),
            ),
          );
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
            text: suggestionlist[index].substring(0, query.length),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: suggestionlist[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ],
          ),
        ),
      ),
      itemCount: suggestionlist.length,
    );
  }
}
