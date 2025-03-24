enum Environment {dev,uat,prod}

abstract class AppEnvironment{
  static late String baseurl;
  static late String environmentbase;

  static late Environment _environment;
  static Environment get environment => _environment;

  static setupEnv (Environment env){
    _environment = env;
    switch (env) {
      case Environment.dev:
        baseurl = "Api baseurl";
        environmentbase = "DEV";
        break;
      
      case Environment.uat:
        baseurl = "Api baseurl";
        environmentbase = "uat";
        break;

      case Environment.prod:
        baseurl = "Api baseurl";
        environmentbase = "prod";
        break;

      default:
        baseurl = "";
        environmentbase = "";
        break;

    }
  }
}
