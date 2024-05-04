import 'package:campuslink_mobile/data/models/batch_model/batch_model.dart';
import 'package:campuslink_mobile/data/models/course_model/course_model.dart';
import 'package:campuslink_mobile/data/models/notification_model/notification_model.dart';
import 'package:campuslink_mobile/data/models/user_data_model/address_model/address_model.dart';
import 'package:campuslink_mobile/data/models/user_data_model/student_data_model/student_data_model.dart';
import 'package:campuslink_mobile/data/models/user_data_model/teacher_data_model/teacher_data_model.dart';
import 'package:campuslink_mobile/utils/enums/enums.dart';

import '../../models/complaint_model/complaint_model.dart';
import '../../models/time_table_model/time_table_model.dart';

class SampleData {


  
  final currentUserStudent = StudentDataModel(
    userId: '123456',
    email: 'ahmedkhan12@gmail.com',
    name: 'Ahmed Khan',
    fatherName: 'Ali Khan',
    cnic: '12345-6789012-3',
    phone: '032-1234567',
    address: Address(
        city: 'Karachi', state: 'Sindh', street: '56', zipcode: '74000'),
    role: UserRole.student,
    isBlocked: true,
    rollNo: 41601,
    batchId: "CS34",
  );
  final currentUserTeacher =   TeacherDataModel(
      role: UserRole.teacher,
      address: Address(
          city: "Lahore", state: "Punjab", street: "12", zipcode: "5400"),
      cnic: "12345-1234567-1",
      departmentId: "3",
      email: "johnsmith@gmail.com",
      fatherName: "John",
      name: "John Smith",
      phone: "03001234567",
      userId: "12345678901",
      isBlocked: false,
      isHod: true,
    );

  List<BatchModel> listOfBatches = [
    BatchModel(
        batchId: "CS34",
        departmentId: "CS",
        program: "BS",
        semester: "4th",
        session: "2022-24"),
    BatchModel(
        batchId: 'ESCT',
        departmentId: 'GX',
        program: 'BS',
        semester: '1st',
        session: '2017-2030'),
    BatchModel(
        batchId: 'PIHB',
        departmentId: 'LJ',
        program: 'MS',
        semester: '3rd',
        session: '2015-2023'),
    BatchModel(
        batchId: 'WQXZ',
        departmentId: 'UV',
        program: 'PhD',
        semester: '2nd',
        session: '2018-2026'),
    BatchModel(
        batchId: 'TGBN',
        departmentId: 'OP',
        program: 'BS',
        semester: '4th',
        session: '2016-2024'),
    BatchModel(
        batchId: 'M071',
        departmentId: 'QP',
        program: 'PhD',
        semester: '2nd',
        session: '2021-2030')
  ];
  final List<TimeTableModel> listOfTimeTable = [
    TimeTableModel(
        batchId: 'Batch-404',
        courseCode: 'CSI-516',
        dayOfWeek: 'Monday',
        starttime: '8:00AM',
        endtime: '9:00AM',
        roomId: 40,
        block: "A",
        teacherId: '42355443543'),
    TimeTableModel(
        batchId: 'Batch-401',
        courseCode: 'CSI-604',
        dayOfWeek: 'Tuesday',
        starttime: '11:00AM',
        endtime: '12:00PM',
        roomId: 43,
        block: "c",
        teacherId: '12345678903'),
    TimeTableModel(
        batchId: 'CS34',
        courseCode: 'CSI-512',
        dayOfWeek: 'Wednesday',
        starttime: '9:00AM',
        endtime: '10:00AM',
        roomId: 41,
        block: "Hamza",
        teacherId: '12345678902'),
    TimeTableModel(
        batchId: 'Batch-403',
        courseCode: 'CSI-602',
        dayOfWeek: 'Thursday',
        starttime: '10:00AM',
        endtime: '11:00AM',
        roomId: 42,
        block: "Quaid e Azam",
        teacherId: '12345678901'),
    TimeTableModel(
        batchId: 'CS34',
        courseCode: 'CSI-508',
        dayOfWeek: 'Friday',
        starttime: '8:00AM',
        endtime: '9:00AM',
        roomId: 40,
        block: "c",
        teacherId: '10987654321'),
    TimeTableModel(
        batchId: 'Batch-401',
        courseCode: 'CSI-604',
        dayOfWeek: 'Monday',
        starttime: '11:00AM',
        endtime: '12:00PM',
        roomId: 43,
        block: "c",
        teacherId: '11223344556'),
    TimeTableModel(
        batchId: 'CS34',
        courseCode: 'CSI-504',
        dayOfWeek: 'Tuesday',
        starttime: '9:00AM',
        endtime: '10:00AM',
        roomId: 41,
        block: "c",
        teacherId: '12345678901'),
    TimeTableModel(
        batchId: 'Batch-403',
        courseCode: 'CSI-520',
        dayOfWeek: 'Wednesday',
        starttime: '10:00AM',
        endtime: '11:00AM',
        roomId: 42,
        block: "c",
        teacherId: '10987654321'),
  ];

  TeacherDataModel model = TeacherDataModel(
    role: UserRole.teacher,
    address:
        Address(city: "Lahore", state: "Punjab", street: "34", zipcode: "3423"),
    cnic: "32432-4323456-5",
    departmentId: "1",
    email: "teachress@gmail.com",
    fatherName: "Ali",
    name: "none",
    phone: "03001234567",
    userId: "42355443543",
    isBlocked: false,
    isHod: false,
  );

