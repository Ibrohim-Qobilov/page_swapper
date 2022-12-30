import 'package:flutter/material.dart';
import 'package:slider_card/models/app_banner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  PageController controller = PageController(viewportFraction: 0.7);
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 160,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                controller: controller,
                itemCount: appbannerList.length,
                itemBuilder: (context, index) {
                  var banner = appbannerList[index];
                  var _scale = _selectedIndex == index ? 1.0 : 0.8;
                  return TweenAnimationBuilder(
                    curve: Curves.ease,
                    tween: Tween(begin: _scale, end: _scale),
                    duration: const Duration(milliseconds: 400),
                    builder: ((context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: child,
                      );
                    }),
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: appbannerList[index].color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: DefaultTextStyle(
                        style:
                            const TextStyle(fontSize: 20, color: Colors.blue),
                        child: Text(
                          appbannerList[index].title.toString(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  appbannerList.length,
                  (index) => Inducator(
                    isActive: _selectedIndex == index ? true : false,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Inducator extends StatelessWidget {
  final bool isActive;
  const Inducator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 20,
      height: 3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:
              isActive ? Colors.orangeAccent : Colors.white.withOpacity(0.14)),
    );
  }
}
