import 'package:get/get.dart';

class TranslationKeys {
  // App related
  static const String appName = 'app_name';
  static const String chooseLanguage = 'choose_language';
  static const String login = 'login';
  static const String signup = 'signup';
  static const String email = 'email';
  static const String password = 'password';
  static const String phone = 'phone';
  static const String otp = 'otp';
  static const String verify = 'verify';
  static const String resend = 'resend';
  static const String success = 'success';
  static const String error = 'error';
  static const String languageChanged = 'language_changed';
  static const String invalidOtp = 'invalid_otp';
  static const String otpSent = 'otp_sent';

  // Language selection
  static const String english = 'english';
  static const String marathi = 'marathi';
  static const String hindi = 'hindi';

  // Service Screen
  static const String selectOption = 'select_option';
  static const String farmer = 'farmer';
  static const String labour = 'labour';
  static const String serviceProvider = 'service_provider';
  static const String serviceReceiver = 'service_receiver';

  // Login Screen
  static const String forgotPassword = 'forgot_password';
  static const String loginWithPhone = 'login_with_phone';
  static const String loginWithEmail = 'login_with_email';
  static const String or = 'or';
  static const String continueWithGoogle = 'continue_with_google';
  static const String dontHaveAccount = 'dont_have_account';
  static const String signUp = 'sign_up';

  // Farmer related
  static const String farmerId = 'farmer_id';
  static const String farmerName = 'farmer_name';
  static const String farmerAge = 'farmer_age';
  static const String farmerAddress = 'farmer_address';
  static const String farmerLandSize = 'farmer_land_size';
  static const String farmerCropTypes = 'farmer_crop_types';
  static const String farmerAnnualIncome = 'farmer_annual_income';
  static const String farmerContactNumber = 'farmer_contact_number';

  // Common
  static const String submit = 'submit';
  static const String cancel = 'cancel';
  static const String save = 'save';
  static const String edit = 'edit';
  static const String delete = 'delete';
  static const String confirm = 'confirm';
  static const String back = 'back';
  static const String next = 'next';
  static const String skip = 'skip';
  static const String done = 'done';
  static const String loading = 'loading';
  static const String noData = 'no_data';
  static const String search = 'search';
  static const String filter = 'filter';
  static const String sort = 'sort';
  static const String refresh = 'refresh';
  static const String retry = 'retry';
  static const String settings = 'settings';
  static const String profile = 'profile';
  static const String logout = 'logout';

  // Agricultural Orders
  static const String agriculturalOrders = 'agricultural_orders';
  static const String orderId = 'order_id';
  static const String orderDate = 'order_date';
  static const String orderStatus = 'order_status';
  static const String orderDetails = 'order_details';
  static const String orderItems = 'order_items';
  static const String orderTotal = 'order_total';
  static const String orderQuantity = 'order_quantity';
  static const String orderPrice = 'order_price';
  static const String orderDeliveryDate = 'order_delivery_date';
  static const String orderPaymentStatus = 'order_payment_status';
  static const String orderPaymentMethod = 'order_payment_method';
  static const String orderShippingAddress = 'order_shipping_address';
  static const String orderBillingAddress = 'order_billing_address';
  static const String orderNotes = 'order_notes';
  static const String orderTrackingNumber = 'order_tracking_number';
  static const String orderInvoice = 'order_invoice';
  static const String orderHistory = 'order_history';
  static const String orderCancelled = 'order_cancelled';
  static const String orderPending = 'order_pending';
  static const String orderProcessing = 'order_processing';
  static const String orderShipped = 'order_shipped';
  static const String orderDelivered = 'order_delivered';
  static const String orderReturned = 'order_returned';
  static const String orderRefunded = 'order_refunded';
  static const String orderFailed = 'order_failed';
  static const String orderCompleted = 'order_completed';

  // OTP Screen
  static const String otpVerification = 'otp_verification';
  static const String enterOtpSent = 'enter_otp_sent';
  static const String enterOtp = 'enter_otp';
  static const String verifyOtp = 'verify_otp';
  static const String didntReceiveOtp = 'didnt_receive_otp';
  static const String resendOtp = 'resend_otp';
  static const String otpMustBe6Digits = 'otp_must_be_6_digits';
  static const String pleaseEnterOtp = 'please_enter_otp';

