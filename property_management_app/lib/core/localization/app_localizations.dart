import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      // Auth
      'login_title': 'Login',
      'email_hint': 'Enter your email',
      'password_hint': 'Enter your password',
      'sign_in': 'Sign In',
      'no_account': 'Don\'t have an account? ',
      'register': 'Register',
      'register_title': 'Create Account',
      'full_name': 'Full Name',
      'phone_number': 'Phone Number',
      'create_account': 'Create Account',
      'incorrect_role': 'Incorrect role? ',
      'change': 'Change',

      // Role Selection
      'choose_account_type': 'Choose Account Type',
      'role_selection_subtitle':
          'To provide you with a personalized experience suitable for your role within the building.',
      'role_owner': 'Owner',
      'role_owner_desc':
          'Manage apartment, track maintenance, and oversee all units',
      'role_tenant': 'Tenant',
      'role_tenant_desc':
          'Submit maintenance requests, receive notifications and track services',
      'role_supervisor': 'Supervisor',
      'role_supervisor_desc':
          'Arrange daily tasks, follow up on workers and approve requests',
      'role_provider': 'Service Provider',
      'role_provider_desc':
          'Receive reports, execute requests, and update work status',
      'next': 'Next',
      'select_account_type_error': 'Please select an account type',
      'registering_as': 'Registering as: ',

      // Dashboard Titles
      'dashboard_owner': 'Owner Dashboard',
      'dashboard_tenant': 'Tenant Dashboard',
      'dashboard_supervisor': 'Supervisor Dashboard',
      'dashboard_provider': 'Provider Dashboard',

      // Common
      'welcome': 'Welcome',
      'logout': 'Logout',
    },
    'ar': {
      // Auth
      'login_title': 'تسجيل الدخول',
      'email_hint': 'أدخل البريد الإلكتروني',
      'password_hint': 'أدخل كلمة المرور',
      'sign_in': 'دخول',
      'no_account': 'ليس لديك حساب؟ ',
      'register': 'تسجيل جديد',
      'register_title': 'إنشاء حساب',
      'full_name': 'الاسم الكامل',
      'phone_number': 'رقم الهاتف',
      'create_account': 'إنشاء الحساب',
      'incorrect_role': 'الدور غير صحيح؟ ',
      'change': 'تغيير',

      // Role Selection
      'choose_account_type': 'اختر نوع الحساب',
      'role_selection_subtitle': 'لنقدم لك تجربة مخصصة تناسب دورك داخل المبنى.',
      'role_owner': 'مالك',
      'role_owner_desc': 'إدارة الشقة، تتبع الصيانة، والإشراف على جميع الوحدات',
      'role_tenant': 'مستأجر',
      'role_tenant_desc': 'تقديم طلبات الصيانة، تلقي الإشعارات وتتبع الخدمات',
      'role_supervisor': 'مشرف',
      'role_supervisor_desc':
          'ترتيب المهام اليومية، متابعة العمال والموافقة على الطلبات',
      'role_provider': 'مزود خدمة',
      'role_provider_desc': 'استلام التقارير، تنفيذ الطلبات، وتحديث حالة العمل',
      'next': 'التالي',
      'select_account_type_error': 'الرجاء اختيار نوع الحساب',
      'registering_as': 'التسجيل كـ: ',

      // Dashboard Titles
      'dashboard_owner': 'لوحة تحكم المالك',
      'dashboard_tenant': 'لوحة تحكم المستأجر',
      'dashboard_supervisor': 'لوحة تحكم المشرف',
      'dashboard_provider': 'لوحة تحكم مزود الخدمة',

      // Common
      'welcome': 'مرحباً',
      'logout': 'تسجيل خروج',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
