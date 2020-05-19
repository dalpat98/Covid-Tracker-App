import 'package:flutter/material.dart';

class Datasearch extends SearchDelegate<String> {
  List city; //[country names]
  Map citywithinformation; //{'country name':'information'}
  List recentcity;

  Datasearch(this.city, this.citywithinformation, this.recentcity);
  //, this.citywithinformation

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
          Navigator.pushReplacementNamed(context, '/travelparticular',
              arguments: [
                suggestionlist[index],
                citywithinformation[suggestionlist[index]]
              ]);
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
