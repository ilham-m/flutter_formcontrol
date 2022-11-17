import 'package:flutter/material.dart';
import 'package:signup/model/user.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.user});
  final UserInfo user;
  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Detail Page"),
        actions: const [FlutterLogo()],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("username : ${widget.user.username}"),
            const SizedBox(height: 10),
            Text("email : ${widget.user.email}"),
            const SizedBox(height: 10),
            Text("password : ${widget.user.password}"),
            const SizedBox(height: 20),
            Text("address : ${widget.user.address}"),
            const SizedBox(height: 10),
            Text("city : ${widget.user.city}"),
            const SizedBox(height: 10),
            Text("province : ${widget.user.province}"),
            const SizedBox(height: 20),
            Text("gender : ${widget.user.gender}"),
            const SizedBox(height: 20),
            Text("hoby : ${widget.user.hobby}"),
            const SizedBox(height: 10),
          ],
        ),
      )),
    );
  }
}
