// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a uk locale. All the
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
  String get localeName => 'uk';

  static String m0(foldername) =>
      "Ви впевнені, що хочете видалити цю папку? ${foldername}";

  static String m1(filename) => "Завантаження ${filename}";

  static String m2(err) => "Помилка: ${err}";

  static String m3(filename) => "Помилка відкриття файлу: ${filename}";

  static String m4(filename) => "Файл ${filename} недоступний офлайн";

  static String m5(path) => "Офлайн-файли зберігаються за адресою ${path}";

  static String m6(filename) => "Відкриття файлу: ${filename}";

  static String m7(length) => "Пароль повинен бути довжиною ${length} символів";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountDeleted":
            MessageLookupByLibrary.simpleMessage("Обліковий запис видалено"),
        "allowedEmails":
            MessageLookupByLibrary.simpleMessage("Дозволені електронні адреси"),
        "appName": MessageLookupByLibrary.simpleMessage("Blazed Cloud"),
        "areYouSureYouWantToDeleteThisFile":
            MessageLookupByLibrary.simpleMessage(
                "Ви впевнені, що хочете видалити цей файл?"),
        "areYouSureYouWantToDeleteYourAccountThis":
            MessageLookupByLibrary.simpleMessage(
                "Ви впевнені, що хочете видалити свій обліковий запис? Це невідворотнє. Зверніть увагу, що вам потрібно буде вручну скасувати підписку через магазин Play (якщо ви маєте одну)."),
        "areYouSureYouWantToSignOut": MessageLookupByLibrary.simpleMessage(
            "Ви впевнені, що хочете вийти?"),
        "authenticationRequired":
            MessageLookupByLibrary.simpleMessage("Потрібна аутентифікація"),
        "autoDeleteAcount": MessageLookupByLibrary.simpleMessage(
            "Автоматично видаляти обліковий запис"),
        "blazedExplorer":
            MessageLookupByLibrary.simpleMessage("Blazed Explorer"),
        "cancel": MessageLookupByLibrary.simpleMessage("Скасувати"),
        "changeDownloadLocation":
            MessageLookupByLibrary.simpleMessage("Змінити місце завантаження"),
        "changeEmail":
            MessageLookupByLibrary.simpleMessage("Змінити електронну пошту"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Змінити пароль"),
        "close": MessageLookupByLibrary.simpleMessage("Закрити"),
        "confirmFolderDelete": m0,
        "create": MessageLookupByLibrary.simpleMessage("Створити"),
        "createAnAccount":
            MessageLookupByLibrary.simpleMessage("Створити обліковий запис"),
        "createFolder": MessageLookupByLibrary.simpleMessage("Створити папку"),
        "delete": MessageLookupByLibrary.simpleMessage("Видалити"),
        "deleteAccount":
            MessageLookupByLibrary.simpleMessage("Видалити обліковий запис"),
        "deleteFile": MessageLookupByLibrary.simpleMessage("Видалити файл"),
        "deleteFolder": MessageLookupByLibrary.simpleMessage("Видалити папку"),
        "deleteYourAccountAfter90DaysOfInactivityUsersWith":
            MessageLookupByLibrary.simpleMessage(
                "Видаляти обліковий запис після 90 днів бездіяльності. Завжди ігнорується для користувачів із активними підписками."),
        "downloaded": MessageLookupByLibrary.simpleMessage("Завантажено"),
        "downloading": MessageLookupByLibrary.simpleMessage("Завантаження..."),
        "downloadingGetfilenamefilekey": m1,
        "email": MessageLookupByLibrary.simpleMessage("Електронна пошта"),
        "emailDomainNotAllowed": MessageLookupByLibrary.simpleMessage(
            "Домен електронної пошти не дозволений"),
        "emailSent": MessageLookupByLibrary.simpleMessage("Email sent"),
        "emptyDirectory":
            MessageLookupByLibrary.simpleMessage("Немає файлів чи папок"),
        "errorErr": m2,
        "errorOpeningFileE": m3,
        "errorSendingPasswordResetEmail": MessageLookupByLibrary.simpleMessage(
            "Помилка відправлення електронного листа для скидання пароля"),
        "errorSendingRequest":
            MessageLookupByLibrary.simpleMessage("Помилка відправлення запиту"),
        "errorUpdatingUserPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
            "Помилка оновлення користувача. Будь ласка, спробуйте знову."),
        "failedLogingInAfterSignup": MessageLookupByLibrary.simpleMessage(
            "Не вдалося увійти після реєстрації"),
        "failedToDeleteAccount": MessageLookupByLibrary.simpleMessage(
            "Не вдалося видалити обліковий запис"),
        "failedToOpenPleaseTrySavingTheFileFirst":
            MessageLookupByLibrary.simpleMessage(
                "Не вдалося відкрити. Будь ласка, спробуйте спочатку зберегти файл."),
        "failedToOpenPortal":
            MessageLookupByLibrary.simpleMessage("Не вдалося відкрити портал"),
        "fileGetfilenamefilekeyIsNotAvailableOffline": m4,
        "files": MessageLookupByLibrary.simpleMessage("Файли"),
        "folderName": MessageLookupByLibrary.simpleMessage("Назва папки"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Забули пароль?"),
        "howLongToShare": MessageLookupByLibrary.simpleMessage(
            "На який термін файл повинен бути доступний для спільного використання?"),
        "invalidEmailOrPassword": MessageLookupByLibrary.simpleMessage(
            "Невірний електронний лист або пароль"),
        "linkCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Посилання скопійовано в буфер обміну"),
        "login": MessageLookupByLibrary.simpleMessage("Увійти"),
        "manageAccount": MessageLookupByLibrary.simpleMessage(
            "Управління обліковим записом"),
        "notVerified":
            MessageLookupByLibrary.simpleMessage("Email not verified"),
        "offlineFilesAreStoredAtSnapshotdata": m5,
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "open": MessageLookupByLibrary.simpleMessage("Відкрити"),
        "openingFileGetfilenamefilekey": m6,
        "openingInBrowser":
            MessageLookupByLibrary.simpleMessage("Відкриття у браузері..."),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "passwordMustBePasswordminlengthCharactersLong": m7,
        "passwordResetEmailSent": MessageLookupByLibrary.simpleMessage(
            "Електронний лист для скидання пароля відправлено!"),
        "pickFolder": MessageLookupByLibrary.simpleMessage("Вибрати папку"),
        "pleaseSelectADirectoryWhereYouWouldLikeToDownload":
            MessageLookupByLibrary.simpleMessage(
                "Будь ласка, виберіть каталог, куди ви хочете завантажити ваші файли на наступному екрані."),
        "purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion":
            MessageLookupByLibrary.simpleMessage(
                "Придбайте 1 ТБ за допомогою збірки Playstore. Ви можете видалити цю версію після завершення."),
        "requestSent": MessageLookupByLibrary.simpleMessage("Запит надіслано!"),
        "requireBiometricsToOpenApp": MessageLookupByLibrary.simpleMessage(
            "Вимагати біометрії для відкриття додатка"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Скинути пароль"),
        "save": MessageLookupByLibrary.simpleMessage("Зберегти"),
        "selectDownloadDirectory": MessageLookupByLibrary.simpleMessage(
            "Вибрати каталог для завантаження"),
        "send": MessageLookupByLibrary.simpleMessage("Відправити"),
        "sendEmail": MessageLookupByLibrary.simpleMessage("Send Email"),
        "serverMaintenance": MessageLookupByLibrary.simpleMessage(
            "Сервер наразі перебуває на технічному обслуговуванні. Будь ласка, спробуйте знову пізніше."),
        "settings": MessageLookupByLibrary.simpleMessage("Налаштування"),
        "share": MessageLookupByLibrary.simpleMessage("Поділитися"),
        "shareEmailVerificationNeeded": MessageLookupByLibrary.simpleMessage(
            "Email needs to be verified, or have active subscription to share files."),
        "shareFile": MessageLookupByLibrary.simpleMessage("Поділитися файлом"),
        "signOut": MessageLookupByLibrary.simpleMessage("Вийти"),
        "signUp": MessageLookupByLibrary.simpleMessage("Зареєструватися"),
        "storageUsage":
            MessageLookupByLibrary.simpleMessage("Використання сховища"),
        "subscribedThroughPlaystoreOrAppstore":
            MessageLookupByLibrary.simpleMessage(
                "Підписано через Playstore або Appstore"),
        "transfers": MessageLookupByLibrary.simpleMessage("Передачі"),
        "upgradeStorage":
            MessageLookupByLibrary.simpleMessage("Оновлення сховища"),
        "uploaded": MessageLookupByLibrary.simpleMessage("Відправлено"),
        "uploading": MessageLookupByLibrary.simpleMessage("Відправлення..."),
        "viewAllowedEmailDomains": MessageLookupByLibrary.simpleMessage(
            "Переглянути дозволені домени електронної пошти"),
        "viewBackendOnGithub": MessageLookupByLibrary.simpleMessage(
            "Переглянути backend на Github"),
        "viewOnGithub":
            MessageLookupByLibrary.simpleMessage("Перегляд на Github"),
        "welcomeBack":
            MessageLookupByLibrary.simpleMessage("Ласкаво просимо назад!"),
        "willSendALinkToYourEmailToCompleteThe":
            MessageLookupByLibrary.simpleMessage(
                "Відправимо посилання на вашу електронну пошту для завершення зміни"),
        "willSendALinkToYourEmailToResetYour": MessageLookupByLibrary.simpleMessage(
            "Відправимо посилання на вашу електронну пошту для скидання пароля"),
        "yourAccountHasBeenDeleted": MessageLookupByLibrary.simpleMessage(
            "Ваш обліковий запис видалено.")
      };
}
