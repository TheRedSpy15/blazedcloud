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
        "account": MessageLookupByLibrary.simpleMessage("Konto"),
        "accountDeleted":
            MessageLookupByLibrary.simpleMessage("Konto gelöscht"),
        "allowMeteredConnections": MessageLookupByLibrary.simpleMessage(
            "Gebührenpflichtige Verbindungen zulassen"),
        "allowedEmails":
            MessageLookupByLibrary.simpleMessage("Erlaubte E-Mails"),
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
        "camSyncDesc": MessageLookupByLibrary.simpleMessage(
            "Wählen Sie den Ordner auf Ihrem Gerät aus, in dem Ihre Kamera-App Fotos und Videos speichert. Sucht nicht rekursiv nach Dateien. Synchronisiert ungefähr alle 6 Stunden."),
        "cameraRollSync": MessageLookupByLibrary.simpleMessage(
            "Kamerarollen-Synchronisierung"),
        "cameraSync": MessageLookupByLibrary.simpleMessage("Kamerasync"),
        "cancel": MessageLookupByLibrary.simpleMessage("Abbrechen"),
        "changeDownloadLocation":
            MessageLookupByLibrary.simpleMessage("Download-Speicherort ändern"),
        "changeEmail": MessageLookupByLibrary.simpleMessage("E-Mail ändern"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Passwort ändern"),
        "changeSyncPath": MessageLookupByLibrary.simpleMessage("Pfad ändern"),
        "close": MessageLookupByLibrary.simpleMessage("Schließen"),
        "confirmFolderDelete": m0,
        "create": MessageLookupByLibrary.simpleMessage("Erstellen"),
        "createAnAccount":
            MessageLookupByLibrary.simpleMessage("Benutzerkonto erstellen"),
        "createFolder":
            MessageLookupByLibrary.simpleMessage("Ordner erstellen"),
        "currentlyNestedFoldersAreNotSupported":
            MessageLookupByLibrary.simpleMessage(
                "Aktuell werden verschachtelte Ordner nicht unterstützt."),
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
        "emailSent": MessageLookupByLibrary.simpleMessage("E-Mail gesendet"),
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
        "failedToOpenPortal": MessageLookupByLibrary.simpleMessage(
            "Portal konnte nicht geöffnet werden"),
        "fileGetfilenamefilekeyIsNotAvailableOffline": m4,
        "files": MessageLookupByLibrary.simpleMessage("Dateien"),
        "folderName": MessageLookupByLibrary.simpleMessage("Ordnername"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Passwort vergessen?"),
        "general": MessageLookupByLibrary.simpleMessage("Allgemein"),
        "howLongToShare": MessageLookupByLibrary.simpleMessage(
            "Wie lange soll die Datei für die Freigabe verfügbar sein?"),
        "invalidEmailOrPassword": MessageLookupByLibrary.simpleMessage(
            "Ungültige E-Mail oder Passwort"),
        "linkCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Link in die Zwischenablage kopiert"),
        "login": MessageLookupByLibrary.simpleMessage("Anmelden"),
        "manageAccount":
            MessageLookupByLibrary.simpleMessage("Konto verwalten"),
        "noTransfers": MessageLookupByLibrary.simpleMessage("No transfers"),
        "notVerified":
            MessageLookupByLibrary.simpleMessage("E-Mail nicht verifiziert"),
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
        "periodicallyBackingUpSelectedFolder":
            MessageLookupByLibrary.simpleMessage(
                "Ausgewählten Ordner regelmäßig sichern"),
        "pickFolder": MessageLookupByLibrary.simpleMessage("Ordner auswählen"),
        "pleaseAuthenticateToAccessYourCloud":
            MessageLookupByLibrary.simpleMessage(
                "Bitte authentifizieren Sie sich, um auf Ihre Cloud zuzugreifen"),
        "pleaseSelectADirectoryWhereYouWouldLikeToDownload":
            MessageLookupByLibrary.simpleMessage(
                "Bitte wählen Sie ein Verzeichnis aus, in dem Sie Ihre Dateien im nächsten Bildschirm herunterladen möchten."),
        "privacyPolicy":
            MessageLookupByLibrary.simpleMessage("Datenschutzrichtlinie"),
        "purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion":
            MessageLookupByLibrary.simpleMessage(
                "Kaufe 1 TB mit der Playstore-Version. Sie können diese Version deinstallieren, wenn Sie fertig sind."),
        "requestSent":
            MessageLookupByLibrary.simpleMessage("Anfrage gesendet!"),
        "requireBiometricsToOpenApp": MessageLookupByLibrary.simpleMessage(
            "Biometrie erforderlich, um die App zu öffnen"),
        "requireCharging":
            MessageLookupByLibrary.simpleMessage("Laden erforderlich"),
        "resetPassword":
            MessageLookupByLibrary.simpleMessage("Passwort zurücksetzen"),
        "save": MessageLookupByLibrary.simpleMessage("Speichern"),
        "security": MessageLookupByLibrary.simpleMessage("Sicherheit"),
        "selectDownloadDirectory": MessageLookupByLibrary.simpleMessage(
            "Download-Verzeichnis auswählen"),
        "selectSyncLocation":
            MessageLookupByLibrary.simpleMessage("Standort auswählen"),
        "send": MessageLookupByLibrary.simpleMessage("Senden"),
        "sendEmail": MessageLookupByLibrary.simpleMessage("E-Mail senden"),
        "serverMaintenance": MessageLookupByLibrary.simpleMessage(
            "Server wird derzeit gewartet. Bitte versuchen Sie es später erneut."),
        "settings": MessageLookupByLibrary.simpleMessage("Einstellungen"),
        "share": MessageLookupByLibrary.simpleMessage("Teilen"),
        "shareEmailVerificationNeeded": MessageLookupByLibrary.simpleMessage(
            "E-Mail muss verifiziert werden oder es muss ein aktives Abonnement vorhanden sein, um Dateien zu teilen."),
        "shareFile": MessageLookupByLibrary.simpleMessage("Datei teilen"),
        "signOut": MessageLookupByLibrary.simpleMessage("Abmelden"),
        "signUp": MessageLookupByLibrary.simpleMessage("Registrieren"),
        "storageUsage": MessageLookupByLibrary.simpleMessage("Speichernutzung"),
        "subscribedThroughPlaystoreOrAppstore":
            MessageLookupByLibrary.simpleMessage(
                "Über Playstore oder Appstore abonniert"),
        "syncEnabled":
            MessageLookupByLibrary.simpleMessage("Synchronisierung aktiviert"),
        "syncNow":
            MessageLookupByLibrary.simpleMessage("Jetzt synchronisieren"),
        "syncSettings": MessageLookupByLibrary.simpleMessage(
            "Synchronisationseinstellungen"),
        "syncing": MessageLookupByLibrary.simpleMessage("Synchronisierung..."),
        "termsOfService":
            MessageLookupByLibrary.simpleMessage("Nutzungsbedingungen"),
        "transfers": MessageLookupByLibrary.simpleMessage("Übertragungen"),
        "upgradeStorage":
            MessageLookupByLibrary.simpleMessage("Speicherplatz erweitern"),
        "upgradeStorage1Terabyte": MessageLookupByLibrary.simpleMessage(
            "Speicherplatz erweitern (1 Terabyte)"),
        "uploaded": MessageLookupByLibrary.simpleMessage("Hochgeladen"),
        "uploading": MessageLookupByLibrary.simpleMessage("Hochladen..."),
        "viewAllowedEmailDomains": MessageLookupByLibrary.simpleMessage(
            "Erlaubte E-Mail-Domains anzeigen"),
        "viewBackendOnGithub":
            MessageLookupByLibrary.simpleMessage("Backend auf Github anzeigen"),
        "viewOnGithub":
            MessageLookupByLibrary.simpleMessage("Auf Github anzeigen"),
        "welcomeBack":
            MessageLookupByLibrary.simpleMessage("Willkommen zurück!"),
        "willSendALinkToYourEmailToCompleteThe":
            MessageLookupByLibrary.simpleMessage(
                "Wir senden einen Link an Ihre E-Mail, um die Änderung abzuschließen"),
        "willSendALinkToYourEmailToResetYour": MessageLookupByLibrary.simpleMessage(
            "Wir senden einen Link an Ihre E-Mail, um Ihr Passwort zurückzusetzen"),
        "yourAccountHasBeenDeleted":
            MessageLookupByLibrary.simpleMessage("Ihr Konto wurde gelöscht.")
      };
}
