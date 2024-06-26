import 'package:campuslink_mobile/presentation/common/views/complaint_view/complaint_view.dart';
import 'package:campuslink_mobile/presentation/common/views/complaint_view/new_complain_view.dart';
import 'package:campuslink_mobile/presentation/common/views/dashboard_view/dashboard_view.dart';
import 'package:campuslink_mobile/presentation/common/views/login_view/forget_password_view/forget_password_view.dart';
import 'package:campuslink_mobile/presentation/common/views/login_view/initial_login_view.dart';
import 'package:campuslink_mobile/presentation/common/views/notification_view/notification_view.dart';
import 'package:campuslink_mobile/presentation/common/views/profile_view/profile_view.dart';
import 'package:campuslink_mobile/presentation/common/views/splash_view/splash_view.dart';
import 'package:campuslink_mobile/presentation/common/views/transport_view/transport_view.dart';
import 'package:campuslink_mobile/presentation/common/views/courses_view/courses_view.dart';
import 'package:campuslink_mobile/presentation/student_features/view/student_sign_up_view/student_sign_up_view.dart';
import 'package:campuslink_mobile/presentation/student_features/view/student_attendance_view/student_attendance_view.dart';
import 'package:campuslink_mobile/presentation/common/views/timetable_view/timetable_view.dart';
import 'package:campuslink_mobile/presentation/teacher_features/hod_features/views/hod_schedule_view/hod_batch_schedule_view.dart';
import 'package:campuslink_mobile/presentation/teacher_features/hod_features/views/hod_schedule_view/hod_faculty_schedule_view.dart';
import 'package:campuslink_mobile/presentation/teacher_features/view/teacher_attendance_view/teacher_attendance_view.dart';
import 'package:campuslink_mobile/presentation/teacher_features/view/teacher_attendance_view/view_attendance_view.dart';
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
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.loginView,
          page: () => const LoginView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.initialLoginView,
          page: () => const InitialLoginView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.signUpViewTeacher,
          page: () => const TeacherSignUpView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.signUpViewStudent,
          page: () => const StudentSignUpView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.dashboardView,
          page: () => const DashboardView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.coursesView,
          page: () => const CoursesView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.timeTableView,
          page: () => const TimeTableView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.notificationView,
          page: () => const NotificationView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.complaintView,
          page: () => const ComplaintView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.transportView,
          page: () => const TransportView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.studentAttendanceView,
          page: () => const StudentAttendanceView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.teacherAttendanceView,
          page: () => const TeacherAttendanceView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.viewAttendanceView,
          page: () => const ViewAttendanceView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.forgetPasswordView,
          page: () => const ForgetPasswordView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.newComplainView,
          page: () => const NewComplainView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.hodBatchScheduleView,
          page: () => const HodBatchScheduleView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.hodFacultyScheduleView,
          page: () => const HodFacultyScheduleView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
         GetPage(
          name: RouteName.profileView,
          page: () => const ProfileView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
      ];
}
