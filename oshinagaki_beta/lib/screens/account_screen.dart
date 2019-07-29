import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oshinagaki_beta/screens/login_screen.dart';
import 'package:oshinagaki_beta/bloc/page_controller_bloc.dart';
import 'package:oshinagaki_beta/models/account_state.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PageControllerBloc>(context);
    return StreamBuilder(
      stream: bloc.accountState,
      initialData: bloc.accountState.value,
      builder: (context, accountState) {
        if (accountState.hasData)
          return accountInformation(bloc, accountState.data);
        else
          return LoginScreen();
      },
    );
  }

  Widget accountInformation(PageControllerBloc bloc, AccountState account) {
    // get account information ...
    // get account information ...
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://pbs.twimg.com/profile_images/1097887970755923968/YCPU9m-2_400x400.png")),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(account.name, style: TextStyle(fontSize: 25.0)),
                    Text("@" + account.id, style: TextStyle(fontSize: 18.0),),
                    FlatButton(
                      child: Text("Logout"),
                      color: Colors.lightBlue,
                      onPressed: bloc.logout,
                    ),
                    PremiumButton(bloc, account.isPremium),
                  ],
                ),
              ),
            ],
          ),
          Text("flsjf;wlejf"),
          Text("f;lwjef;le"),
        ],
      ),
    );
  }

  Widget PremiumButton(PageControllerBloc bloc, bool isPremiumAccount) {
    if(isPremiumAccount) {
      return FlatButton(
        child: Text("プレミアム会員をやめる"),
        color: Colors.redAccent,
        onPressed: bloc.cancellationPremiumMember,
      );
    } else {
      return FlatButton(
        child: Text("プレミアム会員になる"),
        color: Colors.lightBlue,
        onPressed: bloc.registerPremiumMember,
      );
    }
  }
}
