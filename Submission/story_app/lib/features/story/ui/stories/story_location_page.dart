import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:story_app/features/story/provider/story_provider.dart';
import 'package:story_app/widgets/error_page.dart';
import 'package:story_app/widgets/loading_page.dart';

class StoryLocationPage extends StatefulWidget {
  const StoryLocationPage({super.key});

  @override
  State<StoryLocationPage> createState() => _StoryLocationPageState();
}

class _StoryLocationPageState extends State<StoryLocationPage> {
  late GoogleMapController mapController;
  final initLocation = const LatLng(-6.19801, 106.82883);
  final Set<Marker> markers = {};
  MapType selectedMapType = MapType.normal;

  LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    double? x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
      northeast: LatLng(x1!, y1!),
      southwest: LatLng(x0!, y0!),
    );
  }

  void addLocationMarker(List<LatLng> latLng) {
    for (final place in latLng) {
      markers.add(
        Marker(
          markerId: MarkerId("Location $place"),
          position: place,
          onTap: () {
            mapController.animateCamera(
              CameraUpdate.newLatLngZoom(place, 18),
            );
          },
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<StoryProvider>(
      builder: (context, provider, child) {
        final state = provider.storiesState;
        return state.map(
          initial: (value) {
            return const LoadingPage();
          },
          loading: (value) {
            return const LoadingPage();
          },
          loaded: (value) {
            addLocationMarker(provider.listLatLng);

            return Center(
                child: Stack(
                  children: [
                    GoogleMap(
                      markers: markers,
                      mapType: selectedMapType,
                      initialCameraPosition: CameraPosition(
                        target: initLocation,
                        zoom: 18,
                      ),
                      onMapCreated: (controller) {
                        setState(() {
                          mapController = controller;
                        });

                        final bound = boundsFromLatLngList(
                            provider.listLatLng);
                        mapController.animateCamera(
                          CameraUpdate.newLatLngBounds(bound, 50),
                        );
                      },
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      mapToolbarEnabled: false,
                    ),
                    Positioned(
                      top: 32,
                      left: 16,
                      child: FloatingActionButton.small(
                          heroTag: "back",
                          onPressed: () {
                            context.pop();
                          },
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: Column(
                        children: [
                          FloatingActionButton.small(
                            heroTag: "zoom-in",
                            onPressed: () {
                              mapController.animateCamera(
                                CameraUpdate.zoomIn(),
                              );
                            },
                            child: const Icon(Icons.add),
                          ),
                          FloatingActionButton.small(
                            heroTag: "zoom-out",
                            onPressed: () {
                              mapController.animateCamera(
                                CameraUpdate.zoomOut(),
                              );
                            },
                            child: const Icon(Icons.remove),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 32,
                      right: 16,
                      child: FloatingActionButton.small(
                        onPressed: null,
                        child: PopupMenuButton<MapType>(
                          offset: const Offset(0, 54),
                          icon: const Icon(Icons.layers_outlined),
                          onSelected: (MapType item) {
                            setState(() {
                              selectedMapType = item;
                            });
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<MapType>>[
                            const PopupMenuItem<MapType>(
                              value: MapType.normal,
                              child: Text('Normal'),
                            ),
                            const PopupMenuItem<MapType>(
                              value: MapType.satellite,
                              child: Text('Satellite'),
                            ),
                            const PopupMenuItem<MapType>(
                              value: MapType.terrain,
                              child: Text('Terrain'),
                            ),
                            const PopupMenuItem<MapType>(
                              value: MapType.hybrid,
                              child: Text('Hybrid'),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
          },
          error: (value) {
            return ErrorPage(error: value.message);
          },
        );
      },
    );
  }
}
