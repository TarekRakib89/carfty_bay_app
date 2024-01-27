class Urls {
  static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';

  static String sentEmailOtp(String email) => '$_baseUrl/UserLogin/$email';
  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';
  static String createProfile = '$_baseUrl/CreateProfile';
  static String homeBanner = '$_baseUrl/ListProductSlider';
  static String popularProduct = '$_baseUrl/ListProductByRemark/Popular';
  static String categoryList = '$_baseUrl/CategoryList';
  static String readProfile = '$_baseUrl/ReadProfile';
  static String productsByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';
}
