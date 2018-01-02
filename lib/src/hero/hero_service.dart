import 'dart:async';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:http/http.dart';

import 'hero.dart';
import 'package:angular_app/globals.dart' as global;

@Injectable()
class HeroService {
  static const _heroesUrl = global.apiPath+'/heroes'; // URL to web API

  final Client _http;

  HeroService(this._http);

  Future<List<Hero>> getHeroes() async {
    try {
      final response = await _http.get(_heroesUrl);
      final heroes = _extractData(response)
          .map((value) => new Hero.fromJson(value))
          .toList();
      return heroes;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Hero> getHero(int id) async {
    try {
      final response = await _http.get('$_heroesUrl/$id');
      print('ok k report ha');
      final heroes = new Hero.fromJson(_extractData(response));
      return heroes;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Null> updateHero(Hero hero) async {
    print('1: '+hero.name);
    print(hero.id);
  }

  dynamic _extractData(Response resp) => JSON.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return new Exception('Server error; cause: $e');
  }

}