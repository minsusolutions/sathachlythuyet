import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/routing/router.dart';
import 'package:sathachlaixe/screens/splash/presentation/bloc/app_start_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppStartBloc, AppStartState>(
      listener: (context, state) {
        if (state is AppStartedSuccess) {
          AppRouter.router.go(PAGE.home.screenPath);
        }
      },
      child: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('Đang khởi tạo dữ liệu...'),
            ],
          ),
        ),
      ),
    );
  }
}
