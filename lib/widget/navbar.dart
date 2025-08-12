import 'dart:ui';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final int notificationCount;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.notificationCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final glassColor = (isDark ? Colors.black : Colors.white).withOpacity(0.75);
    final borderColor = (isDark ? Colors.white12 : Colors.black12);

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: glassColor,
                border: Border(top: BorderSide(color: borderColor)),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 20,
                    offset: Offset(0, 8),
                    color: Color(0x1A000000),
                  ),
                ],
              ),
              child: NavigationBar(
                height: 64,
                elevation: 0,
                backgroundColor: Colors.transparent,
                indicatorColor: Colors.blue[400]!.withOpacity(0.2),
                labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                selectedIndex: currentIndex,
                onDestinationSelected: onTap,
                destinations: [
                  _buildDestination(
                    Icons.home_outlined,
                    Icons.home_rounded,
                    'Beranda',
                    0,
                  ),
                  _buildDestination(
                    Icons.grid_view_outlined,
                    Icons.grid_view_rounded,
                    'Modul',
                    1,
                  ),
                  _buildDestinationNotif(
                    Icons.notifications_outlined,
                    Icons.notifications_rounded,
                    'Notifikasi',
                    2,
                  ),
                  _buildDestination(
                    Icons.person_outline,
                    Icons.person_rounded,
                    'Profil',
                    3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  NavigationDestination _buildDestination(
    IconData icon,
    IconData selectedIcon,
    String label,
    int index,
  ) {
    return NavigationDestination(
      icon: _animatedIcon(icon, index, false),
      selectedIcon: _animatedIcon(selectedIcon, index, true),
      label: label,
    );
  }

  NavigationDestination _buildDestinationNotif(
    IconData icon,
    IconData selectedIcon,
    String label,
    int index,
  ) {
    return NavigationDestination(
      icon: _animatedNotifIcon(icon, index, false),
      selectedIcon: _animatedNotifIcon(selectedIcon, index, true),
      label: label,
    );
  }

  Widget _animatedIcon(IconData icon, int index, bool selected) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 250),
      tween: Tween(begin: 1.0, end: selected ? 1.25 : 1.0),
      curve: Curves.easeOut,
      builder:
          (context, scale, child) => Transform.scale(
            scale: scale,
            child: Icon(
              icon,
              color: selected ? Colors.blue[400] : Colors.grey[600],
            ),
          ),
    );
  }

  Widget _animatedNotifIcon(IconData icon, int index, bool selected) {
    final baseIcon = _animatedIcon(icon, index, selected);
    if (notificationCount <= 0) return baseIcon;

    return Badge(
      label: Text(
        notificationCount > 99 ? '99+' : '$notificationCount',
        style: const TextStyle(fontSize: 10),
      ),
      offset: const Offset(6, -6),
      child: baseIcon,
    );
  }
}
