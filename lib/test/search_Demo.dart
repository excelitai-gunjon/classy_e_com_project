import 'package:classy_ecom_project/constants.dart';
import 'package:classy_ecom_project/model/log_in_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
class SearchDemo extends StatefulWidget {
  static const String routeName = '/material/search';

  @override
  _SearchDemoState createState() => _SearchDemoState();
}

class _SearchDemoState extends State<SearchDemo> {
  final _SearchDemoSearchDelegate _delegate = _SearchDemoSearchDelegate();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int? _lastIntegerSelected;
  //final loginData=Provider.of<LogInDataModel>(context);
  @override
  Widget build(BuildContext context) {
    final loginData=Provider.of<LogInDataModel>(context,listen: false);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Navigation menu',
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            color: Colors.white,
            progress: _delegate.transitionAnimation,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: const Text('Numbers'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () async {
              final int? selected = await showSearch<int>(
                context: context,
                delegate: _delegate,
              );
              if (selected != null && selected != _lastIntegerSelected) {
                setState(() {
                  _lastIntegerSelected = selected;
                });
              }
            },
          ),
          //MaterialDemoDocumentationButton(SearchDemo.routeName),
          IconButton(
            tooltip: 'More (not implemented)',
            icon: Icon(
              Theme.of(context).platform == TargetPlatform.iOS
                  ? Icons.more_horiz
                  : Icons.more_vert,
            ),
            onPressed: () { },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MergeSemantics(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text('Press the '),
                      Tooltip(
                        message: 'search',
                        child: Icon(
                          Icons.search,
                          size: 18.0,
                        ),
                      ),
                      Text(' icon in the AppBar'),
                    ],
                  ),
                  const Text('and search for an integer between 0 and 100,000.'),
                ],
              ),
            ),
            const SizedBox(height: 64.0),
            Text('Last selected integer: ${_lastIntegerSelected ?? 'NONE' }.'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        tooltip: 'Back', // Tests depend on this label to exit the demo.
        onPressed: () {
          Navigator.of(context).pop();
        },
        label: const Text('Close demo'),
        icon: const Icon(Icons.close),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
             UserAccountsDrawerHeader(
              accountName: Text(loginData.data!.name.toString()),
              accountEmail: Text(loginData.data!.email.toString()),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(loginData.data!.profilePhotoUrl.toString()),
                // AssetImage(
                //   'people/square/peter.png',
                //   package: 'flutter_gallery_assets',
                // ),
              ),
              margin: EdgeInsets.zero,
            ),
            MediaQuery.removePadding(
              context: context,
              // DrawerHeader consumes top MediaQuery padding.
              removeTop: true,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.payment),
                    title: Text('Placeholder'),
                  ),
                  ListTile(
                    leading: Icon(Icons.payment),
                    title: Text('Placeholder'),
                  ),
                  ListTile(
                    leading: Icon(Icons.payment),
                    title: Text('Placeholder'),
                  ),
                  ListTile(
                    leading: Icon(Icons.payment),
                    title: Text('Placeholder'),
                  ),
                  ListTile(
                    leading: Icon(Icons.payment),
                    title: Text('Placeholder'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchDemoSearchDelegate extends SearchDelegate<int> {
  final List<int> _data = List<int>.generate(100001, (int i) => i).reversed.toList();
  final List<int> _history = <int>[42607, 85604, 66374, 44, 174];

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
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
  Widget buildSuggestions(BuildContext context) {

    final Iterable<int> suggestions = query.isEmpty
        ? _history
        : _data.where((int i) => '$i'.startsWith(query));

    return _SuggestionList(
      query: query,
      suggestions: suggestions.map<String>((int i) => '$i').toList(),
      onSelected: (String? suggestion) {
        query = suggestion!;
        showResults(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final int? searched = int.tryParse(query);
    if (searched == null || !_data.contains(searched)) {
      return Center(
        child: Text(
          '"$query"\n is not a valid integer between 0 and 100,000.\nTry again.',
          textAlign: TextAlign.center,
        ),
      );
    }

    return ListView(
      children: <Widget>[
        _ResultCard(
          title: 'This integer',
          integer: searched,
          searchDelegate: this,
        ),
        _ResultCard(
          title: 'Next integer',
          integer: searched + 1,
          searchDelegate: this,
        ),
        _ResultCard(
          title: 'Previous integer',
          integer: searched - 1,
          searchDelegate: this,
        ),
      ],
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      if (query.isEmpty)
        IconButton(
          tooltip: 'Voice Search',
          icon: const Icon(Icons.mic),
          onPressed: () {
            query = 'TODO: implement voice input';
          },
        )
      else
        IconButton(
          tooltip: 'Clear',
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }
  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return Theme.of(context).copyWith(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: kTextColor,
        selectionColor: kTextColor,
        selectionHandleColor: kTextColor,
      ),
      appBarTheme: AppBarTheme(
        //foregroundColor: Colors.red,
        color: kPrimaryColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light, //Brightness.light,
        iconTheme: IconThemeData(color: Colors.white),
        // textTheme: TextTheme(
        //   headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18,),
        // ),
        titleTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
        toolbarTextStyle: TextStyle(
          color: Colors.black,//Color(0XFF8B8B8B),
          fontSize: 18,
        ),
      ),
      //backgroundColor: kPrimaryColor,
      //primaryColor: Colors.redAccent,
      primaryIconTheme: IconThemeData(
        color: Colors.white
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
        //fillColor: Colors.black
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: kTextColor),
        bodyText2: TextStyle(color: kTextColor),
        subtitle1: TextStyle(color: Colors.white),
        headline1: TextStyle(color: kTextColor),
      ),
      iconTheme: IconThemeData(color: Colors.red),
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({this.integer, this.title, this.searchDelegate});

  final int? integer;
  final String? title;
  final SearchDelegate<int>? searchDelegate;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        searchDelegate!.close(context, integer!);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(title!),
              Text(
                '$integer',
                style: theme.textTheme.headline1!.copyWith(fontSize: 72.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SuggestionList extends StatelessWidget {
  const _SuggestionList({this.suggestions, this.query, this.onSelected});

  final List<String>? suggestions;
  final String? query;
  final ValueChanged<String?>? onSelected;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListView.builder(
      itemCount: suggestions!.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions![i];
        return ListTile(
          leading: query!.isEmpty ? const Icon(Icons.history) : const Icon(Icons.arrow_forward),
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query!.length),
              style: theme.textTheme.subtitle1!.copyWith(color: kTextColor,fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query!.length),
                  style: theme.textTheme.subtitle1!.copyWith(color: kTextColor),
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected!(suggestion);
          },
        );
      },
    );
  }
}