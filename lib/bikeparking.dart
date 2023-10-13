import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sa3_liquid/sa3_liquid.dart';

class BikeParking extends StatefulWidget {
  const BikeParking({super.key});

  @override
  State<BikeParking> createState() => _BikeParkingState();
}

class _BikeParkingState extends State<BikeParking> {
  final FirebaseService firebaseService = FirebaseService();
  final FirebaseService1 firebaseService1 = FirebaseService1();
  late double deviceWidth;
  late double deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            title: const Center(
              child: Text(
                "Park-A-Lot",
                style: TextStyle(fontSize: 25),
              ),
            ),
            // elevation: 1,
            backgroundColor: Colors.transparent),
        // bottomNavigationBar: const SizedBox(
        //     // height: 60,
        //     child: NavBar()),
        backgroundColor: Colors.black.withOpacity(0.3),
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                tileMode: TileMode.mirror,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(133, 193, 193, 193),
                  // Color.fromARGB(158, 110, 110, 110),
                  Color.fromARGB(0, 81, 80, 80),
                ],
                stops: [
                  0,
                  1,
                ],
              ),
              backgroundBlendMode: BlendMode.srcOver,
            ),
            child: PlasmaRenderer(
              type: PlasmaType.infinity,
              particles: 20,
              color: Colors.black.withOpacity(0.3),
              blur: 0.3,
              size: 1.5,
              speed: 4.5,
              offset: 0,
              blendMode: BlendMode.plus,
              particleType: ParticleType.atlas,
              variation1: 1,
              variation2: 0,
              variation3: 0,
              rotation: 0,
              child: SizedBox(
                height: deviceHeight,
                width: deviceWidth,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    width: deviceWidth,
                    height: deviceHeight,
                    child: SafeArea(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Center(
                                    child: Container(
                                      color: Colors.white,
                                      width: 30,
                                      height: 5,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 30,
                                  child: Center(
                                    child: Container(
                                      color: Colors.white,
                                      width: 30,
                                      height: 5,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 30,
                                  child: Center(
                                    child: Container(
                                      color: Colors.white,
                                      width: 30,
                                      height: 5,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 30,
                                  child: Center(
                                    child: Container(
                                      color: Colors.white,
                                      width: 30,
                                      height: 5,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 30,
                                  child: Center(
                                    child: Container(
                                      color: Colors.white,
                                      width: 30,
                                      height: 5,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 30,
                                  child: Center(
                                    child: Container(
                                      color: Colors.white,
                                      width: 30,
                                      height: 5,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 30,
                                  child: Center(
                                    child: Container(
                                      color: Colors.white,
                                      width: 30,
                                      height: 5,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 30,
                                  child: Center(
                                    child: Container(
                                      color: Colors.white,
                                      width: 10,
                                      height: 5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StreamBuilder<int>(
                                  stream: firebaseService.parkingSpaceStream,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      final int parkingSpace = snapshot.data!;
                                      return Container(
                                        height: 130,
                                        width: deviceWidth - 200,
                                        alignment: FractionalOffset.centerLeft,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 2.5,
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                            ),
                                          ),
                                          color: parkingSpace == 1
                                              ? Colors.green.withOpacity(0.5)
                                              : Colors.red.withOpacity(0.5),
                                          // borderRadius:
                                          //     BorderRadius.circular(10),
                                        ),
                                        // padding: const EdgeInsets.all(16),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              parkingSpace == 1
                                                  ? 'assets/images/green bike.png'
                                                  : 'assets/images/red bike.png',
                                              width: 60,
                                              height: 75,
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                parkingSpace == 1
                                                    ? 'Slot1  : Available'
                                                    : 'Slot1  : UnAvailable',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  // fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return const Center(
                                        child: Text('Error fetching data'),
                                      );
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ),
                                SizedBox(
                                  width: 30,
                                  child: Center(
                                    child: Container(
                                      color: Colors.white,
                                      width: 5,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                //lot2
                                StreamBuilder<int>(
                                  stream: firebaseService1.parkingSpaceStream,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      final int parkingSpace = snapshot.data!;
                                      return Container(
                                        height: 130,
                                        width: deviceWidth - 200,
                                        alignment: FractionalOffset.centerLeft,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 2.5,
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                            ),
                                          ),
                                          color: parkingSpace == 1
                                              ? Colors.green.withOpacity(0.5)
                                              : Colors.red.withOpacity(0.5),
                                          // borderRadius:
                                          //     BorderRadius.circular(10),
                                        ),
                                        // padding: const EdgeInsets.all(16),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              parkingSpace == 1
                                                  ? 'assets/images/green bike.png'
                                                  : 'assets/images/red bike.png',
                                              width: 60,
                                              height: 75,
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                parkingSpace == 1
                                                    ? 'Slot2  : Available'
                                                    : 'Slot2  : UnAvailable',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  // fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return const Center(
                                        child: Text('Error fetching data'),
                                      );
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 130,
                                  width: deviceWidth - 200,
                                  alignment: FractionalOffset.centerLeft,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 2.5,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                    color: Colors.red.withOpacity(0.5),
                                    // borderRadius: BorderRadius.circular(10),
                                  ),
                                  // padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/red bike.png',
                                        width: 60,
                                        height: 75,
                                      ),
                                      const SizedBox(width: 8),
                                      const Expanded(
                                        child: Text(
                                          'Slot3  : UnAvailable',
                                          style: TextStyle(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                  child: Center(
                                    child: Container(
                                      color: Colors.white,
                                      width: 5,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 130,
                                  width: deviceWidth - 200,
                                  alignment: FractionalOffset.centerLeft,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 2.5,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                    color: Colors.red.withOpacity(0.5),
                                    // borderRadius: BorderRadius.circular(10),
                                  ),
                                  // padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/red bike.png',
                                        width: 60,
                                        height: 75,
                                      ),
                                      const SizedBox(width: 8),
                                      const Expanded(
                                        child: Text(
                                          'Slot4  : UnAvailable',
                                          style: TextStyle(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            Row(
                              children: [
                                Container(
                                  height: 130,
                                  width: deviceWidth - 200,
                                  alignment: FractionalOffset.centerLeft,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 2.5,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                    color: Colors.red.withOpacity(0.5),
                                    // borderRadius: BorderRadius.circular(10),
                                  ),
                                  // padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/red bike.png',
                                        width: 60,
                                        height: 75,
                                      ),
                                      const SizedBox(width: 8),
                                      const Expanded(
                                        child: Text(
                                          'Slot5  : UnAvailable',
                                          style: TextStyle(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                  child: Center(
                                    child: Container(
                                      color: Colors.white,
                                      width: 5,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 130,
                                  width: deviceWidth - 200,
                                  alignment: FractionalOffset.centerLeft,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 2.5,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                    color: Colors.red.withOpacity(0.5),
                                    // borderRadius: BorderRadius.circular(10),
                                  ),
                                  // padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/red bike.png',
                                        width: 60,
                                        height: 75,
                                      ),
                                      const SizedBox(width: 8),
                                      const Expanded(
                                        child: Text(
                                          'Slot6  : UnAvailable',
                                          style: TextStyle(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            Row(
                              children: [
                                Container(
                                  height: 130,
                                  width: deviceWidth - 200,
                                  alignment: FractionalOffset.centerLeft,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 2.5,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                    color: Colors.red.withOpacity(0.5),
                                    // borderRadius: BorderRadius.circular(10),
                                  ),
                                  // padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/red bike.png',
                                        width: 60,
                                        height: 75,
                                      ),
                                      const SizedBox(width: 8),
                                      const Expanded(
                                        child: Text(
                                          'Slot7  : UnAvailable',
                                          style: TextStyle(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                  child: Center(
                                    child: Container(
                                      color: Colors.white,
                                      width: 5,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 130,
                                  width: deviceWidth - 200,
                                  alignment: FractionalOffset.centerLeft,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 2.5,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                    color: Colors.red.withOpacity(0.5),
                                    // borderRadius: BorderRadius.circular(10),
                                  ),
                                  // padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/red bike.png',
                                        width: 60,
                                        height: 75,
                                      ),
                                      const SizedBox(width: 8),
                                      const Expanded(
                                        child: Text(
                                          'Slot8  : UnAvailable',
                                          style: TextStyle(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // const SizedBox(
                            //   height: 20,
                            // ),

                            Row(
                              children: [
                                Container(
                                  height: 130,
                                  width: deviceWidth - 200,
                                  alignment: FractionalOffset.centerLeft,
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.5),
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 2.5,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                    // borderRadius: BorderRadius.circular(10),
                                  ),
                                  // padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/red bike.png',
                                        width: 60,
                                        height: 75,
                                      ),
                                      const SizedBox(width: 8),
                                      const Expanded(
                                        child: Text(
                                          'Slot9  : UnAvailable',
                                          style: TextStyle(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                  child: Center(
                                    child: Container(
                                      color: Colors.white,
                                      width: 5,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 130,
                                  width: deviceWidth - 200,
                                  alignment: FractionalOffset.centerLeft,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 2.5,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                    color: Colors.red.withOpacity(0.5),
                                    // borderRadius: BorderRadius.circular(10),
                                  ),
                                  // padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      // Divider(color:Colors.white,),
                                      Image.asset(
                                        'assets/images/red bike.png',
                                        width: 60,
                                        height: 75,
                                      ),
                                      const SizedBox(width: 8),
                                      const Expanded(
                                        child: Text(
                                          'Slot10:UnAvailable',
                                          style: TextStyle(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FirebaseService {
  final databaseReference = FirebaseDatabase.instance.ref();

  Stream<int> get parkingSpaceStream {
    return databaseReference.child('Parking lot/lot1').onValue.map((event) {
      return event.snapshot.value as int;
    });
  }
}

class FirebaseService1 {
  final databaseReference1 = FirebaseDatabase.instance.ref();

  Stream<int> get parkingSpaceStream {
    return databaseReference1.child('Parking lot/lot2').onValue.map((event) {
      return event.snapshot.value as int;
    });
  }
}
