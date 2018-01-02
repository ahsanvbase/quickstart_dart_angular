import 'dart:async';

import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:angular_app/src/hero/hero.dart';
import 'package:angular_app/src/hero/hero_service.dart';
import 'package:angular_app/globals.dart' as globals;

@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  styleUrls: const['dashboard_component.css'],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
)

class DashboardComponent implements OnInit {
  List<Hero> heroes;

  final HeroService _heroService;

  DashboardComponent(this._heroService);

  Future<Null> ngOnInit() async {
    print(globals.isLoggedIn);
    window.localStorage['ikey'] = 'i am local storage';
    print(window.localStorage['ikey']);
    heroes = (await _heroService.getHeroes()).skip(1).take(4).toList();
  }

}