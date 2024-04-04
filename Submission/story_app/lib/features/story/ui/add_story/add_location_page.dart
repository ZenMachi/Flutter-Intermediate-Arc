import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:story_app/features/story/provider/story_provider.dart';
import 'package:story_app/features/story/widgets/placemark_widget.dart';

class AddLocationPage extends StatefulWidget {
  const AddLocationPage({super.key});

  @override
  State<AddLocationPage> createState() => _AddLocationPageState();
}

class _AddLocationPageState extends State<AddLocationPage> {
  final initLocation = const LatLng(-6.19801, 106.82883);
  late GoogleMapController mapController;
  late final Set<Marker> markers = {};
  late StoryProvider provider;

  @override
  void initState() {
    super.initState();
    provider = context.read<StoryProvider>();
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stateLocation = provider.latLng;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              GoogleMap(
                myLocationEnabled: true,
                initialCameraPosition: stateLocation != null
                    ? CameraPosition(target: stateLocation, zoom: 18)
                    : CameraPosition(target: initLocation),
                markers: markers,
                onMapCreated: (controller) async {
                  final info = provider.placemark;

                  if (info != null && stateLocation != null) {
                    final place = info[0];
                    final street = place.street!;
                    final address =
                        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
                    defineMarker(stateLocation, street, address);
                  }
                  setState(() {
                    mapController = controller;
                  });
                },
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
                myLocationButtonEnabled: false,
                onLongPress: (LatLng latLng) {
                  onLongPressGoogleMap(latLng);
                },
              ),
              Positioned(
                top: 16,
                right: 16,
                child: FloatingActionButton(
                  child: const Icon(Icons.my_location),
                  onPressed: () {
                    onMyLocationButtonPress();
                  },
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: FloatingActionButton(
                  child: const Icon(Icons.arrow_back),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
              stateLocation == null
                  ? const SizedBox()
                  : Positioned(
                      bottom: 16,
                      right: 16,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                            child: const Icon(Icons.done),
                            onPressed: () {
                              context.pop();
                            },
                          ),
                          const SizedBox(height: 16),
                          PlacemarkWidget(
                            placemark: provider.placemark![0],
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void onMyLocationButtonPress() async {
    final Location location = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        log("Location services is not available");
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        log("Location permission is denied");
        return;
      }
    }

    locationData = await location.getLocation();
    final latLng = LatLng(locationData.latitude!, locationData.longitude!);
    provider.setLatLng(latLng);
    await provider.setPlacemark();

    final info = provider.placemark;

    if (info != null) {

      final place = info[0];
      final street = place.street!;
      final address =
          '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      defineMarker(latLng, street, address);
    }

    mapController.animateCamera(
      CameraUpdate.newLatLngZoom(latLng, 18),
    );
  }

  void onLongPressGoogleMap(LatLng latLng) async {
    provider.setLatLng(latLng);
    await provider.setPlacemark();

    final info = provider.placemark;

    if (info != null) {

      final place = info[0];
      final street = place.street!;
      final address =
          '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      defineMarker(latLng, street, address);
    }

    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  void defineMarker(LatLng latLng, String street, String address) {
    final marker = Marker(
        markerId: const MarkerId("source"),
        position: latLng,
        infoWindow: InfoWindow(
          title: street,
          snippet: address,
        ));

    setState(() {
      markers.clear();
      markers.add(marker);
    });
  }
}
