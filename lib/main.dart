import 'package:flutter/material.dart';

void main() {
  runApp(const AlmamlSportApp());
}

class AlmamlSportApp extends StatelessWidget {
  const AlmamlSportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Almaml Sport',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark, // تصميم داكن احترافي
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent, 
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF121212), // لون خلفية داكن
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          centerTitle: true,
        ),
      ),
      home: const MainScreen(),
    );
  }
}

// الشاشة الرئيسية التي تحتوي على شريط التنقل السفلي
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // قائمة الشاشات التي سيتم التنقل بينها
  final List<Widget> _pages = [
    const HomePage(),
    const Center(child: Text('شاشة المباريات', style: TextStyle(fontSize: 24))),
    const Center(child: Text('شاشة الأخبار', style: TextStyle(fontSize: 24))),
    const Center(child: Text('الملف الشخصي', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عالم الرياضة', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'الرئيسية'),
          NavigationDestination(icon: Icon(Icons.sports_soccer), label: 'المباريات'),
          NavigationDestination(icon: Icon(Icons.newspaper), label: 'الأخبار'),
          NavigationDestination(icon: Icon(Icons.person), label: 'حسابي'),
        ],
      ),
    );
  }
}

// واجهة الشاشة الرئيسية (Home)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // بطاقة ترحيبية
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.blueAccent, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'مرحباً بك في Almaml Sport',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                'تابع آخر الأخبار والنتائج الرياضية لحظة بلحظة.',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        
        // عنوان فرعي
        const Text(
          'أهم المباريات اليوم',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        
        // بطاقة مباراة وهمية
        Card(
          color: const Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Column(
                  children: [
                    CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.sports_soccer, color: Colors.black)),
                    SizedBox(height: 8),
                    Text('الفريق أ'),
                  ],
                ),
                Column(
                  children: [
                    const Text('20:00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.greenAccent)),
                    const SizedBox(height: 4),
                    Text('اليوم', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                  ],
                ),
                const Column(
                  children: [
                    CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.sports_soccer, color: Colors.red)),
                    SizedBox(height: 8),
                    Text('الفريق ب'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}