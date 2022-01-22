var serverToken =
    "AAAAurlSwTc:APA91bF1FfjCt7EE1e5qA_-1n3FfwTXNCR6_u2AKgG1reHsDWoKvCXTdx33RaNHJQLe-cMVEIN5odwtYI6cY5ij9mqNClIP5W3MgvUAFvYcpxdSHMWhki_NDRoemGwPkZQ1K5jDs2apt";

sendNotify(String title, String body, String id) async {
  await http.post(
    Uri.parse('https://fcm.googleapis.com/fcm/send'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'key-$serverToken',
    },
    body: jsonEncode(
      <String, dynamic>{
        'notification': <String, dynamic>{
          'body': body.toString(),
          'title': title.toString()
        },
        'priority': 'high',
        'data': <String, dynamic>{
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'id': id.toString(),
        },
        'to': "/topics/users"
      },
    ),
  );
}
