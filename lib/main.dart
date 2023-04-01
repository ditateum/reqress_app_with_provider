import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reqress_app/pages/home_page.dart';
import 'package:reqress_app/services/api_service_http_impl.dart';

import 'providers/users_provider.dart';
import 'repository/reqress_repository.dart';
import 'services/api_service.dart';

// import 'services/api_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reqress App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MultiProvider(
        providers: [
          Provider<ApiService>(
            create: (_) => ApiServiceHttp(),
          ),
          Provider<ReqresRepository>(
            create: (context) => ReqresRepository(
              apiService: context.read<ApiService>(),
            ),
          ),
          ChangeNotifierProvider<UsersProvider>(
            create: (context) => UsersProvider(
              repository: context.read<ReqresRepository>(),
            ),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
