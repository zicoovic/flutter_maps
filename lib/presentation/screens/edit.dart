import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_maps/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_maps/constants/my_colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
  static Position? position;

  final Completer<GoogleMapController> _mapController = Completer();

  static CameraPosition? _myCurrentLocationCameraPosition;

  Future<void> getMyCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // تحقق من تفعيل خدمة الموقع
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // لا يوجد خدمة موقع متاحة
      return;
    }

    // تحقق من إذن الموقع
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // الإذن مرفوض
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // الإذن مرفوض دائمًا
      return;
    }

    // الحصول على الموقع الحالي
    position = await Geolocator.getCurrentPosition();

    setState(() {
      _myCurrentLocationCameraPosition = CameraPosition(
        bearing: 0.0,
        tilt: 0.0,
        target: LatLng(position!.latitude, position!.longitude),
        zoom: 17,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    getMyCurrentLocation();
  }

  Widget buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
      initialCameraPosition: _myCurrentLocationCameraPosition ??
          const CameraPosition(
            target: LatLng(0.0, 0.0),
            zoom: 2,
          ), // استخدم موقع افتراضي في حالة عدم توفر الموقع
      onMapCreated: (controller) {
        _mapController.complete(controller);
      },
    );
  }

  Future<void> _goToMyCurrentLocation() async {
    if (position != null) {
      final GoogleMapController controller = await _mapController.future;
      controller.animateCamera(
          CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          position != null
              ? buildMap()
              : const Center(
                  child: CircularProgressIndicator(
                    color: MyColors.blue,
                  ),
                ),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
          backgroundColor: MyColors.blue,
          onPressed: _goToMyCurrentLocation,
          child: const Icon(
            Icons.place,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
