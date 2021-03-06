
// Generated file. Do not edit.

import 'package:flutter/foundation.dart';
import 'package:fast_i18n/fast_i18n.dart';

const String _baseLocale = '';
String _locale = _baseLocale;
Map<String, Strings> _strings = {
	'': Strings.instance,
	'tr': StringsTr.instance,
	'en': Strings.instance, // assume default locale is en, add a specific 'en' locale to remove this or add config.i18n.json
};

/// use this to get your translations, e.g. t.someKey.anotherKey
Strings get t {
	return _strings[_locale];
}

class LocaleSettings {

	/// use the locale of the device, fallback to default locale
	static Future<void> useDeviceLocale() async {
		_locale = await FastI18n.findDeviceLocale(_strings.keys.toList(), _baseLocale);
	}

	/// set the locale, fallback to default locale
	static void setLocale(String locale) {
		_locale = FastI18n.selectLocale(locale, _strings.keys.toList(), _baseLocale);
	}

	/// get the current locale
	static String get currentLocale {
		if (_locale == 'en') return '';
		return _locale;
	}

	/// get the base locale
	static String get baseLocale {
		return _baseLocale;
	}

	/// get the supported locales
	static List<String> get locales {
		return _strings.keys.toList();
	}
}

class Strings {
	static Strings _instance = Strings();
	static Strings get instance => _instance;

	StringsAuth get Auth => StringsAuth._instance;
	StringsDrawer get Drawer => StringsDrawer._instance;
	StringsSettings get Settings => StringsSettings._instance;
	StringsAbout get About => StringsAbout._instance;
	StringsFeed get Feed => StringsFeed._instance;
	StringsChat get Chat => StringsChat._instance;
	StringsGroups get Groups => StringsGroups._instance;
	StringsWallpapers get Wallpapers => StringsWallpapers._instance;
	StringsSubscriptions get Subscriptions => StringsSubscriptions._instance;
	StringsNotifications get Notifications => StringsNotifications._instance;
	String get app_name => 'Social Messenger';
	String get app_version => '1.0.0';
	String get about_us => 'Social Messenger is a community dedicated to chat app to connect people.';
	String get unknown_error => 'Oops, Something went Wrong!';
	StringsReport get Report => StringsReport._instance;
	StringsAdmin get Admin => StringsAdmin._instance;
}

class StringsAuth {
	static StringsAuth _instance = StringsAuth();
	static StringsAuth get instance => _instance;

	String get next => 'Next';
	String get email_user => 'Are you Email User, Login here!';
	String get email => 'Email';
	String get password => 'Password';
	String get login => 'Login';
	String get phone_verification => 'Phone Number Verification';
	String get enter_code => 'Enter the code sent to ';
	String get didnt_recieve_code => 'Didn\'t receive the code? ';
	String get resend => 'RESEND';
	String get verify => 'VERIFY';
	String get posts => 'POSTS';
	String get forgot_password => 'Forgot Password?';
	String get followig => 'FOLLOWING';
	String get followers => 'FOLLOWERS';
	String get register => 'Register';
	String get name => 'Username';
	String get status => 'Status';
	String get add_valid_name => 'Add valid Name';
	String get select_gender => 'Please select your gender.';
	String get male_gender => 'Male';
	String get female_gender => 'Female';
	String get accept_terms => 'I Accept All Terms & Conditions';
	String get save => 'Save';
	String get invalid_email => 'Invalid Email';
	String get short_pass_msg => 'Password Must Contain At Least 8 characters';
	String get name_taken => 'Username is Already taken';
	String get invalid_phone => '*Please fill up all the cells properly';
	String get follow => 'Follow';
	String get following => 'Following';
	String get message => 'Message';
	String get login_first => 'Oops, Please login first';
	String get enter_email => 'Enter email';
	String get send_mail => 'Send mail';
}

class StringsDrawer {
	static StringsDrawer _instance = StringsDrawer();
	static StringsDrawer get instance => _instance;

	String get groups => 'Groups';
	String get notifications => 'Notifications';
	String get Subscriptions => 'Subscriptions';
	String get chats => 'Chats';
	String get profile => 'Profile';
	String get settings => 'Settings';
	String get admin => 'Admin';
}

