import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/services/notifications_service.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notif = context.watch<NotificationsProvider>();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Notifications', style: GoogleFonts.poppins(color: const Color(0xFF1A1A2E))),
        actions: [
          TextButton(
            onPressed: notif.items.isEmpty ? null : notif.markAllSeen,
            child: Text('Mark all read', style: GoogleFonts.poppins(color: const Color(0xFF3B82F6))),
          )
        ],
      ),
      body: SafeArea(
        child: notif.items.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3B82F6).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.notifications_none_rounded, size: 40, color: Color(0xFF3B82F6)),
                      ),
                      const SizedBox(height: 24),
                      Text('No Notifications', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 10),
                      Text('You\'re all caught up! New notifications will appear here', textAlign: TextAlign.center, style: GoogleFonts.poppins(color: const Color(0xFF8F90A6))),
                    ],
                  ),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(12),
                itemBuilder: (ctx, i) {
                  final n = notif.items[i];
                  return ListTile(
                    tileColor: n.seen ? Colors.white : const Color(0xFFFFF8ED),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    title: Text(n.title, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                    subtitle: Text(n.body, style: GoogleFonts.poppins(color: const Color(0xFF8F90A6))),
                    trailing: Text(
                      '${n.createdAt.hour.toString().padLeft(2, '0')}:${n.createdAt.minute.toString().padLeft(2, '0')}',
                      style: GoogleFonts.poppins(fontSize: 11, color: const Color(0xFF8F90A6)),
                    ),
                    onTap: () => notif.markSeen(n.id),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemCount: notif.items.length,
              ),
      ),
    );
  }
}
