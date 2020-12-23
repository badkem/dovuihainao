/// apps : [{"name":"Thi đấu tiếng Anh","description":"Game","linkdown":"com.huesoft.englishchallenge","logolink":"http://relax365.net/hsmoreapp/images/logoEnglishChallenge.png","linkdownios":""},{"name":"Bắn trái cây","description":"Game","linkdown":"com.hsmobile.fruit.shoot","logolink":"http://relax365.net/hsmoreapp/images/logobantraicay.png","linkdownios":"929512964"},{"name":"Bé lái xe","description":"Game","linkdown":"com.huesoft.baby.cardriver","logolink":"http://relax365.net/hsmoreapp/images/babycardriver.png","linkdownios":""},{"name":"Đu Dây","description":"Game","linkdown":"com.huesoft.rope.swing","logolink":"http://relax365.net/hsmoreapp/images/ropeswing.png","linkdownios":""},{"name":"Bắn trứng khủng long","description":"Game","linkdown":"com.hsmobile.dinosaureggshooter","logolink":"http://relax365.net/hsmoreapp/images/dinosaurshooter.png","linkdownios":""},{"name":"Bắn trứng cổ điển","description":"Game","linkdown":"com.huesoft.eggshoot","logolink":"http://relax365.net/hsmoreapp/images/eggshootclassic.png","linkdownios":""},{"name":"Đấu trường âm nhạc","description":"Game","linkdown":"com.huesoft.dautruongamnhac","logolink":"http://relax365.net/hsmoreapp/images/dautruongamnhac.png","linkdownios":""},{"name":"Ruồi đêm","description":"Game","linkdown":"com.hsmobile.night.flies","logolink":"http://relax365.net/hsmoreapp/images/nightflies.png","linkdownios":""},{"name":"Xếp gạch","description":"Game","linkdown":"com.hsmobile.IntelligentBrick.android","logolink":"http://relax365.net/hsmoreapp/images/IntelligentBrick.png","linkdownios":"1014267861"},{"name":"Bẫy nhện","description":"Game","linkdown":"ldthai.hsmobile.spidertrap","logolink":"http://relax365.net/hsmoreapp/images/spidertrap.png","linkdownios":"956726598"},{"name":"Line Eggs","description":"Game","linkdown":"hsmobile.line.eggs2015","logolink":"http://relax365.net/hsmoreapp/images/LineEggs2015.png","linkdownios":"998437751"},{"name":"Pikachu Christmas","description":"Game","linkdown":"com.hsmobile.pikachuchrismas.android","logolink":"http://relax365.net/hsmoreapp/images/pikachuchristmas.png","linkdownios":"949309583"},{"name":"Đập bọ","description":"Game","linkdown":"com.hsmobile.ladybugwars.android","logolink":"http://relax365.net/hsmoreapp/images/ladybugwars.png","linkdownios":"940918964"},{"name":"Ai nhanh mắt","description":"Game","linkdown":"com.hsmobile.ainhanhmat","logolink":"http://relax365.net/hsmoreapp/images/anhnhanhmat.png","linkdownios":"923894041"},{"name":"Ghép ảnh","description":"App","linkdown":"art.photo.studio.fotor","logolink":"http://relax365.net/hsmoreapp/images/logophotoartstudio.png","linkdownios":""},{"name":"Người Gỗ Đu Dây","description":"Game","linkdown":"com.huesoft.swing.danbo","logolink":"http://relax365.net/hsmoreapp/images/swingdanbo.png","linkdownios":""},{"name":"Rồng vàng","description":"Game","linkdown":"com.huesoft.rongvang","logolink":"http://relax365.net/hsmoreapp/images/rongvang.png","linkdownios":""},{"name":"Bắn quà giáng sinh","description":"Game","linkdown":"hsmobile.xmas.gift.shooting","logolink":"http://relax365.net/hsmoreapp/images/logoxmasgiftshooting.png","linkdownios":""},{"name":"Điện năng","description":"Game","linkdown":"com.hsmobile.electricjoint.android","logolink":"http://relax365.net/hsmoreapp/images/ElectricJoint.png","linkdownios":""},{"name":"Xếp hình cổ điển","description":"Game","linkdown":"com.hsmobile.SlidePuzzle.android","logolink":"http://relax365.net/hsmoreapp/images/PicsShiftPuzzle.png","linkdownios":"1017194570"},{"name":"Hình nền động","description":"Game","linkdown":"com.hsmobile.LiveWallpaperForLove.android","logolink":"http://relax365.net/hsmoreapp/images/LiveWallpaper.png","linkdownios":""},{"name":"Đập chuột tổng hợp","description":"Game","linkdown":"com.huesoft.punchmousecollection","logolink":"http://relax365.net/hsmoreapp/images/punchmousecollection.png","linkdownios":""},{"name":"Ảnh ảo","description":"App","linkdown":"com.hsmobile.magiceye","logolink":"http://relax365.net/hsmoreapp/images/3DMagicEye.png","linkdownios":""},{"name":"Xếp hình 2","description":"Game","linkdown":"com.hsmobile.PlacesPuzzle10.android","logolink":"http://relax365.net/hsmoreapp/images/PlacesPuzzle2.png","linkdownios":""},{"name":"Bắn trái cây 2","description":"Game","linkdown":"com.hsmobile.fruitshootplus.android","logolink":"http://relax365.net/hsmoreapp/images/FruitShootPlus.png","linkdownios":""},{"name":"Xếp hình 1","description":"Game","linkdown":"com.hsmobile.PlacesPuzzle.android","logolink":"http://relax365.net/hsmoreapp/images/PlacesPuzzle1.png","linkdownios":""},{"name":"Pikachu Animals","description":"Game","linkdown":"com.hsmobile.pikachuanimals.android","logolink":"http://relax365.net/hsmoreapp/images/AnimalsConnect.png","linkdownios":"960577626"},{"name":"Photo Style","description":"App","linkdown":"","logolink":"http://relax365.net/hsmoreapp/images/PhotoStyle.png","linkdownios":"954182821"},{"name":"Bắn bóng","description":"Game","linkdown":"com.hsmobile.ballshooterpro","logolink":"http://relax365.net/hsmoreapp/images/beeshoot.png","linkdownios":"948959973"},{"name":"Đập chuột 2","description":"Game","linkdown":"com.hsmobile.punchmousepro","logolink":"http://relax365.net/hsmoreapp/images/logodapchuotmoi.png","linkdownios":""},{"name":"Học chữ cái","description":"Game","linkdown":"com.hsmobile.whohasquickeyes","logolink":"http://relax365.net/hsmoreapp/images/logowhohasquickeyes.png","linkdownios":"921955150"}]

