// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Server is currently undergoing maintenance. Please try again later.`
  String get serverMaintenance {
    return Intl.message(
      'Server is currently undergoing maintenance. Please try again later.',
      name: 'serverMaintenance',
      desc: '',
      args: [],
    );
  }

  /// `Blazed Cloud`
  String get appName {
    return Intl.message(
      'Blazed Cloud',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `No files or folders`
  String get emptyDirectory {
    return Intl.message(
      'No files or folders',
      name: 'emptyDirectory',
      desc: '',
      args: [],
    );
  }

  /// `Error: {err}`
  String errorErr(Object err) {
    return Intl.message(
      'Error: $err',
      name: 'errorErr',
      desc: '',
      args: [err],
    );
  }

  /// `Invalid email or password`
  String get invalidEmailOrPassword {
    return Intl.message(
      'Invalid email or password',
      name: 'invalidEmailOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Password reset email sent!`
  String get passwordResetEmailSent {
    return Intl.message(
      'Password reset email sent!',
      name: 'passwordResetEmailSent',
      desc: '',
      args: [],
    );
  }

  /// `Error sending password reset email`
  String get errorSendingPasswordResetEmail {
    return Intl.message(
      'Error sending password reset email',
      name: 'errorSendingPasswordResetEmail',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Transfers`
  String get transfers {
    return Intl.message(
      'Transfers',
      name: 'transfers',
      desc: '',
      args: [],
    );
  }

  /// `Files`
  String get files {
    return Intl.message(
      'Files',
      name: 'files',
      desc: '',
      args: [],
    );
  }

  /// `Email Domain not allowed`
  String get emailDomainNotAllowed {
    return Intl.message(
      'Email Domain not allowed',
      name: 'emailDomainNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Password must be {length} characters long`
  String passwordMustBePasswordminlengthCharactersLong(Object length) {
    return Intl.message(
      'Password must be $length characters long',
      name: 'passwordMustBePasswordminlengthCharactersLong',
      desc: '',
      args: [length],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Failed loging in after signup`
  String get failedLogingInAfterSignup {
    return Intl.message(
      'Failed loging in after signup',
      name: 'failedLogingInAfterSignup',
      desc: '',
      args: [],
    );
  }

  /// `Error sending request`
  String get errorSendingRequest {
    return Intl.message(
      'Error sending request',
      name: 'errorSendingRequest',
      desc: '',
      args: [],
    );
  }

  /// `Request Sent!`
  String get requestSent {
    return Intl.message(
      'Request Sent!',
      name: 'requestSent',
      desc: '',
      args: [],
    );
  }

  /// `Error updating user. Please try again.`
  String get errorUpdatingUserPleaseTryAgain {
    return Intl.message(
      'Error updating user. Please try again.',
      name: 'errorUpdatingUserPleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Delete file`
  String get deleteFile {
    return Intl.message(
      'Delete file',
      name: 'deleteFile',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this file?`
  String get areYouSureYouWantToDeleteThisFile {
    return Intl.message(
      'Are you sure you want to delete this file?',
      name: 'areYouSureYouWantToDeleteThisFile',
      desc: '',
      args: [],
    );
  }

  /// `Downloading {filename}`
  String downloadingGetfilenamefilekey(Object filename) {
    return Intl.message(
      'Downloading $filename',
      name: 'downloadingGetfilenamefilekey',
      desc: '',
      args: [filename],
    );
  }

  /// `Opening file: {filename}`
  String openingFileGetfilenamefilekey(Object filename) {
    return Intl.message(
      'Opening file: $filename',
      name: 'openingFileGetfilenamefilekey',
      desc: '',
      args: [filename],
    );
  }

  /// `Error opening file: {filename}`
  String errorOpeningFileE(Object filename) {
    return Intl.message(
      'Error opening file: $filename',
      name: 'errorOpeningFileE',
      desc: '',
      args: [filename],
    );
  }

  /// `Opening in browser...`
  String get openingInBrowser {
    return Intl.message(
      'Opening in browser...',
      name: 'openingInBrowser',
      desc: '',
      args: [],
    );
  }

  /// `Failed to open. Please try saving the file first`
  String get failedToOpenPleaseTrySavingTheFileFirst {
    return Intl.message(
      'Failed to open. Please try saving the file first',
      name: 'failedToOpenPleaseTrySavingTheFileFirst',
      desc: '',
      args: [],
    );
  }

  /// `File {filename} is not available offline`
  String fileGetfilenamefilekeyIsNotAvailableOffline(Object filename) {
    return Intl.message(
      'File $filename is not available offline',
      name: 'fileGetfilenamefilekeyIsNotAvailableOffline',
      desc: '',
      args: [filename],
    );
  }

  /// `Share file`
  String get shareFile {
    return Intl.message(
      'Share file',
      name: 'shareFile',
      desc: '',
      args: [],
    );
  }

  /// `Link copied to clipboard`
  String get linkCopiedToClipboard {
    return Intl.message(
      'Link copied to clipboard',
      name: 'linkCopiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Blazed Explorer`
  String get blazedExplorer {
    return Intl.message(
      'Blazed Explorer',
      name: 'blazedExplorer',
      desc: '',
      args: [],
    );
  }

  /// `Create folder`
  String get createFolder {
    return Intl.message(
      'Create folder',
      name: 'createFolder',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Delete folder`
  String get deleteFolder {
    return Intl.message(
      'Delete folder',
      name: 'deleteFolder',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this Folder? {foldername}`
  String confirmFolderDelete(Object foldername) {
    return Intl.message(
      'Are you sure you want to delete this Folder? $foldername',
      name: 'confirmFolderDelete',
      desc: '',
      args: [foldername],
    );
  }

  /// `Authentication Required`
  String get authenticationRequired {
    return Intl.message(
      'Authentication Required',
      name: 'authenticationRequired',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account? This is irreversible. Please note, you will need to cancel your subscription through the play store manually (if you have one)`
  String get areYouSureYouWantToDeleteYourAccountThis {
    return Intl.message(
      'Are you sure you want to delete your account? This is irreversible. Please note, you will need to cancel your subscription through the play store manually (if you have one)',
      name: 'areYouSureYouWantToDeleteYourAccountThis',
      desc: '',
      args: [],
    );
  }

  /// `Delete account`
  String get deleteAccount {
    return Intl.message(
      'Delete account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Account deleted`
  String get accountDeleted {
    return Intl.message(
      'Account deleted',
      name: 'accountDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been deleted.`
  String get yourAccountHasBeenDeleted {
    return Intl.message(
      'Your account has been deleted.',
      name: 'yourAccountHasBeenDeleted',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Failed to delete account`
  String get failedToDeleteAccount {
    return Intl.message(
      'Failed to delete account',
      name: 'failedToDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Change Download Location`
  String get changeDownloadLocation {
    return Intl.message(
      'Change Download Location',
      name: 'changeDownloadLocation',
      desc: '',
      args: [],
    );
  }

  /// `Change Email`
  String get changeEmail {
    return Intl.message(
      'Change Email',
      name: 'changeEmail',
      desc: '',
      args: [],
    );
  }

  /// `Will send a link to your email to complete the change`
  String get willSendALinkToYourEmailToCompleteThe {
    return Intl.message(
      'Will send a link to your email to complete the change',
      name: 'willSendALinkToYourEmailToCompleteThe',
      desc: '',
      args: [],
    );
  }

  /// `View backend on Github`
  String get viewBackendOnGithub {
    return Intl.message(
      'View backend on Github',
      name: 'viewBackendOnGithub',
      desc: '',
      args: [],
    );
  }

  /// `View on Github`
  String get viewOnGithub {
    return Intl.message(
      'View on Github',
      name: 'viewOnGithub',
      desc: '',
      args: [],
    );
  }

  /// `Auto Delete Acount`
  String get autoDeleteAcount {
    return Intl.message(
      'Auto Delete Acount',
      name: 'autoDeleteAcount',
      desc: '',
      args: [],
    );
  }

  /// `Delete your account after 90 days of inactivity. Always ignored for users with active subscriptions.`
  String get deleteYourAccountAfter90DaysOfInactivityUsersWith {
    return Intl.message(
      'Delete your account after 90 days of inactivity. Always ignored for users with active subscriptions.',
      name: 'deleteYourAccountAfter90DaysOfInactivityUsersWith',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to sign out?`
  String get areYouSureYouWantToSignOut {
    return Intl.message(
      'Are you sure you want to sign out?',
      name: 'areYouSureYouWantToSignOut',
      desc: '',
      args: [],
    );
  }

  /// `Require biometrics to open app`
  String get requireBiometricsToOpenApp {
    return Intl.message(
      'Require biometrics to open app',
      name: 'requireBiometricsToOpenApp',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Will send a link to your email to reset your password`
  String get willSendALinkToYourEmailToResetYour {
    return Intl.message(
      'Will send a link to your email to reset your password',
      name: 'willSendALinkToYourEmailToResetYour',
      desc: '',
      args: [],
    );
  }

  /// `Downloading...`
  String get downloading {
    return Intl.message(
      'Downloading...',
      name: 'downloading',
      desc: '',
      args: [],
    );
  }

  /// `Downloaded`
  String get downloaded {
    return Intl.message(
      'Downloaded',
      name: 'downloaded',
      desc: '',
      args: [],
    );
  }

  /// `Select download directory`
  String get selectDownloadDirectory {
    return Intl.message(
      'Select download directory',
      name: 'selectDownloadDirectory',
      desc: '',
      args: [],
    );
  }

  /// `Please select a directory where you would like to download your files in the next screen.`
  String get pleaseSelectADirectoryWhereYouWouldLikeToDownload {
    return Intl.message(
      'Please select a directory where you would like to download your files in the next screen.',
      name: 'pleaseSelectADirectoryWhereYouWouldLikeToDownload',
      desc: '',
      args: [],
    );
  }

  /// `Pick Folder`
  String get pickFolder {
    return Intl.message(
      'Pick Folder',
      name: 'pickFolder',
      desc: '',
      args: [],
    );
  }

  /// `Offline files are stored at {path}`
  String offlineFilesAreStoredAtSnapshotdata(Object path) {
    return Intl.message(
      'Offline files are stored at $path',
      name: 'offlineFilesAreStoredAtSnapshotdata',
      desc: '',
      args: [path],
    );
  }

  /// `Uploading...`
  String get uploading {
    return Intl.message(
      'Uploading...',
      name: 'uploading',
      desc: '',
      args: [],
    );
  }

  /// `Uploaded`
  String get uploaded {
    return Intl.message(
      'Uploaded',
      name: 'uploaded',
      desc: '',
      args: [],
    );
  }

  /// `Purchase 1TB using Playstore build. You can uninstall that version when done.`
  String get purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion {
    return Intl.message(
      'Purchase 1TB using Playstore build. You can uninstall that version when done.',
      name: 'purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion',
      desc: '',
      args: [],
    );
  }

  /// `Folder name`
  String get folderName {
    return Intl.message(
      'Folder name',
      name: 'folderName',
      desc: '',
      args: [],
    );
  }

  /// `Storage Usage`
  String get storageUsage {
    return Intl.message(
      'Storage Usage',
      name: 'storageUsage',
      desc: '',
      args: [],
    );
  }

  /// `How long should the file be available for sharing?`
  String get howLongToShare {
    return Intl.message(
      'How long should the file be available for sharing?',
      name: 'howLongToShare',
      desc: '',
      args: [],
    );
  }

  /// `Create an Account`
  String get createAnAccount {
    return Intl.message(
      'Create an Account',
      name: 'createAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Allowed Emails`
  String get allowedEmails {
    return Intl.message(
      'Allowed Emails',
      name: 'allowedEmails',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `View Allowed Email Domains`
  String get viewAllowedEmailDomains {
    return Intl.message(
      'View Allowed Email Domains',
      name: 'viewAllowedEmailDomains',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade Storage`
  String get upgradeStorage {
    return Intl.message(
      'Upgrade Storage',
      name: 'upgradeStorage',
      desc: '',
      args: [],
    );
  }

  /// `Failed to open portal`
  String get failedToOpenPortal {
    return Intl.message(
      'Failed to open portal',
      name: 'failedToOpenPortal',
      desc: '',
      args: [],
    );
  }

  /// `Manage Account`
  String get manageAccount {
    return Intl.message(
      'Manage Account',
      name: 'manageAccount',
      desc: '',
      args: [],
    );
  }

  /// `Subscribed through Playstore or Appstore`
  String get subscribedThroughPlaystoreOrAppstore {
    return Intl.message(
      'Subscribed through Playstore or Appstore',
      name: 'subscribedThroughPlaystoreOrAppstore',
      desc: '',
      args: [],
    );
  }

  /// `Email needs to be verified, or have active subscription to share files.`
  String get shareEmailVerificationNeeded {
    return Intl.message(
      'Email needs to be verified, or have active subscription to share files.',
      name: 'shareEmailVerificationNeeded',
      desc: '',
      args: [],
    );
  }

  /// `Email not verified`
  String get notVerified {
    return Intl.message(
      'Email not verified',
      name: 'notVerified',
      desc: '',
      args: [],
    );
  }

  /// `Email sent`
  String get emailSent {
    return Intl.message(
      'Email sent',
      name: 'emailSent',
      desc: '',
      args: [],
    );
  }

  /// `Send Email`
  String get sendEmail {
    return Intl.message(
      'Send Email',
      name: 'sendEmail',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uk'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
