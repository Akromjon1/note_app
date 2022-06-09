import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../services/util_services.dart';
import 'itemOfHome.dart';
import 'test_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "home_page";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late User _user;
  List<FileSystemEntity> listDirectory = [];
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  late Directory mainDirectory;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readFolder();
  }
  void _submit() async {
    String folderName = _controller.text.trim().toString();
    if (kDebugMode) {
      print("${_controller.text}hjjhj");
    }
    _controller.clear();


    String fullPath = "${mainDirectory.path}/$folderName";
    Directory directory = Directory(fullPath);
    bool isExist = await directory.exists();
    if(isExist) {
    if (!mounted) return;
     Utils.fireSnackBar("This folder already exist!", context);
     Navigator.pop(context);
     } else {
    await directory.create();
    if (!mounted) return;
    Utils.fireSnackBar("Folder Successfully created!", context);
    await _readFolder();
    Navigator.pop(context);
    }
  }
  Future<void> _readFolder() async {
    if(Platform.isIOS) {
      mainDirectory = await getApplicationDocumentsDirectory();
      listDirectory = mainDirectory.listSync();

      FileSystemEntity? trash;
      for (var element in listDirectory) {
        if(element.path.contains("/.Trash")) {
          trash = element;
        }
      }
      listDirectory.remove(trash);
      setState((){

      });
    } else {
      String pathAndroid = "storage/emulated/0/TodoApp";
      if(await Permission.manageExternalStorage.request().isGranted && await Permission.storage.request().isGranted) {
        mainDirectory = Directory(pathAndroid);
        bool isExist = await mainDirectory.exists();
        if(!isExist) {
          mainDirectory.create();
        }
        listDirectory = mainDirectory.listSync();
        setState((){});
      }
    }
  }
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
                      controller: _controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Todo title...",
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text("Task content",style: TextStyle(fontWeight: FontWeight.w400, fontSize: MediaQuery.of(context).size.height/56.25),),
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
                      controller: _contentController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Subtitle",
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: _submit,

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
        leading: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, HomePageTwo.id);
            },
            child: Icon(Icons.dashboard, size: MediaQuery.of(context).size.height/32)),
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
      body:          Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: listDirectory.length,
          itemBuilder: (context, index) {
            String currentPath = listDirectory[index].path;
            String title = currentPath.substring(currentPath.lastIndexOf("/") + 1);
            return HomeItem(
              iconColor: Colors.white,
              icon: Icons.task_alt_outlined,
              title: title,
              //subtitle: subtitle,
              onPressed: () => Navigator.pop(context),
            );
          }, separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 20,);
        },
        ),
      ),




      // Container(height: MediaQuery.of(context).size.height/8.44,
          //   padding: EdgeInsets.symmetric(horizontal: 20),
          //   margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/70),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/42.2),
          //       color: Colors.red
          //   ),),




   
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
