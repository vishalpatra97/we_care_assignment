import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:we_care/core/routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  bool _isInitialized = false;

  Future<void> _initializeApp() async {
    _isInitialized = false;
    // Simulate some initialization work (e.g., loading resources, checking auth status)
    await Future.delayed(const Duration(seconds: 5));
    if (mounted) {
      _isInitialized = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Container(color: Colors.white.withOpacity(0.8)),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              FlutterLogo(size: 100),
              SizedBox(height: 16),
              Text(
                'WeCare',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text('Your health, always first', style: TextStyle(fontSize: 16)),
            ],
          ),
          Positioned(
            bottom: 32,
            child: SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: _isInitialized
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          context.go(Routes.login);
                        },
                        child: Text('Login'),
                      ),
                    )
                  : Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 8),
                        Text('Initializing...'),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
