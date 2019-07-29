import 'package:rxdart/rxdart.dart';
import 'package:oshinagaki_beta/models/account_state.dart';

class PageControllerBloc {
  // Value
  final _currentTabIndex = BehaviorSubject<int>.seeded(0);
  final _accountState = BehaviorSubject<AccountState>();

  // Stream
  ValueObservable<int> get currentTabIndex => _currentTabIndex.stream;
  ValueObservable<AccountState> get accountState => _accountState.stream;

  // Function
  Function(int) get changeCurrentIndex => _currentTabIndex.sink.add;
  Function(AccountState) get updateAccountState => _accountState.sink.add;

  bool isLogin() {
    return accountState.value != null;
  }

  void login() {
    bool loginComplete = true;
    if(loginComplete) {
      _accountState.sink.add(AccountState('neko', 'i_love_cat0000', 'qAwsEdRftgYhUjIKolp', false));
    }
  }

  void logout() {
    _accountState.sink.add(null);
  }

  void registerPremiumMember() {
    AccountState account = _accountState.value;
    account.isPremium = true;
    _accountState.sink.add(account);
  }

  void cancellationPremiumMember() {
    AccountState account = _accountState.value;
    account.isPremium = false;
    _accountState.sink.add(account);
  }

  // dispose
  void dispose() {
    _currentTabIndex.close();
    _accountState.close();
  }
}