class OtherApplication {
  List<Apps> _apps;

  List<Apps> get apps => _apps;

  OtherApplication({List<Apps> apps}) {
    _apps = apps;
  }

  OtherApplication.fromJson(dynamic json) {
    if (json["apps"] != null) {
      _apps = [];
      json["apps"].forEach((v) {
        _apps.add(Apps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_apps != null) {
      map["apps"] = _apps.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "Thi đấu tiếng Anh"
/// description : "Game"
/// linkdown : "com.huesoft.englishchallenge"
/// logolink : "http://relax365.net/hsmoreapp/images/logoEnglishChallenge.png"
/// linkdownios : ""

class Apps {
  String _name;
  String _description;
  String _linkdown;
  String _logolink;
  String _linkdownios;

  String get name => _name;

  String get description => _description;

  String get linkdown => _linkdown;

  String get logolink => _logolink;

  String get linkdownios => _linkdownios;

  Apps({String name, String description, String linkdown, String logolink, String linkdownios}) {
    _name = name;
    _description = description;
    _linkdown = linkdown;
    _logolink = logolink;
    _linkdownios = linkdownios;
  }

  Apps.fromJson(dynamic json) {
    _name = json["name"];
    _description = json["description"];
    _linkdown = json["linkdown"];
    _logolink = json["logolink"];
    _linkdownios = json["linkdownios"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["description"] = _description;
    map["linkdown"] = _linkdown;
    map["logolink"] = _logolink;
    map["linkdownios"] = _linkdownios;
    return map;
  }
}
