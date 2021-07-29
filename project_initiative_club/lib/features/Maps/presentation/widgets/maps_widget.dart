import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_initiative_club_app/ressources/globals.dart';


class MapsWidget extends StatefulWidget {
  const MapsWidget({ Key? key }) : super(key: key);

  @override
  _MapsWidgetState createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {

    late PageController _pageController;
    late GoogleMapController  _controller; 
    int prevPage = 1;
    CameraPosition _initialPosition = CameraPosition(
      zoom: 14.5,
      target: LatLng(10,20));

    @override
    void initState() { 
      super.initState();
      print(listMapData);
   _pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.8
    )..addListener(_onScroll);
    

    }


    void _onScroll() {
      if (_pageController.page!.toInt() != prevPage) {
          prevPage = _pageController.page!.toInt();
          moveCamera();
      } 
    }

    void _onMapCreated(controller) {
    setState(() {
      _controller = controller;
      _controller.setMapStyle(mapsStyle);
    });
  }

    void moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: listMapData[_pageController.page!.toInt()].position,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
    }

  Widget _buildingList(int index) {


        return AnimatedBuilder(
          animation: _pageController,
           builder:  (BuildContext context, Widget? widget) {
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
      
      child: Center(child: Text('test'),)
      
      /*InkWell(
          onTap: () {},
          child: Stack(
            children: [
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
                        child: Row(
                          children: [
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
                                          listMapData[index].images[0]),
                                      fit: BoxFit.cover))),
                          SizedBox(width: 5.0),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listMapData[index].title,
                                  style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: 170.0,
                                  child: Text(
                                    listMapData[index].description,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )
                              ])
                        ]))))
          ]))*/
          );
    
    }



  @override
  Widget build(BuildContext context) {

    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;
    
    



    return Stack(children: [
      Container(
        height: screenH - 50,
        width: screenW,
        child: 
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: _initialPosition       
            ),
        )
      ,Positioned(
              bottom: 20.0,
              child: Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: listMapData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildingList(index);
                  },
                ),
              ),
            )
      
      ]);    
  }
}



/*Widget MapsWidget(
    {required double screenW,
    required double heightImage,
    required bool state_perso_map}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ConstrainedBox(
        constraints:
            BoxConstraints.tightFor(width: screenW, height: heightImage),
        child: InteractiveViewer(
            panEnabled: true, // Set it to false
            boundaryMargin: EdgeInsets.all(0),
            minScale: 0.1,
            maxScale: 5,
            child: state_perso_map
                ? Image.asset('images/maps_preview_perso.png',
                    width: screenW, height: heightImage, fit: BoxFit.cover)
                : Image.asset('images/maps_preview.png',
                    width: screenW, height: heightImage, fit: BoxFit.cover)),
      ),
    ],
  );
}
*/