import 'package:go_router/go_router.dart';
import 'package:we_care/features/auth/presentation/pages/doctor_login_page.dart';
import 'package:we_care/features/auth/presentation/pages/login_page.dart';
import 'package:we_care/features/auth/presentation/pages/signup_page.dart';
import 'package:we_care/features/booking/presentation/pages/confirmed_booking_page.dart';
import 'package:we_care/features/booking/presentation/pages/medical_records_page.dart';
import 'package:we_care/features/booking/presentation/pages/select_slot_page.dart';
import 'package:we_care/features/doctor_schedule/presentation/pages/doctor_appointment_details_page.dart';
import 'package:we_care/features/doctor_schedule/presentation/pages/doctor_my_patient.dart';
import 'package:we_care/features/doctor_schedule/presentation/pages/doctor_schedule_page.dart';
import 'package:we_care/features/doctor_schedule/presentation/pages/record_saved_page.dart';
import 'package:we_care/features/home/presentation/pages/dashboard_page.dart';
import 'package:we_care/features/home/presentation/pages/doctor_dashboard_page.dart';
import 'package:we_care/features/home/presentation/pages/doctor_profile_page.dart';
import 'package:we_care/features/home/presentation/pages/find_doctors_page.dart';
import 'package:we_care/features/splash/splash_page.dart';

class Routes {
  static const String splash = '/';
  static const String login = 'login';
  static const String signup = 'signup';
  static const String dashboard = 'dashboard';
  static const String findDoctors = 'find-doctors';
  static const String doctorProfile = 'doctor-profile';
  static const String selectSlot = 'select-slot';
  static const String confirmBooking = 'confirm-booking';
  static const String myAppointments = 'my-appointments';
  //
  static const String doctorLogin = 'doctor-login';
  static const String doctorDashboard = 'doctor-dashboard';
  static const String doctorSchedule = 'doctor-schedule';
  static const String recordSaved = 'record-saved';
  static const String doctorAppointmentDetails = 'doctor-appointment-details';
  static const String doctorMyPatient = 'doctor-my-patient';

  static final List<GoRoute> allRoutes = [
    GoRoute(
      path: '/$splash',
      name: splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/$login',
      name: login,
      builder: (context, state) => const LoginPage(),
    ),
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

    // Doctor
    GoRoute(
      path: '/$doctorLogin',
      name: doctorLogin,
      builder: (context, state) => const DoctorLoginPage(),
    ),
    GoRoute(
      path: '/$doctorDashboard',
      name: doctorDashboard,
      builder: (context, state) => const DoctorDashboardPage(),
    ),
    GoRoute(
      path: '/$doctorSchedule',
      name: doctorSchedule,
      builder: (context, state) => const DoctorSchedulePage(),
    ),
    GoRoute(
      path: '/$doctorAppointmentDetails',
      name: doctorAppointmentDetails,
      builder: (context, state) => const DoctorAppointmentDetailsPage(),
    ),
    GoRoute(
      path: '/$recordSaved',
      name: recordSaved,
      builder: (context, state) => const RecordSavedPage(),
    ),
    GoRoute(
      path: '/$doctorMyPatient',
      name: doctorMyPatient,
      builder: (context, state) => const MyPatientPage(),
    ),
  ];
}
