import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:we_care/core/app/cubit/app_roll_cubit.dart';
import 'package:we_care/core/constants/app_roles.dart';
import 'package:we_care/core/routes/routes.dart';
import 'package:we_care/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:we_care/features/splash/widget/app_role_button.dart';

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
      body: BlocConsumer<AppRoleCubit, AppRoleEnum>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<AppRoleCubit>();
          return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Container(color: Colors.white.withValues(alpha: 0.8)),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: state == AppRoleEnum.patient
                    ? const [
                        FlutterLogo(size: 100),
                        SizedBox(height: 16),
                        Text(
                          'WeCare',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Your health, always first',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Trusted by 2M+ patients across India',
                          style: TextStyle(fontSize: 14),
                        ),
                      ]
                    : [
                        FlutterLogo(size: 100),
                        SizedBox(height: 16),
                        Text(
                          'WeCare',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).primaryColor.withAlpha(30),
                          ),
                          child: Text(
                            'for Doctors',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Trusted by 2M+ patients across India',
                          style: TextStyle(fontSize: 14),
                        ),
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
                              state == AppRoleEnum.patient
                                  ? context.goNamed(Routes.login)
                                  : context.goNamed(Routes.doctorLogin);
                            },
                            child: Text(
                              state == AppRoleEnum.patient
                                  ? 'Login'
                                  : 'Sign In to Practice',
                            ),
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

              Positioned(
                top: 30,
                child: SafeArea(
                  bottom: false,
                  child: SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      children: [
                        AppRoleButton(
                          AppRoleEnum.doctor,
                          title: 'Doctor',
                          selectedEnum: cubit.state,
                          onPressed: () {
                            cubit.switchRole(AppRoleEnum.doctor);
                          },
                        ),
                        SizedBox(width: 16),
                        AppRoleButton(
                          AppRoleEnum.patient,
                          title: 'Patient',
                          selectedEnum: cubit.state,
                          onPressed: () {
                            cubit.switchRole(AppRoleEnum.patient);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
