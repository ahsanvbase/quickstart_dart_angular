import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/dashboard/dashboard_component.dart';
import 'src/hero/heroes_component.dart';
import 'src/hero/hero_service.dart';
import 'src/hero_detail/hero_detail_component.dart';

@Component(
  selector: 'my-app',
  templateUrl: "app_component.html",
  styleUrls: const['app_component.css'],
  directives: const [ROUTER_DIRECTIVES],
  providers: const [HeroService],
)

@RouteConfig(const [
  const Redirect(path: '/', redirectTo: const ['Dashboard']),
  const Route(path: '/dashboard', name: 'Dashboard', component: DashboardComponent),
  const Route(path: '/heroes', name: 'Heroes', component: HeroesComponent),
  const Route(path: '/hero/detail/:id',name: 'HeroDetail',component: HeroDetailComponent,),
])

class AppComponent {
  final title = 'Tour of Heroes';
  String name = 'Tour of Heroes';
}
