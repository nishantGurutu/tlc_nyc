import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';

class WindowsSettingsScreen extends StatefulWidget {
  const WindowsSettingsScreen({super.key});

  @override
  State<WindowsSettingsScreen> createState() => _WindowsSettingsScreenState();
}

class _WindowsSettingsScreenState extends State<WindowsSettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _autoSaveEnabled = true;
  String _selectedLanguage = 'English';
  double _fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(24.w),
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
              child: Row(
                children: [
                  Icon(Icons.settings, color: primary, size: 28.sp),
                  SizedBox(width: 12.w),
                  Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Settings Sections
            _buildSettingsSection(
              "General",
              [
                _buildSwitchTile(
                  "Notifications",
                  "Receive notifications for test reminders",
                  Icons.notifications,
                  _notificationsEnabled,
                  (value) => setState(() => _notificationsEnabled = value),
                ),
                _buildSwitchTile(
                  "Dark Mode",
                  "Enable dark theme for the application",
                  Icons.dark_mode,
                  _darkModeEnabled,
                  (value) => setState(() => _darkModeEnabled = value),
                ),
                _buildSwitchTile(
                  "Auto Save",
                  "Automatically save your progress",
                  Icons.save,
                  _autoSaveEnabled,
                  (value) => setState(() => _autoSaveEnabled = value),
                ),
              ],
            ),

            SizedBox(height: 24.h),

            _buildSettingsSection(
              "Appearance",
              [
                _buildDropdownTile(
                  "Language",
                  "Select your preferred language",
                  Icons.language,
                  _selectedLanguage,
                  ['English', 'Spanish', 'French', 'German'],
                  (value) => setState(() => _selectedLanguage = value!),
                ),
                _buildSliderTile(
                  "Font Size",
                  "Adjust the text size",
                  Icons.text_fields,
                  _fontSize,
                  12.0,
                  24.0,
                  (value) => setState(() => _fontSize = value),
                ),
              ],
            ),

            SizedBox(height: 24.h),

            _buildSettingsSection(
              "Account",
              [
                _buildActionTile(
                  "Profile",
                  "Manage your profile information",
                  Icons.person,
                  () => _showProfileDialog(),
                ),
                _buildActionTile(
                  "Privacy",
                  "Control your privacy settings",
                  Icons.privacy_tip,
                  () => _showPrivacyDialog(),
                ),
                _buildActionTile(
                  "Security",
                  "Manage your security settings",
                  Icons.security,
                  () => _showSecurityDialog(),
                ),
              ],
            ),

            SizedBox(height: 24.h),

            _buildSettingsSection(
              "Support",
              [
                _buildActionTile(
                  "Help Center",
                  "Get help and support",
                  Icons.help_center,
                  () => _showHelpDialog(),
                ),
                _buildActionTile(
                  "Contact Us",
                  "Get in touch with our team",
                  Icons.contact_support,
                  () => _showContactDialog(),
                ),
                _buildActionTile(
                  "About",
                  "App version and information",
                  Icons.info,
                  () => _showAboutDialog(),
                ),
              ],
            ),

            SizedBox(height: 24.h),

            // Danger Zone
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.warning, color: Colors.red, size: 20.sp),
                      SizedBox(width: 8.w),
                      Text(
                        "Danger Zone",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "These actions are irreversible. Please proceed with caution.",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.red.shade700,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => _showResetDialog(),
                          icon: Icon(Icons.refresh, size: 18.sp),
                          label: Text("Reset App Data"),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: BorderSide(color: Colors.red),
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _showLogoutDialog(),
                          icon: Icon(Icons.logout, size: 18.sp),
                          label: Text("Logout"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> children) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
          ),
          Divider(height: 1, color: Colors.grey.shade300),
          ...children,
        ],
      ),
    );
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    IconData icon,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return ListTile(
      leading: Icon(icon, color: primary, size: 24.sp),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: blackColor,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 14.sp,
          color: darkGreyColor,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: primary,
      ),
    );
  }

  Widget _buildDropdownTile(
    String title,
    String subtitle,
    IconData icon,
    String value,
    List<String> options,
    ValueChanged<String?> onChanged,
  ) {
    return ListTile(
      leading: Icon(icon, color: primary, size: 24.sp),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: blackColor,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 14.sp,
          color: darkGreyColor,
        ),
      ),
      trailing: DropdownButton<String>(
        value: value,
        onChanged: onChanged,
        underline: Container(),
        items: options.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSliderTile(
    String title,
    String subtitle,
    IconData icon,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
  ) {
    return ListTile(
      leading: Icon(icon, color: primary, size: 24.sp),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: blackColor,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14.sp,
              color: darkGreyColor,
            ),
          ),
          SizedBox(height: 8.h),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: 12,
            activeColor: primary,
            onChanged: onChanged,
          ),
          Text(
            "${value.toStringAsFixed(1)}sp",
            style: TextStyle(
              fontSize: 12.sp,
              color: darkGreyColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: primary, size: 24.sp),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: blackColor,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 14.sp,
          color: darkGreyColor,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16.sp, color: darkGreyColor),
      onTap: onTap,
    );
  }

  void _showProfileDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        title: Text("Profile Settings"),
        content: Text("Profile management features coming soon!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showPrivacyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        title: Text("Privacy Settings"),
        content: Text("Privacy settings will be available in a future update."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showSecurityDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        title: Text("Security Settings"),
        content: Text("Security management features coming soon!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        title: Text("Help Center"),
        content: Text("Help center and documentation will be available soon."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showContactDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        title: Text("Contact Us"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Get in touch with our support team:"),
            SizedBox(height: 16.h),
            Text("Email: support@tlcnyc.com"),
            Text("Phone: +1 (555) 123-4567"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        title: Text("About TLC NYC"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Version: 1.0.0"),
            Text("Build: 2024.01.01"),
            SizedBox(height: 8.h),
            Text("A comprehensive test preparation platform for TLC NYC."),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showResetDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        title: Text("Reset App Data"),
        content: Text("This will reset all app data and settings. This action cannot be undone."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Implement reset functionality
              Get.snackbar(
                "Reset",
                "App data has been reset",
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text("Reset"),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        title: Text("Logout"),
        content: Text("Are you sure you want to logout? You will need to login again to access the app."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Implement logout functionality
              Get.snackbar(
                "Logout",
                "You have been logged out",
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }
}

