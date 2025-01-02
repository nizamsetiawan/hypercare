import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypercare/common/widgets/appbar/appbar.dart';
import 'package:intl/intl.dart';
import 'package:hypercare/features/shop/screens/wishlist/widgets/add_new_alarm.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/constraints/colors.dart';
import '../../../../utils/constraints/image_strings.dart';
import '../../controllers/alarm_controller.dart';
import 'widgets/alarm_card.dart';  // Pastikan untuk mengimpor AlarmCard

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AlarmController alarmController = Get.put(AlarmController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAlarm()),
        child: const Icon(Iconsax.add, color: TColors.white),
      ),
      appBar: const TAppBar(title: Text("Pengingat Latihan")),

      body: Obx(() {
        if (alarmController.alarms.isEmpty) {
          return Center(
            child: Column(
              children: [
                Lottie.asset(
                  TImages.noDataIllustration,
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                Text(
                  "Tidak ada pengingat",
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          itemCount: alarmController.alarms.length,
          itemBuilder: (context, index) {
            final alarm = alarmController.alarms[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AlarmCard(
                alarm: alarm,
                onDelete: () {
                  alarmController.deleteAlarm(alarm.id);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
