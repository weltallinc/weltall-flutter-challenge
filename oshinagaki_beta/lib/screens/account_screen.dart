import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oshinagaki_beta/screens/login_screen.dart';
import 'package:oshinagaki_beta/bloc/page_controller_bloc.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PageControllerBloc>(context);
    return StreamBuilder(
      stream: bloc.accountState,
      initialData: bloc.accountState.value,
      builder: (context, _isLogin) {
        print(_isLogin.data);
        if(_isLogin.hasData) return Text("account");
        else return LoginScreen();
      },
    );
  }
}
