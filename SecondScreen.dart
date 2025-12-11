import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  static const String termsText = ''' 
''';

  @override
  Widget build(BuildContext context) {
    var i = 200;
    return Scaffold(
      appBar: AppBar(
        title: const Text('شروط الاستخدام'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Column(
        children: [ // قسم النص مع التمرير
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    // عنوان الشروط
                    const Text(
                      'شروط وأحكام استخدام التطبيق',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,  ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    
                    // رمز توضيحي
                    Icon(
                      Icons.assignment,
                      size: 60,
                      color: Colors.teal[300],
                    ),
                    const SizedBox(height: 20),
                    
                    // النص مع تنسيق
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],  borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        termsText,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.8,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                     // ملاحظة مهمة
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.yellow[50],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.yellow),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.info_outline, color: Colors.orange),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'يرجى قراءة الشروط بعناية قبل الموافقة',
                              style: TextStyle(
                                fontSize: 14,  color: Colors.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // قسم الأزرار
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(  color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // زر الرفض
                  Expanded(
                    child: OutlinedButton.icon( onPressed: () {
                        Navigator.pop(context, false);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        side: const BorderSide(color: Colors.red),
                      ),
                      icon: const Icon(Icons.close, color: Colors.red),
                      label: const Text(
                        'لا أوافق',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),  ),
                  
                  const SizedBox(width: 15),
                  
                  // زر القبول
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.teal,
                      ),
                      icon: const Icon(Icons.check, color: Colors.white),
                      label: const Text(
                        'أوافق على الشروط',
                        style: TextStyle( fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}