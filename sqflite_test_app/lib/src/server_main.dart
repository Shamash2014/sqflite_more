import 'package:tekartik_test_menu/test.dart';
import 'package:sqflite_server/sqflite_server.dart';

int defaultPort = 8501;
void serverMain() {
  menu('server', () {
    SqfliteServer server;
    item('start', () async {
      if (server == null) {
        server = await SqfliteServer.serve(port: defaultPort);
      }
    });
    item('stop', () async {
      await server?.close();
      server = null;
    });
  });
}
