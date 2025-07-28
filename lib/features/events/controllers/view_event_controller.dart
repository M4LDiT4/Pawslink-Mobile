import 'package:get/get.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/event_model.dart';
import 'package:mobile_app_template/data/local_storage/isar/repositories/event_repository.dart';

class ViewEventController extends GetxController {
  /// pre: [EventRepository] is present in the [getIt] service locator
  final RxList<Event> _events = <Event>[].obs;
  final RxBool _isLastPage = false.obs;
  int _pageNum = 0; //make sure that offset is zero during initialization
  late EventRepository repo;
  final int _itemsPerPage = 10; 

  @override
  void onInit(){
    super.onInit();
    repo = getIt.get<EventRepository>();
    getEvents();
  }

  /// pre: [EventRepository] is present in the [getIt] service locator
  /// 
  /// post: populate [upcomingEvents] with events taken from the [EventRepository] service 
  Future<void> getEvents() async{
    if(!_isLastPage.value){
      final events = await repo.getEvents(pageNum: _pageNum, itemsPerPage: _itemsPerPage);
      final data = events.data;
      if(data != null){
        if(data.isNotEmpty){
          _events.addAll(data);
          _pageNum ++;
        }else{
          _isLastPage.value = true;
        }
      }
    }
  }

  Future<void> refreshEvents() async{
    reset();
    final events = await repo.getEvents(pageNum: _pageNum, itemsPerPage: _itemsPerPage);
    if(events.data != null){
      _events.addAll(events.data!);
    }
  }

  List<Event> get events{
    return _events;
  }

  bool get isLastPage{
    return _isLastPage.value;
  }

  set pageNum (int pageNum){
    _pageNum = pageNum;
  }

  void reset() {
    _events.removeRange(0, _events.length);
  }
}