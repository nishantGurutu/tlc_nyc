import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tlc_nyc/constant/color_constant.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f9ff),
      body: Row(
        children: [
          Container(
            width: 60.w,
            color: const Color(0xfff4f7fe),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.purple.shade100,
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Lindsey Carder",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Your current standing is 32",
                    style: TextStyle(fontSize: 4.sp, color: Colors.purple),
                  ),
                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: LinearProgressIndicator(
                      value: 32 / 40,
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.purple,
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(height: 30),

                  sidebarTile(Icons.dashboard, "Dashboard", 0),
                  sidebarTile(Icons.emoji_events, "Leaderboard", 1),
                  sidebarTile(Icons.bar_chart, "Stats", 2),
                  sidebarTile(Icons.shopping_cart, "Shop", 3),
                  sidebarTile(Icons.developer_board, "Prototype", 4),
                  sidebarTile(Icons.more_horiz, "More", 5),
                ],
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top AppBar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 3.w,
                              vertical: 3.h,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.workspace_premium,
                                  color: Colors.white,
                                ),
                                Text(
                                  "TLC NYC",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 6.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xff6a4dfd),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Member since Dec 2023",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 3.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "Welcome, Leo George",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 5.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "Complete 7/80 Test",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 7.sp,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          LinearProgressIndicator(
                            value: 7 / 20,
                            minHeight: 10,
                            color: Colors.white,
                            backgroundColor: Colors.white24,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          SizedBox(height: 4.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "20 Days",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 6.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Your Test",
                      style: TextStyle(
                        fontSize: 6.sp,
                        fontWeight: FontWeight.bold,
                        color: primary,
                      ),
                    ),
                    const SizedBox(height: 15),
                    taskTile("Complete Test", 40, 40, completed: true),
                    Row(
                      children: [
                        Container(
                          height: 30.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==== Sidebar Widget ====
  Widget sidebarTile(IconData icon, String title, int index) {
    bool isSelected = selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() => selectedIndex = index);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border:
              isSelected
                  ? Border.all(color: Colors.purple.shade200, width: 2)
                  : null,
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.purple),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  // ==== Task Widget ====
  Widget taskTile(String name, int done, int total, {bool completed = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            offset: Offset(0, 3),
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
                name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (completed)
                const Icon(Icons.check_circle, color: Colors.green, size: 22),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: done / total,
            minHeight: 10,
            color: Colors.green,
            backgroundColor: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(6),
          ),
          const SizedBox(height: 6),
          Text(
            "$done / $total",
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
