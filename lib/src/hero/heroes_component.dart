import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'hero.dart';
import 'package:angular_app/src/hero_detail/hero_detail_component.dart';
import 'hero_service.dart';
import 'package:angular_router/angular_router.dart';
import 'dart:async';


@Component(
  selector: 'my-heroes',
  directives: const [CORE_DIRECTIVES, formDirectives, HeroDetailComponent],
  templateUrl: 'heroes_component.html',
  styleUrls: const ['heroes_component.css'],
  providers: const [HeroService],
  pipes: const [COMMON_PIPES],
)

class HeroesComponent implements OnInit {
  final HeroService _heroService;
  final Router _router;

  final title = 'Tour Of Heros';
  String name = 'ahsan';

  List<Hero> heroes;
  Hero selectedHero;

  HeroesComponent(this._heroService, this._router);

  Future<Null> getHeroes() async {
    heroes = await _heroService.getHeroes();
  }

  void ngOnInit() => getHeroes();

  void onSelect(Hero hero) => selectedHero = hero;

  Future<Null> gotoDetail() => _router.navigate([
    'HeroDetail',
    {'id': selectedHero.id.toString()}
  ]);
}
