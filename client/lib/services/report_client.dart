import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

class ReportClient {
  static final String _host = "http://10.0.2.2:8000/api";
  Response response;
  Dio dio = new Dio();

  Future<dynamic> getHeaders() async {
    return {"Content-Type": "application/json"};
  }

  Future<bool> createLogin(Map<String, dynamic> login) async {
    try {
      print(_host + "/signup");
      response = await dio.post("http://10.0.2.2:8000/api/signup", data: {
        "username": "henriq",
        "password": "123456789",
        "email": "66556556a9@gmail.com"
      });
      print(response);

      /* final model = await post(_host + '/signup',
          body: json.encode(login), headers: await getHeaders());
      print(model); */
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  /* Future<void> fetchExpenseItems() async {
    AppDatabase _db = await db;

    List<LoginEntity> _login = await _db.loginDao.getAll();

    if (_login.length > 0) {
      LoginEntity model = _login[0];
      Map<String, String> headers = await this.getHeaders();
      String domain = model.domain;
      final expenseItems =
          await post(_host + '/api/$domain/Expenses/ListarItensDespesa',
              body: json.encode({
                "dominio": domain,
                "rota_dominio": "app.erpm8.cloud",
                "grant_type": "password",
              }),
              headers: headers);

      print(expenseItems.body);

      model.expenseItems = expenseItems.body;
      await _db.loginDao.updateItem(model);
    }
  } */
}
