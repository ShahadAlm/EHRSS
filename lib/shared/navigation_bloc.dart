import 'package:employee_db/screens/home/admin/admin_page.dart';
import 'package:employee_db/screens/home/authenticate/profile_page.dart';
import 'package:employee_db/screens/home/user/home.dart';
import 'package:employee_db/screens/home/user/request_page.dart';
import 'package:bloc/bloc.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  ReqepageClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield AdminPage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield ProfilePage();
        break;
      case NavigationEvents.ReqepageClickedEvent:
        yield Reqepage();
        break;  
    }
  }
}