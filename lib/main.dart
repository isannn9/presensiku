import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDRU4UpwPszWqaJh5pGWBnSBc_nEuOGSwY",
      authDomain: "data-login-ikhsan.firebaseapp.com",
      projectId: "data-login-ikhsan",
      storageBucket: "data-login-ikhsan.firebasestorage.app",
      messagingSenderId: "1002720640355",
      appId: "1:1002720640355:web:28fd025986604af110e756",
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Presensi Online',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: PilihLoginPage(),
    );
  }
}

class PilihLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff0D47A1),
              Color(0xff42A5F5),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.school_rounded,
                        color: Colors.white,
                        size: 55,
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      'PRESENSI SISWA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'SMKN 1 SANDEN',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 50),
                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Color(0xff1565C0),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LoginSiswaPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.person),
                        label: Text(
                          'Login Siswa',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: BorderSide(
                            color: Colors.white,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LoginAdminPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.admin_panel_settings),
                        label: Text(
                          'Login Admin',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'powered by Firebase Cloud Firestore',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginSiswaPage extends StatefulWidget {
  @override
  State<LoginSiswaPage> createState() => _LoginSiswaPageState();
}

class _LoginSiswaPageState extends State<LoginSiswaPage> {
  final namaCtrl = TextEditingController();
  final kelasCtrl = TextEditingController();

  Widget customField({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            prefixIcon: Icon(icon),
            contentPadding: EdgeInsets.symmetric(vertical: 18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff42A5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  size: 55,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Login Siswa',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Masukkan nama dan kelas Anda',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 35),
              Container(
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [
                    customField(
                      label: 'Nama Lengkap',
                      hint: 'Masukkan Nama Lengkap',
                      icon: Icons.person_outline,
                      controller: namaCtrl,
                    ),
                    SizedBox(height: 22),
                    customField(
                      label: 'Kelas',
                      hint: 'Masukkan Kelas',
                      icon: Icons.school_outlined,
                      controller: kelasCtrl,
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff1565C0),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {
                          String nama = namaCtrl.text.trim();
                          String kelas = kelasCtrl.text.trim();

                          if (nama.isEmpty) {
                            nama = "Siswa";
                          }

                          if (kelas.isEmpty) {
                            kelas = "Belum Diisi";
                          }

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DashboardSiswa(
                                nama: nama,
                                kelas: kelas,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'MASUK',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
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
    );
  }
}

// ============================
// DASHBOARD SISWA - DENGAN DETAIL
// ============================
class DashboardSiswa extends StatefulWidget {
  final String nama;
  final String kelas;

  DashboardSiswa({
    required this.nama,
    required this.kelas,
  });

  @override
  State<DashboardSiswa> createState() => _DashboardSiswaState();
}

class _DashboardSiswaState extends State<DashboardSiswa> {
  // --- State untuk presensi terakhir ---
  String? lastStatus;
  String? lastTime;
  String? lastDate;

  // --- Helper: warna berdasarkan status ---
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Masuk':
        return Colors.green;
      case 'Keluar':
        return Colors.blue;
      case 'Izin':
        return Colors.orange;
      case 'Sakit':
        return Colors.purple;
      case 'Alpha':
        return Colors.red;
      default:
        return Colors.green;
    }
  }

  // --- Helper: icon berdasarkan status ---
  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Masuk':
        return Icons.login_rounded;
      case 'Keluar':
        return Icons.logout_rounded;
      case 'Izin':
        return Icons.work_rounded;
      case 'Sakit':
        return Icons.local_hospital_rounded;
      case 'Alpha':
        return Icons.cancel_rounded;
      default:
        return Icons.check_circle;
    }
  }

  // --- Helper: format tanggal Indonesia ---
  String _formatDate(DateTime date) {
    const months = [
      '',
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];
    return '${date.day} ${months[date.month]} ${date.year}';
  }

  // --- Dialog Konfirmasi Presensi ---
  void konfirmasiPresensi(String status) {
    final statusColor = _getStatusColor(status);
    final statusIcon = _getStatusIcon(status);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                statusIcon,
                size: 52,
                color: statusColor,
              ),
              SizedBox(height: 18),
              Text(
                'Konfirmasi Presensi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  status.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              SizedBox(height: 6),
              Text(
                '${widget.nama} - ${widget.kelas}',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.grey,
                      side: BorderSide(color: Colors.grey.shade300),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Batal',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: statusColor,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      simpanPresensi(status);
                    },
                    child: Text(
                      'Ya, Konfirmasi',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  // --- Simpan Presensi ke Firebase ---
  Future<void> simpanPresensi(String status) async {
    final now = DateTime.now();

    // Data Firebase TETAP SAMA - tidak diubah
    await FirebaseFirestore.instance.collection('presensi').add({
      'nama': widget.nama,
      'kelas': widget.kelas,
      'status': status,
      'waktu': now.toIso8601String(),
    });

    setState(() {
      lastStatus = status;
      lastTime =
          '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
      lastDate = _formatDate(now);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        content: Text('Presensi "$status" berhasil dicatat'),
      ),
    );
  }

  // --- Tombol Presensi ---
  Widget tombol(
    String title,
    IconData icon,
    Color color,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: () => konfirmasiPresensi(title),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color.withOpacity(0.12),
              child: Icon(
                icon,
                color: color,
                size: 30,
              ),
            ),
            SizedBox(height: 15),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F8FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff0D47A1),
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo, ${widget.nama}! 👋',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.kelas,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => PilihLoginPage(),
                ),
                (route) => false,
              );
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            // --- Card Jam Presensi ---
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 25,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff0D47A1),
                    Color(0xff42A5F5),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'PRESENSI HARI INI',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  StreamBuilder(
                    stream: Stream.periodic(Duration(seconds: 1)),
                    builder: (context, snapshot) {
                      final now = DateTime.now();
                      return Text(
                        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // --- Card Detail Presensi Terakhir ---
            if (lastStatus != null)
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 22, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color:
                                _getStatusColor(lastStatus!).withOpacity(0.12),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _getStatusIcon(lastStatus!),
                            color: _getStatusColor(lastStatus!),
                            size: 28,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lastStatus!,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: _getStatusColor(lastStatus!),
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 16,
                                    color: Colors.black45,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    lastTime!,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    size: 14,
                                    color: Colors.black45,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    lastDate!,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 18,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Presensi berhasil dicatat',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            if (lastStatus != null) SizedBox(height: 22),

            // --- Label Pilih Status ---
            Text(
              'Pilih Status Presensi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 20),

            // --- Grid Tombol Presensi ---
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
                children: [
                  tombol('Masuk', Icons.login, Colors.green),
                  tombol('Keluar', Icons.logout, Colors.blue),
                  tombol('Izin', Icons.work, Colors.orange),
                  tombol('Sakit', Icons.local_hospital, Colors.purple),
                  tombol('Alpha', Icons.cancel, Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================
// LOGIN ADMIN
// ============================
class LoginAdminPage extends StatefulWidget {
  @override
  State<LoginAdminPage> createState() => _LoginAdminPageState();
}

class _LoginAdminPageState extends State<LoginAdminPage> {
  final userCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  String? error;
  bool hide = true;

  void login() {
    if (userCtrl.text == 'admin' && passCtrl.text == 'admin123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => DashboardAdmin(),
        ),
      );
    } else {
      setState(() {
        error = 'Username atau password salah';
      });
    }
  }

  Widget field({
    required String title,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool password = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller,
          obscureText: password ? hide : false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            prefixIcon: Icon(icon),
            suffixIcon: password
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        hide = !hide;
                      });
                    },
                    icon: Icon(
                      hide ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8F5E9),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.admin_panel_settings,
                  size: 55,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Login Admin',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Khusus untuk guru / admin sekolah',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 35),
              Container(
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [
                    field(
                      title: 'Username',
                      hint: 'Masukkan username',
                      icon: Icons.person_outline,
                      controller: userCtrl,
                    ),
                    SizedBox(height: 20),
                    field(
                      title: 'Password',
                      hint: 'Masukkan password',
                      icon: Icons.lock_outline,
                      controller: passCtrl,
                      password: true,
                    ),
                    if (error != null)
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          error!,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: login,
                        child: Text(
                          'MASUK ADMIN',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
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
    );
  }
}

// ============================
// DASHBOARD ADMIN
// ============================
class DashboardAdmin extends StatelessWidget {
  Widget kotak(
    String jumlah,
    String title,
    Color color,
  ) {
    return Expanded(
      child: Container(
        height: 90,
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              jumlah,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: 6),
            Text(title),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F8F4),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Dashboard Admin',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => PilihLoginPage(),
                ),
                (route) => false,
              );
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('presensi')
            .orderBy('waktu', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final data = snapshot.data!.docs;

          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff1B5E20),
                        Color(0xff43A047),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Presensi Hari Ini',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${data.length}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Total presensi tercatat',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    kotak(
                      '${data.where((e) => (e.data() as Map<String, dynamic>)['status'] == 'Masuk').length}',
                      'Masuk',
                      Colors.green,
                    ),
                    kotak(
                      '${data.where((e) => (e.data() as Map<String, dynamic>)['status'] == 'Keluar').length}',
                      'Keluar',
                      Colors.blue,
                    ),
                    kotak(
                      '${data.where((e) => (e.data() as Map<String, dynamic>)['status'] == 'Izin').length}',
                      'Izin',
                      Colors.orange,
                    ),
                    kotak(
                      '${data.where((e) => (e.data() as Map<String, dynamic>)['status'] == 'Sakit').length}',
                      'Sakit',
                      Colors.purple,
                    ),
                    kotak(
                      '${data.where((e) => (e.data() as Map<String, dynamic>)['status'] == 'Alpha').length}',
                      'Alpha',
                      Colors.red,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final item = data[index].data() as Map<String, dynamic>;

                      return Container(
                        margin: EdgeInsets.only(bottom: 14),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 26,
                              backgroundColor: Colors.green.withOpacity(0.12),
                              child: Icon(
                                Icons.person,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['nama'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    item['kelas'],
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  item['status'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  item['waktu'].toString().substring(11, 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
