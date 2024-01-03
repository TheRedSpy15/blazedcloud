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

  static String m2(filename) =>
      "Файл ${filename} недоступний в автономному режимі";

  static String m3(path) => "Офлайн-файли зберігаються за адресою ${path}";

  static String m4(filename) => "Відкривається файл: ${filename}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountDeleted":
            MessageLookupByLibrary.simpleMessage("Обліковий запис видалено"),
        "appName": MessageLookupByLibrary.simpleMessage("Blazed Cloud"),
        "areYouSureYouWantToDeleteThisFile":
            MessageLookupByLibrary.simpleMessage(
                "Ви впевнені, що хочете видалити цей файл?"),
        "areYouSureYouWantToDeleteYourAccountThis":
            MessageLookupByLibrary.simpleMessage(
                "Ви впевнені, що хочете видалити свій обліковий запис? Це незворотньо. Зверніть увагу, що вам потрібно буде вручну скасувати підписку через магазин гри (якщо вона є)"),
        "areYouSureYouWantToSignOut": MessageLookupByLibrary.simpleMessage(
            "Ви впевнені, що хочете вийти?"),
        "authenticationRequired":
            MessageLookupByLibrary.simpleMessage("Вимагається автентифікація"),
        "autoDeleteAcount": MessageLookupByLibrary.simpleMessage(
            "Автоматично видалити обліковий запис"),
        "blazedExplorer":
            MessageLookupByLibrary.simpleMessage("Blazed Explorer"),
        "cancel": MessageLookupByLibrary.simpleMessage("Скасувати"),
        "changeDownloadLocation":
            MessageLookupByLibrary.simpleMessage("Змінити місце завантаження"),
        "changeEmail":
            MessageLookupByLibrary.simpleMessage("Змінити електронну пошту"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Змінити пароль"),
        "confirmFolderDelete": m0,
        "create": MessageLookupByLibrary.simpleMessage("Створити"),
        "createFolder": MessageLookupByLibrary.simpleMessage("Створити папку"),
        "delete": MessageLookupByLibrary.simpleMessage("Видалити"),
        "deleteAccount":
            MessageLookupByLibrary.simpleMessage("Видалити обліковий запис"),
        "deleteFile": MessageLookupByLibrary.simpleMessage("Видалити файл"),
        "deleteFolder": MessageLookupByLibrary.simpleMessage("Видалити папку"),
        "deleteYourAccountAfter90DaysOfInactivityUsersWith":
            MessageLookupByLibrary.simpleMessage(
                "Видалити обліковий запис через 90 днів бездіяльності. Завжди ігнорується для користувачів з активними підписками."),
        "downloaded": MessageLookupByLibrary.simpleMessage("Завантажено"),
        "downloading": MessageLookupByLibrary.simpleMessage("Завантаження..."),
        "downloadingGetfilenamefilekey": m1,
        "email": MessageLookupByLibrary.simpleMessage("Електронна пошта"),
        "emailDomainNotAllowed": MessageLookupByLibrary.simpleMessage(
            "Домен електронної пошти не дозволений"),
        "emptyDirectory":
            MessageLookupByLibrary.simpleMessage("Немає файлів або папок"),
        "errorErr": MessageLookupByLibrary.simpleMessage("Помилка: \$err"),
        "errorOpeningFileE": MessageLookupByLibrary.simpleMessage(
            "Помилка відкриття файлу: \$e"),
        "errorSendingPasswordResetEmail": MessageLookupByLibrary.simpleMessage(
            "Помилка відправки листа із скиданням пароля"),
        "errorSendingRequest":
            MessageLookupByLibrary.simpleMessage("Помилка відправки запиту"),
        "errorUpdatingUserPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
            "Помилка оновлення користувача. Будь ласка, спробуйте ще раз."),
        "failedLogingInAfterSignup": MessageLookupByLibrary.simpleMessage(
            "Не вдалося увійти після реєстрації"),
        "failedToDeleteAccount": MessageLookupByLibrary.simpleMessage(
            "Не вдалося видалити обліковий запис"),
        "failedToOpenPleaseTrySavingTheFileFirst":
            MessageLookupByLibrary.simpleMessage(
                "Не вдалося відкрити. Будь ласка, спробуйте спершу зберегти файл"),
        "fileGetfilenamefilekeyIsNotAvailableOffline": m2,
        "files": MessageLookupByLibrary.simpleMessage("Файли"),
        "folderName": MessageLookupByLibrary.simpleMessage("Ім\'\'я папки"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Забули пароль?"),
        "invalidEmailOrPassword": MessageLookupByLibrary.simpleMessage(
            "Невірна електронна пошта або пароль"),
        "linkCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Посилання скопійовано в буфер обміну"),
        "login": MessageLookupByLibrary.simpleMessage("Увійти"),
        "offlineFilesAreStoredAtSnapshotdata": m3,
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "open": MessageLookupByLibrary.simpleMessage("Відкрити"),
        "openingFileGetfilenamefilekey": m4,
        "openingInBrowser":
            MessageLookupByLibrary.simpleMessage("Відкривається в браузері..."),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "passwordMustBePasswordminlengthCharactersLong":
            MessageLookupByLibrary.simpleMessage(
                "Пароль повинен бути довжиною не менше \$passwordMinLength символів"),
        "passwordResetEmailSent": MessageLookupByLibrary.simpleMessage(
            "Лист із скиданням пароля відправлено!"),
        "pickFolder": MessageLookupByLibrary.simpleMessage("Вибрати папку"),
        "pleaseSelectADirectoryWhereYouWouldLikeToDownload":
            MessageLookupByLibrary.simpleMessage(
                "Будь ласка, виберіть каталог, куди ви хочете завантажити файли на наступному екрані."),
        "purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion":
            MessageLookupByLibrary.simpleMessage(
                "Придбайте 1 ТБ, використовуючи версію Playstore. Ви можете видалити цю версію після завершення."),
        "requestSent":
            MessageLookupByLibrary.simpleMessage("Запит відправлено!"),
        "requireBiometricsToOpenApp": MessageLookupByLibrary.simpleMessage(
            "Вимагати біометричних даних для відкриття додатка"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Скинути пароль"),
        "save": MessageLookupByLibrary.simpleMessage("Зберегти"),
        "selectDownloadDirectory": MessageLookupByLibrary.simpleMessage(
            "Виберіть каталог для завантаження"),
        "send": MessageLookupByLibrary.simpleMessage("Відправити"),
        "serverMaintenance": MessageLookupByLibrary.simpleMessage(
            "Сервер в даний момент перебуває на технічному обслуговуванні. Будь ласка, спробуйте пізніше."),
        "settings": MessageLookupByLibrary.simpleMessage("Налаштування"),
        "share": MessageLookupByLibrary.simpleMessage("Поділитися"),
        "shareFile": MessageLookupByLibrary.simpleMessage("Поділитися файлом"),
        "signOut": MessageLookupByLibrary.simpleMessage("Вийти"),
        "signUp": MessageLookupByLibrary.simpleMessage("Зареєструватися"),
        "storageUsage":
            MessageLookupByLibrary.simpleMessage("Використання сховища"),
        "transfers": MessageLookupByLibrary.simpleMessage("Передачі"),
        "uploaded": MessageLookupByLibrary.simpleMessage("Вивантажено"),
        "uploading": MessageLookupByLibrary.simpleMessage("Вивантаження..."),
        "viewBackendOnGithub": MessageLookupByLibrary.simpleMessage(
            "Переглянути бекенд на Github"),
        "viewOnGithub":
            MessageLookupByLibrary.simpleMessage("Переглянути на Github"),
        "willSendALinkToYourEmailToCompleteThe":
            MessageLookupByLibrary.simpleMessage(
                "Надішлють посилання на вашу електронну пошту для завершення зміни"),
        "willSendALinkToYourEmailToResetYour": MessageLookupByLibrary.simpleMessage(
            "Надішлють посилання на вашу електронну пошту для скидання пароля"),
        "yourAccountHasBeenDeleted": MessageLookupByLibrary.simpleMessage(
            "Ваш обліковий запис був видалений.")
      };
}