class StringsSettings {
	static StringsSettings _instance = StringsSettings();
	static StringsSettings get instance => _instance;

	String get title => 'Settings';
	String get account => 'Account';
	String get edit_profile => 'Edit Profile';
	String get online_status => 'Online Status';
	String get online_description => 'Anyone can see when you\'re last Online';
	String get logout => 'Logout';
	String get notifications => 'Notifications';
	String get direct_msgs => 'Direct Messages';
	String get direct_msgs_descr => 'Recieve all Direct Chat Notificatins';
	String get groups_msgs => 'Groups Messages';
	String get groups_msgs_desc => 'Recieve all Groups Notifications';
	String get about => 'About';
}

class StringsAbout {
	static StringsAbout _instance = StringsAbout();
	static StringsAbout get instance => _instance;

	String get title => 'About';
	String get about_app => 'About App';
	String get rate_us => 'Rate Us';
	String get eula => 'Eulat Agreement';
	String get privacy_policy => 'Privacy Policy';
}

class StringsFeed {
	static StringsFeed _instance = StringsFeed();
	static StringsFeed get instance => _instance;

	String get title => 'FeeD';
	String get post => 'Post';
	String get newest => 'Newest';
	String get gallery => 'Gallery';
	String get story => 'Stories';
	String get my_posts => 'My Posts';
	String get favorite => 'Favorites';
	String get Announcement => 'Announcement';
	String get what_on_mind => 'What on your mind?';
	String get report => 'Report';
	String get likes => 'Likes';
	String get comments => 'Comments';
	String get create_post => 'Create Post';
	String get share => 'Share';
	String get edit => 'Edit';
	String get delete => 'Delete';
	String get read_more => '...Read More';
	String get type_comment => 'Type a comment...';
	String get not_allowed_comment => 'Sorry! You are not allowed to comment';
	String get comment_remove_confirm => 'Are you sure you want to delete this comment?';
	String get reply => 'Reply';
	String get replies => 'Replies';
}

class StringsChat {
	static StringsChat _instance = StringsChat();
	static StringsChat get instance => _instance;

	String get title => 'Chats';
	String get online_users => 'ONLINE USERS';
	String get recent_chats => 'RECENT CHATS';
	String get block => 'Block';
	String get unblock => 'UnBlock';
	String get remove_conversation => 'Remove Conversation';
	String get message => 'Message...';
	String get cannot_chat_with_user => 'Sorry! You can\'t chat wih this user';
	String get msg_remove_confirm => 'Are you sure you want to delete the message?';
	String get online => 'Online';
	String get typing => 'Typing...';
	String get img_msg => 'Image Message';
	String get voice_msg => 'Voice Message';
}

class StringsGroups {
	static StringsGroups _instance = StringsGroups();
	static StringsGroups get instance => _instance;

	String get title => 'Groups';
	String get create_group => 'Create a Group';
	String get members => 'Memebers';
	String get message => 'Message...';
	String get notifications => 'Notifications';
	String get on => 'On';
	String get off => 'Off';
	String get edit => 'Edit Group';
	String get save => 'Save';
	String get leave => 'Leave Group';
	String get group_name => 'Group Name';
	String get join => 'Join';
	String get remove_member => 'Remove member';
	String get block => 'Block';
	String get unblock => 'UnBlock';
	String get admin => 'Admin';
}

class StringsWallpapers {
	static StringsWallpapers _instance = StringsWallpapers();
	static StringsWallpapers get instance => _instance;

	String get failed_to_upload => 'Failed to upload Image';
	String get no_img_selected => 'No image was selected';
}

class StringsSubscriptions {
	static StringsSubscriptions _instance = StringsSubscriptions();
	static StringsSubscriptions get instance => _instance;

	String get Pressed => 'Pressed!';
	String get subscription_header => 'Subscribe now to use all features';
	String get already_subscribed => 'You are already subscribed!';
	String get voice_call_feature => 'Call over the voice anywhere';
	String get video_call_feature => 'Unlimited video call to anyone';
	String get send_text_feature => 'Send secured personal text message to anyone';
	String get one_month => '1 Month';
	String get six_month => '6 Month';
	String get twelve_month => '12 Month';
	String get all_features => 'All features';
}