  // Application Screen
  static const String application = 'application';
  static const String applicationSent = 'application_sent';
  static const String appliedForJob = 'applied_for_job';
  static const String termsNotAccepted = 'terms_not_accepted';
  static const String acceptTerms = 'accept_terms';

  // Service Provider Screen
  static const String completedHarvesting = 'completed_harvesting';
  static const String labourId = 'labour_id';

  // Sign Up Screen
  static const String haveAnAccount = 'have_an_account';
  static const String logIn = 'log_in';
}

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      // App related
      TranslationKeys.appName: 'Agro Finder',
      TranslationKeys.chooseLanguage: 'Choose Language',
      TranslationKeys.login: 'Login',
      TranslationKeys.signup: 'Sign Up',
      TranslationKeys.email: 'Email',
      TranslationKeys.password: 'Password',
      TranslationKeys.phone: 'Phone Number',
      TranslationKeys.otp: 'OTP',
      TranslationKeys.verify: 'Verify',
      TranslationKeys.resend: 'Resend',
      TranslationKeys.success: 'Success',
      TranslationKeys.error: 'Error',
      TranslationKeys.languageChanged: 'Language changed to @language',
      TranslationKeys.invalidOtp: 'Invalid OTP',
      TranslationKeys.otpSent: 'OTP sent successfully',

      // Language selection
      TranslationKeys.english: 'English',
      TranslationKeys.marathi: 'मराठी',
      TranslationKeys.hindi: 'हिंदी',

      // Service Screen
      TranslationKeys.selectOption: 'Select the option',
      TranslationKeys.farmer: 'FARMER',
      TranslationKeys.labour: 'LABOUR',
      TranslationKeys.serviceProvider: 'Service Provider',
      TranslationKeys.serviceReceiver: 'Service Receiver',

      // Login Screen
      TranslationKeys.forgotPassword: 'Forgot Password',
      TranslationKeys.loginWithPhone: 'Login with Phone Number',
      TranslationKeys.loginWithEmail: 'Login with Email',
      TranslationKeys.or: 'OR',
      TranslationKeys.continueWithGoogle: 'Continue with Google',
      TranslationKeys.dontHaveAccount: 'Don\'t have an account?',
      TranslationKeys.signUp: 'Sign up',

      // Farmer related
      TranslationKeys.farmerId: 'Farmer ID',
      TranslationKeys.farmerName: 'Name',
      TranslationKeys.farmerAge: 'Age',
      TranslationKeys.farmerAddress: 'Address',
      TranslationKeys.farmerLandSize: 'Land Size (acres)',
      TranslationKeys.farmerCropTypes: 'Crop Types',
      TranslationKeys.farmerAnnualIncome: 'Annual Income',
      TranslationKeys.farmerContactNumber: 'Contact Number',

      // Common
      TranslationKeys.submit: 'Submit',
      TranslationKeys.cancel: 'Cancel',
      TranslationKeys.save: 'Save',
      TranslationKeys.edit: 'Edit',
      TranslationKeys.delete: 'Delete',
      TranslationKeys.confirm: 'Confirm',
      TranslationKeys.back: 'Back',
      TranslationKeys.next: 'Next',
      TranslationKeys.skip: 'Skip',
      TranslationKeys.done: 'Done',
      TranslationKeys.loading: 'Loading...',
      TranslationKeys.noData: 'No data available',
      TranslationKeys.search: 'Search',
      TranslationKeys.filter: 'Filter',
      TranslationKeys.sort: 'Sort',
      TranslationKeys.refresh: 'Refresh',
      TranslationKeys.retry: 'Retry',
      TranslationKeys.settings: 'Settings',
      TranslationKeys.profile: 'Profile',
      TranslationKeys.logout: 'Logout',

      // Agricultural Orders
      TranslationKeys.agriculturalOrders: 'Agricultural Orders',
      TranslationKeys.orderId: 'Order ID',
      TranslationKeys.orderDate: 'Order Date',
      TranslationKeys.orderStatus: 'Order Status',
      TranslationKeys.orderDetails: 'Order Details',
      TranslationKeys.orderItems: 'Order Items',
      TranslationKeys.orderTotal: 'Order Total',
      TranslationKeys.orderQuantity: 'Quantity',
      TranslationKeys.orderPrice: 'Price',
      TranslationKeys.orderDeliveryDate: 'Delivery Date',
      TranslationKeys.orderPaymentStatus: 'Payment Status',
      TranslationKeys.orderPaymentMethod: 'Payment Method',
      TranslationKeys.orderShippingAddress: 'Shipping Address',
      TranslationKeys.orderBillingAddress: 'Billing Address',
      TranslationKeys.orderNotes: 'Order Notes',
      TranslationKeys.orderTrackingNumber: 'Tracking Number',
      TranslationKeys.orderInvoice: 'Invoice',
      TranslationKeys.orderHistory: 'Order History',
      TranslationKeys.orderCancelled: 'Cancelled',
      TranslationKeys.orderPending: 'Pending',
      TranslationKeys.orderProcessing: 'Processing',
      TranslationKeys.orderShipped: 'Shipped',
      TranslationKeys.orderDelivered: 'Delivered',
      TranslationKeys.orderReturned: 'Returned',
      TranslationKeys.orderRefunded: 'Refunded',
      TranslationKeys.orderFailed: 'Failed',
      TranslationKeys.orderCompleted: 'Completed',

      // OTP Screen
      TranslationKeys.otpVerification: 'OTP Verification',
      TranslationKeys.enterOtpSent: 'Enter the OTP sent to your phone number',
      TranslationKeys.enterOtp: 'Enter OTP',
      TranslationKeys.verifyOtp: 'Verify OTP',
      TranslationKeys.didntReceiveOtp: 'Didn\'t receive OTP? Resend',
      TranslationKeys.resendOtp: 'Resend OTP',
      TranslationKeys.otpMustBe6Digits: 'OTP must be 6 digits',
      TranslationKeys.pleaseEnterOtp: 'Please enter the OTP',

      // Application Screen
      TranslationKeys.application: 'Application',
      TranslationKeys.applicationSent: 'Application Sent',
      TranslationKeys.appliedForJob: 'You have applied for the Harvesting job!',
      TranslationKeys.termsNotAccepted: 'Terms Not Accepted',
      TranslationKeys.acceptTerms: 'Please accept the terms and conditions.',

      // Service Provider Screen
      TranslationKeys.completedHarvesting: 'Completed Harvesting',
      TranslationKeys.labourId: 'Labour ID',

      // Sign Up Screen
      TranslationKeys.haveAnAccount: 'Have an account?',
      TranslationKeys.logIn: 'Log in',
    },
    'mr_IN': {
      // App related
      TranslationKeys.appName: 'एग्रो फाइंडर',
      TranslationKeys.chooseLanguage: 'भाषा निवडा',
      TranslationKeys.login: 'लॉगिन',
      TranslationKeys.signup: 'साइन अप',
      TranslationKeys.email: 'ईमेल',
      TranslationKeys.password: 'पासवर्ड',
      TranslationKeys.phone: 'फोन नंबर',
      TranslationKeys.otp: 'ओटीपी',
      TranslationKeys.verify: 'सत्यापित करा',
      TranslationKeys.resend: 'पुन्हा पाठवा',
      TranslationKeys.success: 'यशस्वी',
      TranslationKeys.error: 'त्रुटी',
      TranslationKeys.languageChanged: 'भाषा @language मध्ये बदलली',
      TranslationKeys.invalidOtp: 'अवैध ओटीपी',
      TranslationKeys.otpSent: 'ओटीपी यशस्वीरित्या पाठवला',

      // Language selection
      TranslationKeys.english: 'English',
      TranslationKeys.marathi: 'मराठी',
      TranslationKeys.hindi: 'हिंदी',

      // Service Screen
      TranslationKeys.selectOption: 'पर्याय निवडा',
      TranslationKeys.farmer: 'शेतकरी',
      TranslationKeys.labour: 'कामगार',
      TranslationKeys.serviceProvider: 'सेवा प्रदाता',
      TranslationKeys.serviceReceiver: 'सेवा प्राप्तकर्ता',

      // Login Screen
      TranslationKeys.forgotPassword: 'पासवर्ड विसरलात?',
      TranslationKeys.loginWithPhone: 'फोन नंबरने लॉगिन करा',
      TranslationKeys.loginWithEmail: 'ईमेलने लॉगिन करा',
      TranslationKeys.or: 'किंवा',
      TranslationKeys.continueWithGoogle: 'Google सह सुरू ठेवा',
      TranslationKeys.dontHaveAccount: 'खाते नाही?',
      TranslationKeys.signUp: 'साइन अप करा',

      // Farmer related
      TranslationKeys.farmerId: 'शेतकरी आयडी',
      TranslationKeys.farmerName: 'नाव',
      TranslationKeys.farmerAge: 'वय',
      TranslationKeys.farmerAddress: 'पत्ता',
      TranslationKeys.farmerLandSize: 'जमीन आकार (एकर)',
      TranslationKeys.farmerCropTypes: 'पिकांचे प्रकार',
      TranslationKeys.farmerAnnualIncome: 'वार्षिक उत्पन्न',
      TranslationKeys.farmerContactNumber: 'संपर्क क्रमांक',

      // Common
      TranslationKeys.submit: 'सबमिट करा',
      TranslationKeys.cancel: 'रद्द करा',
      TranslationKeys.save: 'जतन करा',
      TranslationKeys.edit: 'सुधारा',
      TranslationKeys.delete: 'हटवा',
      TranslationKeys.confirm: 'पुष्टी करा',
      TranslationKeys.back: 'मागे जा',
      TranslationKeys.next: 'पुढे जा',
      TranslationKeys.skip: 'वगळा',
      TranslationKeys.done: 'पूर्ण',
      TranslationKeys.loading: 'लोड होत आहे...',
      TranslationKeys.noData: 'डेटा उपलब्ध नाही',
      TranslationKeys.search: 'शोधा',
      TranslationKeys.filter: 'फिल्टर',
      TranslationKeys.sort: 'क्रमवारी',
      TranslationKeys.refresh: 'रिफ्रेश करा',
      TranslationKeys.retry: 'पुन्हा प्रयत्न करा',
      TranslationKeys.settings: 'सेटिंग्ज',
      TranslationKeys.profile: 'प्रोफाइल',
      TranslationKeys.logout: 'लॉगआउट',

      // Agricultural Orders
      TranslationKeys.agriculturalOrders: 'कृषी ऑर्डर्स',
      TranslationKeys.orderId: 'ऑर्डर आयडी',
      TranslationKeys.orderDate: 'ऑर्डर तारीख',
      TranslationKeys.orderStatus: 'ऑर्डर स्थिती',
      TranslationKeys.orderDetails: 'ऑर्डर तपशील',
      TranslationKeys.orderItems: 'ऑर्डर आयटम्स',
      TranslationKeys.orderTotal: 'एकूण ऑर्डर',
      TranslationKeys.orderQuantity: 'प्रमाण',
      TranslationKeys.orderPrice: 'किंमत',
      TranslationKeys.orderDeliveryDate: 'डिलिव्हरी तारीख',
      TranslationKeys.orderPaymentStatus: 'पेमेंट स्थिती',
      TranslationKeys.orderPaymentMethod: 'पेमेंट पद्धत',
      TranslationKeys.orderShippingAddress: 'शिपिंग पत्ता',
      TranslationKeys.orderBillingAddress: 'बिलिंग पत्ता',
      TranslationKeys.orderNotes: 'ऑर्डर नोट्स',
      TranslationKeys.orderTrackingNumber: 'ट्रॅकिंग नंबर',
      TranslationKeys.orderInvoice: 'इनव्हॉइस',
      TranslationKeys.orderHistory: 'ऑर्डर इतिहास',
      TranslationKeys.orderCancelled: 'रद्द केले',
      TranslationKeys.orderPending: 'प्रलंबित',
      TranslationKeys.orderProcessing: 'प्रक्रिया करत आहे',
      TranslationKeys.orderShipped: 'पाठवले',
      TranslationKeys.orderDelivered: 'डिलिव्हर केले',
      TranslationKeys.orderReturned: 'परत केले',
      TranslationKeys.orderRefunded: 'परतावा दिला',
      TranslationKeys.orderFailed: 'अयशस्वी',
      TranslationKeys.orderCompleted: 'पूर्ण झाले',

      // OTP Screen
      TranslationKeys.otpVerification: 'ओटीपी सत्यापन',
      TranslationKeys.enterOtpSent: 'तुमच्या फोन नंबरवर पाठवलेला ओटीपी टाका',
      TranslationKeys.enterOtp: 'ओटीपी टाका',
      TranslationKeys.verifyOtp: 'ओटीपी सत्यापित करा',
      TranslationKeys.didntReceiveOtp: 'ओटीपी मिळाला नाही? पुन्हा पाठवा',
      TranslationKeys.resendOtp: 'ओटीपी पुन्हा पाठवा',
      TranslationKeys.otpMustBe6Digits: 'ओटीपी 6 अंकी असावा',
      TranslationKeys.pleaseEnterOtp: 'कृपया ओटीपी टाका',

      // Application Screen
      TranslationKeys.application: 'अर्ज',
      TranslationKeys.applicationSent: 'अर्ज पाठवला',
      TranslationKeys.appliedForJob:
          'तुम्ही कापणीच्या नोकरीसाठी अर्ज केला आहे!',
      TranslationKeys.termsNotAccepted: 'अटी स्वीकारल्या नाहीत',
      TranslationKeys.acceptTerms: 'कृपया अटी आणि नियम स्वीकारा.',

      // Service Provider Screen
      TranslationKeys.completedHarvesting: 'कापणी पूर्ण झाली',
      TranslationKeys.labourId: 'कामगार आयडी',

      // Sign Up Screen
      TranslationKeys.haveAnAccount: 'खाते आहे?',
      TranslationKeys.logIn: 'लॉग इन करा',
    },
    'hi_IN': {
      // App related
      TranslationKeys.appName: 'एग्रो फाइंडर',
      TranslationKeys.chooseLanguage: 'भाषा चुनें',
      TranslationKeys.login: 'लॉगिन',
      TranslationKeys.signup: 'साइन अप',
      TranslationKeys.email: 'ईमेल',
      TranslationKeys.password: 'पासवर्ड',
      TranslationKeys.phone: 'फोन नंबर',
      TranslationKeys.otp: 'ओटीपी',
      TranslationKeys.verify: 'सत्यापित करें',
      TranslationKeys.resend: 'पुनः भेजें',
      TranslationKeys.success: 'सफल',
      TranslationKeys.error: 'त्रुटि',
      TranslationKeys.languageChanged: 'भाषा @language में बदली गई',
      TranslationKeys.invalidOtp: 'अमान्य ओटीपी',
      TranslationKeys.otpSent: 'ओटीपी सफलतापूर्वक भेजा गया',

      // Language selection
      TranslationKeys.english: 'English',
      TranslationKeys.marathi: 'मराठी',
      TranslationKeys.hindi: 'हिंदी',

      // Service Screen
      TranslationKeys.selectOption: 'विकल्प चुनें',
      TranslationKeys.farmer: 'किसान',
      TranslationKeys.labour: 'मजदूर',
      TranslationKeys.serviceProvider: 'सेवा प्रदाता',
      TranslationKeys.serviceReceiver: 'सेवा प्राप्तकर्ता',

      // Login Screen
      TranslationKeys.forgotPassword: 'पासवर्ड भूल गए?',
      TranslationKeys.loginWithPhone: 'फोन नंबर से लॉगिन करें',
      TranslationKeys.loginWithEmail: 'ईमेल से लॉगिन करें',
      TranslationKeys.or: 'या',
      TranslationKeys.continueWithGoogle: 'Google के साथ जारी रखें',
      TranslationKeys.dontHaveAccount: 'खाता नहीं है?',
      TranslationKeys.signUp: 'साइन अप करें',

      // Farmer related
      TranslationKeys.farmerId: 'किसान आईडी',
      TranslationKeys.farmerName: 'नाम',
      TranslationKeys.farmerAge: 'आयु',
      TranslationKeys.farmerAddress: 'पता',
      TranslationKeys.farmerLandSize: 'जमीन का आकार (एकड़)',
      TranslationKeys.farmerCropTypes: 'फसल के प्रकार',
      TranslationKeys.farmerAnnualIncome: 'वार्षिक आय',
      TranslationKeys.farmerContactNumber: 'संपर्क नंबर',

      // Common
      TranslationKeys.submit: 'जमा करें',
      TranslationKeys.cancel: 'रद्द करें',
      TranslationKeys.save: 'सहेजें',
      TranslationKeys.edit: 'संपादित करें',
      TranslationKeys.delete: 'हटाएं',
      TranslationKeys.confirm: 'पुष्टि करें',
      TranslationKeys.back: 'वापस जाएं',
      TranslationKeys.next: 'आगे बढ़ें',
      TranslationKeys.skip: 'छोड़ें',
      TranslationKeys.done: 'पूर्ण',
      TranslationKeys.loading: 'लोड हो रहा है...',
      TranslationKeys.noData: 'कोई डेटा उपलब्ध नहीं है',
      TranslationKeys.search: 'खोजें',
      TranslationKeys.filter: 'फ़िल्टर',
      TranslationKeys.sort: 'क्रमबद्ध करें',
      TranslationKeys.refresh: 'ताज़ा करें',
      TranslationKeys.retry: 'पुनः प्रयास करें',
      TranslationKeys.settings: 'सेटिंग्स',
      TranslationKeys.profile: 'प्रोफ़ाइल',
      TranslationKeys.logout: 'लॉगआउट',

      // Agricultural Orders
      TranslationKeys.agriculturalOrders: 'कृषि आदेश',
      TranslationKeys.orderId: 'आदेश आईडी',
      TranslationKeys.orderDate: 'आदेश तिथि',
      TranslationKeys.orderStatus: 'आदेश स्थिति',
      TranslationKeys.orderDetails: 'आदेश विवरण',
      TranslationKeys.orderItems: 'आदेश आइटम',
      TranslationKeys.orderTotal: 'कुल आदेश',
      TranslationKeys.orderQuantity: 'मात्रा',
      TranslationKeys.orderPrice: 'मूल्य',
      TranslationKeys.orderDeliveryDate: 'वितरण तिथि',
      TranslationKeys.orderPaymentStatus: 'भुगतान स्थिति',
      TranslationKeys.orderPaymentMethod: 'भुगतान विधि',
      TranslationKeys.orderShippingAddress: 'शिपिंग पता',
      TranslationKeys.orderBillingAddress: 'बिलिंग पता',
      TranslationKeys.orderNotes: 'आदेश नोट्स',
      TranslationKeys.orderTrackingNumber: 'ट्रैकिंग नंबर',
      TranslationKeys.orderInvoice: 'चालान',
      TranslationKeys.orderHistory: 'आदेश इतिहास',
      TranslationKeys.orderCancelled: 'रद्द किया गया',
      TranslationKeys.orderPending: 'लंबित',
      TranslationKeys.orderProcessing: 'प्रसंस्करण',
      TranslationKeys.orderShipped: 'भेज दिया गया',
      TranslationKeys.orderDelivered: 'वितरित किया गया',
      TranslationKeys.orderReturned: 'वापस किया गया',
      TranslationKeys.orderRefunded: 'वापस किया गया',
      TranslationKeys.orderFailed: 'असफल',
      TranslationKeys.orderCompleted: 'पूर्ण हुआ',

      // OTP Screen
      TranslationKeys.otpVerification: 'ओटीपी सत्यापन',
      TranslationKeys.enterOtpSent: 'अपने फोन नंबर पर भेजा गया ओटीपी दर्ज करें',
      TranslationKeys.enterOtp: 'ओटीपी दर्ज करें',
      TranslationKeys.verifyOtp: 'ओटीपी सत्यापित करें',
      TranslationKeys.didntReceiveOtp: 'ओटीपी नहीं मिला? पुनः भेजें',
      TranslationKeys.resendOtp: 'ओटीपी पुनः भेजें',
      TranslationKeys.otpMustBe6Digits: 'ओटीपी 6 अंकों का होना चाहिए',
      TranslationKeys.pleaseEnterOtp: 'कृपया ओटीपी दर्ज करें',

      // Application Screen
      TranslationKeys.application: 'आवेदन',
      TranslationKeys.applicationSent: 'आवेदन भेजा गया',
      TranslationKeys.appliedForJob: 'आपने कटाई की नौकरी के लिए आवेदन किया है!',
      TranslationKeys.termsNotAccepted: 'नियम स्वीकारे नहीं गए',
      TranslationKeys.acceptTerms: 'कृपया नियम और शर्तें स्वीकार करें.',

      // Service Provider Screen
      TranslationKeys.completedHarvesting: 'कटाई पूरी हुई',
      TranslationKeys.labourId: 'श्रमिक आईडी',

      // Sign Up Screen
      TranslationKeys.haveAnAccount: 'खाता है?',
      TranslationKeys.logIn: 'लॉग इन करें',
    },
  };
}
