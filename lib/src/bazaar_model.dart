import 'package:forgottenlandapp_utils/utils.dart';
import 'package:universal_html/html.dart';

import '../models.dart';

class Bazaar {
  Bazaar({
    this.auctions = const <Auction>[],
  });

  Bazaar.fromListDivElement(List<dynamic> list) {
    auctions = <Auction>[];
    for (dynamic e in list) {
      if (e is DivElement) auctions.add(Auction.fromDivElement(e));
    }
    auctions.sort((Auction a, Auction b) => (b.level ?? 0).compareTo(a.level ?? 0));
  }

  Bazaar.fromJson(Map<String, dynamic> json) {
    json.clean();
    if (json['auctions'] is List<dynamic>) {
      for (dynamic e in json['auctions'] as List<dynamic>) {
        if (e is Map<String, dynamic>) auctions.add(Auction.fromJson(e));
      }
    }
  }

  List<Auction> auctions = <Auction>[];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['auctions'] = auctions.map((Auction e) => e.toJson()).toList();
    return json.clean();
  }
}

class Auction {
  Auction.fromDivElement(DivElement divE) {
    name = divE.text?.split('Level:').firstOrNull?.trim();
    sex = divE.text?.split('|')[2].trim();
    world?.name = divE.text?.split('World:').lastOrNull?.split('Auction Start:').firstOrNull?.trim() ?? '';
    level = int.tryParse(divE.text?.split('Level:').lastOrNull?.split('|').firstOrNull?.trim() ?? '');
    minimumBid = int.tryParse(
      divE.text?.split('Minimum Bid:').lastOrNull?.split('My Bid Limit').firstOrNull?.replaceAll(',', '').trim() ?? '',
    );
    currentBid = int.tryParse(
      divE.text?.split('Current Bid:').lastOrNull?.split('My Bid Limit').firstOrNull?.replaceAll(',', '').trim() ?? '',
    );
    url = divE.children.first.children[1].children.first.attributes['href'];
  }

  Auction.fromJson(Map<String, dynamic> json) {
    json.clean();
    if (json['name'] is String) name = json['name'] as String;
    if (json['sex'] is String) sex = json['sex'] as String;
    if (json['world'] is Map<String, dynamic>) world = World.fromJson(json['world'] as Map<String, dynamic>);
    if (json['level'] is int) level = json['level'] as int;
    if (json['minimum_bid'] is int) minimumBid = json['minimum_bid'] as int;
    if (json['current_bid'] is int) currentBid = json['current_bid'] as int;
    if (json['url'] is String) url = json['url'] as String;
  }

  String? name;
  String? sex;
  World? world = World();
  int? level;
  int? minimumBid;
  int? currentBid;
  String? url;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['sex'] = sex;
    json['world'] = world?.toJson();
    json['level'] = level;
    json['minimum_bid'] = minimumBid;
    json['current_bid'] = currentBid;
    json['url'] = url;
    return json.clean();
  }
}
