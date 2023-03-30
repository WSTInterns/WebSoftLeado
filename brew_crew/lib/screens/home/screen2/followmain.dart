import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'overdue.dart';
import 'someday.dart';
import 'upcoming.dart';

// class MyAppSak extends StatelessWidget {
//   const MyAppSak({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       home: const MyAppSak(title: 'Flutter Demo Home Page'),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class MyAppSak extends StatefulWidget {
  const MyAppSak({super.key});
  @override
  State<MyAppSak> createState() => _MyAppSak();
}

class _MyAppSak extends State<MyAppSak> {
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
                  automaticallyImplyLeading: false,

        elevation: 0.0,
        backgroundColor: Color(0xffA85CF9),
        title: Column(
          children: [
            Container(
              child: Center(
                child: Text(
                  "Follow Ups",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,),
                ),
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
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
                      offset: const Offset(0, 8), // changes position of shadow
                    ),
                  ],
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: double.infinity,
                    minHeight: 50,
                  ),
                  child: Row(
                    children: [
                     SizedBox(width: 10,),
                          Icon(
                              Icons.calendar_today,
                              color: Colors.red,
                            ),
                          SizedBox(width: 10,),
                          Text(
                              "OVERDUE",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.red,
                          )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => overdue()),
                  );
              
              },
            ),
            
            // InkWell(
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => overdue()),
            //       );
            //     },
            //     child: Container(
            //       height: 50,
                  
            //         padding: EdgeInsets.all(10),
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //           ),
            //           child: Row(
            //             children: [
            //               SizedBox(width: 10,),
            //               Icon(
            //                   Icons.calendar_today,
            //                   color: Colors.red,
            //                 ),
            //               SizedBox(width: 10,),
            //               Text(
            //                   "OVERDUE",
            //                   style: TextStyle(
            //                       fontSize: 16,
            //                       fontWeight: FontWeight.bold,
            //                       color: Colors.red),
            //                 ),
                          
            //               Spacer(),
            //               Icon(
            //                 Icons.arrow_forward_ios,
            //                 color: Colors.red,
            //               )
            //             ],
            //           ),
                    
                  
            //     )),
            SizedBox(height: 10,),
             GestureDetector(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
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
                      offset: const Offset(0, 8), // changes position of shadow
                    ),
                  ],
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: double.infinity,
                    minHeight: 50,
                  ),
                  child: Row(
                    children: [
                     SizedBox(width: 10,),
                          Icon(
                              Icons.calendar_today,
                              
                            ),
                          SizedBox(width: 10,),
                          Text(
                              "UPCOMING",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  ),
                            ),
                          
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            
                          )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => upcoming()),
                  );
              
              },
            ),
            
            // InkWell(
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => upcoming()),
            //       );
            //     },
            //     child: Container(
            //       height: 50,
                  
            //         padding: EdgeInsets.all(10),
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //           ),
            //           child: Row(
            //             children: [
            //               SizedBox(width: 10,),
            //               Icon(
            //                   Icons.calendar_today,
                            
            //                 ),
            //               SizedBox(width: 10,),
            //               Text(
            //                   "UPCOMING",
            //                   style: TextStyle(
            //                       fontSize: 16,
            //                       fontWeight: FontWeight.bold,
            //                       ),
            //                 ),
                          
            //               Spacer(),
            //               Icon(
            //                 Icons.arrow_forward_ios,
                            
            //               )
            //             ],
            //           ),
                    
                  
            //     )),
            SizedBox(height: 10, ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
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
                      offset: const Offset(0, 8), // changes position of shadow
                    ),
                  ],
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: double.infinity,
                    minHeight: 50,
                  ),
                  child: Row(
                    children: [
                     SizedBox(width: 10,),
                          Icon(
                              Icons.calendar_today,
                              color: Colors.blueGrey,
                            ),
                          SizedBox(width: 10,),
                          Text(
                              "SOMEDAY",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                          
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.blueGrey,
                          )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => someday()),
                  );
              
              },
            ),
            
            
            SizedBox(
              height: 20,
              
            ),
            Container(
             
              height: 50,
             decoration: BoxDecoration(
               color: Colors.white,
             borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              ),
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
                padding: EdgeInsets.all(10),
                child: Row(
                    children: [
                      SizedBox(width:10),
                      Icon(
                          Icons.calendar_today,
                          color: Color.fromARGB(255, 4, 54, 78),
                        ),
                      
                      SizedBox(width: 10,),
                      Text(
                          "TODAY",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 4, 54, 78),
                          ),
                        ),
                      
                    ],
                  ),
                
              
            ),
            Divider(height: 1,),
            InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => clientProf()),
                // );
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10)),
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
                  tileColor: Colors.white,
                  leading: CircleAvatar(
                    backgroundColor: Color(0xffA85CF9),
                    radius: 20,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  title: Text("Privyr Support"),
                  subtitle: Row(
                    children: [
                      Text("Due today"),
                      Spacer(),
                    ],
                  ),
                  trailing: CupertinoButton(
                    onPressed: () => _showActionSheet(context),
                    child: const Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
           
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  DateTime? _chosenDateTime;

// Show the modal that contains the CupertinoDatePicker
  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 350,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (val) {
                          // setState(() {
                          // _chosenDateTime = val;
                          //});
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: const Text('Done'),
                    onPressed: () => Navigator.of(ctx).pop(),
                  )
                ],
              ),
            ));
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Schedule follow up for Client',style: TextStyle(fontFamily: "Montserrat",fontSize: 17,),),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// defualt behavior, turns the action's text to bold text.

            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Today',
              style: TextStyle(
                fontFamily: "Montserrat",
                  color: Color.fromARGB(255, 132, 131, 131), fontSize: 15),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Tomorrow',
              style: TextStyle(
                fontFamily: "Montserrat",
                  color: Color.fromARGB(255, 132, 131, 131), fontSize: 15),
            ),
          ),
          CupertinoActionSheetAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as delete or exit and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              '3 days from now',
              style: TextStyle(
                fontFamily: "Montserrat",
                  color: Color.fromARGB(255, 132, 131, 131), fontSize: 15),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              '1 week from now',
              style: TextStyle(
                fontFamily: "Montserrat",
                  color: Color(0xFF848383), fontSize: 15),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              '1 month from now',
              style: TextStyle(
                fontFamily: "Montserrat",
                  color: Color.fromARGB(255, 132, 131, 131), fontSize: 15),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () => _showDatePicker(context),
            child: const Text(
              'Select custom date and time',
              style: TextStyle(
                fontFamily: "Montserrat",
                  color: Color.fromARGB(255, 132, 131, 131), fontSize: 15),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Someday',
              style: TextStyle(
                fontFamily: "Montserrat",
                  color: Color.fromARGB(255, 132, 131, 131), fontSize: 15),
            ),
          ),
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Never ',
              style: TextStyle(
                fontFamily: "Montserrat",
                  // color: Color.fromARGB(255, 132, 131, 131), 
                  color: Colors.black,
                  fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
