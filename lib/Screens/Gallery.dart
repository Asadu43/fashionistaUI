import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/Api_url/Api_Url.dart';
import 'package:flutter_login_ui/Models/spot_data_entity.dart';
import 'package:flutter_login_ui/Provider/CheckIconProvider.dart';
import 'package:flutter_login_ui/Service/SpotAPI.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Consumer<CheckIconProvider>(
        builder: (context, value, child) {
          if(value.list.isEmpty)
            return Container();
          else return RaisedButton(
            onPressed: (){},
            color: Colors.amberAccent,

            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                Text("Filter Items"),
                SizedBox(width: 10.0,),
                Icon(Icons.search),
              ],
            ),
          );
        },

      ),
      body: FutureBuilder(
        future: SpotAPI.getData(),
        builder: (BuildContext context,
            AsyncSnapshot<List<SpotDataEntity>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                SpotDataEntity spot = snapshot.data[index];
                return Column(
                  children: [
                    buildTypeTitle(context, spot),
                    buildGridView(spot)
                  ],
                );
              },
            );
          } else {}
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  GridView buildGridView(SpotDataEntity spot) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: spot.types.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (context, index) {
        SpotDataType type = spot.types[index];
        CheckIconProvider provider = Provider.of<CheckIconProvider>(context);
        return Stack(
          children: [
            Transform.scale(
              scale: provider.isChecked(type.id)? 0.9:1.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: provider.isChecked(type.id)? Colors.black12 :null,
                  child: ListTile(
                    onTap: (){
                      provider.toggle(type.id);
                    },
                    title: CachedNetworkImage(
                      imageUrl: ApiUrl.web_image_url + "${type.icon}",

                    ),
                    subtitle: Container(
                      height: 40,
                      child: AutoSizeText(

                        "${type.title}",
                        maxLines: 2,
                        wrapWords: false,
                        // style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),
                        textAlign: TextAlign.center,
                        minFontSize: 1,
                        // overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: provider.isChecked(type.id),
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.check),
            )),
          ],
        );
      },
    );
  }

  Padding buildTypeTitle(BuildContext context, SpotDataEntity spot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        child: Text(
          "${spot.title}",
          style: TextStyle(
              color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
