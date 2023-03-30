import 'package:brew_crew/screens/home/followUpForm.dart';
import 'package:brew_crew/screens/home/followUp_notes.dart';
import 'package:brew_crew/stepper%20(1).dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClientProf extends StatefulWidget {
  const ClientProf(
      {super.key,
      required this.name,
      required this.email,
      required this.phoneNo});
  final String name, email;
  final int phoneNo;

  @override
  State<ClientProf> createState() => _ClientProfState();
}

// class _ClientProfState extends State<ClientProf> {
//   @override
//   Widget build(BuildContext context) {
//     return StepperWithStreamBuilder();
//   }
// }
class _ClientProfState extends State<ClientProf> {
  String? createdAt;
  Map<String, IconData> iconlist = {
    "Message": FaIcon(FontAwesomeIcons.whatsapp).icon!,
    "Phone Call": Icons.phone,
    "Meet": Icons.people_alt_outlined,
    "Note": Icons.note_alt_rounded
  };
  String getCreatedDate() {
    DocumentReference doc =
        FirebaseFirestore.instance.collection("Leads").doc(widget.email);

    doc.get().then<dynamic>((DocumentSnapshot datasnapshot) {
      if (datasnapshot.exists) {
        return datasnapshot["createdAt"];
      } else {
        return '30 March 00:00 AM';
      }
    });
    return '30 March 00:00 AM';
  }

