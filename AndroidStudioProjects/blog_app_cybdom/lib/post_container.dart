import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final onTap;
  final String title, author,image;

  const PostContainer({ this.onTap, required this.title, required this.author, required this.image}) : super();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.0),
      child: ListTile(
        onTap: onTap,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(9.0),
          child: Image.network("$image"),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "$title", style: TextStyle(fontSize: 15)
             //style: Theme.of(context).textTheme.subhead,
            ),
            SizedBox(height: 5),
            Text("$author", style: TextStyle(color: Colors.blue)
              //style: Theme.of(context).textTheme.body2,
              ),
          ],
        ),
      ),
    );
  }
}
