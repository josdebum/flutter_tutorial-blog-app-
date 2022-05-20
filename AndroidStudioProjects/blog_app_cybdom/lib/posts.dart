import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'models/singlePost.dart';

class PostScreen extends StatelessWidget {
  final SinglePost postData;

  const PostScreen({ required this.postData}) : super();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
        child:
        LayoutBuilder(
          builder: (context, _) => Column(
            children: <Widget>[
                        Container(
                          color: Colors.blue,
                       child: ListTile(
                          //tileColor: Colors.blue,
                          leading: Image.network(
                            "${postData.avatarURL}",
                            height: 35,
                            width: 35,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            "${postData.authorName}",
                              style: TextStyle(color: Colors.white )
                           // style: Theme.of(context).textTheme.subtitle,
                          ),
                          subtitle: Text( DateFormat.yMMMd()
                              .format(DateTime.parse(postData.date)), style: TextStyle(color: Colors.white )),
                          trailing: IconButton (
                            onPressed: () { Share.share(postData.url);},
                            icon:Icon( Icons.share, color: Colors.white,))

                        )),
                       //SizedBox(height: 2),
                        Padding (
                            padding: EdgeInsets.fromLTRB(4, 0, 4, 2),
                            child:
                        Html(
                          data: "${postData.content}",))


            ],
          ),
        )),
      ),
    );
  }
}
