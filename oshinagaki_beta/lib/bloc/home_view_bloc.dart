import 'package:rxdart/rxdart.dart';
import 'package:oshinagaki_beta/models/account_state.dart';
import 'package:oshinagaki_beta/models/menu_state.dart';

class HomeViewBloc {

  // Value
  final _ranking = BehaviorSubject<List<MenuState>>.seeded(const []);
  final _recommendation = BehaviorSubject<List<MenuState>>.seeded(const []);
  final _premium = BehaviorSubject<List<MenuState>>.seeded(const []);

  // Steam
  ValueObservable<List<MenuState>> get ranking => _ranking.stream;
  ValueObservable<List<MenuState>> get recommendation => _recommendation.stream;
  ValueObservable<List<MenuState>> get premium => _premium.stream;

  void fetchRanking() {
    _ranking.sink.add(ranking_);
  }

  void fetchRecommendation(AccountState account) {
    _recommendation.sink.add(recommendation_);
  }

  void fetchPremium(AccountState account) {
    _premium.sink.add(premium_);
  }

  void dispose() {
    _ranking.close();
    _recommendation.close();
    _premium.close();
  }
}

final List<MenuState> ranking_ = [
  MenuState(
      "neko",
      "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg",
      "わらび餅A",
      "寝たい"),
  MenuState(
      "neko",
      "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg",
      "わらび餅B",
      "寝たい"),
  MenuState(
      "neko",
      "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg",
      "わらび餅C",
      "寝たい"),
  MenuState(
      "neko",
      "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg",
      "わらび餅D",
      "寝たい"),
];

final List<MenuState> recommendation_ = [
  MenuState(
      "neko",
      "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg",
      "みかん大福",
      "寝たい"),
  MenuState(
      "neko",
      "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg",
      "ぶどう大福",
      "寝たい"),
  MenuState(
      "neko",
      "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg",
      "梨大福",
      "寝たい"),
  MenuState(
      "neko",
      "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg",
      "八朔大福",
      "寝たい"),
];

final List<MenuState> premium_ = [
  MenuState(
      "neko",
      "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg",
      "プレミア大福",
      "寝たい"),
  MenuState(
      "neko",
      "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg",
      "プレミア餅",
      "寝たい"),
  MenuState(
      "neko",
      "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg",
      "プレミアみかん",
      "寝たい"),
  MenuState(
      "neko",
      "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg",
      "プレミア梨",
      "寝たい"),
];
