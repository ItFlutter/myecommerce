class AppLink {
  // static const String server = "http://172.20.10.7/ecommerce";
  static const String server = "http://192.168.1.102/ecommerce";
  // static const String server =
  //     "https://ahmaditecommerce.000webhostapp.com//ecommerce";
  // static const String server = "http://10.0.2.2/ecommerce";
  // ================================= Image ================================== //

  // static const String imagestatic = "http://172.20.10.7/ecommerce/upload";
  static const String imagestatic = "http://192.168.1.102/ecommerce/upload";
  // static const String imagestatic =
  //     "https://ahmaditecommerce.000webhostapp.com//ecommerce/upload";
  // static const String imagestatic = "http://10.0.2.2/ecommerce/upload";
  static const String imagecategories = "$imagestatic/categories";
  static const String imageitems = "$imagestatic/items";
  // ========================================================================== //

  static const String test = "$server/test.php";
  // ================================= Auth ================================== //
  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verfiycode = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";
  // ================================= ForgetPassword ================================== //
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String verifyCodeForgetPassword =
      "$server/forgetpassword/verifycode.php";
  // ================================= Home ================================== //
  static const String homepage = "$server/home.php";
  // ================================= Items ================================== //
  static const String items = "$server/items/items.php";
  static const String itemsimages = "$server/items/itemsimages.php";
  static const String searchItems = "$server/items/search.php";
  // ================================= Favorite ================================== //
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deletefromfavorite =
      "$server/favorite/deletefromfavorite.php";
  // ================================= Cart ================================== //
  static const String cartview = "$server/cart/view.php";
  static const String cartadd = "$server/cart/add.php";
  static const String cartdelete = "$server/cart/delete.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";
  // ================================= Address ================================== //
  static const String addressView = "$server/addrees/view.php";
  static const String addressAdd = "$server/addrees/add.php";
  static const String addressEdit = "$server/addrees/edit.php";
  static const String addressDelete = "$server/addrees/delete.php";
  // ================================= Coupon ================================== //
  static const String checkcoupon = "$server/coupon/checkcoupon.php";
  // ================================= Checkout ================================== //
  static const String checkout = "$server/orders/checkout.php";
  static const String pendingorders = "$server/orders/pending.php";
  static const String ordersdetails = "$server/orders/details.php";
  static const String ordersdelete = "$server/orders/delete.php";
  static const String ordersarchive = "$server/orders/archive.php";
  // ================================= Notification ================================== //
  static const String notification = "$server/notification.php";
  // ================================= Offers ================================== //
  static const String offers = "$server/offers.php";
  // ================================= Rating ================================== //
  static const String rating = "$server/rating.php";
}
