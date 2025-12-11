import 'package:flutter/material.dart';

void main() {
  runApp(const TasbeehApp());
}

class TasbeehApp extends StatelessWidget {
  const TasbeehApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'عداد التسبيح',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Tajawal',
      ),
      home: const TasbeehCounter(),
    );
  }
}

class TasbeehCounter extends StatefulWidget {
  const TasbeehCounter({super.key});

  @override
  State<TasbeehCounter> createState() => _TasbeehCounterState();
}

class _TasbeehCounterState extends State<TasbeehCounter> {
  int _count = 0;
  int _target = 33;
  final List<String> _tasbeehat = [
    'سُبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
    'أستغفر الله'
  ];
  int _currentTasbeehIndex = 0;
  bool _vibrationEnabled = true;

  void _increment() {
    setState(() {
      _count++;
      if (_count >= _target) {
        _showCompletionDialog();
      }
    });
  }

  void _decrement() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
    });
  }

  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  void _changeTasbeeh() {
    setState(() {
      _currentTasbeehIndex = (_currentTasbeehIndex + 1) % _tasbeehat.length;
      _reset();
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تهانينا!'),
        content: Text('أتممت $_target تسبيحة "${_getCurrentTasbeeh()}"'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _reset();
            },
            child: const Text('بدء جديد'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('متابعة'),
          ),
        ],
      ),
    );
  }

  String _getCurrentTasbeeh() {
    return _tasbeehat[_currentTasbeehIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: const Text('عداد التسبيح'),
        centerTitle: true,
        elevation: 4,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _showSettings,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.teal[50]!,
              Colors.teal[100]!,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // بطاقة التسبيح الحالي
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          _getCurrentTasbeeh(),
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal[800],
                            fontFamily: 'Tajawal',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'الهدف: $_target',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // عداد التسبيح
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: _count >= _target ? Colors.teal[300] : Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '$_count',
                          style: TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.bold,
                            color: _count >= _target ? Colors.white : Colors.teal[800],
                          ),
                        ),
                      ),
                    ),
                    // مؤشر التقدم
                    SizedBox(
                      width: 220,
                      height: 220,
                      child: CircularProgressIndicator(
                        value: _count / _target,
                        strokeWidth: 6,
                        backgroundColor: Colors.teal[100],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.teal[700]!,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // أزرار التحكم
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: _decrement,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.teal,
                      heroTag: 'decrement',
                      child: const Icon(Icons.remove, size: 28),
                    ),
                    const SizedBox(width: 30),
                    ElevatedButton(
                      onPressed: _increment,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.teal[700],
                        elevation: 5,
                      ),
                      child: const Text(
                        'تسبيح',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 30),
                    FloatingActionButton(
                      onPressed: _reset,
                      backgroundColor: Colors.teal[100],
                      foregroundColor: Colors.teal[800],
                      heroTag: 'reset',
                      child: const Icon(Icons.refresh, size: 28),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // زر تغيير التسبيح
                OutlinedButton.icon(
                  onPressed: _changeTasbeeh,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    side: BorderSide(color: Colors.teal[400]!, width: 2),
                  ),
                  icon: const Icon(Icons.swap_horiz, color: Colors.teal),
                  label: const Text(
                    'تغيير التسبيح',
                    style: TextStyle(fontSize: 16),
                  ),
                ),

                // معلومات إضافية
                const SizedBox(height: 30),
                Text(
                  'التسبيحات المتبقية: ${_target - _count}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showHistory,
        backgroundColor: Colors.teal[600],
        icon: const Icon(Icons.history),
        label: const Text('السجل'),
      ),
    );
  }

  void _showSettings() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'الإعدادات',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    leading: const Icon(Icons.vibration),
                    title: const Text('تفعيل الاهتزاز'),
                    trailing: Switch(
                      value: _vibrationEnabled,
                      onChanged: (value) {
                        setState(() {
                          _vibrationEnabled = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.flag),
                    title: const Text('الهدف'),
                    trailing: DropdownButton<int>(
                      value: _target,
                      onChanged: (value) {
                        setState(() {
                          _target = value!;
                        });
                        Navigator.pop(context);
                      },
                      items: [33, 50, 100, 200]
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text('$value'),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('تم'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showHistory() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('سجل التسبيحات'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _tasbeehat.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: index == _currentTasbeehIndex
                      ? Colors.teal
                      : Colors.grey[300],
                  child: Text('${index + 1}'),
                ),
                title: Text(_tasbeehat[index]),
                subtitle: Text('الهدف: $_target مرة'),
                trailing: index == _currentTasbeehIndex
                    ? Icon(Icons.check, color: Colors.teal)
                    : null,
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إغلاق'),
          ),
        ],
      ),
    );
  }
}