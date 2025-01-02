import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:hypercare/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:hypercare/utils/constraints/colors.dart';
import 'package:hypercare/utils/constraints/sizes.dart';
import 'package:hypercare/utils/helpers/helper_functions.dart';
import 'package:intl/intl.dart'; // Untuk format tanggal
import 'package:hypercare/features/shop/controllers/alarm_controller.dart';

import '../../../models/alarm_model.dart'; // Untuk mengakses controller

class AlarmCard extends StatelessWidget {
  const AlarmCard({
    Key? key,
    required this.alarm,
    required this.onDelete,
  }) : super(key: key);

  final AlarmModel alarm;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.md),
      backgroundColor: Colors.transparent,
      borderColor: dark ? TColors.darkerGrey : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alarm.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: TSizes.sm / 2),
                 Text(
                    alarm.description,
                    maxLines: 5,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                const SizedBox(height: TSizes.sm / 2),
                Text(
                  DateFormat.yMMMd().add_Hm().format(alarm.dateTime),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: TColors.primary,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete, // Memanggil callback delete
          ),
        ],
      ),
    );
  }
}
