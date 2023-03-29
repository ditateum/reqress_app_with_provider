import 'package:flutter/material.dart';

import '../models/user_model.dart';

class CardUser extends StatelessWidget {
  const CardUser({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Column(
        children: [
          Hero(
            tag: user.id,
            child: Container(
              height: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(user.avatar),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                '${user.firstName} ${user.lastName}',
              ),
              subtitle: Text(
                user.email,
                style: const TextStyle(
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
