import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:oshinagaki_beta/models/user_state.dart';
import 'package:oshinagaki_beta/models/event_state.dart';
import 'package:oshinagaki_beta/models/menu_state.dart';


class SearchBloc {
  List<MenuState> _menus = [];
  List<EventState> _events = [];
  List<UserState> _users = [];

  final _tabIndex = BehaviorSubject<int>.seeded(0);
  final _menuList = BehaviorSubject<List<MenuState>>.seeded(const []);
  final _eventList = BehaviorSubject<List<EventState>>.seeded(const []);
  final _userList = BehaviorSubject<List<UserState>>.seeded(const []);

  // Stream
  ValueObservable<int> get tabIndex => _tabIndex.stream;
  ValueObservable<List<MenuState>> get menuResult => _menuList.stream;
  ValueObservable<List<EventState>> get eventResult => _eventList.stream;
  ValueObservable<List<UserState>> get userResult => _userList.stream;


  // Function
  void changeTabIndex(int id) {
    _tabIndex.sink.add(id);
  }

  void onSubmitText(text) {
    if(text == "") return ;

    final int index = _tabIndex.value;
    if(index == 0) {
      // oshinagaki(menu) search
      _menus = sample_menu_result;
      _menuList.sink.add(_menus);
    } else if(index == 1) {
      // event search
      _events = sample_event_result;
      _eventList.sink.add(_events);
    } else if(index == 2) {
      // user search
      _users = sample_user_result;
      print(_users);
      _userList.sink.add(_users);
    }
  }

  void dispose() {
    _tabIndex.close();
    _userList.close();
    _menuList.close();
    _eventList.close();
  }
}

final sample_menu_result = [
  MenuState("cat", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", "猫の詰め合わせ(1)", "これは猫の詰め合わせです(1)"),
  MenuState("cat", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", "猫の詰め合わせ(2)", "これは猫の詰め合わせです(2)"),
  MenuState("cat", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", "猫の詰め合わせ(3)", "これは猫の詰め合わせです(3)"),
  MenuState("cat", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", "猫の詰め合わせ(4)", "これは猫の詰め合わせです(4)"),
  MenuState("cat", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", "猫の詰め合わせ(5)", "これは猫の詰め合わせです(5)"),
  MenuState("cat", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", "猫の詰め合わせ(6)", "これは猫の詰め合わせです(6)"),
  MenuState("cat", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", "猫の詰め合わせ(7)", "これは猫の詰め合わせです(7)"),
  MenuState("cat", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", "猫の詰め合わせ(8)", "これは猫の詰め合わせです(8)"),
  MenuState("cat", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", "猫の詰め合わせ(9)", "これは猫の詰め合わせです(9)")
];

final sample_event_result = [
  EventState("大阪祭り", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", DateTime(2011, 5, 1).toString(), "東京"),
  EventState("枚方祭り", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", DateTime(2012, 3, 4).toString(), "奈良"),
  EventState("コミケ", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", DateTime(2013, 12, 4).toString(), "大阪"),
  EventState("技術書店", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", DateTime(2014, 3, 7).toString(), "北海道"),
  EventState("猫祭", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", DateTime(2015, 5, 9).toString(), "南極"),
  EventState("天神祭", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", DateTime(2016, 1, 16).toString(), "大都会奈良"),
  EventState("博多祭り", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", DateTime(2017, 3, 22).toString(), "島根"),
  EventState("フリーマーケット", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", DateTime(2018, 2, 2).toString(), "福岡"),
  EventState("にゃーん", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", DateTime(2019, 8, 1).toString(), "京都")
];

final sample_user_result = [
  UserState("cat", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", "cat0001"),
  UserState("dog", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", "dog0012"),
  UserState("chocolate", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", "1mcm2"),
  UserState("monday", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", "ababa"),
  UserState("neko", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", "LRLLRLRRLR"),
  UserState("innu", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", "0000001"),
  UserState("wan", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", "hogehoge"),
  UserState("mew", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", "mewmew"),
  UserState("poyo", "https://s3-ap-northeast-1.amazonaws.com/chouseisan-wordpress/uploads/2018/07/22044536/VLh1pi1TsWxC1uuUQOf3veOvDdonx9QbQ5KpD0H8.jpeg", "piyopiyo")
];