import 'account_state.dart';

class PageControlState {
  int tabBarIndex = 0;
  bool isLogin = false;
  AccountState accountState;

  PageControlState(this.tabBarIndex, this.isLogin, this.accountState);

}