import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:story_app/features/story/provider/story_provider.dart';
import 'package:story_app/features/story/widgets/placemark_widget.dart';

class DetailLocationPage extends StatefulWidget {
  final String latString;
  final String lonString;

  const DetailLocationPage(
      {super.key, required this.latString, required this.lonString});

  @override
  State<DetailLocationPage> createState() => _DetailLocationPageState();
}

class _DetailLocationPageState extends State<DetailLocationPage> {
  late GoogleMapController mapController;
  late StoryProvider provider;
  late LatLng location;
  final Set<Marker> markers = {};
  MapType selectedMapType = MapType.normal;

  @override
  void initState() {
    super.initState();
    provider = context.read<StoryProvider>();
    location = LatLng(
      double.parse(widget.latString),
      double.parse(widget.lonString),
    );
    setPlacemark();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          GoogleMap(
            markers: markers,
            mapType: selectedMapType,
            initialCameraPosition: CameraPosition(
              target: location,
              zoom: 18,
            ),
            onMapCreated: (controller) async {
              setState(() {
                mapController = controller;
              });
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
                provider.setLatLng(null);
              },
              child: const Icon(Icons.arrow_back),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                const SizedBox(height: 8,),
                provider.placemark != null ?
                PlacemarkWidget(
                  placemark: provider.placemark![0],
                ) : const SizedBox(),
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
  }

  void setPlacemark() async {
    await provider.setPlacemark();
    final info = provider.placemark;

    if (info != null) {
      final place = info[0];
      final street = place.street!;
      final address =
          '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      defineMarker(location, street, address);
    }
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
