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
        "accountDeleted":
            MessageLookupByLibrary.simpleMessage("Compte supprimé"),
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
        "cancel": MessageLookupByLibrary.simpleMessage("Annuler"),
        "changeDownloadLocation": MessageLookupByLibrary.simpleMessage(
            "Changer l\'\'emplacement de téléchargement"),
        "changeEmail":
            MessageLookupByLibrary.simpleMessage("Changer l\'\'adresse email"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Changer le mot de passe"),
        "confirmFolderDelete": m0,
        "create": MessageLookupByLibrary.simpleMessage("Créer"),
        "createFolder":
            MessageLookupByLibrary.simpleMessage("Créer un dossier"),
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
        "fileGetfilenamefilekeyIsNotAvailableOffline": m4,
        "files": MessageLookupByLibrary.simpleMessage("Fichiers"),
        "folderName": MessageLookupByLibrary.simpleMessage("Nom du dossier"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Mot de passe oublié ?"),
        "howLongToShare": MessageLookupByLibrary.simpleMessage(
            "Combien de temps le fichier devrait-il être disponible pour le partage ?"),
        "invalidEmailOrPassword": MessageLookupByLibrary.simpleMessage(
            "Email ou mot de passe invalide"),
        "linkCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Lien copié dans le presse-papiers"),
        "login": MessageLookupByLibrary.simpleMessage("Connexion"),
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
        "pickFolder":
            MessageLookupByLibrary.simpleMessage("Choisir le dossier"),
        "pleaseSelectADirectoryWhereYouWouldLikeToDownload":
            MessageLookupByLibrary.simpleMessage(
                "Veuillez sélectionner un répertoire où vous souhaitez télécharger vos fichiers à l\'\'écran suivant."),
        "purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion":
            MessageLookupByLibrary.simpleMessage(
                "Achetez 1 To avec la version du Play Store. Vous pouvez désinstaller cette version une fois terminée."),
        "requestSent":
            MessageLookupByLibrary.simpleMessage("Demande envoyée !"),
        "requireBiometricsToOpenApp": MessageLookupByLibrary.simpleMessage(
            "Exiger la biométrie pour ouvrir l\'\'application"),
        "resetPassword": MessageLookupByLibrary.simpleMessage(
            "Réinitialiser le mot de passe"),
        "save": MessageLookupByLibrary.simpleMessage("Enregistrer"),
        "selectDownloadDirectory": MessageLookupByLibrary.simpleMessage(
            "Sélectionner le répertoire de téléchargement"),
        "send": MessageLookupByLibrary.simpleMessage("Envoyer"),
        "serverMaintenance": MessageLookupByLibrary.simpleMessage(
            "Le serveur est actuellement en maintenance. Veuillez réessayer plus tard."),
        "settings": MessageLookupByLibrary.simpleMessage("Paramètres"),
        "share": MessageLookupByLibrary.simpleMessage("Partager"),
        "shareFile":
            MessageLookupByLibrary.simpleMessage("Partager le fichier"),
        "signOut": MessageLookupByLibrary.simpleMessage("Déconnexion"),
        "signUp": MessageLookupByLibrary.simpleMessage("S\'\'inscrire"),
        "storageUsage":
            MessageLookupByLibrary.simpleMessage("Utilisation du stockage"),
        "transfers": MessageLookupByLibrary.simpleMessage("Transferts"),
        "uploaded": MessageLookupByLibrary.simpleMessage("Téléchargé"),
        "uploading":
            MessageLookupByLibrary.simpleMessage("Téléchargement en cours..."),
        "viewBackendOnGithub":
            MessageLookupByLibrary.simpleMessage("Voir le backend sur Github"),
        "viewOnGithub": MessageLookupByLibrary.simpleMessage("Voir sur Github"),
        "willSendALinkToYourEmailToCompleteThe":
            MessageLookupByLibrary.simpleMessage(
                "Enverra un lien à votre adresse email pour compléter le changement"),
        "willSendALinkToYourEmailToResetYour": MessageLookupByLibrary.simpleMessage(
            "Enverra un lien à votre adresse email pour réinitialiser votre mot de passe"),
        "yourAccountHasBeenDeleted":
            MessageLookupByLibrary.simpleMessage("Votre compte a été supprimé.")
      };
}