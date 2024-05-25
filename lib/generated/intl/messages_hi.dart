// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hi locale. All the
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
  String get localeName => 'hi';

  static String m0(foldername) =>
      "क्या आप इस फ़ोल्डर को हटाना चाहते हैं? ${foldername}";

  static String m1(filename) => "${filename} डाउनलोड हो रहा है";

  static String m2(err) => "त्रुटि: ${err}";

  static String m3(filename) => "त्रुटि फ़ाइल खोलते समय: ${filename}";

  static String m4(filename) => "फ़ाइल ${filename} ऑफ़लाइन उपलब्ध नहीं है";

  static String m5(path) => "ऑफ़लाइन फ़ाइलें ${path} पर संग्रहित हैं";

  static String m6(filename) => "फ़ाइल खोल रहा है: ${filename}";

  static String m7(length) => "पासवर्ड ${length} अक्षरों का होना चाहिए";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("खाता"),
        "accountDeleted":
            MessageLookupByLibrary.simpleMessage("खाता हटा दिया गया है"),
        "allowMeteredConnections":
            MessageLookupByLibrary.simpleMessage("मीटरड कनेक्शन की अनुमति दें"),
        "allowedEmails": MessageLookupByLibrary.simpleMessage("अनुमत ईमेल"),
        "appName": MessageLookupByLibrary.simpleMessage("ब्लेज्ड क्लाउड"),
        "areYouSureYouWantToDeleteThisFile":
            MessageLookupByLibrary.simpleMessage(
                "क्या आप इस फ़ाइल को हटाना चाहते हैं?"),
        "areYouSureYouWantToDeleteYourAccountThis":
            MessageLookupByLibrary.simpleMessage(
                "क्या आप वाकई अपने खाता को हटाना चाहते हैं? यह अनपुनरावृत्ती है। कृपया ध्यान दें, आपको अगर है तो आपको अपनी सदस्यता को प्ले स्टोर से मैन्युअली रद्द करना होगा।"),
        "areYouSureYouWantToSignOut": MessageLookupByLibrary.simpleMessage(
            "क्या आप सचमुच साइन आउट करना चाहते हैं?"),
        "authenticationRequired":
            MessageLookupByLibrary.simpleMessage("प्रमाणीकरण आवश्यक है"),
        "autoDeleteAcount":
            MessageLookupByLibrary.simpleMessage("स्वतः हटाएं खाता"),
        "blazedExplorer":
            MessageLookupByLibrary.simpleMessage("ब्लेज्ड एक्सप्लोरर"),
        "camSyncDesc": MessageLookupByLibrary.simpleMessage(
            "अपनी डिवाइस पर फोटो और वीडियो सहेजने वाले आपके कैमरा ऐप के फ़ोल्डर का चयन करें। फ़ाइलों को अनुक्रमणिक ढंग से खोजता नहीं है। लगभग हर 6 घंटे में सिंक्रनाइज़ करता है।"),
        "cameraRollSync":
            MessageLookupByLibrary.simpleMessage("कैमरा रोल सिंक्रनाइज़ेशन"),
        "cameraSync": MessageLookupByLibrary.simpleMessage("कैमरा सिंक"),
        "cancel": MessageLookupByLibrary.simpleMessage("रद्द करें"),
        "changeDownloadLocation":
            MessageLookupByLibrary.simpleMessage("डाउनलोड स्थान बदलें"),
        "changeEmail": MessageLookupByLibrary.simpleMessage("ईमेल बदलें"),
        "changePassword": MessageLookupByLibrary.simpleMessage("पासवर्ड बदलें"),
        "changeSyncPath": MessageLookupByLibrary.simpleMessage("पथ बदलें"),
        "close": MessageLookupByLibrary.simpleMessage("बंद करें"),
        "confirmFolderDelete": m0,
        "create": MessageLookupByLibrary.simpleMessage("बनाएं"),
        "createAnAccount": MessageLookupByLibrary.simpleMessage("खाता बनाएं"),
        "createFolder": MessageLookupByLibrary.simpleMessage("फ़ोल्डर बनाएं"),
        "currentlyNestedFoldersAreNotSupported":
            MessageLookupByLibrary.simpleMessage(
                "वर्तमान में नेस्टेड फ़ोल्डर समर्थित नहीं हैं।"),
        "delete": MessageLookupByLibrary.simpleMessage("हटाएं"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("खाता हटाएं"),
        "deleteFile": MessageLookupByLibrary.simpleMessage("फ़ाइल हटाएं"),
        "deleteFolder": MessageLookupByLibrary.simpleMessage("फ़ोल्डर हटाएं"),
        "deleteYourAccountAfter90DaysOfInactivityUsersWith":
            MessageLookupByLibrary.simpleMessage(
                "निष्क्रियता के बाद 90 दिनों में अपने खाता को हटाएं। हमेशा ऐक्टिव सब्सक्रिप्शन वाले उपयोगकर्ताओं के लिए हमेशा अनदेखा किया जाता है।"),
        "downloaded": MessageLookupByLibrary.simpleMessage("डाउनलोड हो गया"),
        "downloading":
            MessageLookupByLibrary.simpleMessage("डाउनलोड हो रहा है..."),
        "downloadingGetfilenamefilekey": m1,
        "email": MessageLookupByLibrary.simpleMessage("ईमेल"),
        "emailDomainNotAllowed":
            MessageLookupByLibrary.simpleMessage("ईमेल डोमेन अनुमत नहीं है"),
        "emailSent": MessageLookupByLibrary.simpleMessage("ईमेल भेजा गया"),
        "emptyDirectory":
            MessageLookupByLibrary.simpleMessage("कोई फ़ाइल या फ़ोल्डर नहीं"),
        "errorErr": m2,
        "errorOpeningFileE": m3,
        "errorSendingPasswordResetEmail": MessageLookupByLibrary.simpleMessage(
            "पासवर्ड रीसेट ईमेल भेजने में त्रुटि"),
        "errorSendingRequest":
            MessageLookupByLibrary.simpleMessage("अनुरोध भेजने में त्रुटि"),
        "errorUpdatingUserPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
            "उपयोगकर्ता को अपडेट करने में त्रुटि. कृपया पुनः प्रयास करें।"),
        "failedLogingInAfterSignup": MessageLookupByLibrary.simpleMessage(
            "साइन अप के बाद लॉगिन में असफल"),
        "failedToDeleteAccount":
            MessageLookupByLibrary.simpleMessage("खाता हटाने में असफल"),
        "failedToOpenPleaseTrySavingTheFileFirst":
            MessageLookupByLibrary.simpleMessage(
                "खोलने में असफल हुआ। कृपया पहले फ़ाइल को सहेजने का प्रयास करें"),
        "failedToOpenPortal":
            MessageLookupByLibrary.simpleMessage("पोर्टल खोलने में विफल"),
        "fileGetfilenamefilekeyIsNotAvailableOffline": m4,
        "files": MessageLookupByLibrary.simpleMessage("फ़ाइलें"),
        "folderName": MessageLookupByLibrary.simpleMessage("फ़ोल्डर का नाम"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("पासवर्ड भूल गए?"),
        "general": MessageLookupByLibrary.simpleMessage("सामान्य"),
        "howLongToShare": MessageLookupByLibrary.simpleMessage(
            "फ़ाइल को साझा करने के लिए कितनी देर तक उपलब्ध रखा जाना चाहिए?"),
        "invalidEmailOrPassword":
            MessageLookupByLibrary.simpleMessage("अमान्य ईमेल या पासवर्ड"),
        "linkCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "लिंक क्लिपबोर्ड पर कॉपी किया गया है"),
        "login": MessageLookupByLibrary.simpleMessage("लॉगिन"),
        "manageAccount":
            MessageLookupByLibrary.simpleMessage("खाता प्रबंधित करें"),
        "noTransfers": MessageLookupByLibrary.simpleMessage("No transfers"),
        "notVerified":
            MessageLookupByLibrary.simpleMessage("ईमेल सत्यापित नहीं है"),
        "offlineFilesAreStoredAtSnapshotdata": m5,
        "ok": MessageLookupByLibrary.simpleMessage("ठीक है"),
        "open": MessageLookupByLibrary.simpleMessage("खोलें"),
        "openingFileGetfilenamefilekey": m6,
        "openingInBrowser": MessageLookupByLibrary.simpleMessage(
            "ब्राउज़र में खोला जा रहा है..."),
        "password": MessageLookupByLibrary.simpleMessage("पासवर्ड"),
        "passwordMustBePasswordminlengthCharactersLong": m7,
        "passwordResetEmailSent": MessageLookupByLibrary.simpleMessage(
            "पासवर्ड रीसेट ईमेल भेजा गया है!"),
        "periodicallyBackingUpSelectedFolder":
            MessageLookupByLibrary.simpleMessage(
                "चयनित फ़ोल्डर का नियमित रूप से बैकअप लेना"),
        "pickFolder": MessageLookupByLibrary.simpleMessage("फ़ोल्डर चुनें"),
        "pleaseAuthenticateToAccessYourCloud":
            MessageLookupByLibrary.simpleMessage(
                "कृपया अपने क्लाउड तक पहुँचने के लिए प्रमाणीकृत करें"),
        "pleaseSelectADirectoryWhereYouWouldLikeToDownload":
            MessageLookupByLibrary.simpleMessage(
                "कृपया चुनें एक डायरेक्टरी जहां आप अगले स्क्रीन में अपनी फ़ाइलें डाउनलोड करना चाहेंगे।"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("गोपनीयता नीति"),
        "purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion":
            MessageLookupByLibrary.simpleMessage(
                "प्ले स्टोर बिल्ड का उपयोग करके 1TB खरीदें। आप उस संस्करण को स्थानांतरित कर सकते हैं जब काम हो जाए।"),
        "requestSent": MessageLookupByLibrary.simpleMessage("अनुरोध भेजा गया!"),
        "requireBiometricsToOpenApp": MessageLookupByLibrary.simpleMessage(
            "ऐप खोलने के लिए बायोमेट्रिक्स की आवश्यकता है"),
        "requireCharging":
            MessageLookupByLibrary.simpleMessage("चार्जिंग आवश्यक है"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("पासवर्ड रीसेट"),
        "save": MessageLookupByLibrary.simpleMessage("सहेजें"),
        "security": MessageLookupByLibrary.simpleMessage("सुरक्षा"),
        "selectDownloadDirectory": MessageLookupByLibrary.simpleMessage(
            "डाउनलोड निर्दिष्ट करें डायरेक्टरी"),
        "selectSyncLocation":
            MessageLookupByLibrary.simpleMessage("स्थान चुनें"),
        "send": MessageLookupByLibrary.simpleMessage("भेजें"),
        "sendEmail": MessageLookupByLibrary.simpleMessage("ईमेल भेजें"),
        "serverMaintenance": MessageLookupByLibrary.simpleMessage(
            "सर्वर वर्तमान में मेनटेनेंस के तहत है। कृपया बाद में पुनः प्रयास करें।"),
        "settings": MessageLookupByLibrary.simpleMessage("सेटिंग्स"),
        "share": MessageLookupByLibrary.simpleMessage("साझा करें"),
        "shareEmailVerificationNeeded": MessageLookupByLibrary.simpleMessage(
            "फ़ाइलें साझा करने के लिए ईमेल को सत्यापित किया जाना चाहिए, या सक्रिय सब्सक्रिप्शन होना चाहिए।"),
        "shareFile": MessageLookupByLibrary.simpleMessage("फ़ाइल साझा करें"),
        "signOut": MessageLookupByLibrary.simpleMessage("साइन आउट"),
        "signUp": MessageLookupByLibrary.simpleMessage("साइन अप करें"),
        "storageUsage": MessageLookupByLibrary.simpleMessage("स्टोरेज उपयोग"),
        "subscribedThroughPlaystoreOrAppstore":
            MessageLookupByLibrary.simpleMessage(
                "प्लेस्टोर या एप्पस्टोर के माध्यम से सदस्यता ली गई"),
        "syncEnabled": MessageLookupByLibrary.simpleMessage("सिंक सक्षम है"),
        "syncNow": MessageLookupByLibrary.simpleMessage("अब सिंक्रनाइज़ करें"),
        "syncSettings": MessageLookupByLibrary.simpleMessage("सिंक सेटिंग्स"),
        "syncing": MessageLookupByLibrary.simpleMessage(
            "सिंक्रनाइज़ किया जा रहा है..."),
        "termsOfService":
            MessageLookupByLibrary.simpleMessage("सेवा की शर्तें"),
        "transfers": MessageLookupByLibrary.simpleMessage("ट्रांसफर्स"),
        "upgradeStorage":
            MessageLookupByLibrary.simpleMessage("भंडारण अपग्रेड करें"),
        "upgradeStorage1Terabyte": MessageLookupByLibrary.simpleMessage(
            "स्टोरेज अपग्रेड (1 टेराबाइट)"),
        "uploaded": MessageLookupByLibrary.simpleMessage("अपलोड हो गया"),
        "uploading": MessageLookupByLibrary.simpleMessage("अपलोड हो रहा है..."),
        "viewAllowedEmailDomains":
            MessageLookupByLibrary.simpleMessage("अनुमत ईमेल डोमेन देखें"),
        "viewBackendOnGithub":
            MessageLookupByLibrary.simpleMessage("जितह पर देखें"),
        "viewOnGithub": MessageLookupByLibrary.simpleMessage("जितह पर देखें"),
        "welcomeBack":
            MessageLookupByLibrary.simpleMessage("फिर से स्वागत है!"),
        "willSendALinkToYourEmailToCompleteThe":
            MessageLookupByLibrary.simpleMessage(
                "आपके ईमेल पर एक लिंक भेजा जाएगा ताकि आप परिवर्तन को पूरा कर सकें"),
        "willSendALinkToYourEmailToResetYour": MessageLookupByLibrary.simpleMessage(
            "आपके ईमेल पर एक लिंक भेजा जाएगा ताकि आप अपना पासवर्ड रीसेट कर सकें"),
        "yourAccountHasBeenDeleted":
            MessageLookupByLibrary.simpleMessage("आपका खाता हटा दिया गया है।")
      };
}
