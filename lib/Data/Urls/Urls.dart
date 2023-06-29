class AppUrls
{
  static const num _companyId=1;
  static const String _base="https://10.0.2.2:7152/api";
  static const String home="$_base/Product/$_companyId/Company";
  static const String company="$_base/Company/$_companyId/";

  static  String  order({required int quantity,required int productId})=>"$_base/Order/User/$productId?Quantity=$quantity";
}