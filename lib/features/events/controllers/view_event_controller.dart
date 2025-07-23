import 'package:get/get.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/event_model.dart';
import 'package:mobile_app_template/data/local_storage/isar/repositories/event_repository.dart';

class ViewEventController extends GetxController {
  RxList<Event> upcomingEvents = <Event>[].obs;
  List<Event> _ongoingEvents = <Event>[].obs;
  List<Event> _pastEvents  = <Event>[].obs;

  late EventRepository repo;

  @override
  void onInit(){
    super.onInit();
    repo = getIt.get<EventRepository>();
    _getEvents();
  }

  void _getEvents() async{
    final events = await repo.getEvents();
    if(events.data != null){ //make sure that the data is not null
      upcomingEvents.assignAll(events.data!);
    }
  }

  List<Event> get ongoingEvents{
    return _ongoingEvents;
  }

  List<Event> get pastEvents{
    return _pastEvents;
  }
}