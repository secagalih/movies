import 'package:flutter/material.dart';

class DorawerWidget extends StatelessWidget {
  const DorawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg'),
                    radius: 50.0,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Movie Pro',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Now Playing'),
            leading: Icon(Icons.play_circle_outline),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Top Rated'),
            leading: Icon(Icons.show_chart),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('UpComing'),
            leading: Icon(Icons.smart_display_outlined),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            title: Text('About'),
            leading: Icon(Icons.help_outline_rounded),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
