import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:signup/model/user.dart';
import 'package:signup/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

const List<DropdownMenuItem<String>> menuItemsCity = [
  DropdownMenuItem(value: "Bogor", child: Text("Bogor")),
  DropdownMenuItem(value: "Jakarta", child: Text("Jakarta")),
  DropdownMenuItem(value: "Bekasi", child: Text("Bekasi")),
  DropdownMenuItem(value: "Bandung", child: Text("Bandung")),
];
const List<DropdownMenuItem<String>> menuItemsProvince = [
  DropdownMenuItem(value: "Jawa Barat", child: Text("Jawa Barat")),
  DropdownMenuItem(value: "Jawa Timur", child: Text("Jawa Timur")),
  DropdownMenuItem(value: "Jakarta", child: Text("Jakarta")),
  DropdownMenuItem(value: "Sumatra Timur", child: Text("Sumatra Timur")),
];
const List<DropdownMenuItem<String>> menuItemsGender = [
  DropdownMenuItem(value: "Perempuan", child: Text("Perempuan")),
  DropdownMenuItem(value: "Laki Laki", child: Text("Laki Laki")),
];
bool isCheckeHobby1 = false;

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  UserInfo user = UserInfo();
  void _submit(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext contextSubmit) {
          return AlertDialog(
            title: const Text("Pendaftaran selesai"),
            content: const Text("klik detail untu melihat akun mu"),
            actions: [
              TextButton(
                  onPressed: () {
                    inspect(user);
                    Route route = MaterialPageRoute(
                        builder: (context) => DetailPage(
                              user: user,
                            ));
                    Navigator.push(context, route);
                  },
                  child: const Text("Detail")),
              TextButton(
                  onPressed: () => Navigator.pop(contextSubmit, ''),
                  child: const Text("OK"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Userinfo"),
                      const SizedBox(height: 10),
                      TextFormField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            hintText: "Masukkan username",
                            labelText: "Username",
                            isDense: true,
                            contentPadding: EdgeInsets.all(15)),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username tidak boleh kosong";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            user.setUsername = value;
                          });
                          print(user.username);
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            hintText: "Masukkan password",
                            labelText: "Password",
                            isDense: true,
                            contentPadding: EdgeInsets.all(15)),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password tidak boleh kosong";
                          } else if (value.length < 8) {
                            return "Password harus lebih dari 8";
                          }
                          return null;
                        },
                        onChanged: (String? value) {
                          setState(() {
                            user.setPassword = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            hintText: "Masukkan email",
                            labelText: "Email",
                            isDense: true,
                            contentPadding: EdgeInsets.all(15)),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email tidak boleh kosong";
                          } else if (!value.contains('@')) {
                            return "Email format tidak benar";
                          }
                          return null;
                        },
                        onChanged: (String? value) {
                          setState(() {
                            user.setEmail = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text("Address Info"),
                      const SizedBox(height: 10),
                      TextFormField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            hintText: "Masukkan address",
                            labelText: "Address",
                            isDense: true,
                            contentPadding: EdgeInsets.all(15)),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Address tidak boleh kosong";
                          }
                          return null;
                        },
                        onChanged: (String? value) {
                          setState(() {
                            user.setAddress = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      // TextFormField(
                      //   controller: TextEditingController(),
                      //   enableInteractiveSelection: false,
                      //   onTap: () {
                      //     Dropdown
                      //   },
                      //   focusNode: AlwaysDisabledFocusNode(),
                      //   textAlign: TextAlign.start,
                      //   textAlignVertical: TextAlignVertical.center,
                      //   decoration: const InputDecoration(
                      //       border: OutlineInputBorder(
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(5))),
                      //       hintText: "Masukkan city",
                      //       labelText: "City",
                      //        isDense: true,
                      //       contentPadding: EdgeInsets.all(15),
                      //       suffixIcon: Icon(Icons.view_list)
                      //   ),
                      //   style: const TextStyle(
                      //     fontSize: 14,
                      //   ),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return "Silahkan Pilih Satu City";
                      //     }
                      //     return null;
                      //   },
                      //   onChanged: (String? value) {
                      //     setState(() {
                      //       user.setEmail = value!;
                      //     });
                      //   },
                      // ),
                      DropdownButtonFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "City tidak boleh kosong";
                            }
                            return null;
                          },
                          items: menuItemsCity,
                          onChanged: (value) {
                            setState(() {
                              user.setCity = value!;
                            });
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              hintText: "Pilih City",
                              labelText: "City",
                              isDense: true,
                              contentPadding: EdgeInsets.all(12))),
                      const SizedBox(height: 10),
                      DropdownButtonFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "province tidak boleh kosong";
                            }
                            return null;
                          },
                          items: menuItemsProvince,
                          onChanged: (value) {
                            setState(() {
                              user.setProvince = value!;
                            });
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              hintText: "Pilih Province",
                              labelText: "Province",
                              isDense: true,
                              contentPadding: EdgeInsets.all(12))),
                      const SizedBox(height: 20),
                      const Text("More Info"),
                      const SizedBox(height: 10),
                      DropdownButtonFormField(
                          items: menuItemsGender,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Gender tidak boleh kosong";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              user.setGender = value!;
                            });
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              hintText: "Gender",
                              labelText: "Gender",
                              isDense: true,
                              contentPadding: EdgeInsets.all(12))),
                      const SizedBox(height: 20),
                      const Text("Hobby"),
                      const SizedBox(height: 10),
                      CheckboxListTile(
                          title: const Text("Hobby 1"),
                          value: isCheckeHobby1,
                          onChanged: (value) {
                            setState(() {
                              isCheckeHobby1 = value!;
                              if (value == false) {
                                user.setHobby = "";
                              } else {
                                user.setHobby = "Hobby 1";
                              }
                            });
                          }),
                      ElevatedButton(
                          onPressed: (() {
                            if (_formKey.currentState!.validate()) {
                              _submit(context);
                            }
                          }),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue.shade200),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20)),
                          ),
                          child: const Text("Signup")),
                    ],
                  ),
                ))));
  }
}
