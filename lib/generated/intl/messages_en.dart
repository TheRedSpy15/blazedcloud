// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(foldername) =>
      "Are you sure you want to delete this Folder? ${foldername}";

  static String m1(filename) => "Downloading ${filename}";

  static String m2(err) => "Error: ${err}";

  static String m3(filename) => "Error opening file: ${filename}";

  static String m4(filename) => "File ${filename} is not available offline";

  static String m5(path) => "Offline files are stored at ${path}";

  static String m6(filename) => "Opening file: ${filename}";

  static String m7(length) => "Password must be ${length} characters long";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "accountDeleted":
            MessageLookupByLibrary.simpleMessage("Account deleted"),
        "allowMeteredConnections":
            MessageLookupByLibrary.simpleMessage("Allow Metered Connections"),
        "allowedEmails": MessageLookupByLibrary.simpleMessage("Allowed Emails"),
        "appName": MessageLookupByLibrary.simpleMessage("Blazed Cloud"),
        "areYouSureYouWantToDeleteThisFile":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to delete this file?"),
        "areYouSureYouWantToDeleteYourAccountThis":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to delete your account? This is irreversible. Please note, you will need to cancel your subscription through the play store manually (if you have one)"),
        "areYouSureYouWantToSignOut": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to sign out?"),
        "authenticationRequired":
            MessageLookupByLibrary.simpleMessage("Authentication Required"),
        "autoDeleteAcount":
            MessageLookupByLibrary.simpleMessage("Auto Delete Acount"),
        "blazedExplorer":
            MessageLookupByLibrary.simpleMessage("Blazed Explorer"),
        "camSyncDesc": MessageLookupByLibrary.simpleMessage(
            "Select the folder on your device that your camera app saves photos and videos to. Does not recursively search for files. Syncs approximately every 6 hours"),
        "cameraRollSync":
            MessageLookupByLibrary.simpleMessage("Camera Roll Sync"),
        "cameraSync": MessageLookupByLibrary.simpleMessage("Camera Sync"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "changeDownloadLocation":
            MessageLookupByLibrary.simpleMessage("Change Download Location"),
        "changeEmail": MessageLookupByLibrary.simpleMessage("Change Email"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "changeSyncPath": MessageLookupByLibrary.simpleMessage("Change Path"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "confirmFolderDelete": m0,
        "create": MessageLookupByLibrary.simpleMessage("Create"),
        "createAnAccount":
            MessageLookupByLibrary.simpleMessage("Create an Account"),
        "createFolder": MessageLookupByLibrary.simpleMessage("Create folder"),
        "currentlyNestedFoldersAreNotSupported":
            MessageLookupByLibrary.simpleMessage(
                "Currently nested folders are not supported."),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete account"),
        "deleteFile": MessageLookupByLibrary.simpleMessage("Delete file"),
        "deleteFolder": MessageLookupByLibrary.simpleMessage("Delete folder"),
        "deleteYourAccountAfter90DaysOfInactivityUsersWith":
            MessageLookupByLibrary.simpleMessage(
                "Delete your account after 90 days of inactivity. Always ignored for users with active subscriptions."),
        "downloaded": MessageLookupByLibrary.simpleMessage("Downloaded"),
        "downloading": MessageLookupByLibrary.simpleMessage("Downloading..."),
        "downloadingGetfilenamefilekey": m1,
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailDomainNotAllowed":
            MessageLookupByLibrary.simpleMessage("Email Domain not allowed"),
        "emailSent": MessageLookupByLibrary.simpleMessage("Email sent"),
        "emptyDirectory":
            MessageLookupByLibrary.simpleMessage("No files or folders"),
        "errorErr": m2,
        "errorOpeningFileE": m3,
        "errorSendingPasswordResetEmail": MessageLookupByLibrary.simpleMessage(
            "Error sending password reset email"),
        "errorSendingRequest":
            MessageLookupByLibrary.simpleMessage("Error sending request"),
        "errorUpdatingUserPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
            "Error updating user. Please try again."),
        "failedLogingInAfterSignup": MessageLookupByLibrary.simpleMessage(
            "Failed loging in after signup"),
        "failedToDeleteAccount":
            MessageLookupByLibrary.simpleMessage("Failed to delete account"),
        "failedToOpenPleaseTrySavingTheFileFirst":
            MessageLookupByLibrary.simpleMessage(
                "Failed to open. Please try saving the file first"),
        "failedToOpenPortal":
            MessageLookupByLibrary.simpleMessage("Failed to open portal"),
        "fileGetfilenamefilekeyIsNotAvailableOffline": m4,
        "files": MessageLookupByLibrary.simpleMessage("Files"),
        "folderName": MessageLookupByLibrary.simpleMessage("Folder name"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "general": MessageLookupByLibrary.simpleMessage("General"),
        "howLongToShare": MessageLookupByLibrary.simpleMessage(
            "How long should the file be available for sharing?"),
        "invalidEmailOrPassword":
            MessageLookupByLibrary.simpleMessage("Invalid email or password"),
        "linkCopiedToClipboard":
            MessageLookupByLibrary.simpleMessage("Link copied to clipboard"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "manageAccount": MessageLookupByLibrary.simpleMessage("Manage Account"),
        "noTransfers": MessageLookupByLibrary.simpleMessage("No transfers"),
        "notVerified":
            MessageLookupByLibrary.simpleMessage("Email not verified"),
        "offlineFilesAreStoredAtSnapshotdata": m5,
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "open": MessageLookupByLibrary.simpleMessage("Open"),
        "openingFileGetfilenamefilekey": m6,
        "openingInBrowser":
            MessageLookupByLibrary.simpleMessage("Opening in browser..."),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordMustBePasswordminlengthCharactersLong": m7,
        "passwordResetEmailSent":
            MessageLookupByLibrary.simpleMessage("Password reset email sent!"),
        "periodicallyBackingUpSelectedFolder":
            MessageLookupByLibrary.simpleMessage(
                "Periodically backing up selected folder"),
        "pickFolder": MessageLookupByLibrary.simpleMessage("Pick Folder"),
        "pleaseAuthenticateToAccessYourCloud":
            MessageLookupByLibrary.simpleMessage(
                "Please authenticate to access your cloud"),
        "pleaseSelectADirectoryWhereYouWouldLikeToDownload":
            MessageLookupByLibrary.simpleMessage(
                "Please select a directory where you would like to download your files in the next screen."),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion":
            MessageLookupByLibrary.simpleMessage(
                "Purchase 1TB using Playstore build. You can uninstall that version when done."),
        "requestSent": MessageLookupByLibrary.simpleMessage("Request Sent!"),
        "requireBiometricsToOpenApp": MessageLookupByLibrary.simpleMessage(
            "Require biometrics to open app"),
        "requireCharging":
            MessageLookupByLibrary.simpleMessage("Require Charging"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset password"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "security": MessageLookupByLibrary.simpleMessage("Security"),
        "selectDownloadDirectory":
            MessageLookupByLibrary.simpleMessage("Select download directory"),
        "selectSyncLocation":
            MessageLookupByLibrary.simpleMessage("Select Location"),
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "sendEmail": MessageLookupByLibrary.simpleMessage("Send Email"),
        "serverMaintenance": MessageLookupByLibrary.simpleMessage(
            "Server is currently undergoing maintenance. Please try again later."),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "share": MessageLookupByLibrary.simpleMessage("Share"),
        "shareEmailVerificationNeeded": MessageLookupByLibrary.simpleMessage(
            "Email needs to be verified, or have active subscription to share files."),
        "shareFile": MessageLookupByLibrary.simpleMessage("Share file"),
        "signOut": MessageLookupByLibrary.simpleMessage("Sign Out"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
        "storageUsage": MessageLookupByLibrary.simpleMessage("Storage Usage"),
        "subscribedThroughPlaystoreOrAppstore":
            MessageLookupByLibrary.simpleMessage(
                "Subscribed through Playstore or Appstore"),
        "syncEnabled": MessageLookupByLibrary.simpleMessage("Sync Enabled"),
        "syncNow": MessageLookupByLibrary.simpleMessage("Sync Now"),
        "syncSettings": MessageLookupByLibrary.simpleMessage("Sync Settings"),
        "syncing": MessageLookupByLibrary.simpleMessage("Syncing..."),
        "termsOfService":
            MessageLookupByLibrary.simpleMessage("Terms of Service"),
        "transfers": MessageLookupByLibrary.simpleMessage("Transfers"),
        "upgrade": MessageLookupByLibrary.simpleMessage("Upgrade"),
        "upgradeStorage":
            MessageLookupByLibrary.simpleMessage("Upgrade Storage"),
        "uploaded": MessageLookupByLibrary.simpleMessage("Uploaded"),
        "uploading": MessageLookupByLibrary.simpleMessage("Uploading..."),
        "viewAllowedEmailDomains":
            MessageLookupByLibrary.simpleMessage("View Allowed Email Domains"),
        "viewBackendOnGithub":
            MessageLookupByLibrary.simpleMessage("View backend on Github"),
        "viewOnGithub": MessageLookupByLibrary.simpleMessage("View on Github"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome Back!"),
        "willSendALinkToYourEmailToCompleteThe":
            MessageLookupByLibrary.simpleMessage(
                "Will send a link to your email to complete the change"),
        "willSendALinkToYourEmailToResetYour":
            MessageLookupByLibrary.simpleMessage(
                "Will send a link to your email to reset your password"),
        "yourAccountHasBeenDeleted": MessageLookupByLibrary.simpleMessage(
            "Your account has been deleted.")
      };
}
