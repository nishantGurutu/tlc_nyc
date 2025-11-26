import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/controller/home_controller.dart';
import 'package:tlc_nyc/view/screens/widgets/windows_plateform/add_question.dart';
import 'package:tlc_nyc/view/screens/widgets/windows_plateform/settings_screen.dart';

class WindowsDashboardScreen extends StatefulWidget {
  const WindowsDashboardScreen({super.key});

  @override
  State<WindowsDashboardScreen> createState() => _WindowsDashboardScreenState();
}

class _WindowsDashboardScreenState extends State<WindowsDashboardScreen> {
  final HomeController controller = Get.put(HomeController());
  int selectedIndex = 0;
  int selectedTestIndex = -1;

  @override
  void initState() {
    super.initState();
    controller.questionTypeListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f9ff),
      body: Row(
        children: [
          // Sidebar Navigation
          Container(
            width: 280.w,
            color: const Color(0xfff4f7fe),
            child: Column(
              children: [
                // Header with user info
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: primary,
                        child: const Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "TLC NYC User",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Test Preparation Platform",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: darkGreyColor,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Navigation Menu
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    children: [
                      _buildNavItem(Icons.dashboard, "Dashboard", 0),
                      _buildNavItem(Icons.quiz, "Tests", 1),
                      _buildNavItem(Icons.add_circle, "Add Questions", 2),
                      _buildNavItem(Icons.analytics, "Analytics", 3),
                      _buildNavItem(Icons.settings, "Settings", 4),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Main Content Area
          Expanded(
            child: Column(
              children: [
                // Top App Bar
                Container(
                  height: 60.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _getPageTitle(),
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.workspace_premium, color: Colors.white, size: 16.sp),
                            SizedBox(width: 4.w),
                            Text(
                              "TLC NYC",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Content Area
                Expanded(
                  child: _buildContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String title, int index) {
    bool isSelected = selectedIndex == index;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
              selectedTestIndex = -1;
            });
          },
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: isSelected ? primary.withOpacity(0.1) : Colors.transparent,
              borderRadius: BorderRadius.circular(8.r),
              border: isSelected ? Border.all(color: primary, width: 1) : null,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isSelected ? primary : darkGreyColor,
                  size: 20.sp,
                ),
                SizedBox(width: 12.w),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected ? primary : blackColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getPageTitle() {
    switch (selectedIndex) {
      case 0:
        return "Dashboard";
      case 1:
        return "Available Tests";
      case 2:
        return "Add Questions";
      case 3:
        return "Analytics";
      case 4:
        return "Settings";
      default:
        return "Dashboard";
    }
  }

  Widget _buildContent() {
    switch (selectedIndex) {
      case 0:
        return _buildDashboardContent();
      case 1:
        return _buildTestsContent();
      case 2:
        return WindowsAddQuestionScreen();
      case 3:
        return _buildAnalyticsContent();
      case 4:
        return WindowsSettingsScreen();
      default:
        return _buildDashboardContent();
    }
  }

  Widget _buildDashboardContent() {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primary, primary.withOpacity(0.8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: primary.withOpacity(0.3),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to TLC NYC",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Your comprehensive test preparation platform",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard("Total Tests", "12", Icons.quiz),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: _buildStatCard("Completed", "8", Icons.check_circle),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Quick Actions
            Text(
              "Quick Actions",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            SizedBox(height: 16.h),

            Row(
              children: [
                Expanded(
                  child: _buildActionCard(
                    "Start New Test",
                    Icons.play_arrow,
                    primary,
                    () {
                      setState(() => selectedIndex = 1);
                    },
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: _buildActionCard(
                    "Add Questions",
                    Icons.add_circle,
                    Colors.green,
                    () {
                      setState(() => selectedIndex = 2);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestsContent() {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Obx(() {
        if (controller.isGroupLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 1.5,
          ),
          itemCount: controller.groupListData.length,
          itemBuilder: (context, index) {
            final testType = controller.groupListData[index];
            return _buildTestCard(testType.qtypENAME ?? "", index);
          },
        );
      }),
    );
  }

  Widget _buildTestCard(String testName, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              selectedTestIndex = index;
            });
            // Navigate to test screen
            Get.to(() => WindowsTestScreen(
              testName: testName,
              testTypeId: controller.groupListData[index].qtypECODE ?? 0,
            ));
          },
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.quiz,
                  size: 32.sp,
                  color: primary,
                ),
                SizedBox(height: 8.h),
                Text(
                  testName,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.h),
                Text(
                  "Click to start",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: darkGreyColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnalyticsContent() {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.analytics, size: 64.sp, color: primary),
            SizedBox(height: 16.h),
            Text(
              "Analytics Dashboard",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Coming Soon",
              style: TextStyle(
                fontSize: 16.sp,
                color: darkGreyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 24.sp),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 32.sp, color: color),
                SizedBox(height: 12.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
