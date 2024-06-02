// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a tr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'tr';

  static String m0(foldername) =>
      "Bu Klasörü silmek istediğinizden emin misiniz? ${foldername}";

  static String m1(filename) => "${filename} indiriliyor";

  static String m2(err) => "Hata: ${err}";

  static String m3(filename) => "Dosya açılırken hata oluştu: ${filename}";

  static String m4(filename) => "${filename} dosyası çevrimdışı kullanılamıyor";

  static String m5(path) => "Çevrimdışı dosyalar ${path} adresinde saklanır";

  static String m6(filename) => "Dosya açılıyor: ${filename}";

  static String m7(length) => "Parola ${length} karakter uzunluğunda olmalıdır";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Hesap"),
        "accountDeleted": MessageLookupByLibrary.simpleMessage("Hesap silindi"),
        "allowMeteredConnections": MessageLookupByLibrary.simpleMessage(
            "Ölçülü Bağlantılara İzin Ver"),
        "allowedEmails":
            MessageLookupByLibrary.simpleMessage("İzin Verilen E-postalar"),
        "appName": MessageLookupByLibrary.simpleMessage("Blazed Cloud"),
        "areYouSureYouWantToDeleteThisFile":
            MessageLookupByLibrary.simpleMessage(
                "Bu dosyayı silmek istediğinizden emin misiniz?"),
        "areYouSureYouWantToDeleteYourAccountThis":
            MessageLookupByLibrary.simpleMessage(
                "Hesabınızı silmek istediğinizden emin misiniz? Bu geri döndürülemez. Aboneliğinizi oyun mağazası aracılığıyla manuel olarak iptal etmeniz gerekeceğini lütfen unutmayın (varsa)"),
        "areYouSureYouWantToSignOut": MessageLookupByLibrary.simpleMessage(
            "Çıkış yapmak istediğinizden emin misiniz?"),
        "authenticationRequired":
            MessageLookupByLibrary.simpleMessage("Kimlik Doğrulama Gerekli"),
        "autoDeleteAcount":
            MessageLookupByLibrary.simpleMessage("Hesabı Otomatik Sil"),
        "blazedExplorer":
            MessageLookupByLibrary.simpleMessage("Blazed Explorer"),
        "camSyncDesc": MessageLookupByLibrary.simpleMessage(
            "Cihazınızda kamera uygulamanızın fotoğraf ve videoları kaydettiği klasörü seçin. Dosyaları özyineli olarak aramaz. Yaklaşık olarak her 6 saatte bir senkronize edilir."),
        "cameraRollSync": MessageLookupByLibrary.simpleMessage(
            "Kamera Rulosu Senkronizasyonu"),
        "cameraSync":
            MessageLookupByLibrary.simpleMessage("Kamera Senkronizasyonu"),
        "cancel": MessageLookupByLibrary.simpleMessage("İptal"),
        "changeDownloadLocation":
            MessageLookupByLibrary.simpleMessage("İndirme Konumunu Değiştir"),
        "changeEmail":
            MessageLookupByLibrary.simpleMessage("E-postayı Değiştir"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Parolayı Değiştir"),
        "changeSyncPath": MessageLookupByLibrary.simpleMessage("Yolu Değiştir"),
        "close": MessageLookupByLibrary.simpleMessage("Kapat"),
        "confirmFolderDelete": m0,
        "create": MessageLookupByLibrary.simpleMessage("Oluştur"),
        "createAnAccount":
            MessageLookupByLibrary.simpleMessage("Hesap Oluştur"),
        "createFolder": MessageLookupByLibrary.simpleMessage("Klasör oluştur"),
        "currentlyNestedFoldersAreNotSupported":
            MessageLookupByLibrary.simpleMessage(
                "Şu anda iç içe klasörler desteklenmiyor."),
        "delete": MessageLookupByLibrary.simpleMessage("Sil"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("Hesabı sil"),
        "deleteFile": MessageLookupByLibrary.simpleMessage("Dosyayı sil"),
        "deleteFolder": MessageLookupByLibrary.simpleMessage("Klasörü sil"),
        "deleteYourAccountAfter90DaysOfInactivityUsersWith":
            MessageLookupByLibrary.simpleMessage(
                "90 gün boyunca işlem yapılmadığında hesabınızı silin. Aktif aboneliği olan kullanıcılar için her zaman göz ardı edilir."),
        "downloaded": MessageLookupByLibrary.simpleMessage("İndirildi"),
        "downloading": MessageLookupByLibrary.simpleMessage("İndiriliyor..."),
        "downloadingGetfilenamefilekey": m1,
        "email": MessageLookupByLibrary.simpleMessage("E-posta"),
        "emailDomainNotAllowed": MessageLookupByLibrary.simpleMessage(
            "E-posta Etki Alanına izin verilmiyor"),
        "emailSent": MessageLookupByLibrary.simpleMessage("E-posta gönderildi"),
        "emptyDirectory":
            MessageLookupByLibrary.simpleMessage("Dosya veya klasör yok"),
        "errorErr": m2,
        "errorOpeningFileE": m3,
        "errorSendingPasswordResetEmail": MessageLookupByLibrary.simpleMessage(
            "Şifre sıfırlama e-postası gönderilirken hata oluştu"),
        "errorSendingRequest": MessageLookupByLibrary.simpleMessage(
            "İstek gönderilirken hata oluştu"),
        "errorUpdatingUserPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
            "Kullanıcı güncellenirken hata oluştu. Lütfen tekrar deneyin."),
        "failedLogingInAfterSignup": MessageLookupByLibrary.simpleMessage(
            "Kaydolduktan sonra oturum açılamadı"),
        "failedToDeleteAccount":
            MessageLookupByLibrary.simpleMessage("Hesap silinemedi"),
        "failedToOpenPleaseTrySavingTheFileFirst":
            MessageLookupByLibrary.simpleMessage(
                "Açılamadı. Lütfen önce dosyayı kaydetmeyi deneyin"),
        "failedToOpenPortal":
            MessageLookupByLibrary.simpleMessage("Portal açılamadı"),
        "fileGetfilenamefilekeyIsNotAvailableOffline": m4,
        "files": MessageLookupByLibrary.simpleMessage("Dosyalar"),
        "folderName": MessageLookupByLibrary.simpleMessage("Klasör adı"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Parolanızı mı unuttunuz?"),
        "general": MessageLookupByLibrary.simpleMessage("Genel"),
        "howLongToShare": MessageLookupByLibrary.simpleMessage(
            "Dosya ne kadar süreyle paylaşıma açık olmalıdır?"),
        "invalidEmailOrPassword":
            MessageLookupByLibrary.simpleMessage("Geçersiz e-posta veya şifre"),
        "linkCopiedToClipboard":
            MessageLookupByLibrary.simpleMessage("Bağlantı panoya kopyalandı"),
        "login": MessageLookupByLibrary.simpleMessage("Giriş"),
        "manageAccount": MessageLookupByLibrary.simpleMessage("Hesabı Yönet"),
        "noTransfers": MessageLookupByLibrary.simpleMessage("Transfer Yok"),
        "notVerified":
            MessageLookupByLibrary.simpleMessage("E-posta doğrulanmadı"),
        "offlineFilesAreStoredAtSnapshotdata": m5,
        "ok": MessageLookupByLibrary.simpleMessage("Tamam"),
        "open": MessageLookupByLibrary.simpleMessage("Aç"),
        "openingFileGetfilenamefilekey": m6,
        "openingInBrowser":
            MessageLookupByLibrary.simpleMessage("Tarayıcıda açılıyor..."),
        "password": MessageLookupByLibrary.simpleMessage("Parola"),
        "passwordMustBePasswordminlengthCharactersLong": m7,
        "passwordResetEmailSent": MessageLookupByLibrary.simpleMessage(
            "Şifre sıfırlama e-postası gönderildi!"),
        "periodicallyBackingUpSelectedFolder":
            MessageLookupByLibrary.simpleMessage(
                "Seçilen klasörün periyodik olarak yedeklenmesi"),
        "pickFolder": MessageLookupByLibrary.simpleMessage("Klasör Seç"),
        "pleaseAuthenticateToAccessYourCloud":
            MessageLookupByLibrary.simpleMessage(
                "Bulutunuza erişmek için lütfen kimliğinizi doğrulayın"),
        "pleaseSelectADirectoryWhereYouWouldLikeToDownload":
            MessageLookupByLibrary.simpleMessage(
                "Lütfen bir sonraki ekranda dosyalarınızı indirmek istediğiniz dizini seçin."),
        "privacyPolicy":
            MessageLookupByLibrary.simpleMessage("Gizlilik Politikası"),
        "purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion":
            MessageLookupByLibrary.simpleMessage(
                "Playstore derlemesini kullanarak 1 TB satın alın. İşiniz bittiğinde bu sürümü kaldırabilirsiniz."),
        "requestSent":
            MessageLookupByLibrary.simpleMessage("İstek Gönderildi!"),
        "requireBiometricsToOpenApp": MessageLookupByLibrary.simpleMessage(
            "Uygulamayı açmak için biyometriyi zorunlu kılın"),
        "requireCharging":
            MessageLookupByLibrary.simpleMessage("Şarj Gerektirir"),
        "resetPassword":
            MessageLookupByLibrary.simpleMessage("Şifreyi sıfırla"),
        "save": MessageLookupByLibrary.simpleMessage("Kaydet"),
        "security": MessageLookupByLibrary.simpleMessage("Güvenlik"),
        "selectDownloadDirectory":
            MessageLookupByLibrary.simpleMessage("İndirme dizinini seçin"),
        "selectSyncLocation":
            MessageLookupByLibrary.simpleMessage("Senkronizasyon Konumunu Seç"),
        "send": MessageLookupByLibrary.simpleMessage("Gönder"),
        "sendEmail": MessageLookupByLibrary.simpleMessage("E-posta Gönder"),
        "serverMaintenance": MessageLookupByLibrary.simpleMessage(
            "Sunucu şu anda bakımda. Lütfen daha sonra tekrar deneyin."),
        "settings": MessageLookupByLibrary.simpleMessage("Ayarlar"),
        "share": MessageLookupByLibrary.simpleMessage("Paylaş"),
        "shareEmailVerificationNeeded": MessageLookupByLibrary.simpleMessage(
            "E-postanın doğrulanması veya dosyaları paylaşmak için aktif aboneliğe sahip olması gerekir."),
        "shareFile": MessageLookupByLibrary.simpleMessage("Dosyayı paylaş"),
        "signOut": MessageLookupByLibrary.simpleMessage("Oturumu Kapat"),
        "signUp": MessageLookupByLibrary.simpleMessage("Kaydol"),
        "storageUsage":
            MessageLookupByLibrary.simpleMessage("Depolama Kullanımı"),
        "subscribedThroughPlaystoreOrAppstore":
            MessageLookupByLibrary.simpleMessage(
                "Playstore veya Appstore üzerinden abone olundu"),
        "syncEnabled":
            MessageLookupByLibrary.simpleMessage("Eşitleme Etkinleştirildi"),
        "syncNow": MessageLookupByLibrary.simpleMessage("Şimdi Senkronize Et"),
        "syncSettings":
            MessageLookupByLibrary.simpleMessage("Senkronizasyon Ayarları"),
        "syncing":
            MessageLookupByLibrary.simpleMessage("Senkronize Ediliyor..."),
        "termsOfService":
            MessageLookupByLibrary.simpleMessage("Hizmet Şartları"),
        "transfers": MessageLookupByLibrary.simpleMessage("Transferler"),
        "upgradeStorage":
            MessageLookupByLibrary.simpleMessage("Depolama Alanını Yükselt"),
        "uploaded": MessageLookupByLibrary.simpleMessage("Yüklendi"),
        "uploading": MessageLookupByLibrary.simpleMessage("Yükleniyor..."),
        "viewAllowedEmailDomains": MessageLookupByLibrary.simpleMessage(
            "İzin Verilen E-posta Etki Alanlarını Görüntüle"),
        "viewBackendOnGithub": MessageLookupByLibrary.simpleMessage(
            "Github\'\'da arka ucu görüntüleyin"),
        "viewOnGithub":
            MessageLookupByLibrary.simpleMessage("Github\'\'da görüntüle"),
        "welcomeBack":
            MessageLookupByLibrary.simpleMessage("Tekrar Hoş Geldiniz!"),
        "willSendALinkToYourEmailToCompleteThe":
            MessageLookupByLibrary.simpleMessage(
                "Değişikliği tamamlamak için e-postanıza bir bağlantı gönderilecek"),
        "willSendALinkToYourEmailToResetYour": MessageLookupByLibrary.simpleMessage(
            "Parolanızı sıfırlamak için e-postanıza bir bağlantı gönderilecek"),
        "yourAccountHasBeenDeleted":
            MessageLookupByLibrary.simpleMessage("Hesabınız silindi.")
      };
}
