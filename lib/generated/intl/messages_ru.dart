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

  static String m2(filename) =>
      "Файл ${filename} недоступен в автономном режиме";

  static String m3(path) => "Офлайн-файлы хранятся в ${path}";

  static String m4(filename) => "Открытие файла: ${filename}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountDeleted":
            MessageLookupByLibrary.simpleMessage("Учетная запись удалена"),
        "appName": MessageLookupByLibrary.simpleMessage("Blazed Cloud"),
        "areYouSureYouWantToDeleteThisFile":
            MessageLookupByLibrary.simpleMessage(
                "Вы уверены, что хотите удалить этот файл?"),
        "areYouSureYouWantToDeleteYourAccountThis":
            MessageLookupByLibrary.simpleMessage(
                "Вы уверены, что хотите удалить свою учетную запись? Это необратимо.\\n\\nПожалуйста, обратите внимание, что вам нужно будет вручную отменить подписку через магазин приложений (если у вас есть подписка)"),
        "areYouSureYouWantToSignOut": MessageLookupByLibrary.simpleMessage(
            "Вы уверены, что хотите выйти?"),
        "authenticationRequired":
            MessageLookupByLibrary.simpleMessage("Требуется аутентификация"),
        "autoDeleteAcount": MessageLookupByLibrary.simpleMessage(
            "Автоматическое удаление учетной записи"),
        "blazedExplorer":
            MessageLookupByLibrary.simpleMessage("Blazed Explorer"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
        "changeDownloadLocation":
            MessageLookupByLibrary.simpleMessage("Изменить место загрузки"),
        "changeEmail": MessageLookupByLibrary.simpleMessage(
            "Изменить адрес электронной почты"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Изменить пароль"),
        "confirmFolderDelete": m0,
        "create": MessageLookupByLibrary.simpleMessage("Создать"),
        "createFolder": MessageLookupByLibrary.simpleMessage("Создать папку"),
        "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
        "deleteAccount":
            MessageLookupByLibrary.simpleMessage("Удалить учетную запись"),
        "deleteFile": MessageLookupByLibrary.simpleMessage("Удалить файл"),
        "deleteFolder": MessageLookupByLibrary.simpleMessage("Удалить папку"),
        "deleteYourAccountAfter90DaysOfInactivityUsersWith":
            MessageLookupByLibrary.simpleMessage(
                "Удалить вашу учетную запись после 90 дней бездействия. Всегда игнорируется для пользователей с активной подпиской."),
        "downloaded": MessageLookupByLibrary.simpleMessage("Загружено"),
        "downloading": MessageLookupByLibrary.simpleMessage("Загрузка..."),
        "downloadingGetfilenamefilekey": m1,
        "email": MessageLookupByLibrary.simpleMessage("Эл. почта"),
        "emailDomainNotAllowed": MessageLookupByLibrary.simpleMessage(
            "Домен электронной почты не разрешен"),
        "emptyDirectory":
            MessageLookupByLibrary.simpleMessage("Нет файлов или папок"),
        "errorErr": MessageLookupByLibrary.simpleMessage("Ошибка: \$err"),
        "errorOpeningFileE":
            MessageLookupByLibrary.simpleMessage("Ошибка открытия файла: \$e"),
        "errorSendingPasswordResetEmail": MessageLookupByLibrary.simpleMessage(
            "Ошибка при отправке письма для сброса пароля"),
        "errorSendingRequest":
            MessageLookupByLibrary.simpleMessage("Ошибка при отправке запроса"),
        "errorUpdatingUserPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
            "Ошибка обновления пользователя. Пожалуйста, попробуйте снова."),
        "failedLogingInAfterSignup": MessageLookupByLibrary.simpleMessage(
            "Не удалось войти после регистрации"),
        "failedToDeleteAccount": MessageLookupByLibrary.simpleMessage(
            "Не удалось удалить учетную запись"),
        "failedToOpenPleaseTrySavingTheFileFirst":
            MessageLookupByLibrary.simpleMessage(
                "Не удалось открыть. Пожалуйста, попробуйте сначала сохранить файл"),
        "fileGetfilenamefilekeyIsNotAvailableOffline": m2,
        "files": MessageLookupByLibrary.simpleMessage("Файлы"),
        "folderName": MessageLookupByLibrary.simpleMessage("Имя папки"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Забыли пароль?"),
        "invalidEmailOrPassword": MessageLookupByLibrary.simpleMessage(
            "Неверный адрес электронной почты или пароль"),
        "linkCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Ссылка скопирована в буфер обмена"),
        "login": MessageLookupByLibrary.simpleMessage("Войти"),
        "offlineFilesAreStoredAtSnapshotdata": m3,
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "open": MessageLookupByLibrary.simpleMessage("Открыть"),
        "openingFileGetfilenamefilekey": m4,
        "openingInBrowser":
            MessageLookupByLibrary.simpleMessage("Открытие в браузере..."),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "passwordMustBePasswordminlengthCharactersLong":
            MessageLookupByLibrary.simpleMessage(
                "Пароль должен содержать не менее \$passwordMinLength символов"),
        "passwordResetEmailSent": MessageLookupByLibrary.simpleMessage(
            "Письмо для сброса пароля отправлено!"),
        "pickFolder": MessageLookupByLibrary.simpleMessage("Выбрать папку"),
        "pleaseSelectADirectoryWhereYouWouldLikeToDownload":
            MessageLookupByLibrary.simpleMessage(
                "Пожалуйста, выберите каталог, в который вы хотели бы загрузить ваши файлы на следующем экране."),
        "purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion":
            MessageLookupByLibrary.simpleMessage(
                "Приобретите 1 ТБ, используя версию из магазина Play. Вы можете удалить эту версию после завершения."),
        "requestSent":
            MessageLookupByLibrary.simpleMessage("Запрос отправлен!"),
        "requireBiometricsToOpenApp": MessageLookupByLibrary.simpleMessage(
            "Требовать биометрию для открытия приложения"),
        "resetPassword":
            MessageLookupByLibrary.simpleMessage("Сбросить пароль"),
        "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "selectDownloadDirectory":
            MessageLookupByLibrary.simpleMessage("Выберите каталог загрузки"),
        "send": MessageLookupByLibrary.simpleMessage("Отправить"),
        "serverMaintenance": MessageLookupByLibrary.simpleMessage(
            "Сервер находится на техническом обслуживании. Пожалуйста, попробуйте позже."),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "share": MessageLookupByLibrary.simpleMessage("Поделиться"),
        "shareFile": MessageLookupByLibrary.simpleMessage("Поделиться файлом"),
        "signOut": MessageLookupByLibrary.simpleMessage("Выход"),
        "signUp": MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
        "storageUsage":
            MessageLookupByLibrary.simpleMessage("Использование хранилища"),
        "transfers": MessageLookupByLibrary.simpleMessage("Передачи"),
        "uploaded": MessageLookupByLibrary.simpleMessage("Загружено"),
        "uploading": MessageLookupByLibrary.simpleMessage("Загрузка..."),
        "viewBackendOnGithub": MessageLookupByLibrary.simpleMessage(
            "Просмотреть бэкенд на Github"),
        "viewOnGithub":
            MessageLookupByLibrary.simpleMessage("Просмотреть на Github"),
        "willSendALinkToYourEmailToCompleteThe":
            MessageLookupByLibrary.simpleMessage(
                "Отправим ссылку на ваш адрес электронной почты для завершения изменений"),
        "willSendALinkToYourEmailToResetYour": MessageLookupByLibrary.simpleMessage(
            "Отправим ссылку на ваш адрес электронной почты для сброса пароля"),
        "yourAccountHasBeenDeleted": MessageLookupByLibrary.simpleMessage(
            "Ваша учетная запись была удалена.")
      };
}
