class Urls {
  static const String _baseUrl = 'http://ecom-api.teamrabbil.com/api';

  static String sentEmailOtp(String email) => '$_baseUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

  static String readProfile = '$_baseUrl/ReadProfile';
  static String createProfile = '$_baseUrl/CreateProfile';
  static String homeBanner = '$_baseUrl/ListProductSlider';
  static String categoryList = '$_baseUrl/CategoryList';
  static String popularProduct = '$_baseUrl/ListProductByRemark/Popular';
  static String specialProduct = '$_baseUrl/ListProductByRemark/Special';
  static String newProduct = '$_baseUrl/ListProductByRemark/New';

  static String productsByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';

  static String productDetails(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';

  static String removeProduct(int productId) =>
      '$_baseUrl/RemoveWishList/$productId';

  static String addToCart = '$_baseUrl/CreateCartList';
  static String cartList = '$_baseUrl/CartList';
  static String createInVoice = '$_baseUrl/InvoiceCreate';

  static String createWishList(int productId) =>
      '$_baseUrl/CreateWishList/$productId';
  static String wishList = '$_baseUrl/ProductWishList';

  static String deleteCartListById(int id) => '$_baseUrl/DeleteCartList/$id';
  static String createReview = '$_baseUrl/CreateProductReview';
  static String listReviewById(int id) => '$_baseUrl/ListReviewByProduct/$id';
}
