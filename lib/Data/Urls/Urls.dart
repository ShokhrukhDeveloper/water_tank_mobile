class AppUrls
{
  static const int _companyId=1;
  static const String _base="https://10.0.2.2:7152";
  static const String _baseApi="$_base/api";
  static const String home="$_baseApi/Product/$_companyId/Company";
  static const String images="$_base/Images/";
  static const String company="$_baseApi/Company/$_companyId/";
  static const String login="$_baseApi/Auth/User";
  static const String signUp="$_baseApi/User/$_companyId";
  static  String  order({required int quantity,required int productId})=>"$_baseApi/Order/User/$productId?Quantity=$quantity";
  static  String  orderCreated({ int limit=10,int page=1})=>"$_baseApi/Order/User/Created?limit=$limit&page=$page";
  static  String  orderDelivering({int limit=10,int page=1})=>"$_baseApi/Order/User/Delivering?Page=$page&Limit=$limit";
  static  String  orderCompleted({int limit=10,int page=1})=>"$_baseApi/Order/User/Completed?limit=$limit&page=$page";
}