import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "home_page";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void bottomSheet(context){
    showModalBottomSheet(context: context,
        backgroundColor: Colors.transparent,
        enableDrag: true,
        isScrollControlled: true,
        builder: (context)=>SingleChildScrollView(
          child: Container(

            height: MediaQuery.of(context).size.height / 2.5 +
                MediaQuery.of(context).viewInsets.bottom,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 00.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Center(
                      child: Container(
                        width: 143,
                        height: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[600]!,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Todo title",style: TextStyle(fontWeight: FontWeight.w400, fontSize: MediaQuery.of(context).size.height/56.25),),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height/17,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/105),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Todo title...",
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text("Todo title",style: TextStyle(fontWeight: FontWeight.w400, fontSize: MediaQuery.of(context).size.height/56.25),),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height/17,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/105),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Todo title...",
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height/14,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/85),
                      ),
                      child: Center(
                        child: Text("Save",style:TextStyle(fontSize: MediaQuery.of(context).size.height/26, fontWeight: FontWeight.w700,color: Colors.white),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isSearch ? AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/105),
                border: Border.all(),
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: GestureDetector(
                        onTap: (){
                          setState((){
                            isSearch = false;
                          });
                        },
                        child: Icon(Icons.clear))
                ),
              ),),)
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/30), child: SizedBox.shrink(),
        ),
      ):
      AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
        centerTitle: false,
        leading: Icon(Icons.dashboard, size: MediaQuery.of(context).size.height/32),
        title: Text("My tasks",style: TextStyle(fontSize: MediaQuery.of(context).size.height/26, fontWeight: FontWeight.w700),),
        actions: [
          IconButton(
              splashRadius: 20,
              onPressed: (){
                setState((){
                  isSearch = true;
                });
              }, icon:isSearch ? SizedBox.shrink(): Icon(Icons.search,color: Colors.grey,size: MediaQuery.of(context).size.height/32))
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/9),
          child: Expanded(
              child: Row(
            children:  [
              const SizedBox(width: 20,),
              Text("What`s on your mind?",style: TextStyle(fontSize: MediaQuery.of(context).size.height/42, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600, color: Colors.red),),
              const Expanded(child: SizedBox.shrink()),
            ],
          )),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(right: 20, left: 20,),
        primary: false,
        children: [
          Container(height: MediaQuery.of(context).size.height/8.44,
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/70),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/42.2),
            color: Colors.red
          ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.task_alt_outlined,color: Colors.white,size: MediaQuery.of(context).size.height/38,),
                    SizedBox(width: 20,),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Pay emma",style: TextStyle(fontWeight: FontWeight.w700, fontSize: MediaQuery.of(context).size.height/35,color: Colors.white ),),
                          Text("20 dollard for manga", style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height/52.75,fontWeight: FontWeight.w300),),
                        ],

                      ),
                    ),
                  ],
                ),
                Icon(Icons.delete_rounded,color: Colors.white,size: MediaQuery.of(context).size.height/38,),

              ],
            ),
          
          ),
          Container(height: MediaQuery.of(context).size.height/8.44,
    padding: EdgeInsets.symmetric(horizontal: 20),
    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/70),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/42.2),
    color: Colors.red
    ),),
          Container(height: MediaQuery.of(context).size.height/8.44,
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/70),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/42.2),
                color: Colors.red
            ),),
          Container(height: MediaQuery.of(context).size.height/8.44,
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/70),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/42.2),
                color: Colors.red
            ),),




        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home,), label: "Home",
        activeIcon: Icon(Icons.home_outlined)),
        BottomNavigationBarItem(icon: Icon(Icons.nightlight_outlined),label: "Night light"),

      ],

        
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        bottomSheet(context);
      },
        backgroundColor: Colors.red,
        child: Icon(Icons.add),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
