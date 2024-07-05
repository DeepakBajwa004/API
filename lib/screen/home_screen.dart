import 'package:flutter/material.dart';
import 'package:instagram_rapid_api/services/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Services services = Services();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Mr.Beast Followers Data'),
      ),
      body:  ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height-90,
            child: FutureBuilder(
              future: services.fatchInstaData(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }
                else {
                 return  ListView.separated(
                   itemCount: snapshot.data!.data.items.length,
                   separatorBuilder: (BuildContext context, int index) {
                     return SizedBox(height: 10,);
                   },
                      itemBuilder: (context , index ){
                        return Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                clipBehavior: Clip.antiAlias,
                                borderRadius: BorderRadius.circular(38),
                                child: Image.network(
                                  snapshot.data!.data.items[index].profilePicUrl,height: 70,width:70,fit: BoxFit.cover,
                                ),
                              ),
                              Text('${index+1}'),
                              Text(
                                  'UserName : ${snapshot.data!.data.items[index].username.toString()}',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),
                              ),
                              Text(
                                  'FullName : ${snapshot.data!.data.items[index].fullName}',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),
                              ),
                              Text(
                                  'Id Private : ${snapshot.data!.data.items[index].isPrivate.toString()}',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),
                              ),
                              Text(
                                  'Id Number : ${snapshot.data!.data.items[index].id.toString()}',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),
                              ),
                            ],
                          ),
                        );
                      },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
