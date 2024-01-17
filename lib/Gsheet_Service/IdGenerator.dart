import 'dart:math';

var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

Random _rnd = Random();
String? ID;

UniqueIdGenerator() async {
  Random random = await new Random();
  int randomNumber = await random.nextInt(1000000);

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  ID = await '${randomNumber}${getRandomString(10)}';
}


