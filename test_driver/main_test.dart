import 'package:flutter_driver/flutter_driver.dart';
import 'package:screenshots/screenshots.dart';
import 'package:test/test.dart';

void main() {
  group('end-to-end test', () {
    FlutterDriver driver;
    final config = Config();

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if(driver != null) await driver.close();
    });

    test('take a screenshot', () async {
      SerializableFinder fab = find.byType("FloatingActionButton");
      await driver.waitFor(fab);
      await screenshot(driver, config, 'dashboard');
    }, timeout: Timeout(Duration(seconds: 120)));
  });
}