class StringsNotifications {
	static StringsNotifications _instance = StringsNotifications();
	static StringsNotifications get instance => _instance;

	String get title => 'Notifications';
	String get likes_post => 'likes your post';
	String get start_following => 'start following you';
	String get commented_post => 'commented your post';
	String get replied => 'replied to your comment';
	String get liked_comment => 'reacted to your comment';
	String get sent_msg => 'Sent you message';
}

class StringsReport {
	static StringsReport _instance = StringsReport();
	static StringsReport get instance => _instance;

	String get title => 'Report';
	String get desc => 'We remove post that has: ';
	String get report_reasons => '?????? Sexual content. \n\n?????? Violent or repulsive content. \n\n?????? Hateful or abusive content. \n\n?????? Spam or misleading.';
	String get note => 'We wont let them know if you take this action.';
	String get thanks => 'We will check your request, Thanks for helping improve our community';
}

class StringsAdmin {
	static StringsAdmin _instance = StringsAdmin();
	static StringsAdmin get instance => _instance;

	String get title => 'Admin';
	String get posts => 'Reported Posts';
}

class StringsTr extends Strings {
	static StringsTr _instance = StringsTr();
	static StringsTr get instance => _instance;

	@override StringsAuthTr get Auth => StringsAuthTr._instance;
	@override StringsDrawerTr get Drawer => StringsDrawerTr._instance;
	@override StringsSettingsTr get Settings => StringsSettingsTr._instance;
	@override StringsAboutTr get About => StringsAboutTr._instance;
	@override StringsFeedTr get Feed => StringsFeedTr._instance;
	@override StringsChatTr get Chat => StringsChatTr._instance;
	@override StringsGroupsTr get Groups => StringsGroupsTr._instance;
	@override StringsWallpapersTr get Wallpapers => StringsWallpapersTr._instance;
	@override StringsSubscriptionsTr get Subscriptions => StringsSubscriptionsTr._instance;
	@override StringsNotificationsTr get Notifications => StringsNotificationsTr._instance;
	@override String get app_name => 'Chatty';
	@override String get app_version => '1.0.0';
	@override String get about_us => 'Chatty, insanlar?? birbirine ba??lamak i??in sohbet uygulamas??na adanm???? bir topluluktur.';
	@override String get unknown_error => 'Hoop! Bir??eyler yanl???? gitti!';
	@override StringsReportTr get Report => StringsReportTr._instance;
	@override StringsAdminTr get Admin => StringsAdminTr._instance;
}

class StringsAuthTr extends StringsAuth {
	static StringsAuthTr _instance = StringsAuthTr();
	static StringsAuthTr get instance => _instance;

	@override String get next => '??leri';
	@override String get email_user => 'E-posta Kullan??c??s?? m??s??n??z, Giri?? Yap??n!';
	@override String get email => 'Email';
	@override String get password => '??ifre';
	@override String get login => 'Giri?? Yap';
	@override String get phone_verification => 'Telefon Numaras?? Do??rulamas??';
	@override String get enter_code => 'Adresine g??nderilen kodu girin ';
	@override String get didnt_recieve_code => 'Kodu almad??n m??? ';
	@override String get resend => 'YEN??DEN G??NDER';
	@override String get verify => 'DO??RULAYIN';
	@override String get posts => 'G??NDER??LER';
	@override String get forgot_password => 'Parolan??z?? m?? unuttunuz?';
	@override String get followig => 'TAK??P ETME';
	@override String get followers => 'Takip??iler';
	@override String get register => 'Kay??t ol';
	@override String get name => 'Kullan??c?? Ad??';
	@override String get status => 'Durum';
	@override String get add_valid_name => 'Ge??erli Ad ekleyin';
	@override String get select_gender => 'Cinsiyet Se??.';
	@override String get male_gender => 'Erkek';
	@override String get female_gender => 'Kad??n';
	@override String get accept_terms => 'T??m H??k??m ve Ko??ullar?? Kabul Ediyorum';
	@override String get save => 'Kaydet';
	@override String get invalid_email => 'Ge??ersiz e-posta';
	@override String get short_pass_msg => '??ifre En az 8 karakter i??ermelidir';
	@override String get name_taken => 'Kullan??c?? ad?? zaten al??nm????';
	@override String get invalid_phone => '*L??tfen t??m yerleri do??ru ??ekilde doldurun';
	@override String get follow => 'Takip et';
	@override String get following => 'Takip etme';
	@override String get message => 'Mesaj';
	@override String get login_first => 'Hata, l??tfen ??nce giri?? yap??n';
	@override String get enter_email => 'Email Girin';
	@override String get send_mail => 'Mail G??nder';
}

