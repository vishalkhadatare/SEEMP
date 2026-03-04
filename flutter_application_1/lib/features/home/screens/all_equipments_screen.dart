import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:equippro/features/home/models/equipment_model.dart';
import 'package:equippro/features/equipment/services/equipment_service.dart' as equip_svc;
import 'package:equippro/features/home/screens/equipment_details_screen.dart';

class AllEquipmentsScreen extends StatefulWidget {
  const AllEquipmentsScreen({super.key});

  @override
  State<AllEquipmentsScreen> createState() => _AllEquipmentsScreenState();
}

class _AllEquipmentsScreenState extends State<AllEquipmentsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<equip_svc.EquipmentProvider>().loadAllEquipment();
    });
  }

  @override
  Widget build(BuildContext context) {
    final all = context.watch<equip_svc.EquipmentProvider>().allEquipment
        .map((fs) => EquipmentModel.fromFirestoreModel(fs))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('All Equipment', style: GoogleFonts.poppins(color: const Color(0xFF1A1A2E))),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: all.length,
          itemBuilder: (ctx, i) {
            final e = all[i];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => EquipmentDetailsScreen(equipment: e)),
              ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Container(width: 72, height: 56, color: const Color(0xFFF3F3F3)),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(e.name, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)), const SizedBox(height: 4), Text(e.model, style: GoogleFonts.poppins(color: const Color(0xFF8F90A6))) ])),
                    Text('₹${e.pricePerHour.toStringAsFixed(0)}', style: GoogleFonts.poppins(color: const Color(0xFFFF6B00), fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
