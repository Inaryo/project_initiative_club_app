import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_initiative_club_app/features/Maps/domain/entities/maps_data.dart';
import 'package:project_initiative_club_app/features/Maps/presentation/widgets/filter_button.dart';
import 'package:project_initiative_club_app/ressources/globals.dart';

class MapsWidget extends StatefulWidget {
  const MapsWidget({Key? key}) : super(key: key);

  @override
  _MapsWidgetState createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  late PageController _pageController;
  late GoogleMapController _controller;
  int prevPage = 1;
  List<MapsDataEntity> currentFiltredList = [];
  CameraPosition _initialPosition =
      CameraPosition(zoom: 14.5, target: LatLng(36.7121668, 3.1802495));
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  List<int> currentFiltringCode = [];

  List<MapsDataEntity> getFiltredList() {
    List<MapsDataEntity> list = [];
    markers.clear();
    listMapData.forEach((element) {
      if (currentFiltringCode.contains(element.type)) {
        var date = DateTime.now().microsecondsSinceEpoch;
        MarkerId id = MarkerId("marker" + date.toString());
        InfoWindow info =
            InfoWindow(snippet: element.title, title: element.title);
        var icon;

        switch (element.type) {
          case 0:
            icon = iconFood;
            break;
          case 1:
            icon = iconEntry;
            break;
          case 2:
            icon = iconFaculty;
            break;
          case 3:
            icon = iconAdminsitration;
            break;
          case 4:
            icon = iconOther;
            break;
        }
        print(icon);
        markers[id] = Marker(
            icon: iconFood,
            consumeTapEvents: false,
            infoWindow: info,
            markerId: id,
            position: element.position);

        list.add(element);
      }
    });

    currentFiltredList = list;
    return list;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page!.toInt() != prevPage) {
      prevPage = _pageController.page!.toInt();
      moveCamera();
    }
  }

  void _onMapCreated(controller) async {
    setState(() async {
      _controller = controller;
      await _controller.setMapStyle(mapStyle);
      /* _controller.setMapStyle(
          '[{"featureType": "poi.business","stylers": [{"visibility": "off"}]},{"featureType": "poi.park","elementType": "labels.text","stylers": [{"visibility": "off"}]},{"featureType": "poi.school","stylers": [{"visibility": "off"}]]');
    */
    });
  }

  void moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: currentFiltredList[_pageController.page!.toInt()].position,
        zoom: 17.0,
        bearing: 45.0,
        tilt: 45.0)));

    setState(() {
      MarkerId id = MarkerId("marker");
      InfoWindow info = InfoWindow(
          snippet: currentFiltredList[_pageController.page!.toInt()].title);
      markers[id] = Marker(
          consumeTapEvents: false,
          infoWindow: info,
          markerId: id,
          position: currentFiltredList[_pageController.page!.toInt()].position);
    });
  }

  Widget _buildingList(int index) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (BuildContext context, Widget? widget) {
          double value = 1;
          if (_pageController.position.haveDimensions) {
            value = _pageController.page! - index;
            value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
          }

          return Center(
            child: SizedBox(
              height: Curves.easeInOut.transform(value) * 125.0,
              width: Curves.easeInOut.transform(value) * 350.0,
              child: widget,
            ),
          );
        },
        child: InkWell(
            onTap: () {},
            child: Stack(children: [
              Center(
                  child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 20.0,
                      ),
                      height: 125.0,
                      width: 275.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              offset: Offset(0.0, 4.0),
                              blurRadius: 10.0,
                            ),
                          ]),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white),
                          child: Row(children: [
                            // Image Container
                            Container(
                                height: 90.0,
                                width: 90.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            currentFiltredList[index]
                                                .images[0]),
                                        fit: BoxFit.cover))),
                            SizedBox(width: 5.0),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentFiltredList[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width: 170.0,
                                    child: Text(
                                      currentFiltredList[index].description,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  )
                                ])
                          ]))))
            ])));
  }

  @override
  Widget build(BuildContext context) {
    currentFiltredList = getFiltredList();

    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;

    return Stack(alignment: Alignment.center, children: [
      Container(
        height: screenH - 50,
        width: screenW,
        child: GoogleMap(
          markers: Set<Marker>.of(markers.values),
          onMapCreated: _onMapCreated,
          initialCameraPosition: _initialPosition,
          myLocationEnabled: true,
          mapType: MapType.hybrid,
        ),
      ),
      Positioned(
        bottom: 20.0,
        child: Container(
          height: 200.0,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            controller: _pageController,
            itemCount: currentFiltredList.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildingList(index);
            },
          ),
        ),
      )

      // Filtre des Informations
      ,
      Positioned(
          top: 25,
          child: FilterButtonWidget(
            filterFunction: modifyFilter,
          )),
    ]);
  }

  void modifyFilter(int index) {
    setState(() {
      if (currentFiltringCode.contains(index)) {
        currentFiltringCode.remove(index);
      } else {
        currentFiltringCode.add(index);
      }
    });
  }
}
