import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.grey),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Untuk membuka drawer
              },
            );
          },
        ),
        title: Row(
          children: [
            Icon(Icons.adb, color: Colors.green),
            Spacer(),
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 20),
            Stack(
              children: <Widget>[
                Icon(Icons.notifications, color: Colors.grey),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(width: 20),
            CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/user.jpg'), // Ganti dengan path gambar Anda
              radius: 15,
            ),
          ],
        ),
      ),
       drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Menu Sidebar"),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),

            // MASTER DATA Section
            ExpansionTile(
              leading: Icon(Icons.storage),
              title: Text("Master Barang"),
              children: <Widget>[
                ListTile(
                  title: Text("Ikan"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => IkanPage()));
                  },
                ),
                ListTile(
                  title: Text("Barang Lain"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BarangLainPage()));
                  },
                ),
                ListTile(
                  title: Text("Kondisi Ikan"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KondisiIkanPage()));
                  },
                ),
                ListTile(
                  title: Text("Ukuran Ikan"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UkuranIkanPage()));
                  },
                ),
                ListTile(
                  title: Text("Produk"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProdukPage()));
                  },
                ),
                ListTile(
                  title: Text("Supplier"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SupplierPage()));
                  },
                ),
              ],
            ),

            Divider(),

            // MENU Section
            ExpansionTile(
              leading: Icon(Icons.dashboard),
              title: Text("Dashboard"),
              children: <Widget>[
                ListTile(
                  title: Text("Dashboard 1"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashboard1Page()));
                  },
                ),
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.menu),
              title: Text("Menu Pertama"),
              children: <Widget>[
                ListTile(
                  title: Text("Menu 1"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Menu1Page()));
                  },
                ),
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.menu),
              title: Text("Menu Kedua"),
              children: <Widget>[
                ListTile(
                  title: Text("Menu 2"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Menu2Page()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Widget pertama
              SalesCard(
                totalSales: 69700,
                percentageChange: 2.2,
                description: "Total Online Sales",
              ),
              SizedBox(height: 20),
              // Widget kedua
              SalesCard(
                totalSales: 55000,
                percentageChange: -1.1,
                description: "Total In-Store Sales",
              ),
              SizedBox(height: 20),
              // Widget daftar media sosial
              SocialNetworkVisits(),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget untuk SalesCard
class SalesCard extends StatelessWidget {
  final double totalSales;
  final double percentageChange;
  final String description;

  SalesCard({
    required this.totalSales,
    required this.percentageChange,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "\$$totalSales",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                percentageChange > 0
                    ? "+${percentageChange}%"
                    : "${percentageChange}%",
                style: TextStyle(
                  fontSize: 16,
                  color: percentageChange > 0 ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget untuk Social Network Visits
class SocialNetworkVisits extends StatelessWidget {
  final List<Map<String, dynamic>> socialNetworks = [
    {
      'icon': Icons.sports_basketball,
      'name': 'Dribbble',
      'category': 'Community',
      'visits': 579,
      'change': 2.6,
      'color': Colors.pink
    },
    {
      'icon': Icons.business,
      'name': 'Linked In',
      'category': 'Social Media',
      'visits': 2588,
      'change': -0.4,
      'color': Colors.blue
    },
    {
      'icon': Icons.message,
      'name': 'Slack',
      'category': 'Messenger',
      'visits': 794,
      'change': 0.2,
      'color': Colors.green
    },
    {
      'icon': Icons.video_library,
      'name': 'YouTube',
      'category': 'Video Channel',
      'visits': 1578,
      'change': 4.1,
      'color': Colors.red
    },
    {
      'icon': Icons.camera_alt,
      'name': 'Instagram',
      'category': 'Social Network',
      'visits': 3458,
      'change': 8.3,
      'color': Colors.purple
    },
    {
      'icon': Icons.facebook,
      'name': 'Facebook',
      'category': 'Social Network',
      'visits': 2047,
      'change': 1.9,
      'color': Colors.blue
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Social Network Visits",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Aksi saat 'View All' ditekan
                },
                child: Text("View All"),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "8k social visitors",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 16),
          Column(
            children: socialNetworks.map((network) {
              return ListTile(
                leading: Icon(network['icon'], color: network['color']),
                title: Text(network['name']),
                subtitle: Text(network['category']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      network['visits'].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    Text(
                      network['change'] > 0
                          ? "+${network['change']}%"
                          : "${network['change']}%",
                      style: TextStyle(
                        color:
                            network['change'] > 0 ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Text("Welcome to Home Page"),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Page"),
      ),
      body: Center(
        child: Text("Welcome to Settings Page"),
      ),
    );
  }
}

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logout Page"),
      ),
      body: Center(
        child: Text("You have been logged out."),
      ),
    );
  }
}


// Berikut adalah halaman-halaman yang akan dituju dari navigasi sidebar
class IkanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ikan")),
      body: Center(child: Text("Halaman Ikan")),
    );
  }
}

class BarangLainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Barang Lain")),
      body: Center(child: Text("Halaman Barang Lain")),
    );
  }
}

class KondisiIkanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kondisi Ikan")),
      body: Center(child: Text("Halaman Kondisi Ikan")),
    );
  }
}

class UkuranIkanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ukuran Ikan")),
      body: Center(child: Text("Halaman Ukuran Ikan")),
    );
  }
}

class ProdukPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Produk")),
      body: Center(child: Text("Halaman Produk")),
    );
  }
}

class SupplierPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Supplier")),
      body: Center(child: Text("Halaman Supplier")),
    );
  }
}

class Dashboard1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard 1")),
      body: Center(child: Text("Halaman Dashboard 1")),
    );
  }
}

class Menu1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu 1")),
      body: Center(child: Text("Halaman Menu 1")),
    );
  }
}

class Menu2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu 2")),
      body: Center(child: Text("Halaman Menu 2")),
    );
  }
}