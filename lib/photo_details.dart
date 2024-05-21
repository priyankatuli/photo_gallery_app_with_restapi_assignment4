
import 'package:flutter/material.dart';

class PhotoDetails extends StatelessWidget{

  String ? imgUrl;
  String ? title;
  String ? id;

  PhotoDetails({super.key, required this.imgUrl, required this.title,required this.id});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.00),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //const SizedBox(height: 30,),

                SizedBox(
                  //height: 400,
                  //width: 400,
                  child: Image.network(imgUrl!),
                ),
              const SizedBox(height: 20,),
              Wrap(
                alignment: WrapAlignment.start,
                children: [
                  Text('Title: $title',style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                  ),),
                  Center(
                    child: Text('ID: $id',style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),),
                  )
                ],
              )

            ],
          ),
        ),
      )


    );
  }



}