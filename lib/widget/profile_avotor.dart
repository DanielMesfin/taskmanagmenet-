import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey,
      child: InkWell(
        onTap: () {},
        child: const CircleAvatar(
          radius: 27,
          backgroundImage: AssetImage('assets/images/devi.jpg'),
        ),
      ),
    );
  }
}
