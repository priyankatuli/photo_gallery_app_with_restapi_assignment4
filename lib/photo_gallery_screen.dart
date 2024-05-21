import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:photo_gallery_app_with_restapi_assignment4/photo_details.dart';
import 'package:photo_gallery_app_with_restapi_assignment4/photo_property.dart';



class PhotoGalleryScreen extends StatefulWidget{
  const PhotoGalleryScreen({super.key});

  @override
  State<StatefulWidget> createState() {

    return _PhotoGalleryScreenState();

  }

}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen>{

  bool _getPhotoInProgress = false;
  List<PhotoProperty> photoList=[];

  @override
  void initState(){
    super.initState();

    _getPhotoGalleryList();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Photo Gallery App'),
        ),

        body: Visibility(
          visible: _getPhotoInProgress == false,
          replacement: const Center(
            child: CircularProgressIndicator(

            ),
          ),
          child:ListView.builder(
            itemCount: photoList.length,
            itemBuilder: (context,index){
              return _buildPhotoItem(photoList[index] );
            },
            //separatorBuilder: (_, index) => const Divider(),
          ),
        )


    );
  }

  Widget _buildPhotoItem(PhotoProperty photo) {

     return ListTile(

      leading: Image.network(photo.thumbnailUrl.toString(),
      errorBuilder: (context, error, stackTrace) {
      return Icon(Icons.broken_image);
      },
    ),

      //CachedNetWorkImage doesn't support web
      //CachedNetworkImage(
        //imageUrl: photo.thumbnailUrl.toString(), //?? 'https://jsonplaceholder.typicode.com/photos',
        //placeholder: (context, url) => const CircularProgressIndicator(),
        //errorWidget: (context, url, error) =>const Icon(Icons.error),

      title: Text(photo.title.toString()),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoDetails(
          imgUrl: photo.thumbnailUrl.toString(),
          title: photo.title.toString(),
          id: photo.id.toString(),
        )));

      },
     );
  }

  Future<void>_getPhotoGalleryList () async{

      _getPhotoInProgress = true;
      setState(() {

      });

    String getPhotoGalleryUrl = 'https://jsonplaceholder.typicode.com/photos';
    Uri uri =Uri.parse(getPhotoGalleryUrl);
    Response response = await get(uri);

    print(response.statusCode);
    print(response.body);
    print(response.headers);

    //decode to data
    //final decodeData = jsonDecode(response.body);
    //loop over the list
    if(response.statusCode == 200) {
      final decodeData = jsonDecode(response.body);

      for (Map<String, dynamic> json in decodeData) {

        photoList.add(PhotoProperty.fromJson(json));
        //PhotoProperty photo= PhotoProperty.fromJson(json);
        //photoList.add(photo);

      }
    }
    else{
      print('failed');
    }

   _getPhotoInProgress =false;
      setState(() {

      });


  }



}