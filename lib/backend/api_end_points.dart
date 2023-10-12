class ApiEndPoints{
  static String baseUrl='https://v5.checkprojectstatus.com:4000/';
  static String createUser='auth/user/signup';
  static String loginUser='auth/user/login';
  static String userProfile='auth/user/detail';
  static String sendOtp='auth/user/forgot-password/send-otp';
  static String verifyOtp='auth/user/forgot-password/verify-otp';
  static String setPassword='auth/user/forgot-password/set-password';
  static String getCategory='category/get-all';
  static String getTimeZone='timezone/get/all';
  static String createBooking='booking/create';
  static String getExpertList='expert/get/all';
  static String getExpertProfile='expert/get/profile/';
  static String getBookingList='booking/get-all';
  static String getSingleBooking='booking/single/';
  static String getWallet='wallet/get/';
  static String getPayments='booking/payments';
  static String cancelBooking='booking/cancel/';
  static String acceptBooking='booking/accept/';
}