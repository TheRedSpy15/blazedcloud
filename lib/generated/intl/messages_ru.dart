// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(foldername) =>
      "Вы уверены, что хотите удалить эту папку? ${foldername}";

  static String m1(filename) => "Загрузка ${filename}";

  static String m2(err) => "Ошибка: ${err}";

  static String m3(filename) => "Ошибка открытия файла: ${filename}";

  static String m4(filename) =>
      "Файл ${filename} недоступен в автономном режиме";

  static String m5(path) =>
      "Файлы для автономного режима сохраняются по пути${path}";

  static String m6(filename) => "Открытие файла: ${filename}";

  static String m7(length) => "Пароль должен содержать ${length} символов";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountDeleted":
            MessageLookupByLibrary.simpleMessage("Аккаунт удален"),
        "appName": MessageLookupByLibrary.simpleMessage("Blazed Cloud"),
        "areYouSureYouWantToDeleteThisFile":
            MessageLookupByLibrary.simpleMessage(
                "Вы уверены, что хотите удалить этот файл?"),
        "areYouSureYouWantToDeleteYourAccountThis":
            MessageLookupByLibrary.simpleMessage(
                "Вы уверены, что хотите удалить свою учетную запись? Это невозможно отменить. Обратите внимание, что вы должны вручную отменить подписку в магазине приложений (если у вас есть одна)"),
        "areYouSureYouWantToSignOut": MessageLookupByLibrary.simpleMessage(
            "Вы уверены, что хотите выйти?"),
        "authenticationRequired":
            MessageLookupByLibrary.simpleMessage("Требуется аутентификация"),
        "autoDeleteAcount": MessageLookupByLibrary.simpleMessage(
            "Автоматическое удаление аккаунта"),
        "blazedExplorer":
            MessageLookupByLibrary.simpleMessage("Blazed Explorer"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
        "changeDownloadLocation":
            MessageLookupByLibrary.simpleMessage("Изменить место загрузки"),
        "changeEmail":
            MessageLookupByLibrary.simpleMessage("Изменить эл. почту"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Изменить пароль"),
        "confirmFolderDelete": m0,
        "create": MessageLookupByLibrary.simpleMessage("Создать"),
        "createFolder": MessageLookupByLibrary.simpleMessage("Создать папку"),
        "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
        "deleteAccount":
            MessageLookupByLibrary.simpleMessage("Удалить аккаунт"),
        "deleteFile": MessageLookupByLibrary.simpleMessage("Удалить файл"),
        "deleteFolder": MessageLookupByLibrary.simpleMessage("Удалить папку"),
        "deleteYourAccountAfter90DaysOfInactivityUsersWith":
            MessageLookupByLibrary.simpleMessage(
                "Удалить ваш аккаунт после 90 дней бездействия. Всегда игнорируется для пользователей с активными подписками."),
        "downloaded": MessageLookupByLibrary.simpleMessage("Загружено"),
        "downloading": MessageLookupByLibrary.simpleMessage("Загрузка..."),
        "downloadingGetfilenamefilekey": m1,
        "email": MessageLookupByLibrary.simpleMessage("Эл. почта"),
        "emailDomainNotAllowed": MessageLookupByLibrary.simpleMessage(
            "Домен электронной почты не разрешен"),
        "emptyDirectory":
            MessageLookupByLibrary.simpleMessage("Нет файлов или папок"),
        "errorErr": m2,
        "errorOpeningFileE": m3,
        "errorSendingPasswordResetEmail": MessageLookupByLibrary.simpleMessage(
            "Ошибка отправки письма для сброса пароля"),
        "errorSendingRequest":
            MessageLookupByLibrary.simpleMessage("Ошибка отправки запроса"),
        "errorUpdatingUserPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
            "Ошибка обновления пользователя. Пожалуйста, попробуйте снова."),
        "failedLogingInAfterSignup": MessageLookupByLibrary.simpleMessage(
            "Не удалось войти после регистрации"),
        "failedToDeleteAccount":
            MessageLookupByLibrary.simpleMessage("Не удалось удалить аккаунт"),
        "failedToOpenPleaseTrySavingTheFileFirst":
            MessageLookupByLibrary.simpleMessage(
                "Не удалось открыть. Пожалуйста, попробуйте сначала сохранить файл"),
        "fileGetfilenamefilekeyIsNotAvailableOffline": m4,
        "files": MessageLookupByLibrary.simpleMessage("Файлы"),
        "folderName": MessageLookupByLibrary.simpleMessage("Имя папки"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Забыли пароль?"),
        "howLongToShare": MessageLookupByLibrary.simpleMessage(
            "На какой срок файл должен быть доступен для общего доступа?"),
        "invalidEmailOrPassword": MessageLookupByLibrary.simpleMessage(
            "Неверный адрес электронной почты или пароль"),
        "linkCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Ссылка скопирована в буфер обмена"),
        "login": MessageLookupByLibrary.simpleMessage("Войти"),
        "offlineFilesAreStoredAtSnapshotdata": m5,
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "open": MessageLookupByLibrary.simpleMessage("Открыть"),
        "openingFileGetfilenamefilekey": m6,
        "openingInBrowser":
            MessageLookupByLibrary.simpleMessage("Открытие в браузере..."),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "passwordMustBePasswordminlengthCharactersLong": m7,
        "passwordResetEmailSent": MessageLookupByLibrary.simpleMessage(
            "Письмо для сброса пароля отправлено!"),
        "pickFolder": MessageLookupByLibrary.simpleMessage("Выбрать папку"),
        "pleaseSelectADirectoryWhereYouWouldLikeToDownload":
            MessageLookupByLibrary.simpleMessage(
                "Выберите директорию, в которую вы хотели бы загрузить ваши файлы на следующем экране."),
        "purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion":
            MessageLookupByLibrary.simpleMessage(
                "Приобретите 1 ТБ, используя сборку из Play Store. Вы можете удалить эту версию после завершения."),
        "requestSent":
            MessageLookupByLibrary.simpleMessage("Запрос отправлен!"),
        "requireBiometricsToOpenApp": MessageLookupByLibrary.simpleMessage(
            "Требовать биометрию для открытия приложения"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Сброс пароля"),
        "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "selectDownloadDirectory": MessageLookupByLibrary.simpleMessage(
            "Выберите директорию для загрузки"),
        "send": MessageLookupByLibrary.simpleMessage("Отправить"),
        "serverMaintenance": MessageLookupByLibrary.simpleMessage(
            "Сервер находится на техническом обслуживании. Пожалуйста, попробуйте позже."),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "share": MessageLookupByLibrary.simpleMessage("Поделиться"),
        "shareFile": MessageLookupByLibrary.simpleMessage("Поделиться файлом"),
        "signOut": MessageLookupByLibrary.simpleMessage("Выйти"),
        "signUp": MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
        "storageUsage":
            MessageLookupByLibrary.simpleMessage("Использование хранилища"),
        "transfers": MessageLookupByLibrary.simpleMessage("Передачи"),
        "upgradeStorage1Terabyte":
            MessageLookupByLibrary.simpleMessage("Покупка 1 терабайта"),
        "uploaded": MessageLookupByLibrary.simpleMessage("Загружено"),
        "uploading": MessageLookupByLibrary.simpleMessage("Загрузка..."),
        "viewBackendOnGithub":
            MessageLookupByLibrary.simpleMessage("Посмотреть бэкэнд на Github"),
        "viewOnGithub":
            MessageLookupByLibrary.simpleMessage("Посмотреть на Github"),
        "willSendALinkToYourEmailToCompleteThe":
            MessageLookupByLibrary.simpleMessage(
                "Отправим ссылку на вашу электронную почту для завершения изменения"),
        "willSendALinkToYourEmailToResetYour":
            MessageLookupByLibrary.simpleMessage(
                "Отправим ссылку на вашу электронную почту для сброса пароля"),
        "yourAccountHasBeenDeleted": MessageLookupByLibrary.simpleMessage(
            "Ваша учетная запись была удалена.")
      };
}
