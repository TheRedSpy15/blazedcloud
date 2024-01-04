// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static String m0(foldername) =>
      "Sind Sie sicher, dass Sie diesen Ordner löschen möchten? ${foldername}";

  static String m1(filename) => "Herunterladen von ${filename}";

  static String m2(err) => "Fehler: ${err}";

  static String m3(filename) => "Fehler beim Öffnen der Datei: ${filename}";

  static String m4(filename) => "Datei ${filename} ist offline nicht verfügbar";

  static String m5(path) => "Offline-Dateien werden unter ${path} gespeichert";

  static String m6(filename) => "Öffnen der Datei: ${filename}";

  static String m7(length) => "Das Passwort muss ${length} Zeichen lang sein";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountDeleted":
            MessageLookupByLibrary.simpleMessage("Konto gelöscht"),
        "appName": MessageLookupByLibrary.simpleMessage("Blazed Cloud"),
        "areYouSureYouWantToDeleteThisFile":
            MessageLookupByLibrary.simpleMessage(
                "Sind Sie sicher, dass Sie diese Datei löschen möchten?"),
        "areYouSureYouWantToDeleteYourAccountThis":
            MessageLookupByLibrary.simpleMessage(
                "Sind Sie sicher, dass Sie Ihr Konto löschen möchten? Dies ist irreversibel. Bitte beachten Sie, dass Sie Ihr Abonnement manuell über den Play Store kündigen müssen (falls vorhanden)"),
        "areYouSureYouWantToSignOut": MessageLookupByLibrary.simpleMessage(
            "Sind Sie sicher, dass Sie sich abmelden möchten?"),
        "authenticationRequired": MessageLookupByLibrary.simpleMessage(
            "Authentifizierung erforderlich"),
        "autoDeleteAcount":
            MessageLookupByLibrary.simpleMessage("Konto automatisch löschen"),
        "blazedExplorer":
            MessageLookupByLibrary.simpleMessage("Blazed Explorer"),
        "cancel": MessageLookupByLibrary.simpleMessage("Abbrechen"),
        "changeDownloadLocation":
            MessageLookupByLibrary.simpleMessage("Download-Speicherort ändern"),
        "changeEmail": MessageLookupByLibrary.simpleMessage("E-Mail ändern"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Passwort ändern"),
        "confirmFolderDelete": m0,
        "create": MessageLookupByLibrary.simpleMessage("Erstellen"),
        "createFolder":
            MessageLookupByLibrary.simpleMessage("Ordner erstellen"),
        "delete": MessageLookupByLibrary.simpleMessage("Löschen"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("Konto löschen"),
        "deleteFile": MessageLookupByLibrary.simpleMessage("Datei löschen"),
        "deleteFolder": MessageLookupByLibrary.simpleMessage("Ordner löschen"),
        "deleteYourAccountAfter90DaysOfInactivityUsersWith":
            MessageLookupByLibrary.simpleMessage(
                "Löschen Sie Ihr Konto nach 90 Tagen Inaktivität. Immer ignoriert für Benutzer mit aktiven Abonnements."),
        "downloaded": MessageLookupByLibrary.simpleMessage("Heruntergeladen"),
        "downloading": MessageLookupByLibrary.simpleMessage("Herunterladen..."),
        "downloadingGetfilenamefilekey": m1,
        "email": MessageLookupByLibrary.simpleMessage("E-Mail"),
        "emailDomainNotAllowed":
            MessageLookupByLibrary.simpleMessage("E-Mail-Domäne nicht erlaubt"),
        "emptyDirectory":
            MessageLookupByLibrary.simpleMessage("Keine Dateien oder Ordner"),
        "errorErr": m2,
        "errorOpeningFileE": m3,
        "errorSendingPasswordResetEmail": MessageLookupByLibrary.simpleMessage(
            "Fehler beim Senden der E-Mail zum Zurücksetzen des Passworts"),
        "errorSendingRequest": MessageLookupByLibrary.simpleMessage(
            "Fehler beim Senden der Anfrage"),
        "errorUpdatingUserPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
            "Fehler beim Aktualisieren des Benutzers. Bitte versuchen Sie es erneut."),
        "failedLogingInAfterSignup": MessageLookupByLibrary.simpleMessage(
            "Anmeldung nach der Registrierung fehlgeschlagen"),
        "failedToDeleteAccount": MessageLookupByLibrary.simpleMessage(
            "Fehler beim Löschen des Kontos"),
        "failedToOpenPleaseTrySavingTheFileFirst":
            MessageLookupByLibrary.simpleMessage(
                "Öffnen fehlgeschlagen. Versuchen Sie bitte zuerst, die Datei zu speichern"),
        "fileGetfilenamefilekeyIsNotAvailableOffline": m4,
        "files": MessageLookupByLibrary.simpleMessage("Dateien"),
        "folderName": MessageLookupByLibrary.simpleMessage("Ordnername"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Passwort vergessen?"),
        "howLongToShare": MessageLookupByLibrary.simpleMessage(
            "Wie lange soll die Datei für die Freigabe verfügbar sein?"),
        "invalidEmailOrPassword": MessageLookupByLibrary.simpleMessage(
            "Ungültige E-Mail oder Passwort"),
        "linkCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Link in die Zwischenablage kopiert"),
        "login": MessageLookupByLibrary.simpleMessage("Anmelden"),
        "offlineFilesAreStoredAtSnapshotdata": m5,
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "open": MessageLookupByLibrary.simpleMessage("Öffnen"),
        "openingFileGetfilenamefilekey": m6,
        "openingInBrowser":
            MessageLookupByLibrary.simpleMessage("Im Browser öffnen..."),
        "password": MessageLookupByLibrary.simpleMessage("Passwort"),
        "passwordMustBePasswordminlengthCharactersLong": m7,
        "passwordResetEmailSent": MessageLookupByLibrary.simpleMessage(
            "Passwort-Zurücksetzen-E-Mail gesendet!"),
        "pickFolder": MessageLookupByLibrary.simpleMessage("Ordner auswählen"),
        "pleaseSelectADirectoryWhereYouWouldLikeToDownload":
            MessageLookupByLibrary.simpleMessage(
                "Bitte wählen Sie ein Verzeichnis aus, in dem Sie Ihre Dateien im nächsten Bildschirm herunterladen möchten."),
        "purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion":
            MessageLookupByLibrary.simpleMessage(
                "Kaufe 1 TB mit der Playstore-Version. Sie können diese Version deinstallieren, wenn Sie fertig sind."),
        "requestSent":
            MessageLookupByLibrary.simpleMessage("Anfrage gesendet!"),
        "requireBiometricsToOpenApp": MessageLookupByLibrary.simpleMessage(
            "Biometrie erforderlich, um die App zu öffnen"),
        "resetPassword":
            MessageLookupByLibrary.simpleMessage("Passwort zurücksetzen"),
        "save": MessageLookupByLibrary.simpleMessage("Speichern"),
        "selectDownloadDirectory": MessageLookupByLibrary.simpleMessage(
            "Download-Verzeichnis auswählen"),
        "send": MessageLookupByLibrary.simpleMessage("Senden"),
        "serverMaintenance": MessageLookupByLibrary.simpleMessage(
            "Server wird derzeit gewartet. Bitte versuchen Sie es später erneut."),
        "settings": MessageLookupByLibrary.simpleMessage("Einstellungen"),
        "share": MessageLookupByLibrary.simpleMessage("Teilen"),
        "shareFile": MessageLookupByLibrary.simpleMessage("Datei teilen"),
        "signOut": MessageLookupByLibrary.simpleMessage("Abmelden"),
        "signUp": MessageLookupByLibrary.simpleMessage("Registrieren"),
        "storageUsage": MessageLookupByLibrary.simpleMessage("Speichernutzung"),
        "transfers": MessageLookupByLibrary.simpleMessage("Übertragungen"),
        "upgradeStorage1Terabyte": MessageLookupByLibrary.simpleMessage(
            "Speicherplatz erweitern (1 Terabyte)"),
        "uploaded": MessageLookupByLibrary.simpleMessage("Hochgeladen"),
        "uploading": MessageLookupByLibrary.simpleMessage("Hochladen..."),
        "viewBackendOnGithub":
            MessageLookupByLibrary.simpleMessage("Backend auf Github anzeigen"),
        "viewOnGithub":
            MessageLookupByLibrary.simpleMessage("Auf Github anzeigen"),
        "willSendALinkToYourEmailToCompleteThe":
            MessageLookupByLibrary.simpleMessage(
                "Wir senden einen Link an Ihre E-Mail, um die Änderung abzuschließen"),
        "willSendALinkToYourEmailToResetYour": MessageLookupByLibrary.simpleMessage(
            "Wir senden einen Link an Ihre E-Mail, um Ihr Passwort zurückzusetzen"),
        "yourAccountHasBeenDeleted":
            MessageLookupByLibrary.simpleMessage("Ihr Konto wurde gelöscht.")
      };
}
