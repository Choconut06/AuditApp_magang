import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/navbar.dart';
import 'package:audit_app_magang/pages/homepage.dart';

enum NotifType { activity, mention, system }

class NotificationItem {
  final String id;
  final NotifType type;
  final String title;
  final String body;
  final DateTime time;
  bool isRead;
  bool isArchived;

  NotificationItem({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    required this.time,
    this.isRead = false,
    this.isArchived = false,
  });
}

class NotifikasiPage extends StatefulWidget {
  const NotifikasiPage({super.key});

  @override
  State<NotifikasiPage> createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage>
    with SingleTickerProviderStateMixin {
  final Color _primary = Colors.blue.shade400;

  late TabController _tabController;
  final List<NotificationItem> _items = [
    NotificationItem(
      id: '1',
      type: NotifType.activity,
      title: 'Dokumen disetujui',
      body: 'Dokumen PKAT-001 telah disetujui oleh Reviewer.',
      time: DateTime.now().subtract(const Duration(minutes: 3)),
      isRead: false,
    ),
    NotificationItem(
      id: '2',
      type: NotifType.mention,
      title: 'Kamu disebut',
      body: '“@kamu mohon lengkapi RAB di Rencana Biaya.”',
      time: DateTime.now().subtract(const Duration(hours: 2)),
      isRead: false,
    ),
    NotificationItem(
      id: '3',
      type: NotifType.system,
      title: 'Pemeliharaan sistem',
      body: 'Aplikasi akan maintenance pukul 22.00–23.00 WIB.',
      time: DateTime.now().subtract(const Duration(days: 1, hours: 1)),
      isRead: true,
    ),
    NotificationItem(
      id: '4',
      type: NotifType.activity,
      title: 'Komentar baru',
      body: 'Ada komentar baru pada Draft LHA.',
      time: DateTime.now().subtract(const Duration(days: 3)),
      isRead: true,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // === Helpers ===
  List<NotificationItem> _filteredItems() {
    final tab = _tabController.index;
    if (tab == 1) {
      return _items
          .where((e) => e.type == NotifType.mention && !e.isArchived)
          .toList();
    } else if (tab == 2) {
      return _items
          .where((e) => e.type == NotifType.system && !e.isArchived)
          .toList();
    }
    return _items.where((e) => !e.isArchived).toList();
  }

  String _relativeTime(DateTime t) {
    final diff = DateTime.now().difference(t);
    if (diff.inSeconds < 60) return '${diff.inSeconds}s';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    if (diff.inDays < 7) return '${diff.inDays}d';
    final weeks = (diff.inDays / 7).floor();
    return '${weeks}w';
  }

  IconData _iconFor(NotifType type) {
    switch (type) {
      case NotifType.activity:
        return Icons.notifications_active_rounded;
      case NotifType.mention:
        return Icons.alternate_email_rounded;
      case NotifType.system:
        return Icons.settings_rounded;
    }
  }

  Color _tintFor(NotifType type) {
    switch (type) {
      case NotifType.activity:
        return Colors.blue.shade100;
      case NotifType.mention:
        return Colors.purple.shade100;
      case NotifType.system:
        return Colors.orange.shade100;
    }
  }

  Future<void> _onRefresh() async {
    // simulasi refresh
    await Future.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;
    setState(() {
      // contoh: tandai item paling baru sebagai belum dibaca
      if (_items.isNotEmpty) {
        _items.first.isRead = false;
      }
    });
  }

  void _markAllRead() {
    setState(() {
      for (final n in _filteredItems()) {
        n.isRead = true;
      }
    });
  }

  void _toggleRead(NotificationItem n) {
    setState(() {
      n.isRead = !n.isRead;
    });
  }

  void _archive(NotificationItem n) {
    setState(() {
      n.isArchived = true;
    });
  }

  void _delete(NotificationItem n) {
    setState(() {
      _items.removeWhere((e) => e.id == n.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredItems();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue.shade400,
          elevation: 0.4,
          centerTitle: true,
          titleSpacing: 0,
          title: const Text(
            'Notifications',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: TextButton(
                onPressed: _markAllRead,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
                child: Text(
                  'Mark all as read',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 54, 54, 54),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(52),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: _SegmentedTabBar(
                controller: _tabController,
                primary: _primary,
                tabs: const ['All', 'Mentions', 'System'],
                onChanged: (_) => setState(() {}),
              ),
            ),
          ),
        ),
      ),

      body: RefreshIndicator(
        color: _primary,
        onRefresh: _onRefresh,
        child:
            filtered.isEmpty
                ? ListView(
                  children: [
                    const SizedBox(height: 80),
                    Icon(
                      Icons.notifications_none_rounded,
                      size: 64,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 12),
                    const Center(
                      child: Text(
                        'No notifications yet',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Center(
                      child: Text(
                        'You’re all caught up 🎉',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                  ],
                )
                : ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemBuilder: (_, i) {
                    final n = filtered[i];
                    return Dismissible(
                      key: ValueKey(n.id),
                      background: _swipeBg(
                        alignLeft: true,
                        color: Colors.green.shade100,
                        icon: Icons.archive_rounded,
                        label: 'Archive',
                      ),
                      secondaryBackground: _swipeBg(
                        alignLeft: false,
                        color: Colors.red.shade100,
                        icon: Icons.delete_rounded,
                        label: 'Delete',
                      ),
                      onDismissed: (dir) {
                        if (dir == DismissDirection.startToEnd) {
                          _archive(n);
                        } else {
                          _delete(n);
                        }
                      },
                      child: InkWell(
                        onTap: () => _toggleRead(n),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color:
                                n.isRead ? Colors.white : Colors.blue.shade50,
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade200,
                                width: 0.6,
                              ),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // leading avatar
                              Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                  color: _tintFor(n.type),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(_iconFor(n.type), color: _primary),
                              ),
                              const SizedBox(width: 12),
                              // content
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            n.title,
                                            style: TextStyle(
                                              fontWeight:
                                                  n.isRead
                                                      ? FontWeight.w500
                                                      : FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          _relativeTime(n.time),
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      n.body,
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        height: 1.25,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    if (!n.isRead)
                                      Row(
                                        children: [
                                          Container(
                                            width: 8,
                                            height: 8,
                                            decoration: BoxDecoration(
                                              color: _primary,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: _primary.withOpacity(0.12),
                                              borderRadius:
                                                  BorderRadius.circular(999),
                                            ),
                                            child: Text(
                                              'New',
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: _primary,
                                                fontWeight: FontWeight.w600,
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
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 0),
                  itemCount: filtered.length,
                ),
      ),

      bottomNavigationBar: CustomNavBar(
        currentIndex: 1, // 1 = Notifikasi
        onTap: (i) {
          if (i == 1) return; // sudah di Notifikasi
          if (i == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          }
        },
      ),
    );
  }

  Widget _swipeBg({
    required bool alignLeft,
    required Color color,
    required IconData icon,
    required String label,
  }) {
    return Container(
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: alignLeft ? Alignment.centerLeft : Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (alignLeft) ...[
            Icon(icon, color: Colors.black54),
            const SizedBox(width: 8),
            Text(label),
          ] else ...[
            Text(label),
            const SizedBox(width: 8),
            Icon(icon, color: Colors.black54),
          ],
        ],
      ),
    );
  }
}

/// Segmented tab
class _SegmentedTabBar extends StatelessWidget {
  final TabController controller;
  final List<String> tabs;
  final Color primary;
  final ValueChanged<int>? onChanged;

  const _SegmentedTabBar({
    required this.controller,
    required this.tabs,
    required this.primary,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TabBar(
        controller: controller,
        dividerColor: Colors.transparent,
        labelPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        labelColor: primary,
        unselectedLabelColor: Colors.grey.shade700,
        onTap: onChanged,
        tabs:
            tabs
                .map(
                  (t) => Tab(
                    child: Center(
                      child: Text(
                        t,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
