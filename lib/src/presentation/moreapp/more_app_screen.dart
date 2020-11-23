import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:launch_review/launch_review.dart';
import 'package:lichamduong/src/presentation/base/base.dart';
import 'package:lichamduong/src/resource/model/more_app.dart';
import 'package:lichamduong/src/resource/repo/more_app_repository.dart';
import 'package:lichamduong/src/resource/services/provider.dart';
import 'package:lichamduong/src/resource/services/sound.dart';
import 'more_app_viewmodel.dart';

class MoreAppScreen extends StatelessWidget {
  final soundService = locator<SoundService>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: null,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/moreapp_bg.png'),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("assets/images/more_head.png",),
                Align(
                  alignment: Alignment.topRight,
                  child: ImageButton(
                      height: 50,
                      width: 50,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[Text("")],
                      onTap: () {
                        Navigator.pop(context);
                        soundService.playSound('back');
                      },
                      unpressedImage:
                      Image.asset("assets/images/btn_back.png"),
                      pressedImage:
                      Image.asset("assets/images/btn_back_hover.png")),
                )
              ],
            ),
            Expanded(
              child: BaseWidget<MoreAppViewModel>(
                viewModel: MoreAppViewModel(
                  moreAppRepository: MoreAppRepository(),
                ),
                onViewModelReady: (viewModel) async {
                  viewModel.setLoading(true);
                  await viewModel.init();
                  viewModel.setLoading(false);
                },
                builder: (context, viewModel, child) {
                  if (viewModel.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return WidgetMoreAppList(
                      apps: viewModel.getApps,
                    );
                  }
                },
                child: Text("child"),
              ),
            )
          ],
        ),
      ),
    ),);
  }
}

class WidgetMoreAppList extends StatelessWidget {
  final List<MoreApp> apps;

  WidgetMoreAppList({
    Key key,
    @required this.apps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: apps.length,
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ',
                style: TextStyle(color: Colors.brown),
              ),
            ),
          );
        },
        itemBuilder: (context, index) {
          final _app = apps[index];
          return WidgetMoreAppItem(app: _app);
        });
  }
}

class WidgetMoreAppItem extends StatelessWidget {
  final MoreApp app;

  const WidgetMoreAppItem({
    Key key,
    @required this.app,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: AssetImage(''),
        image: NetworkImage(
          app.logolink,
        ),
      ),
      title: Text(app.name ?? "name"),
      trailing: ImageButton(
          height: 50,
          width: 120,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[Text("")],
          onTap: () => LaunchReview.launch(
              androidAppId: app.linkdown, iOSAppId: app.linkdownios),
          unpressedImage:
          Image.asset("assets/images/btn_download.png"),
          pressedImage:
          Image.asset("assets/images/btn_download_hover.png")),
    );
  }
}