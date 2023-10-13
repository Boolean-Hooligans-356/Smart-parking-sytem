import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iotbasedparking/bikeparking.dart';
import 'package:iotbasedparking/parkingspace.dart';
import 'package:sa3_liquid/sa3_liquid.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late double deviceWidth;
  late double deviceHeight;
  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 150,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ParkingSpaceScreen()),
                              );
                            },
                            child: Container(
                              height: 150,
                              width: 170,
                              alignment: FractionalOffset.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  ImageIcon(
                                    AssetImage(
                                        'assets/images/icons8-car-60.png'),
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 10.0),
                                  Expanded(
                                    child: Text(
                                      'Car Parking',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 75,
                          ),

                          //bike parking
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BikeParking()),
                              );
                            },
                            child: Container(
                              height: 150,
                              width: 170,
                              alignment: FractionalOffset.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  ImageIcon(
                                    AssetImage(
                                        'assets/images/icons8-bike-parking-50.png'),
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 10.0),
                                  Expanded(
                                    child: Text(
                                      'Bike Parking',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // child: const Text('carparking'),
                          ),
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
    );
  }
}
