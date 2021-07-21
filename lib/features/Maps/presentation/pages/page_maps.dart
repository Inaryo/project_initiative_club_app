import 'package:flutter/material.dart';
import 'package:project_initiative_club_app/features/Maps/presentation/blocs/maps_data/mapsdata_bloc.dart';
import 'package:project_initiative_club_app/features/Maps/presentation/widgets/button_change.dart';
import 'package:project_initiative_club_app/features/Maps/presentation/widgets/info_widget.dart';
import 'package:project_initiative_club_app/features/Maps/presentation/widgets/maps_widget.dart';
import 'package:project_initiative_club_app/injections.dart';
import 'package:project_initiative_club_app/ressources/globals.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_initiative_club_app/ressources/widgets/error.dart';
import 'package:project_initiative_club_app/ressources/widgets/loading.dart';


class MapsPage extends StatelessWidget {
  const MapsPage ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Maps")),
        body:  
           BlocProvider <MapsdataBloc>(
            create: (_context) => sl<MapsdataBloc>(),
            child: BlocBuilder<MapsdataBloc, MapsdataState>(
              builder: (context, state) {
                  if (state is Empty) {
                    BlocProvider.of<MapsdataBloc>(context)
                      .add(GetMapsDataEvent());

                    return Container();
                  } else if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Loaded) {
                    return MapsWidget();
                  } else if (state is Error) {
                    return ErrorPage(message: state.message);
                  }
                  return Container();
                },
            )))); 
  }
}

    /*Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //* Maps
          MapsWidget(
              screenW: screenW / 1.05,
              heightImage: heightImage,
              state_perso_map: state_perso_map),
          //* Button For Changing Verions
          ButtonMapVersionChange(
            screenH: screenH,
            screenW: screenW,
            function: () {
              setState(() => state_perso_map = !state_perso_map);
            },
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: InfoListWidget(
              list: listMapData,
              context: context,
              screenW: screenW,
              screenH: screenH,
            ),
          ),
        ],
      ),
    );
  }
  */
  */*/

