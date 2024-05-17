// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it locale. All the
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
  String get localeName => 'it';

  static String m0(foldername) =>
      "Sei sicuro di voler eliminare questa cartella? ${foldername}";

  static String m1(filename) => "Scaricamento ${filename}";

  static String m2(err) => "Errore: ${err}";

  static String m3(filename) => "Errore nell\'\'apertura del file: ${filename}";

  static String m4(filename) => "Il file ${filename} non è disponibile offline";

  static String m5(path) => "I file offline sono memorizzati in ${path}";

  static String m6(filename) => "Apertura file: ${filename}";

  static String m7(length) =>
      "La password deve essere lunga ${length} caratteri";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "accountDeleted":
            MessageLookupByLibrary.simpleMessage("Account eliminato"),
        "allowMeteredConnections": MessageLookupByLibrary.simpleMessage(
            "Consenti connessioni a consumo"),
        "allowedEmails":
            MessageLookupByLibrary.simpleMessage("Email Consentite"),
        "appName": MessageLookupByLibrary.simpleMessage("Blazed Cloud"),
        "areYouSureYouWantToDeleteThisFile":
            MessageLookupByLibrary.simpleMessage(
                "Sei sicuro di voler eliminare questo file?"),
        "areYouSureYouWantToDeleteYourAccountThis":
            MessageLookupByLibrary.simpleMessage(
                "Sei sicuro di voler eliminare il tuo account? Questa operazione è irreversibile. Nota bene, dovrai cancellare manualmente la tua sottoscrizione attraverso il play store (se ne hai una)"),
        "areYouSureYouWantToSignOut":
            MessageLookupByLibrary.simpleMessage("Sei sicuro di voler uscire?"),
        "authenticationRequired":
            MessageLookupByLibrary.simpleMessage("Autenticazione richiesta"),
        "autoDeleteAcount": MessageLookupByLibrary.simpleMessage(
            "Elimina account automaticamente"),
        "blazedExplorer":
            MessageLookupByLibrary.simpleMessage("Blazed Explorer"),
        "camSyncDesc": MessageLookupByLibrary.simpleMessage(
            "Seleziona la cartella sul tuo dispositivo in cui l\'\'app della fotocamera salva foto e video. Non cerca ricorsivamente i file. Sincronizza approssimativamente ogni 6 ore."),
        "cameraRollSync": MessageLookupByLibrary.simpleMessage(
            "Sincronizzazione del rullino fotografico"),
        "cancel": MessageLookupByLibrary.simpleMessage("Annulla"),
        "changeDownloadLocation": MessageLookupByLibrary.simpleMessage(
            "Cambia posizione di download"),
        "changeEmail": MessageLookupByLibrary.simpleMessage("Cambia email"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Cambia password"),
        "changeSyncPath":
            MessageLookupByLibrary.simpleMessage("Cambia percorso"),
        "close": MessageLookupByLibrary.simpleMessage("Chiudi"),
        "confirmFolderDelete": m0,
        "create": MessageLookupByLibrary.simpleMessage("Crea"),
        "createAnAccount":
            MessageLookupByLibrary.simpleMessage("Crea un Account"),
        "createFolder": MessageLookupByLibrary.simpleMessage("Crea cartella"),
        "currentlyNestedFoldersAreNotSupported":
            MessageLookupByLibrary.simpleMessage(
                "Attualmente le cartelle nidificate non sono supportate."),
        "delete": MessageLookupByLibrary.simpleMessage("Elimina"),
        "deleteAccount":
            MessageLookupByLibrary.simpleMessage("Elimina account"),
        "deleteFile": MessageLookupByLibrary.simpleMessage("Elimina file"),
        "deleteFolder":
            MessageLookupByLibrary.simpleMessage("Elimina cartella"),
        "deleteYourAccountAfter90DaysOfInactivityUsersWith":
            MessageLookupByLibrary.simpleMessage(
                "Elimina il tuo account dopo 90 giorni di inattività. Sempre ignorato per gli utenti con sottoscrizioni attive."),
        "downloaded": MessageLookupByLibrary.simpleMessage("Scaricato"),
        "downloading":
            MessageLookupByLibrary.simpleMessage("Scaricamento in corso..."),
        "downloadingGetfilenamefilekey": m1,
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailDomainNotAllowed": MessageLookupByLibrary.simpleMessage(
            "Dominio email non consentito"),
        "emailSent": MessageLookupByLibrary.simpleMessage("Email inviata"),
        "emptyDirectory":
            MessageLookupByLibrary.simpleMessage("Nessun file o cartella"),
        "errorErr": m2,
        "errorOpeningFileE": m3,
        "errorSendingPasswordResetEmail": MessageLookupByLibrary.simpleMessage(
            "Errore nell\'invio dell\'email di ripristino password"),
        "errorSendingRequest": MessageLookupByLibrary.simpleMessage(
            "Errore nell\'\'invio della richiesta"),
        "errorUpdatingUserPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
            "Errore nell\'aggiornamento dell\'utente. Riprova."),
        "failedLogingInAfterSignup": MessageLookupByLibrary.simpleMessage(
            "Accesso fallito dopo la registrazione"),
        "failedToDeleteAccount": MessageLookupByLibrary.simpleMessage(
            "Eliminazione dell\'\'account fallita"),
        "failedToOpenPleaseTrySavingTheFileFirst":
            MessageLookupByLibrary.simpleMessage(
                "Impossibile aprire. Prova a salvare il file prima"),
        "failedToOpenPortal": MessageLookupByLibrary.simpleMessage(
            "Apertura portale non riuscita"),
        "fileGetfilenamefilekeyIsNotAvailableOffline": m4,
        "files": MessageLookupByLibrary.simpleMessage("File"),
        "folderName": MessageLookupByLibrary.simpleMessage("Nome cartella"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Password dimenticata?"),
        "general": MessageLookupByLibrary.simpleMessage("Generale"),
        "howLongToShare": MessageLookupByLibrary.simpleMessage(
            "Per quanto tempo il file deve essere disponibile per la condivisione?"),
        "invalidEmailOrPassword":
            MessageLookupByLibrary.simpleMessage("Email o password non valide"),
        "linkCopiedToClipboard":
            MessageLookupByLibrary.simpleMessage("Link copiato negli appunti"),
        "login": MessageLookupByLibrary.simpleMessage("Accedi"),
        "manageAccount":
            MessageLookupByLibrary.simpleMessage("Gestisci Account"),
        "notVerified":
            MessageLookupByLibrary.simpleMessage("Email non verificata"),
        "offlineFilesAreStoredAtSnapshotdata": m5,
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "open": MessageLookupByLibrary.simpleMessage("Apri"),
        "openingFileGetfilenamefilekey": m6,
        "openingInBrowser":
            MessageLookupByLibrary.simpleMessage("Apertura nel browser..."),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordMustBePasswordminlengthCharactersLong": m7,
        "passwordResetEmailSent": MessageLookupByLibrary.simpleMessage(
            "Email di ripristino password inviata!"),
        "periodicallyBackingUpSelectedFolder":
            MessageLookupByLibrary.simpleMessage(
                "Backup periodico della cartella selezionata"),
        "pickFolder": MessageLookupByLibrary.simpleMessage("Scegli cartella"),
        "pleaseAuthenticateToAccessYourCloud":
            MessageLookupByLibrary.simpleMessage(
                "Si prega di autenticarsi per accedere al proprio cloud"),
        "pleaseSelectADirectoryWhereYouWouldLikeToDownload":
            MessageLookupByLibrary.simpleMessage(
                "Seleziona una cartella dove desideri scaricare i tuoi file nella prossima schermata."),
        "privacyPolicy":
            MessageLookupByLibrary.simpleMessage("Informativa sulla privacy"),
        "purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion":
            MessageLookupByLibrary.simpleMessage(
                "Acquista 1TB utilizzando la versione Playstore. Puoi disinstallare quella versione una volta completato."),
        "requestSent":
            MessageLookupByLibrary.simpleMessage("Richiesta inviata!"),
        "requireBiometricsToOpenApp": MessageLookupByLibrary.simpleMessage(
            "Richiedi biometria per aprire l\'\'app"),
        "requireCharging":
            MessageLookupByLibrary.simpleMessage("Richiede la ricarica"),
        "resetPassword":
            MessageLookupByLibrary.simpleMessage("Ripristina password"),
        "save": MessageLookupByLibrary.simpleMessage("Salva"),
        "security": MessageLookupByLibrary.simpleMessage("Sicurezza"),
        "selectDownloadDirectory": MessageLookupByLibrary.simpleMessage(
            "Seleziona la cartella di download"),
        "selectSyncLocation":
            MessageLookupByLibrary.simpleMessage("Seleziona posizione"),
        "send": MessageLookupByLibrary.simpleMessage("Invia"),
        "sendEmail": MessageLookupByLibrary.simpleMessage("Invia email"),
        "serverMaintenance": MessageLookupByLibrary.simpleMessage(
            "Il server è attualmente in manutenzione. Riprova più tardi."),
        "settings": MessageLookupByLibrary.simpleMessage("Impostazioni"),
        "share": MessageLookupByLibrary.simpleMessage("Condividi"),
        "shareEmailVerificationNeeded": MessageLookupByLibrary.simpleMessage(
            "L\'email deve essere verificata o è necessaria un\'iscrizione attiva per condividere i file."),
        "shareFile": MessageLookupByLibrary.simpleMessage("Condividi file"),
        "signOut": MessageLookupByLibrary.simpleMessage("Esci"),
        "signUp": MessageLookupByLibrary.simpleMessage("Registrati"),
        "storageUsage":
            MessageLookupByLibrary.simpleMessage("Utilizzo dello spazio"),
        "subscribedThroughPlaystoreOrAppstore":
            MessageLookupByLibrary.simpleMessage(
                "Sottoscritto tramite Playstore o Appstore"),
        "syncEnabled":
            MessageLookupByLibrary.simpleMessage("Sincronizzazione abilitata"),
        "syncNow": MessageLookupByLibrary.simpleMessage("Sincronizza ora"),
        "syncSettings": MessageLookupByLibrary.simpleMessage(
            "Impostazioni di sincronizzazione"),
        "syncing": MessageLookupByLibrary.simpleMessage(
            "Sincronizzazione in corso..."),
        "termsOfService":
            MessageLookupByLibrary.simpleMessage("Termini di servizio"),
        "transfers": MessageLookupByLibrary.simpleMessage("Trasferimenti"),
        "upgradeStorage":
            MessageLookupByLibrary.simpleMessage("Aggiorna Archiviazione"),
        "uploaded": MessageLookupByLibrary.simpleMessage("Caricato"),
        "uploading":
            MessageLookupByLibrary.simpleMessage("Caricamento in corso..."),
        "viewAllowedEmailDomains": MessageLookupByLibrary.simpleMessage(
            "Visualizza Domini Email Consentiti"),
        "viewBackendOnGithub": MessageLookupByLibrary.simpleMessage(
            "Visualizza il backend su Github"),
        "viewOnGithub":
            MessageLookupByLibrary.simpleMessage("Visualizza su Github"),
        "welcomeBack":
            MessageLookupByLibrary.simpleMessage("Benvenuto di nuovo!"),
        "willSendALinkToYourEmailToCompleteThe":
            MessageLookupByLibrary.simpleMessage(
                "Inviaremos un link alla tua email per completare il cambio"),
        "willSendALinkToYourEmailToResetYour":
            MessageLookupByLibrary.simpleMessage(
                "Inviaremos un link alla tua email per resettare la password"),
        "yourAccountHasBeenDeleted": MessageLookupByLibrary.simpleMessage(
            "Il tuo account è stato eliminato.")
      };
}
