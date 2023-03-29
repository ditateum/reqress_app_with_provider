import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reqress_app/common_widgets/card_user.dart';
import 'package:reqress_app/common_widgets/error_dialog.dart';
import 'package:reqress_app/pages/detail_page.dart';

import '../providers/users_provider.dart';
import '../providers/users_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final UsersProvider userProv;
  @override
  void initState() {
    super.initState();
    userProv = context.read<UsersProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userProv.getUsers();
    });
    userProv.addListener(errorListener);
  }

  void errorListener() {
    final state = context.read<UsersProvider>().state;

    if (state.status == UserStatus.error) {
      errorDialog(context, state.error.errMsg);
    }
  }

  Widget showUser() {
    final state = context.watch<UsersProvider>().state;

    if (state.status == UserStatus.initial) {
      return const Center(
        child: Text('No Data'),
      );
    }

    if (state.status == UserStatus.loading) {
      return Center(
        child: Image.asset('assets/images/loading.gif'),
      );
    }

    if (state.status == UserStatus.error) {
      return Center(
        child: Text(state.error.errMsg),
      );
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        // childAspectRatio: 3 / 2,
      ),
      itemCount: state.users.length,
      itemBuilder: (context, index) {
        final user = state.users[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  user: user,
                ),
              ),
            );
          },
          child: CardUser(
            user: user,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reqress App'),
      ),
      body: showUser(),
    );
  }

  @override
  void dispose() {
    userProv.removeListener(errorListener);
    super.dispose();
  }
}
