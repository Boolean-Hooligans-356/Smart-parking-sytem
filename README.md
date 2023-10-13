# Smart-car-parking-IOT-based

Traditional parking systems suffer from significant shortcomings, notably a lack of visibility and inherent inefficiency. These conventional systems often fail to provide drivers with real-time access to the availability status of parking spaces, creating obstacles to planning ahead. This results in wasted time and exacerbates traffic congestion. Furthermore, the inefficacy of traditional parking management, reliant on human operators, leads to prolonged wait times, traffic gridlocks, and mounting frustration among drivers.

The core objective of this project is to develop an IoT-powered Android application for real-time parking space monitoring within a college campus or anywhere. Leveraging advanced infrared sensors, the system detects the presence of vehicles in parking slots. The sensor data is seamlessly transmitted wirelessly to a central gateway device, the Node MCU, which then promptly dispatches this vital information to the cloud. Through the Android app, users gain instant access to real-time parking space availability, enabling them to swiftly locate vacant slots. The deployment of wireless communication protocols, such as Zigbee or Wi-Fi, is an integral part of the system's architecture.

Method 1 (For Larger Parking Spaces):
- Sensors at each parking slot connect to individual microcontrollers (STM32), with each microcontroller managing up to 8 parking slots.
- Microcontrollers are linked to Xbee modules, transmitting sensor data through mesh networks.
- A gateway device (Node MCU) receives the data and uploads it to Google Firebase.
- A mobile app retrieves and displays parking slot availability data from Firebase.
- Ideal for underground parking without WiFi access points.

Method 2 (For Ground Parking with Access Points):
- Parking slot sensors connect to respective NodeMCU microcontrollers.
- Data is transmitted to a gateway device (Node MCU) and uploaded to Google Firebase.
- A mobile app retrieves Firebase data to indicate vacant parking slots.
- Suitable for ground-level parking with available access points.


Frontend:
    We created an app that displays the user about the available slots and unavailable slots in the parking lot, and when the user gets nearer to the parking location he/she can book the slots available and the booked slots will turn yellow until the car is parked
    
![image](https://github.com/Boolean-Hooligans-356/Smart-car-parking-IOT-based/assets/96923418/27afd26f-ef17-4331-8a01-14d20cb76afa)


For car detection:
    In order to determine whether any vehicles are parked in the available spaces, we used IR sensors, Image processing, and Node MCUs to send sensor data to Firebase.
    We have used image processing in parallel to the IR sensors to determine whether the slot is occupied by a car or not.
    Image processing is helpful in confirming the presence of a car in the parking slot.
    The data collected from the IR sensors and the data collected from Image processing are compared with each other to arrive at the final data.  
    
![image](https://github.com/Boolean-Hooligans-356/Smart-car-parking-IOT-based/assets/96923418/2b7da5fa-345b-4027-a7a5-648ef495d489)

  
![WhatsApp Image 2023-10-13 at 22 46 21_29b50ee5](https://github.com/Boolean-Hooligans-356/Smart-car-parking-IOT-based/assets/96923418/8f69a94c-4863-4585-a60d-7602149a322c)

Benefits:
Improved Parking Management Efficiency: Real-time data reduces wait times and traffic congestion.
Seamless User Experience: Students, faculty, and visitors benefit from a hassle-free parking experience.
Flexibility: The project caters to different parking scenarios, including underground and ground parking.

Overall, this project offers an innovative solution to the inefficiencies of traditional parking systems, enhancing campus infrastructure and creating a more convenient parking experience for all stakeholders.