  final List<TeacherDataModel> listOfTeachers = [
    TeacherDataModel(
      role: UserRole.teacher,
      address: Address(
          city: "Lahore", state: "Punjab", street: "12", zipcode: "5400"),
      cnic: "12345-1234567-1",
      departmentId: "3",
      email: "johnsmith@gmail.com",
      fatherName: "John",
      name: "John Smith",
      phone: "03001234567",
      userId: "12345678901",
      isBlocked: false,
      isHod: true,
    ),
    TeacherDataModel(
      role: UserRole.teacher,
      address: Address(
          city: "Lahore", state: "Punjab", street: "24", zipcode: "5400"),
      cnic: "23456-2345678-2",
      departmentId: "4",
      email: "janedoe@yahoo.com",
      fatherName: "Jane",
      name: "Jane Doe",
      phone: "03007654321",
      userId: "10987654321",
      isBlocked: true,
      isHod: false,
    ),
    TeacherDataModel(
      role: UserRole.teacher,
      address: Address(
          city: "Lahore", state: "Punjab", street: "36", zipcode: "5400"),
      cnic: "34567-3456789-3",
      departmentId: "5",
      email: "alicejohnson@hotmail.com",
      fatherName: "Alice",
      name: "Alice Johnson",
      phone: "03009876543",
      userId: "11223344556",
      isBlocked: false,
      isHod: true,
    ),
    TeacherDataModel(
      role: UserRole.teacher,
      address: Address(
          city: "Lahore", state: "Punjab", street: "48", zipcode: "5400"),
      cnic: "45678-4567890-4",
      departmentId: "6",
      email: "bobwilliams@gmail.com",
      fatherName: "Bob",
      name: "Bob Williams",
      phone: "03001122334",
      userId: "12345678902",
      isBlocked: true,
      isHod: false,
    ),
    TeacherDataModel(
      role: UserRole.teacher,
      address: Address(
          city: "Lahore", state: "Punjab", street: "50", zipcode: "5400"),
      cnic: "56789-5678901-5",
      departmentId: "7",
      email: "charliedavis@yahoo.com",
      fatherName: "Charlie",
      name: "Charlie Davis",
      phone: "03002233445",
      userId: "12345678903",
      isBlocked: false,
      isHod: true,
    ),
  ];
  final List<CourseModel> listOfCourses = [
    CourseModel(
        courseCode: 'CSI-520',
        courseName: 'Computer Networks',
        creditHours: '3(2-1)',
        departmentId: 'CS789'),
    CourseModel(
        courseCode: 'CSI-516',
        courseName: 'Software Engineering',
        creditHours: '4(4-0)',
        departmentId: 'CS101'),
    CourseModel(
        courseCode: 'CSI-512',
        courseName: 'Computer Networks',
        creditHours: '3(3-0)',
        departmentId: 'CS456'),
    CourseModel(
        courseCode: 'CSI-508',
        courseName: 'Database Systems',
        creditHours: '3(2-1)',
        departmentId: 'CS789'),
    CourseModel(
        courseCode: 'CSI-504',
        courseName: 'Operating System',
        creditHours: '4(4-0)',
        departmentId: 'CS789'),
  ];
  List<NotificationModel> randomNotifications = [
    NotificationModel(
        id: "5103",
        title: 'Title 10',
        body: 'Body message 78',
        audience: Audience.faculty,
        departmentId: 'Dept 2',
        dateTime: DateTime.parse('2023-01-13 21:57:34')),
    NotificationModel(
        id: "8795",
        title: 'Title 67',
        body: 'Body message 23',
        audience: Audience.students,
        departmentId: 'CS',
        dateTime: DateTime.parse('2021-06-24 03:12:48')),
    NotificationModel(
        id: "2941",
        title: 'Title 26',
        body: 'Body message 95',
        audience: Audience.faculty,
        departmentId: 'Dept 4',
        dateTime: DateTime.parse('2022-09-17 09:43:19')),
    NotificationModel(
        id: "6732",
        title: 'Title 52',
        body: 'Body message 64',
        audience: Audience.students,
        departmentId: 'Dept 1',
        dateTime: DateTime.parse('2020-03-21 16:04:06')),
    NotificationModel(
        id: "8805",
        title: 'Title 71',
        body: 'Body message 81',
        audience: Audience.students,
        departmentId: 'CS',
        dateTime: DateTime.parse('2023-01-13 21:57:34'))
  ];

  List<ComplaintModel> listOfComplaint = [
    ComplaintModel(
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      complainantId: "c1029",
      dateTime: DateTime.parse('2023-01-13 21:57:34'),
      id: "a1b2c3d4",
      title: "Noise Complaint",
    ),
    ComplaintModel(
      body:
          "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      complainantId: "c1030",
      dateTime: DateTime.parse('2023-01-13 21:57:34'),
      id: "e5f6g7h8",
      title: "Parking Issue",
    ),
    ComplaintModel(
      body:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.",
      complainantId: "c1031",
      dateTime: DateTime.parse('2023-01-13 21:57:34'),
      id: "i9j0k1l2",
      title: "Street Light Outage",
    ),
    ComplaintModel(
      body: "Nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor.",
      complainantId: "c1032",
      dateTime: DateTime.parse('2023-01-13 21:57:34'),
      id: "m3n4o5p6",
      title: "Water Leakage",
    ),
    ComplaintModel(
      body:
          "In reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
      complainantId: "c1033",
      dateTime: DateTime.parse('2023-01-13 21:57:34'),
      id: "q7r8s9t0",
      title: "Damaged Road",
    ),
  ];
}