class StringsDrawerTr extends StringsDrawer {
	static StringsDrawerTr _instance = StringsDrawerTr();
	static StringsDrawerTr get instance => _instance;

	@override String get groups => 'Gruplar';
	@override String get notifications => 'Bildirimler';
	@override String get Subscriptions => 'Abonelik';
	@override String get chats => 'Sohbetler';
	@override String get profile => 'Profil';
	@override String get settings => 'Ayarlar';
	@override String get admin => 'Admin';
}

class StringsSettingsTr extends StringsSettings {
	static StringsSettingsTr _instance = StringsSettingsTr();
	static StringsSettingsTr get instance => _instance;

	@override String get title => 'Ayarlar';
	@override String get account => 'Hesap';
	@override String get edit_profile => 'Profili D??zenle';
	@override String get online_status => 'Online Kullan??c??lar';
	@override String get online_description => 'En son ne zaman ??evrimi??i oldu??unuzu herkes g??rebilir';
	@override String get logout => '????k???? Yap';
	@override String get notifications => 'Bildirimler';
	@override String get direct_msgs => 'Direk Mesaj';
	@override String get direct_msgs_descr => 'T??m Direkt Sohbet Bildirimlerini al??n';
	@override String get groups_msgs => 'Grup Sohbet';
	@override String get groups_msgs_desc => 'T??m Grup Bildirimlerini Al??n';
	@override String get about => 'hakk??nda';
}

class StringsAboutTr extends StringsAbout {
	static StringsAboutTr _instance = StringsAboutTr();
	static StringsAboutTr get instance => _instance;

	@override String get title => 'hakk??nda';
	@override String get about_app => 'Uygulama Hakk??nda';
	@override String get rate_us => 'Puan Ver';
	@override String get eula => 'Eulat Agreement';
	@override String get privacy_policy => 'Gizlilik G??zle??mesi';
}

class StringsFeedTr extends StringsFeed {
	static StringsFeedTr _instance = StringsFeedTr();
	static StringsFeedTr get instance => _instance;

	@override String get title => 'Chatty';
	@override String get post => 'Payla????mlar';
	@override String get newest => 'Yeniler';
	@override String get gallery => 'Galeri';
	@override String get story => 'Hikayeler';
	@override String get my_posts => 'Payla????mlar??m';
	@override String get favorite => 'Favoriler';
	@override String get Announcement => 'Duyurular';
	@override String get what_on_mind => 'Ne D??????n??yorsun?';
	@override String get report => 'Raporla';
	@override String get likes => 'Be??en';
	@override String get comments => 'Youm';
	@override String get create_post => 'Payla????m';
	@override String get share => 'Payla??';
	@override String get edit => 'D??zenle';
	@override String get delete => 'Sil';
	@override String get read_more => '...Daha Fazla';
	@override String get type_comment => 'Yorum Yaz...';
	@override String get not_allowed_comment => 'Afedersiniz! Yorum yapma izniniz yok';
	@override String get comment_remove_confirm => 'Bu yorumu silmek istedi??inizden emin misiniz?';
	@override String get reply => 'Cevapla';
	@override String get replies => 'Cevaplar';
}

class StringsChatTr extends StringsChat {
	static StringsChatTr _instance = StringsChatTr();
	static StringsChatTr get instance => _instance;

