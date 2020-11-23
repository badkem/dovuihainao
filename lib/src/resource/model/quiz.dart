class Quiz {
  Quiz({
    this.id,
    this.cauHoi,
    this.a,
    this.b,
    this.c,
    this.d,
    this.dapAn,
    this.giaiThich,
    this.isvisible,
    this.uid,
    this.qtime,
    this.level,
  });

  String id;
  String cauHoi;
  String a;
  String b;
  String c;
  String d;
  String dapAn;
  String giaiThich;
  String isvisible;
  String uid;
  DateTime qtime;
  String level;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
    id: json["ID"],
    cauHoi: json["CauHoi"],
    a: json["A"],
    b: json["B"],
    c: json["C"],
    d: json["D"],
    dapAn: json["A"],
    giaiThich: json["GiaiThich"],
    isvisible: json["isvisible"],
    uid: json["uid"],
    qtime: DateTime.parse(json["qtime"]),
    level: json["level"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "CauHoi": cauHoi,
    "A": a,
    "B": b,
    "C": c,
    "D": d,
    "A": dapAn,
    "GiaiThich": giaiThich,
    "isvisible": isvisible,
    "uid": uid,
    "qtime": "${qtime.year.toString().padLeft(4, '0')}-${qtime.month.toString().padLeft(2, '0')}-${qtime.day.toString().padLeft(2, '0')}",
    "level": level,
  };

  @override
  String toString() {
    return 'Quiz{id: $id, cauHoi: $cauHoi, a: $a, b: $b, c: $c, d: $d, dapAn: $dapAn, giaiThich: $giaiThich, isvisible: $isvisible, uid: $uid, qtime: $qtime, level: $level}';
  }
}
