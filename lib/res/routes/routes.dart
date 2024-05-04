import 'package:campuslink_mobile/presentation/common/views/complaint_view/complaint_view.dart';
import 'package:campuslink_mobile/presentation/common/views/login_view/initial_login_view.dart';
import 'package:campuslink_mobile/presentation/common/views/notification_view/notification_view.dart';
import 'package:campuslink_mobile/presentation/common/views/splash_view/splash_view.dart';
import 'package:campuslink_mobile/presentation/common/views/transport_view/transport_view.dart';
import 'package:campuslink_mobile/presentation/common/views/courses_view/courses_view.dart';
import 'package:campuslink_mobile/presentation/student_features/view/student_sign_up_view/student_sign_up_view.dart';
import 'package:campuslink_mobile/presentation/student_features/view/student_attendance_view/student_attendance_view.dart';
import 'package:campuslink_mobile/presentation/student_features/view/student_dashboard_view/student_dashboard_view.dart';
import 'package:campuslink_mobile/presentation/common/views/timetable_view/timetable_view.dart';
import 'package:campuslink_mobile/presentation/teacher_features/view/teacher_dashboard_view/teacher_dashboard_view.dart';
import 'package:campuslink_mobile/presentation/teacher_features/view/teacher_sign_up_view/teacher_sign_up_view.dart';
import 'package:campuslink_mobile/res/routes/routes_name.dart';
import 'package:get/get.dart';

import '../../presentation/common/views/login_view/login_view.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashView,
          page: () => const SplashView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.loginView,
          page: () => const LoginView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.initialLoginView,
          page: () => const InitialLoginView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.signUpViewTeacher,
          page: () => const TeacherSignUpView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.signUpViewStudent,
          page: () => const StudentSignUpView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.studentDashboardView,
          page: () => const StudentDashboardView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.coursesView,
          page: () => const CoursesView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.timeTableView,
          page: () => const TimeTableView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.notificationView,
          page: () => const NotificationView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.complaintView,
          page: () => const ComplaintView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.transportView,
          page: () => const TransportView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.studentAttendanceView,
          page: () => const StudentAttendanceView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.teacherDashboardView,
          page: () => const TeacherDashboardView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
