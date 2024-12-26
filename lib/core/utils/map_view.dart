import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/feature/services/data/models/service_model.dart'
    as service;
import 'package:weisro/feature/services/presentation/managers/add_service_cubit/add_service_cubit.dart';
import 'package:weisro/generated/l10n.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  LatLng? _currentLocation;
  LatLng? _selectedLocation; // Store the selected location
  final Set<Marker> _markers = {}; // Markers for Google Map

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Location services are disabled. Please enable them.')),
      );
      return;
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (!mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied.')),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Location permissions are permanently denied. Please enable them from settings.',
          ),
        ),
      );
      return;
    }

    // Get the current position if permissions are granted
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
      _markers.add(
        Marker(
          markerId: const MarkerId('current_location'),
          position: _currentLocation!,
          infoWindow: const InfoWindow(title: 'Your Location'),
        ),
      );
    });

    // Animate the camera to the current location
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: _currentLocation!, zoom: 15),
      ),
    );
  }

  void _onMapTap(LatLng position) async {
    setState(() {
      _selectedLocation = position;
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId('selected_location'),
          position: position,
        ),
      );
      log(_selectedLocation.toString());
    });

    try {
      // Get the list of placemarks for the tapped position
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      // Extract the name of the location from the placemarks
      String locationName = placemarks.isNotEmpty
          ? "${placemarks.first.locality}, ${placemarks.first.administrativeArea}"
          : "Unknown Location";

      // Update the location in the cubit
      if (!mounted) return;
      AddServiceCubit.get(context).updateLocation(
        locationName,
        //latitude
        service.Location(
          coordinates: [position.latitude, position.longitude],
        ),
      );

      // Optionally show a snack bar with the location name
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Selected Location: $locationName")),
      );
    } catch (e) {
      // Handle any errors
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Unable to fetch location name")),
      );
    }
  }

  Future<void> _goToMyLocation() async {
    if (_currentLocation != null) {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: _currentLocation!, zoom: 15),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Current location is not available yet.')),
      );
    }
  }

  final TextEditingController _searchController = TextEditingController();

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _searchController,
        onFieldSubmitted: (value) async {
          await _searchLocation();
        },
        decoration: InputDecoration(
          hintText: 'Search for a location',
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: _searchLocation,
          ),
          border: const OutlineInputBorder(),
        ),
        textInputAction: TextInputAction.search,
      ),
    );
  }

  Future<void> _searchLocation() async {
    if (_searchController.text.isEmpty) return;

    try {
      List<Location> locations =
          await locationFromAddress(_searchController.text);
      if (locations.isNotEmpty) {
        LatLng target =
            LatLng(locations.first.latitude, locations.first.longitude);
        _onMapTap(target); // Simulate a map tap for selection
        final GoogleMapController controller = await _controller.future;
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: target, zoom: 15),
          ),
        );
      }
    } catch (e) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Location not found")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 40),
        child: FloatingActionButton(
          onPressed: _goToMyLocation,
          child: const Icon(
            Icons.my_location,
            color: AppColors.orangeColor,
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          S.of(context).selected_location,
          style: AppStyles.style14w400Grey(context),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(
        //       Icons.check,
        //       color: AppColors.orangeColor,
        //     ),
        //     onPressed: _confirmLocation,
        //   )
        // ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: _currentLocation == null
                ? const Center(child: CircularProgressIndicator())
                : GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: _currentLocation!,
                      zoom: 15,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    onTap: _onMapTap,
                    markers: _markers,
                  ),
          ),
        ],
      ),
    );
  }
}
