import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'my-users',
  templateUrl: 'users_component.html',
  styleUrls: const['dashboard_component.css'],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
)

class UsersComponent {
  final name = "Users Listing";
}