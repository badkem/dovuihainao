import 'package:lichamduong/src/presentation/base/base_viewmodel.dart';
import 'package:lichamduong/src/resource/model/more_app.dart';
import 'package:lichamduong/src/resource/repo/more_app_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoreAppViewModel extends BaseViewModel {
   final MoreAppRepository moreAppRepository;
   var appsSubject = BehaviorSubject<List<MoreApp>>();

  MoreAppViewModel({this.moreAppRepository});

  Future<void> init() async {
    final app = await moreAppRepository.fetchMoreAppList();
    appsSubject.add(app);
  }

  List<MoreApp> get getApps => appsSubject.value;

  @override
  void dispose() {
    appsSubject.close();
    super.dispose();
  }
}