import 'package:flutter/material.dart';

void main() {
  runApp(MyStatelessApp());
}

class MyStatelessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless Widget Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // بيانات ثابتة يمكن تمريرها
  final String title = 'Stateless Widget Example';
  final String message = 'Hello, I am a Stateless Widget!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // استخدام متغيرات في العرض
            Text(
              message,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            
            // مثال على widget آخر
            IconWidget(icon: Icons.flutter_dash),
            
            SizedBox(height: 20),
            
            // استخدام بيانات خارجية
            DataDisplay(data: 'This widget is immutable'),
          ],
        ),
      ),
    );
  }
}

// مثال على widget مخصص يعتمد على بيانات
class IconWidget extends StatelessWidget {
  final IconData icon;
  
  const IconWidget({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 50,
      color: Colors.green,
    );
  }
}

// مثال آخر يعرض بيانات
class DataDisplay extends StatelessWidget {
  final String data;
  
  const DataDisplay({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        data,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}