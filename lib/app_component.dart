import 'package:angular/angular.dart';
import 'src/dashboard_component.dart';
import 'src/heroes_component.dart';
import 'src/hero_service.dart';
import 'src/hero_detail_component.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'my-app',
  templateUrl: "app_component.html",
  directives: const [ROUTER_DIRECTIVES],
  providers: const [HeroService],
)

@RouteConfig(const [
  const Route(path: '/heroes', name: 'Heroes', component: HeroesComponent),
  const Route(path: '/dashboard', name: 'Dashboard', component: DashboardComponent),
  const Redirect(path: '/', redirectTo: const ['Dashboard']),
  const Route(path: '/detail/:id',name: 'HeroDetail',component: HeroDetailComponent,),
])

class AppComponent {
  final title = 'Tour of Heroes';
  String name = 'Tour of Heroes';
}
