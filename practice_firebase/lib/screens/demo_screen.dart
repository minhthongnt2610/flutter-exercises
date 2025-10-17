import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Simple One-Touch Check-in/Check-out Screen
/// - File: simple_checkin_screen.dart
/// - Add dependency in pubspec.yaml: intl: any
/// - How to use: push this widget or add to your routes.
///
/// Features:
/// - Big one-touch button to toggle Check-in / Check-out
/// - Shows current time and date
/// - Shows last action (time + type)
/// - Keeps an in-memory list of records (you can replace with local DB / SharedPreferences / API)
/// - Basic success animation and temporary snackbar

class SimpleCheckInScreen extends StatefulWidget {
  const SimpleCheckInScreen({Key? key}) : super(key: key);

  @override
  State<SimpleCheckInScreen> createState() => _SimpleCheckInScreenState();
}

class AttendanceRecord {
  final DateTime time;
  final bool isCheckIn; // true -> check-in, false -> check-out
  AttendanceRecord({required this.time, required this.isCheckIn});
}

class _SimpleCheckInScreenState extends State<SimpleCheckInScreen>
    with SingleTickerProviderStateMixin {
  bool _isCheckedIn = false;
  List<AttendanceRecord> _records = [];

  late Timer _clockTimer;
  DateTime _now = DateTime.now();

  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _clockTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _now = DateTime.now());
    });

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _clockTimer.cancel();
    _animController.dispose();
    super.dispose();
  }

  void _handleToggle() async {
    // Play a quick animation
    _animController.forward(from: 0);

    final now = DateTime.now();
    final newRecord = AttendanceRecord(time: now, isCheckIn: !_isCheckedIn);

    setState(() {
      _isCheckedIn = !_isCheckedIn;
      _records.insert(0, newRecord);
    });

    // Replace this with API call / local persistence if needed.

    // Show feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${newRecord.isCheckIn ? 'Checked in' : 'Checked out'} at ${DateFormat('HH:mm:ss, dd MMM yyyy').format(now)}',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  String _formatDate(DateTime dt) =>
      DateFormat('EEEE, dd MMMM yyyy', 'en_US').format(dt);
  String _formatTime(DateTime dt) => DateFormat('HH:mm:ss').format(dt);

  @override
  Widget build(BuildContext context) {
    final lastRecord = _records.isEmpty ? null : _records.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chấm Công Một Chạm'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Date & Time
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _formatDate(_now),
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            _formatTime(_now),
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Icon(Icons.calendar_today_outlined, size: 36),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Big One-Touch Button
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ScaleTransition(
                        scale: Tween(begin: 1.0, end: 1.08).animate(
                          CurvedAnimation(
                            parent: _animController,
                            curve: Curves.easeOut,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: _handleToggle,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              gradient: _isCheckedIn
                                  ? const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFF6DD3FF),
                                        Color(0xFF4CB1FF),
                                      ],
                                    )
                                  : const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFB7E1A9),
                                        Color(0xFF7ED957),
                                      ],
                                    ),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.12),
                                  blurRadius: 12,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    _isCheckedIn ? Icons.login : Icons.logout,
                                    size: 56,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    _isCheckedIn ? 'CHECK-OUT' : 'CHECK-IN',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Status
                      Column(
                        children: [
                          Text(
                            lastRecord == null
                                ? 'Chưa có thao tác nào'
                                : (lastRecord.isCheckIn
                                          ? 'Đã vào lúc'
                                          : 'Đã ra lúc') +
                                      ' ${DateFormat('HH:mm, dd/MM/yyyy').format(lastRecord.time)}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            _isCheckedIn
                                ? 'Bạn đang trong ca'
                                : 'Bạn đang ngoài ca',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 6),

              // History list
              Text(
                'Lịch sử',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: _records.isEmpty
                    ? Center(
                        child: Text(
                          'Không có bản ghi nào',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )
                    : ListView.separated(
                        itemCount: _records.length,
                        separatorBuilder: (_, __) => const Divider(height: 0),
                        itemBuilder: (context, index) {
                          final r = _records[index];
                          return ListTile(
                            leading: CircleAvatar(
                              child: Icon(
                                r.isCheckIn ? Icons.login : Icons.logout,
                              ),
                            ),
                            title: Text(r.isCheckIn ? 'Check-in' : 'Check-out'),
                            subtitle: Text(
                              DateFormat(
                                'HH:mm:ss - dd/MM/yyyy',
                              ).format(r.time),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
