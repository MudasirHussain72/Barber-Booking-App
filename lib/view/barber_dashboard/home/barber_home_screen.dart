import 'package:barbar_booking_app/res/components/my_appbar.dart';
import 'package:barbar_booking_app/res/components/my_services_display_card.dart';
import 'package:barbar_booking_app/utils/routes/route_name.dart';
import 'package:barbar_booking_app/view/barber_dashboard/add_service/add_service.dart';
import 'package:barbar_booking_app/view_model/services/session_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BarberHomeScreen extends StatefulWidget {
  const BarberHomeScreen({super.key});

  @override
  State<BarberHomeScreen> createState() => _BarberHomeScreenState();
}

class _BarberHomeScreenState extends State<BarberHomeScreen> {
  final stream = FirebaseFirestore.instance
      .collection('users')
      .doc(SessionController().userId)
      .collection('services')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size * 1;
    return Scaffold(
      body: Column(children: [
        SizedBox(height: size.height / 11),
        // my app bar custom component widget
        MyAppBar(
            oniconTap: () {
              PersistentNavBarNavigator.pushNewScreenWithRouteSettings(context,
                  settings:
                      const RouteSettings(name: RouteName.addservicesView),
                  screen: const AddServicesScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.fade);
            },
            title: 'You’re Offering these services',
            icon: Icons.add),
        StreamBuilder(
            stream: stream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                    child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DocumentSnapshot doc = snapshot.data!.docs[index];
                    return Padding(
                      padding:
                          const EdgeInsets.only(bottom: 40, top: 20, left: 20),
                      child: ServicesDisplayCard(snap: doc),
                    );
                  },
                ));
              }
              // return Text('data');
            }),
      ]),
    );
  }
}