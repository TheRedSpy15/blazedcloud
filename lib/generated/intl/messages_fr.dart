// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(foldername) =>
      "Êtes-vous sûr de vouloir supprimer ce dossier ? ${foldername}";

  static String m1(filename) => "Téléchargement de ${filename}";

  static String m2(err) => "Erreur : ${err}";

  static String m3(filename) =>
      "Erreur lors de l\'\'ouverture du fichier : ${filename}";

  static String m4(filename) =>
      "Le fichier ${filename} n\'\'est pas disponible hors ligne";

  static String m5(path) => "Les fichiers hors ligne sont stockés à ${path}";

  static String m6(filename) => "Ouverture du fichier : ${filename}";

  static String m7(length) =>
      "Le mot de passe doit comporter ${length} caractères";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Compte"),
        "accountDeleted":
            MessageLookupByLibrary.simpleMessage("Compte supprimé"),
        "allowMeteredConnections": MessageLookupByLibrary.simpleMessage(
            "Autoriser les connexions tarifées"),
        "allowedEmails":
            MessageLookupByLibrary.simpleMessage("Adresses e-mail autorisées"),
        "appName": MessageLookupByLibrary.simpleMessage("Blazed Cloud"),
        "areYouSureYouWantToDeleteThisFile":
            MessageLookupByLibrary.simpleMessage(
                "Êtes-vous sûr de vouloir supprimer ce fichier ?"),
        "areYouSureYouWantToDeleteYourAccountThis":
            MessageLookupByLibrary.simpleMessage(
                "Êtes-vous sûr de vouloir supprimer votre compte ? C\'\'est irréversible. Veuillez noter que vous devrez annuler votre abonnement manuellement via le Play Store (si vous en avez un)"),
        "areYouSureYouWantToSignOut": MessageLookupByLibrary.simpleMessage(
            "Êtes-vous sûr de vouloir vous déconnecter ?"),
        "authenticationRequired":
            MessageLookupByLibrary.simpleMessage("Authentification requise"),
        "autoDeleteAcount": MessageLookupByLibrary.simpleMessage(
            "Supprimer automatiquement le compte"),
        "blazedExplorer":
            MessageLookupByLibrary.simpleMessage("Blazed Explorer"),
        "camSyncDesc": MessageLookupByLibrary.simpleMessage(
            "Sélectionnez le dossier sur votre appareil où votre application de caméra enregistre les photos et les vidéos. Ne recherche pas de manière récursive les fichiers. Synchronise environ toutes les 6 heures."),
        "cameraRollSync": MessageLookupByLibrary.simpleMessage(
            "Synchronisation du rouleau de caméra"),
        "cancel": MessageLookupByLibrary.simpleMessage("Annuler"),
        "changeDownloadLocation": MessageLookupByLibrary.simpleMessage(
            "Changer l\'\'emplacement de téléchargement"),
        "changeEmail":
            MessageLookupByLibrary.simpleMessage("Changer l\'\'adresse email"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Changer le mot de passe"),
        "changeSyncPath":
            MessageLookupByLibrary.simpleMessage("Changer le chemin"),
        "close": MessageLookupByLibrary.simpleMessage("Fermer"),
        "confirmFolderDelete": m0,
        "create": MessageLookupByLibrary.simpleMessage("Créer"),
        "createAnAccount":
            MessageLookupByLibrary.simpleMessage("Créer un compte"),
        "createFolder":
            MessageLookupByLibrary.simpleMessage("Créer un dossier"),
        "currentlyNestedFoldersAreNotSupported":
            MessageLookupByLibrary.simpleMessage(
                "Actuellement, les dossiers imbriqués ne sont pas pris en charge."),
        "delete": MessageLookupByLibrary.simpleMessage("Supprimer"),
        "deleteAccount":
            MessageLookupByLibrary.simpleMessage("Supprimer le compte"),
        "deleteFile":
            MessageLookupByLibrary.simpleMessage("Supprimer le fichier"),
        "deleteFolder":
            MessageLookupByLibrary.simpleMessage("Supprimer le dossier"),
        "deleteYourAccountAfter90DaysOfInactivityUsersWith":
            MessageLookupByLibrary.simpleMessage(
                "Supprimez votre compte après 90 jours d\'\'inactivité. Toujours ignoré pour les utilisateurs avec des abonnements actifs."),
        "downloaded": MessageLookupByLibrary.simpleMessage("Téléchargé"),
        "downloading":
            MessageLookupByLibrary.simpleMessage("Téléchargement en cours..."),
        "downloadingGetfilenamefilekey": m1,
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailDomainNotAllowed":
            MessageLookupByLibrary.simpleMessage("Domaine email non autorisé"),
        "emailSent": MessageLookupByLibrary.simpleMessage("E-mail envoyé"),
        "emptyDirectory":
            MessageLookupByLibrary.simpleMessage("Aucun fichier ou dossier"),
        "errorErr": m2,
        "errorOpeningFileE": m3,
        "errorSendingPasswordResetEmail": MessageLookupByLibrary.simpleMessage(
            "Erreur lors de l\'envoi de l\'email de réinitialisation du mot de passe"),
        "errorSendingRequest": MessageLookupByLibrary.simpleMessage(
            "Erreur lors de l\'\'envoi de la demande"),
        "errorUpdatingUserPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
            "Erreur de mise à jour de l\'\'utilisateur. Veuillez réessayer."),
        "failedLogingInAfterSignup": MessageLookupByLibrary.simpleMessage(
            "Échec de la connexion après l\'\'inscription"),
        "failedToDeleteAccount": MessageLookupByLibrary.simpleMessage(
            "Échec de la suppression du compte"),
        "failedToOpenPleaseTrySavingTheFileFirst":
            MessageLookupByLibrary.simpleMessage(
                "Échec de l\'ouverture. Veuillez essayer de sauvegarder le fichier d\'abord"),
        "failedToOpenPortal": MessageLookupByLibrary.simpleMessage(
            "Échec de l\'\'ouverture du portail"),
        "fileGetfilenamefilekeyIsNotAvailableOffline": m4,
        "files": MessageLookupByLibrary.simpleMessage("Fichiers"),
        "folderName": MessageLookupByLibrary.simpleMessage("Nom du dossier"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Mot de passe oublié ?"),
        "general": MessageLookupByLibrary.simpleMessage("Général"),
        "howLongToShare": MessageLookupByLibrary.simpleMessage(
            "Combien de temps le fichier devrait-il être disponible pour le partage ?"),
        "invalidEmailOrPassword": MessageLookupByLibrary.simpleMessage(
            "Email ou mot de passe invalide"),
        "linkCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Lien copié dans le presse-papiers"),
        "login": MessageLookupByLibrary.simpleMessage("Connexion"),
        "manageAccount":
            MessageLookupByLibrary.simpleMessage("Gérer le compte"),
        "notVerified":
            MessageLookupByLibrary.simpleMessage("E-mail non vérifié"),
        "offlineFilesAreStoredAtSnapshotdata": m5,
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "open": MessageLookupByLibrary.simpleMessage("Ouvrir"),
        "openingFileGetfilenamefilekey": m6,
        "openingInBrowser": MessageLookupByLibrary.simpleMessage(
            "Ouverture dans le navigateur..."),
        "password": MessageLookupByLibrary.simpleMessage("Mot de passe"),
        "passwordMustBePasswordminlengthCharactersLong": m7,
        "passwordResetEmailSent": MessageLookupByLibrary.simpleMessage(
            "Email de réinitialisation du mot de passe envoyé !"),
        "periodicallyBackingUpSelectedFolder":
            MessageLookupByLibrary.simpleMessage(
                "Sauvegarde périodique du dossier sélectionné"),
        "pickFolder":
            MessageLookupByLibrary.simpleMessage("Choisir le dossier"),
        "pleaseAuthenticateToAccessYourCloud":
            MessageLookupByLibrary.simpleMessage(
                "Veuillez vous authentifier pour accéder à votre cloud"),
        "pleaseSelectADirectoryWhereYouWouldLikeToDownload":
            MessageLookupByLibrary.simpleMessage(
                "Veuillez sélectionner un répertoire où vous souhaitez télécharger vos fichiers à l\'\'écran suivant."),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage(
            "Politique de confidentialité"),
        "purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion":
            MessageLookupByLibrary.simpleMessage(
                "Achetez 1 To avec la version du Play Store. Vous pouvez désinstaller cette version une fois terminée."),
        "requestSent":
            MessageLookupByLibrary.simpleMessage("Demande envoyée !"),
        "requireBiometricsToOpenApp": MessageLookupByLibrary.simpleMessage(
            "Exiger la biométrie pour ouvrir l\'\'application"),
        "requireCharging":
            MessageLookupByLibrary.simpleMessage("Requiert la charge"),
        "resetPassword": MessageLookupByLibrary.simpleMessage(
            "Réinitialiser le mot de passe"),
        "save": MessageLookupByLibrary.simpleMessage("Enregistrer"),
        "security": MessageLookupByLibrary.simpleMessage("Sécurité"),
        "selectDownloadDirectory": MessageLookupByLibrary.simpleMessage(
            "Sélectionner le répertoire de téléchargement"),
        "selectSyncLocation": MessageLookupByLibrary.simpleMessage(
            "Sélectionner l\'\'emplacement"),
        "send": MessageLookupByLibrary.simpleMessage("Envoyer"),
        "sendEmail": MessageLookupByLibrary.simpleMessage("Envoyer un e-mail"),
        "serverMaintenance": MessageLookupByLibrary.simpleMessage(
            "Le serveur est actuellement en maintenance. Veuillez réessayer plus tard."),
        "settings": MessageLookupByLibrary.simpleMessage("Paramètres"),
        "share": MessageLookupByLibrary.simpleMessage("Partager"),
        "shareEmailVerificationNeeded": MessageLookupByLibrary.simpleMessage(
            "L\'\'e-mail doit être vérifié ou avoir un abonnement actif pour partager des fichiers."),
        "shareFile":
            MessageLookupByLibrary.simpleMessage("Partager le fichier"),
        "signOut": MessageLookupByLibrary.simpleMessage("Déconnexion"),
        "signUp": MessageLookupByLibrary.simpleMessage("S\'\'inscrire"),
        "storageUsage":
            MessageLookupByLibrary.simpleMessage("Utilisation du stockage"),
        "subscribedThroughPlaystoreOrAppstore":
            MessageLookupByLibrary.simpleMessage(
                "Abonné via le Playstore ou l\'\'Appstore"),
        "syncEnabled":
            MessageLookupByLibrary.simpleMessage("Synchronisation activée"),
        "syncNow":
            MessageLookupByLibrary.simpleMessage("Synchroniser maintenant"),
        "syncSettings": MessageLookupByLibrary.simpleMessage(
            "Paramètres de synchronisation"),
        "syncing":
            MessageLookupByLibrary.simpleMessage("Synchronisation en cours..."),
        "termsOfService":
            MessageLookupByLibrary.simpleMessage("Conditions d\'\'utilisation"),
        "transfers": MessageLookupByLibrary.simpleMessage("Transferts"),
        "upgradeStorage":
            MessageLookupByLibrary.simpleMessage("Mise à niveau du stockage"),
        "uploaded": MessageLookupByLibrary.simpleMessage("Téléchargé"),
        "uploading":
            MessageLookupByLibrary.simpleMessage("Téléchargement en cours..."),
        "viewAllowedEmailDomains": MessageLookupByLibrary.simpleMessage(
            "Voir les domaines d\'\'e-mail autorisés"),
        "viewBackendOnGithub":
            MessageLookupByLibrary.simpleMessage("Voir le backend sur Github"),
        "viewOnGithub": MessageLookupByLibrary.simpleMessage("Voir sur Github"),
        "welcomeBack":
            MessageLookupByLibrary.simpleMessage("Bienvenue de nouveau !"),
        "willSendALinkToYourEmailToCompleteThe":
            MessageLookupByLibrary.simpleMessage(
                "Enverra un lien à votre adresse email pour compléter le changement"),
        "willSendALinkToYourEmailToResetYour": MessageLookupByLibrary.simpleMessage(
            "Enverra un lien à votre adresse email pour réinitialiser votre mot de passe"),
        "yourAccountHasBeenDeleted":
            MessageLookupByLibrary.simpleMessage("Votre compte a été supprimé.")
      };
}