	@override String get title => 'Sohbetler';
	@override String get online_users => 'ONLINE Kullan??c??lar';
	@override String get recent_chats => 'SON SOHBETLER';
	@override String get block => 'Block';
	@override String get unblock => 'UnBlock';
	@override String get remove_conversation => 'G??r????meyi Kald??r';
	@override String get message => 'Mesaj...';
	@override String get cannot_chat_with_user => 'Afedersiniz! Bu kullan??c??yla sohbet edemezsiniz';
	@override String get msg_remove_confirm => 'Mesaj?? silmek istedi??inizden emin misiniz?';
	@override String get online => 'Online';
	@override String get typing => 'Yaz??yor...';
	@override String get img_msg => 'Resim Mesaj??';
	@override String get voice_msg => 'Sesli mesaj';
}

class StringsGroupsTr extends StringsGroups {
	static StringsGroupsTr _instance = StringsGroupsTr();
	static StringsGroupsTr get instance => _instance;

	@override String get title => 'Grup';
	@override String get create_group => 'Grup Kur';
	@override String get members => '??yeler';
	@override String get message => 'Mesaj...';
	@override String get notifications => 'Bildirimler';
	@override String get on => 'A????k';
	@override String get off => 'Kapal??';
	@override String get edit => 'Grubu D??zenle';
	@override String get save => 'Kaydet';
	@override String get leave => 'Gruptan Ayr??l';
	@override String get group_name => 'Grup Ad??';
	@override String get join => 'Kat??l';
	@override String get remove_member => '??yeyi kald??r';
	@override String get block => 'Block';
	@override String get unblock => 'UnBlock';
	@override String get admin => 'Admin';
}

class StringsWallpapersTr extends StringsWallpapers {
	static StringsWallpapersTr _instance = StringsWallpapersTr();
	static StringsWallpapersTr get instance => _instance;

	@override String get failed_to_upload => 'Resim y??klenemedi';
	@override String get no_img_selected => 'Hi??bir resim se??ilmedi';
}

class StringsSubscriptionsTr extends StringsSubscriptions {
	static StringsSubscriptionsTr _instance = StringsSubscriptionsTr();
	static StringsSubscriptionsTr get instance => _instance;

	@override String get Pressed => 'T??kla!';
	@override String get subscription_header => 't??m ??zellikleri kullanmak i??in hemen abone olun';
	@override String get already_subscribed => 'Daha ??nce abone oldunuz!';
	@override String get voice_call_feature => 'Sesli G??r????me Yap??n';
	@override String get video_call_feature => 'Herkese s??n??rs??z g??r??nt??l?? g??r????me';
	@override String get send_text_feature => 'Herkese g??venli ki??isel metin mesaj?? g??nderin';
	@override String get one_month => '1 Ay';
	@override String get six_month => '6 Ay';
	@override String get twelve_month => '12 Ay';
	@override String get all_features => 'T??m ??zellikler';
}

class StringsNotificationsTr extends StringsNotifications {
	static StringsNotificationsTr _instance = StringsNotificationsTr();
	static StringsNotificationsTr get instance => _instance;

	@override String get title => 'Bildirimler';
	@override String get likes_post => 'g??nderini be??endi';
	@override String get start_following => 'seni takip etmeye ba??lad??';
	@override String get commented_post => 'g??nderine yorum yapt??';
	@override String get replied => 'yorumuna cevap verdi';
	@override String get liked_comment => 'yorumunuza tepki verdi';
	@override String get sent_msg => 'MEsaj G??nder';
}

class StringsReportTr extends StringsReport {
	static StringsReportTr _instance = StringsReportTr();
	static StringsReportTr get instance => _instance;

	@override String get title => 'Rapor';
	@override String get desc => 'Olan g??nderiyi kald??r??yoruz: ';
	@override String get report_reasons => '?????? Sexual content. \n\n?????? Violent or repulsive content. \n\n?????? Hateful or abusive content. \n\n?????? Spam or misleading.';
	@override String get note => 'We wont let them know if you take this action.';
	@override String get thanks => '??ste??inizi kontrol edece??iz, Toplulu??umuzu geli??tirmemize yard??mc?? oldu??unuz i??in te??ekk??rler';
}

class StringsAdminTr extends StringsAdmin {
	static StringsAdminTr _instance = StringsAdminTr();
	static StringsAdminTr get instance => _instance;

	@override String get title => 'Admin';
	@override String get posts => 'Gmnderiyi Raporla';
}
