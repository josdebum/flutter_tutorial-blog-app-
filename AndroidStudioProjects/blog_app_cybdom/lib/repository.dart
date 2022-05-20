import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'global.dart';
import 'models/singlePost.dart';

List<SinglePost> parsePosts(response) {
  final parsed = jsonDecode(response)['posts'].cast<Map<String, dynamic>>();
  return parsed.map<SinglePost>((json) => SinglePost.fromJson(json)).toList();
}

//function to fetch all posts
Future<List<SinglePost>> getPosts() async {
  //hppts get request
  final response = await http.get(Uri.parse(baseUrl));
  return compute(parsePosts, response.body);
}