import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: blogui(),
    debugShowCheckedModeBanner: false,
  ));
  
}
 final List <Map> articles =[
    { "title":"Macbeth",
      "author": "william shakespeare",
      "time":" 10 mins ago",
},
  { "title":" The Pilgrim's Progress ",
      "author": " John Bunyan ",
      "time":"20 mins ago",
},
  { "title":" Robinson Crusoe",
      "author": "Daniel Defoe",
      "time":" 27 mins ago",
},
 
  { "title":" Gulliver's Travels",
      "author": "Jonathan Swift ",
      "time":"30 mins ago",
},
{
  "title":" Clarissa",
  "author":"Samuel Richardson",
  "time":"40 mins ago",
},
{
  "title":" Tom Jones",
  "author":"Henry Fielding",
  "time":"45 mins ago",
},
{
"title":" Wuthering Heights",
  "author":" gggggg",
  "time":"55 mins ago",
},
{
"title":" The Scarlet Letter",
  "author":"Nathaniel Hawthorne ",
  "time":"1 hours ago",
},
{
"title":"Alice's Adventures in Wonderland  ",
  "author":"Lewis Carroll ",
  "time":"2 hours ago",
},

  ];

class blogui extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        
        appBar:AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: (){}, icon: const Icon(Icons.category,color: Colors.black,),),
          title: const Center(child: Text("Categories",style: TextStyle(color: Colors.black),)),
          actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search_rounded,color: Colors.black,),),
          ],
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs:[
              
              Tab(
                child: Text("For You",style: TextStyle(color: Colors.black,fontSize: 15),),
               
              ),
              Tab(
                  child: Text("Design",style: TextStyle(color: Colors.black,fontSize: 15),),
                
              ),
              Tab(
                  child: Text("Beauty",style: TextStyle(color: Colors.black,fontSize: 15),),
                
              ),
              Tab(
                  child: Text("Education",style: TextStyle(color: Colors.black,fontSize: 15),),
              
              ),
              Tab(
                  child: Text("Entertainment",style: TextStyle(color: Colors.black,fontSize: 15),),
              
              ),
            ] ),
    
        ) ,
        body: TabBarView(
            children: <Widget>[
              ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return myarticle(index);
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16.0),
              ),
              const Text("Tab 2"),
              const Text("Tab 3"),
              const Text("Tab 4"),
              const Text("Tab 5"),
            ],
          ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: 1,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          // ignore: prefer_const_literals_to_create_immutables
          items:[
            const BottomNavigationBarItem(icon: Icon(Icons.home,),label: ""),
            const BottomNavigationBarItem(icon: Icon(Icons.folder),label: ""),
            const BottomNavigationBarItem(icon: Icon(Icons.favorite,),label: ""),
            const BottomNavigationBarItem(icon: Icon(Icons.person,),label: ""),
            const BottomNavigationBarItem(icon: Icon(Icons.settings,),label: ""),
          ] ),
      ),
    );
  }
}
Widget myarticle(int index){
  Map article=articles[index];
  return Container(
    color: Colors.white,
    child: Stack(
      children: [
        Container(
          width: 90,
          height: 90,
          color: const Color.fromARGB(255, 173, 232, 235),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                height: 100,
                color: Colors.blue,
                width: 80,
                child: const Image(image: AssetImage("assets/images/Books_HD_(8314929977).jpg"),
                fit: BoxFit.cover,),
              ),
              const SizedBox(width: 20,),
              Expanded(
                child:Column(
                  children: [
                    Text(article["title"],
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                       fontWeight:FontWeight.bold,
                      fontSize: 20,
                      color:  Color.fromARGB(255, 61, 85, 110),
                     
                    ),
                    
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const WidgetSpan(child: 
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Color.fromARGB(255, 239, 119, 159),
                          ),
                          ),
                          const WidgetSpan(child: 
                          SizedBox(width: 5,),
                          ),
                          TextSpan(
                            text: article["author"],
                            style: const TextStyle(fontSize: 15,),
                          ),
                          const WidgetSpan(child: SizedBox(
                            width: 5,
                          ),),
                          TextSpan(
                            text:article["time"],
                          style: const TextStyle(fontSize: 15,height: 3),),
                        ]
                      )
                    )
                  ],
                ) 
              )
            ],
          ),
        )
      ],
    ),
  );
}