  String notes = '';
  deleteActivity(docid) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Activities").doc(docid);
    documentReference.delete();
  }

  void _callFunctionality(int phoneNo) async {
    final Uri phoneNumber = Uri(scheme: 'tel', path: '$phoneNo');
    try {
      if (await canLaunchUrl(phoneNumber)) {
        await launchUrl(phoneNumber);
      } else {
        throw FormatException('Could not call $phoneNumber');
      }
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to open Phone app due to some error!!')),
      );
      print(e.toString());
    }
  }

  void _mailfunctionalty(String email) async {
    final Uri emailUri = Uri(
        scheme: 'mailto',
        path: '$email',
        query: 'subject=Test email&body=Hello, this is a test email.');
    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        throw FormatException('Could not mail $emailUri');
      }
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to open mail due to some error!!')),
      );
      print(e.toString());
    }
  }

  void _whatsappfunctionality(int phoneNo) async {
    String phoneNumber = "$phoneNo";
    String message = "Hello, this is a test message.";
    String urlMessage = Uri.encodeFull(message);
    Uri uri = Uri.parse("whatsapp://send?phone=$phoneNumber&text=$urlMessage");
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not connect to $phoneNumber';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to open WhatsApp due to some error!!')),
      );
      print(e.toString());
    }
  }

  getFollowup() {}

  String getNotes() {
    DocumentReference docref =
        FirebaseFirestore.instance.collection('Leads').doc(widget.email);

    docref.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        notes = documentSnapshot["notes"].toString();
        return documentSnapshot["notes"].toString();
      }
    });
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // shape: const Border(
        //   bottom: BorderSide(
        //     color: Color.fromRGBO(50, 50, 93, 0.25),
        //     width: 0.3,
        //   ),
        // ),
        backgroundColor: Colors.transparent,
        title: const Text(
          '',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "Montserrat",
            fontSize: 17,
          ),
        ),
        // leading: const Icon(
        //   Icons.arrow_back_ios,
        //   color: Colors.black,
        // ),

        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromRGBO(50, 50, 93, 0.25)
                          .withOpacity(0.08),
                      // color: const Color.fromRGBO(0, 0, 0, 0.3).withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: const Offset(0, 8), // changes position of shadow
                    ),
                  ],
                ),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 15, 30),
                    child: Text(
                      "${widget.name}".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(left: 5.0, right: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffA85CF9),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(50, 50, 93, 0.25)
                                  .withOpacity(0.4),
                              // color: const Color.fromRGBO(0, 0, 0, 0.3).withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            _callFunctionality(widget.phoneNo);
                          },
                          // foregroundColor: Colors.white,

                          child: Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(left: 5.0, right: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffA85CF9),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(50, 50, 93, 0.25)
                                  .withOpacity(0.4),
                              // color: const Color.fromRGBO(0, 0, 0, 0.3).withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            _mailfunctionalty(widget.email);
                          },
                          // foregroundColor: Colors.white,

                          child: Icon(
                            Icons.mail,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(left: 5.0, right: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffA85CF9),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(50, 50, 93, 0.25)
                                  .withOpacity(0.4),
                              // color: const Color.fromRGBO(0, 0, 0, 0.3).withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            _whatsappfunctionality(widget.phoneNo);
                          },
                          // foregroundColor: Colors.white,

                          child: Icon(
                            FaIcon(FontAwesomeIcons.whatsapp).icon,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 80,
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromRGBO(50, 50, 93, 0.25)
                            .withOpacity(0.08),
                        // color: const Color.fromRGBO(0, 0, 0, 0.3).withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 20,
                        offset:
                            const Offset(0, 8), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.group_add_rounded,
                      color: Colors.deepPurple,
                      size: 30,
                    ),
                    title: Text("${getCreatedDate()}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Lead Created ",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 3),
                        // Text("No Description"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 60,
                padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromRGBO(50, 50, 93, 0.25)
                          .withOpacity(0.08),
                      // color: const Color.fromRGBO(0, 0, 0, 0.3).withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: const Offset(0, 8), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(
                  'FOLLOW UP SCHEDULED BY',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  print(FirebaseAuth.instance.currentUser!.uid);
                  var notes = getNotes();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => FollowUpNotes(
                            name: widget.name,
                            email: widget.email,
                            phoneNo: widget.phoneNo,
                            // notes: notes,
                          )));
                  print(notes);
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromRGBO(50, 50, 93, 0.25)
                            .withOpacity(0.08),
                        // color: const Color.fromRGBO(0, 0, 0, 0.3).withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 20,
                        offset:
                            const Offset(0, 8), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text(
                    "NOTES",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MyStepperForm(email: widget.email
                              // notes: notes,
                              )));
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromRGBO(50, 50, 93, 0.25)
                            .withOpacity(0.08),
                        // color: const Color.fromRGBO(0, 0, 0, 0.3).withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 20,
                        offset:
                            const Offset(0, 8), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text(
                    "ADD ACTIVITY",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 45,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromRGBO(50, 50, 93, 0.25)
                          .withOpacity(0.08),
                      // color: const Color.fromRGBO(0, 0, 0, 0.3).withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: const Offset(0, 8), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(
                  "TIMELINE",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat"),
                ),
              ),
              Divider(
                height: 1,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Activities")
                    .where('LeadUid', isEqualTo: widget.email)
                    .snapshots(),
                builder: ((context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    print('Error: ${snapshot.error}');
                    return Text('Error: ${snapshot.error}');
                  }
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    return ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        height: 1,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: ((context, int index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        Timestamp timestamp = documentSnapshot.get('Date');
                        DateTime dateTime = timestamp.toDate();
                        String formattedDate =
                            DateFormat('d MMMM h:mm a').format(dateTime);

                        // var clientName = documentSnapshot["name"];
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: double.infinity,
                            height: 80,
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.only(
                              //   bottomLeft: Radius.circular(10),
                              //   bottomRight: Radius.circular(10),
                              // ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromRGBO(50, 50, 93, 0.25)
                                      .withOpacity(0.08),
                                  // color: const Color.fromRGBO(0, 0, 0, 0.3).withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 20,
                                  offset: const Offset(
                                      0, 8), // changes position of shadow
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Icon(
                                iconlist["${documentSnapshot["Type"]}"],
                                color: Colors.deepPurple,
                                size: 30,
                              ),
                              trailing: IconButton(
                                  icon: const Icon(Icons.delete_forever),
                                  color: Color.fromARGB(255, 207, 117, 117),
                                  onPressed: () {
                                    deleteActivity(documentSnapshot.id);
                                  }),
                              title: Text("${formattedDate}"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "${documentSnapshot['Type']}",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text("${documentSnapshot['description']}"),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String getDay(DateTime target) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final dbyesterday = DateTime(now.year, now.month, now.day - 2);
  final tdbefore = DateTime(now.year, now.month, now.day - 3);
  final yesterday = DateTime(now.year, now.month, now.day - 1);
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  final datomorrow = DateTime(now.year, now.month, now.day + 2);
  final tdafter = DateTime(now.year, now.month, now.day + 3);
  if (target == now) {
    target = now;
    return "Just Now";
  } else if (target == today) {
    target = today;
    return "Today";
  } else if (target == tomorrow) {
    target = tomorrow;
    return "Tommorow";
  } else if (target == datomorrow) {
    target = datomorrow;
    return "Day After Tommorow";
  } else if (target == dbyesterday) {
    target = dbyesterday;
    return "Day Before Yesterday";
  } else if (target == tdafter) {
    target = tdafter;
    return "After 3 days";
  } else if (target == tdbefore) {
    target = tdbefore;
    return "3 days before";
  }

  String formattedDate = DateFormat('d MMMM h:mm a').format(target);
  return formattedDate;
}
