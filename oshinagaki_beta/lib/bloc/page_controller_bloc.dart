import 'package:rxdart/rxdart.dart';
import 'package:oshinagaki_beta/models/account_state.dart';

class PageControllerBloc {
  // Value
  final _currentTabIndex = BehaviorSubject<int>.seeded(0);
  final _isLogin = BehaviorSubject<bool>.seeded(false);
  final _accountState = BehaviorSubject<AccountState>();

  // Stream
  ValueObservable<int> get currentTabIndex => _currentTabIndex.stream;
  ValueObservable<bool> get isLogin => _isLogin.stream;
  ValueObservable<AccountState> get accountState => _accountState.stream;

  // Function
  Function(int) get changeCurrentIndex => _currentTabIndex.sink.add;
  Function(AccountState) get updateAccountState => _accountState.sink.add;

  void login() {
    // login process ...
    // login process ...
    // login process ...
    bool loginComplete = true;
    if(loginComplete) {
      _accountState.sink.add(AccountState('neko', 'i_love_cat0000', 'qAwsEdRftgYhUjIKolp'));
    }
  }

  // dispose
  void dispose() {
    _currentTabIndex.close();
    _isLogin.close();
  }
}
/*
class PageControllerBloc {

  final _currentTabIndex = BehaviorSubject<int>.seeded(0);
  final _selectTabIndex = PublishSubject<int>();

  PageControllerBloc() {
    _selectTabIndex.stream.listen(changeTab);
  }

  void changeTab(int index) {
    print("changeTab: " + index.toString());
    _selectTabIndex.add(index);
  }

  void dispose() {
    _currentTabIndex.close();
    _selectTabIndex.close();
  }

  Sink<int> get selectTabIndex => _selectTabIndex.sink;
  ValueObservable<int> get tabIndex => _currentTabIndex.stream;
}
*/