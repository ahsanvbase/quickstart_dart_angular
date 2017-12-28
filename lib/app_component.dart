import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'src/hero.dart';
import 'src/mock_heroes.dart';
import 'src/hero_detail_component.dart';
import 'src/hero_service.dart';


@Component(
  selector: 'my-app',
  directives: const [CORE_DIRECTIVES, formDirectives, HeroDetailComponent],
  templateUrl: 'app_component.html',
  styleUrls: const ['app_component.css'],
  providers: const [HeroService],
)

class AppComponent implements OnInit {
  final HeroService _heroService;
  final title = 'Tour Of Heros';
  List<Hero> heroes;
  Hero selectedHero;

  AppComponent(this._heroService);

  Future<Null> getHeroes() async {
    heroes = await _heroService.getHeroes();
  }

  void ngOnInit() => getHeroes();

  void onSelect(Hero hero) => selectedHero = hero;
  String name = 'ahsan';
}
