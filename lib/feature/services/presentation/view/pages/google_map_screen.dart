import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/generated/l10n.dart';

class GoogleMapScreen extends StatefulWidget {
  final double latitude;
  final double longitude;

  const GoogleMapScreen(
      {super.key, required this.latitude, required this.longitude});

  @override
  GoogleMapScreenState createState() => GoogleMapScreenState();
}

class GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController;
  late LatLng location;

  @override
  void initState() {
    super.initState();
    location = LatLng(widget.latitude, widget.longitude);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).Location,
          style: AppStyles.style20w500Grey(context)
              .copyWith(color: AppColors.orangeColor),
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: location,
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("service_location"),
            position: location,
          ),
        },
      ),
    );
  }
}
