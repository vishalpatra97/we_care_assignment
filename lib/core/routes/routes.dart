import 'package:go_router/go_router.dart';
import 'package:we_care/features/auth/presentation/pages/login_page.dart';
import 'package:we_care/features/auth/presentation/pages/signup_page.dart';
import 'package:we_care/features/booking/presentation/pages/confirmed_booking_page.dart';
import 'package:we_care/features/booking/presentation/pages/medical_records_page.dart';
import 'package:we_care/features/booking/presentation/pages/select_slot_page.dart';
import 'package:we_care/features/home/presentation/pages/dashboard_page.dart';
import 'package:we_care/features/home/presentation/pages/doctor_profile_page.dart';
import 'package:we_care/features/home/presentation/pages/find_doctors_page.dart';
import 'package:we_care/features/splash/splash_page.dart';

class Routes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = 'signup';
  static const String dashboard = 'dashboard';
  static const String findDoctors = 'find-doctors';
  static const String doctorProfile = 'doctor-profile';
  static const String selectSlot = 'select-slot';
  static const String confirmBooking = 'confirm-booking';
  static const String myAppointments = 'my-appointments';

  static final List<GoRoute> allRoutes = [
    GoRoute(path: splash, builder: (context, state) => const SplashPage()),
    GoRoute(path: login, builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/$signup',
      name: signup,
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: '/$dashboard',
      name: dashboard,
      builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(
      path: '/$findDoctors',
      name: findDoctors,
      builder: (context, state) => const FindDoctorsPage(),
    ),
    GoRoute(
      path: '/$doctorProfile',
      name: doctorProfile,
      builder: (context, state) => const DoctorProfilePage(),
    ),
    GoRoute(
      path: '/$selectSlot',
      name: selectSlot,
      builder: (context, state) => const SelectSlotPage(),
    ),
    GoRoute(
      path: '/$confirmBooking',
      name: confirmBooking,
      builder: (context, state) => const ConfirmBookingPage(),
    ),
    GoRoute(
      path: '/$myAppointments',
      name: myAppointments,
      builder: (context, state) => const MedicalRecordsPage(),
    ),
  ];
}
