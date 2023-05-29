
import 'package:covid_data_app/controller/form_provider.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class FormSingleton {
  FormProvider _formProvider = FormProvider();

  FormProvider get formProvider => _formProvider;

  static final FormSingleton _singleton = FormSingleton._internal();

  factory FormSingleton() {
    return _singleton;
  }

  FormSingleton._internal() {
    _formProvider = Provider.of<FormProvider>(navigatorKey!.currentContext!, listen: false);
  }
}