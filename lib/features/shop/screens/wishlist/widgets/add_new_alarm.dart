import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:hypercare/features/shop/models/alarm_model.dart';
import 'package:hypercare/utils/constraints/sizes.dart';
import 'package:hypercare/utils/validators/validation.dart';
import '../../../controllers/alarm_controller.dart';
import '../../../../../common/widgets/appbar/appbar.dart';

class AddNewAlarm extends StatefulWidget {
  const AddNewAlarm({Key? key}) : super(key: key);

  @override
  State<AddNewAlarm> createState() => _AddNewAlarmState();
}

class _AddNewAlarmState extends State<AddNewAlarm> {
  DateTime? selectedDateTime;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _activityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _selectDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final AlarmController alarmController = Get.find<AlarmController>();

    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text("Tambah Pengingat Baru")),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _activityController,
                validator: (value) => TValidator.validateGeneral(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.activity),
                  labelText: 'Aktivitas',
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                maxLines: 5,
                controller: _descriptionController,
                validator: (value) => TValidator.validateGeneral(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.book),
                  labelText: 'Keterangan',
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                readOnly: true,
                onTap: () => _selectDateTime(context),
                validator: (value) => selectedDateTime == null ? 'Waktu belum dipilih' : null,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.clock),
                  labelText: 'Pilih Waktu',
                  hintText: selectedDateTime == null
                      ? 'Belum dipilih'
                      : '${selectedDateTime!.day}/${selectedDateTime!.month}/${selectedDateTime!.year} ${selectedDateTime!.hour}:${selectedDateTime!.minute.toString().padLeft(2, '0')}',
                ),
              ),
              const SizedBox(height: TSizes.defaultSpace),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final alarmId = alarmController.alarms.length + 1;
                      final alarm = AlarmModel(
                        id: alarmId.toString(),
                        title: _activityController.text,
                        description: _descriptionController.text,
                        dateTime: selectedDateTime!,
                      );

                      alarmController.addAlarm(alarm);

                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
