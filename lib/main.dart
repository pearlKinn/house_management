import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_manageemnt/controller/controller.dart';
import 'package:house_manageemnt/models/house.dart';
import 'package:house_manageemnt/screen/testpage.dart';
import 'screen/House_page01.dart';
import './repositories/houseRepository.dart';
import './utils/numberUtil.dart';
  final List<House> Houses = HouseRepositoty().getHouses();


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: '월세및전세관리'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;


   final List<Widget> _pages = [
    const Page1(),
    const Page2(),
    Page3(imagename: Houses[0].imageName),
    Testpage(),
    // Add more pages here
  ];

    void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
 
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
         title: Text(widget.title),
      ),
      body: _pages[_currentIndex],
 
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            // 현재 아이콘이 선택된 아이콘일때와 선택된 아이콘이 아닌 경우 Icon을 다르게 하기 위함
            icon: _currentIndex == 0? const Icon(Icons.home_filled, color: Colors.black,): const Icon(Icons.home_outlined, color: Colors.black),
            label: 'home'
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1? const Icon(Icons.search, color: Colors.black,):  const Icon(Icons.search_off, color: Colors.black,),
              label: 'search'
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2? const Icon(Icons.shopping_bag, color: Colors.black,): const Icon(Icons.shopping_bag_outlined, color: Colors.black),
              label: 'media'
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3? const Icon(Icons.movie, color: Colors.black,): const Icon(Icons.movie_outlined, color: Colors.black,),
              label: 'shop'
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 4? const Icon(Icons.person, color: Colors.black): const Icon(Icons.person_outline, color: Colors.black,),
              label: 'profile'
          ),
          
        ],
        currentIndex: _currentIndex, 
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        showSelectedLabels: true, //(1)
        showUnselectedLabels: true, //(1)
        type: BottomNavigationBarType.shifting,
        elevation: 20, //(2)
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Page1 extends StatelessWidget {

  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
              itemCount: Houses.length, //item 개수
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, //1 개의 행에 보여줄 item 개수
                childAspectRatio: 4 / 2, //item 의 가로 1, 세로 2 의 비율
                mainAxisSpacing: 15, //수평 Padding
               //  crossAxisSpacing: 250, //수직 Padding
              ),
              itemBuilder: (BuildContext context, int index) {
                //item 의 반목문 항목 형성
                return Container(
                  padding: const EdgeInsets.all(12.0),
                  margin: const EdgeInsets.all(12),
                  // color: Colors.orange[200],
                  decoration: BoxDecoration(
                    // color: Colors.orange[200],// 배경색을 파란색으로 설정
                    border: Border.all(
                      color: Colors.black, 
                      style: BorderStyle.solid,// 테두리 색상을 검정색으로 설정
                      width: 0, // 테두리 두께를 2로 설정
                    ),
                    borderRadius: BorderRadius.circular(10), // 둥근 모서리 설정
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Houses[index].posjuso,
                        style: TextStyle(
                          fontSize: Houses[index].household =="3"?30:25
                        ),
                      ),
                      Text("가구수 : ${Houses[index].household}명",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text("월세 : ${formatNumber(strNumber(Houses[index].monthAmt))}원",
                        style: const TextStyle(
                        fontSize: 20,
                      ),                      
                      ),
                      Column(
                        children: [
                          Text("관리비 : ${formatNumber(strNumber(Houses[index].mAmt))}원",
                            style: const TextStyle(
                            fontSize: 20,
                          ),                      
                          ),
                        ],
                      ),
                    ],
                  )
                );
              },
            ),
        ),
      );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {

    
    Controller controller = Get.put(Controller());
    return Center(
      
      child: Column(
        children: [

        ElevatedButton(
          onPressed: (){
            //Get.to(MyPage());
          },
          child: const Text('로그인'),
        ),         
        ],
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  final String imagename;
  const Page3({super.key,required this.imagename});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: (){
              Get.to(const HousePage01());
            },
            child: const Text('Elevated Button'),
          ),
          ImageTest(imagename:imagename),
          const Test01(),
        ],
      )
      
    );
  }
}


Widget aaa(BuildContext context){
  return Container(
    child: const Text('정말 재이 있다'),
  );
}

Widget imageTest(BuildContext context){
  return Image.asset('assets/images/test.png',
  width: MediaQuery.of(context).size.width,
  height: 200,
  );
}

class ImageTest extends StatelessWidget {
  final String imagename;

  const ImageTest({super.key, required this.imagename});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(imagename),
    );
  }
}

class Test01 extends StatelessWidget {
  const Test01({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
          style: BorderStyle.solid,

        ),
        // boxShadow: const [
        //   BoxShadow(
        //     color:Colors.grey,
        //     offset: Offset(0,3),
        //     blurRadius: 1
        //   )
        // ],
        borderRadius: BorderRadius.circular(10),
        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.shopping_bag),
          const SizedBox(width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('퀴즈를 풀고 경품 당첨의 기회를 노리세요',
              
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold


              ),
              ),
              
              const Text('퀴즈 정답을 맞춘 분께 추첨을 통해 선물 증정!!당첨기회 놓치지 마세요!',
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
              const SizedBox(height: 10 ,),
              Image.asset('assets/images/test.png',
                alignment: Alignment.bottomLeft,
                width: 200,
                height: 50,
              ),
              const SizedBox(height: 10,),
              const Text('1일전')
            ],
          )
        ]
        ),
    );
  }
}

