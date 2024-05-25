// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
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
  String get localeName => 'ja';

  static String m0(foldername) => "このフォルダを削除してもよろしいですか？ ${foldername}";

  static String m1(filename) => "${filename} のダウンロード中";

  static String m2(err) => "エラー：${err}";

  static String m3(filename) => "ファイルのオープンエラー：${filename}";

  static String m4(filename) => "ファイル ${filename} はオフラインで利用できません";

  static String m5(path) => "オフラインファイルは${path}に保存されています";

  static String m6(filename) => "ファイルを開いています：${filename}";

  static String m7(length) => "パスワードは${length}文字以上である必要があります";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("アカウント"),
        "accountDeleted": MessageLookupByLibrary.simpleMessage("アカウントが削除されました"),
        "allowMeteredConnections":
            MessageLookupByLibrary.simpleMessage("従量課金接続を許可する"),
        "allowedEmails": MessageLookupByLibrary.simpleMessage("許可されたメール"),
        "appName": MessageLookupByLibrary.simpleMessage("Blazed Cloud"),
        "areYouSureYouWantToDeleteThisFile":
            MessageLookupByLibrary.simpleMessage("このファイルを削除してもよろしいですか？"),
        "areYouSureYouWantToDeleteYourAccountThis":
            MessageLookupByLibrary.simpleMessage(
                "本当にアカウントを削除しますか？ これは取り消せません。注意：プレイストア経由でのサブスクリプションは手動でキャンセルする必要があります（存在する場合）"),
        "areYouSureYouWantToSignOut":
            MessageLookupByLibrary.simpleMessage("本当にサインアウトしますか？"),
        "authenticationRequired":
            MessageLookupByLibrary.simpleMessage("認証が必要です"),
        "autoDeleteAcount": MessageLookupByLibrary.simpleMessage("アカウントの自動削除"),
        "blazedExplorer":
            MessageLookupByLibrary.simpleMessage("Blazed Explorer"),
        "camSyncDesc": MessageLookupByLibrary.simpleMessage(
            "写真や動画を保存するデバイス上のフォルダーを選択します。ファイルを再帰的に検索しません。約6時間ごとに同期します。"),
        "cameraRollSync": MessageLookupByLibrary.simpleMessage("カメラロール同期"),
        "cameraSync": MessageLookupByLibrary.simpleMessage("カメラ同期"),
        "cancel": MessageLookupByLibrary.simpleMessage("キャンセル"),
        "changeDownloadLocation":
            MessageLookupByLibrary.simpleMessage("ダウンロード場所の変更"),
        "changeEmail": MessageLookupByLibrary.simpleMessage("メールアドレスの変更"),
        "changePassword": MessageLookupByLibrary.simpleMessage("パスワードの変更"),
        "changeSyncPath": MessageLookupByLibrary.simpleMessage("パスを変更"),
        "close": MessageLookupByLibrary.simpleMessage("閉じる"),
        "confirmFolderDelete": m0,
        "create": MessageLookupByLibrary.simpleMessage("作成"),
        "createAnAccount": MessageLookupByLibrary.simpleMessage("アカウントを作成"),
        "createFolder": MessageLookupByLibrary.simpleMessage("フォルダを作成"),
        "currentlyNestedFoldersAreNotSupported":
            MessageLookupByLibrary.simpleMessage("現在、入れ子のフォルダはサポートされていません。"),
        "delete": MessageLookupByLibrary.simpleMessage("削除"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("アカウントの削除"),
        "deleteFile": MessageLookupByLibrary.simpleMessage("ファイルの削除"),
        "deleteFolder": MessageLookupByLibrary.simpleMessage("フォルダを削除"),
        "deleteYourAccountAfter90DaysOfInactivityUsersWith":
            MessageLookupByLibrary.simpleMessage(
                "90日間の非アクティブ状態後にアカウントを削除します。アクティブなサブスクリプションがあるユーザーには常に無視されます。"),
        "downloaded": MessageLookupByLibrary.simpleMessage("ダウンロード済み"),
        "downloading": MessageLookupByLibrary.simpleMessage("ダウンロード中..."),
        "downloadingGetfilenamefilekey": m1,
        "email": MessageLookupByLibrary.simpleMessage("メールアドレス"),
        "emailDomainNotAllowed":
            MessageLookupByLibrary.simpleMessage("許可されていないメールドメイン"),
        "emailSent": MessageLookupByLibrary.simpleMessage("メール送信済み"),
        "emptyDirectory":
            MessageLookupByLibrary.simpleMessage("ファイルやフォルダはありません"),
        "errorErr": m2,
        "errorOpeningFileE": m3,
        "errorSendingPasswordResetEmail":
            MessageLookupByLibrary.simpleMessage("パスワードリセットメールの送信中にエラーが発生しました"),
        "errorSendingRequest":
            MessageLookupByLibrary.simpleMessage("リクエストの送信中にエラーが発生しました"),
        "errorUpdatingUserPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
            "ユーザーの更新中にエラーが発生しました。もう一度お試しください。"),
        "failedLogingInAfterSignup":
            MessageLookupByLibrary.simpleMessage("サインアップ後のログインに失敗しました"),
        "failedToDeleteAccount":
            MessageLookupByLibrary.simpleMessage("アカウントの削除に失敗しました"),
        "failedToOpenPleaseTrySavingTheFileFirst":
            MessageLookupByLibrary.simpleMessage(
                "開くのに失敗しました。最初にファイルを保存してみてください。"),
        "failedToOpenPortal":
            MessageLookupByLibrary.simpleMessage("ポータルを開けませんでした"),
        "fileGetfilenamefilekeyIsNotAvailableOffline": m4,
        "files": MessageLookupByLibrary.simpleMessage("ファイル"),
        "folderName": MessageLookupByLibrary.simpleMessage("フォルダ名"),
        "forgotPassword": MessageLookupByLibrary.simpleMessage("パスワードを忘れましたか？"),
        "general": MessageLookupByLibrary.simpleMessage("一般"),
        "howLongToShare":
            MessageLookupByLibrary.simpleMessage("ファイルの共有期間はどれくらいでしょうか？"),
        "invalidEmailOrPassword":
            MessageLookupByLibrary.simpleMessage("無効なメールアドレスまたはパスワード"),
        "linkCopiedToClipboard":
            MessageLookupByLibrary.simpleMessage("リンクがクリップボードにコピーされました"),
        "login": MessageLookupByLibrary.simpleMessage("ログイン"),
        "manageAccount": MessageLookupByLibrary.simpleMessage("アカウントの管理"),
        "noTransfers": MessageLookupByLibrary.simpleMessage("No transfers"),
        "notVerified": MessageLookupByLibrary.simpleMessage("メールが確認されていません"),
        "offlineFilesAreStoredAtSnapshotdata": m5,
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "open": MessageLookupByLibrary.simpleMessage("開く"),
        "openingFileGetfilenamefilekey": m6,
        "openingInBrowser":
            MessageLookupByLibrary.simpleMessage("ブラウザで開いています..."),
        "password": MessageLookupByLibrary.simpleMessage("パスワード"),
        "passwordMustBePasswordminlengthCharactersLong": m7,
        "passwordResetEmailSent":
            MessageLookupByLibrary.simpleMessage("パスワードリセットのメールが送信されました！"),
        "periodicallyBackingUpSelectedFolder":
            MessageLookupByLibrary.simpleMessage("選択したフォルダーを定期的にバックアップしています"),
        "pickFolder": MessageLookupByLibrary.simpleMessage("フォルダを選択"),
        "pleaseAuthenticateToAccessYourCloud":
            MessageLookupByLibrary.simpleMessage("クラウドにアクセスするには認証してください"),
        "pleaseSelectADirectoryWhereYouWouldLikeToDownload":
            MessageLookupByLibrary.simpleMessage(
                "次の画面でファイルをダウンロードするディレクトリを選択してください。"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("プライバシーポリシー"),
        "purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion":
            MessageLookupByLibrary.simpleMessage(
                "Playstoreビルドを使用して1TBを購入します。終了時にそのバージョンをアンインストールできます。"),
        "requestSent": MessageLookupByLibrary.simpleMessage("リクエストが送信されました！"),
        "requireBiometricsToOpenApp":
            MessageLookupByLibrary.simpleMessage("アプリを開くために生体認証が必要です"),
        "requireCharging": MessageLookupByLibrary.simpleMessage("充電が必要です"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("パスワードをリセット"),
        "save": MessageLookupByLibrary.simpleMessage("保存"),
        "security": MessageLookupByLibrary.simpleMessage("セキュリティ"),
        "selectDownloadDirectory":
            MessageLookupByLibrary.simpleMessage("ダウンロードディレクトリを選択"),
        "selectSyncLocation": MessageLookupByLibrary.simpleMessage("場所を選択"),
        "send": MessageLookupByLibrary.simpleMessage("送信"),
        "sendEmail": MessageLookupByLibrary.simpleMessage("メール送信"),
        "serverMaintenance": MessageLookupByLibrary.simpleMessage(
            "サーバーは現在メンテナンス中です。後でもう一度お試しください。"),
        "settings": MessageLookupByLibrary.simpleMessage("設定"),
        "share": MessageLookupByLibrary.simpleMessage("共有"),
        "shareEmailVerificationNeeded": MessageLookupByLibrary.simpleMessage(
            "ファイルを共有するには、メールを確認するかアクティブなサブスクリプションが必要です。"),
        "shareFile": MessageLookupByLibrary.simpleMessage("ファイルを共有"),
        "signOut": MessageLookupByLibrary.simpleMessage("サインアウト"),
        "signUp": MessageLookupByLibrary.simpleMessage("サインアップ"),
        "storageUsage": MessageLookupByLibrary.simpleMessage("ストレージ使用量"),
        "subscribedThroughPlaystoreOrAppstore":
            MessageLookupByLibrary.simpleMessage("PlaystoreまたはAppstore経由で購読済み"),
        "syncEnabled": MessageLookupByLibrary.simpleMessage("同期が有効"),
        "syncNow": MessageLookupByLibrary.simpleMessage("今すぐ同期"),
        "syncSettings": MessageLookupByLibrary.simpleMessage("同期設定"),
        "syncing": MessageLookupByLibrary.simpleMessage("同期中..."),
        "termsOfService": MessageLookupByLibrary.simpleMessage("利用規約"),
        "transfers": MessageLookupByLibrary.simpleMessage("転送"),
        "upgradeStorage": MessageLookupByLibrary.simpleMessage("ストレージのアップグレード"),
        "uploaded": MessageLookupByLibrary.simpleMessage("アップロード済み"),
        "uploading": MessageLookupByLibrary.simpleMessage("アップロード中..."),
        "viewAllowedEmailDomains":
            MessageLookupByLibrary.simpleMessage("許可されたメールドメインを表示"),
        "viewBackendOnGithub":
            MessageLookupByLibrary.simpleMessage("バックエンドをGithubで表示"),
        "viewOnGithub": MessageLookupByLibrary.simpleMessage("Githubで表示"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("おかえりなさい！"),
        "willSendALinkToYourEmailToCompleteThe":
            MessageLookupByLibrary.simpleMessage("変更を完了するためのリンクをメールで送信します"),
        "willSendALinkToYourEmailToResetYour":
            MessageLookupByLibrary.simpleMessage(
                "パスワードをリセットするためのリンクをメールで送信します"),
        "yourAccountHasBeenDeleted":
            MessageLookupByLibrary.simpleMessage("アカウントが削除されました。")
      };
}
