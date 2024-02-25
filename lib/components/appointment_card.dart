import 'package:flutter/material.dart';
import 'package:seventh_sem_project/module/common_widget/common_text.dart';
import 'package:seventh_sem_project/module/utils/const.dart';
import 'package:seventh_sem_project/module/utils/customized_sized_box.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/doctor_photo.jpg"),
              ),
              sboxW8,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "Dr Ram Prasad",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  CustomText(
                    "Dental",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  sboxH10,
                ],
              )
            ],
          ),
          sboxH10,
          ScheduleCard(),
          sboxH10,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Completed',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}
class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
  }) : super(key: key);

  // final Map<String, dynamic> appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "Monday, 11/28/2022",
            // '${appointment['day']}, ${appointment['date']}',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
                "2pm",
                // appointment['time'],
                style: const TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}

