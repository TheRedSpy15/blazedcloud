// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
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
  String get localeName => 'zh';

  static String m0(foldername) => "您确定要删除此文件夹吗？\\n\\n\\u2022 ${foldername}";

  static String m1(filename) => "正在下载 ${filename}";

  static String m2(filename) => "文件 ${filename} 在离线状态下不可用";

  static String m3(path) => "离线文件存储在 ${path}";

  static String m4(filename) => "打开文件：${filename}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountDeleted": MessageLookupByLibrary.simpleMessage("账户已删除"),
        "appName": MessageLookupByLibrary.simpleMessage("云烟云"),
        "areYouSureYouWantToDeleteThisFile":
            MessageLookupByLibrary.simpleMessage("您确定要删除此文件吗？"),
        "areYouSureYouWantToDeleteYourAccountThis":
            MessageLookupByLibrary.simpleMessage(
                "您确定要删除您的账户吗？这是不可逆的。\\n\\n请注意，您需要手动通过Play商店取消订阅（如果有的话）"),
        "areYouSureYouWantToSignOut":
            MessageLookupByLibrary.simpleMessage("您确定要注销吗？"),
        "authenticationRequired":
            MessageLookupByLibrary.simpleMessage("需要身份验证"),
        "autoDeleteAcount": MessageLookupByLibrary.simpleMessage("自动删除账户"),
        "blazedExplorer": MessageLookupByLibrary.simpleMessage("云烟资源管理器"),
        "cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "changeDownloadLocation":
            MessageLookupByLibrary.simpleMessage("更改下载位置"),
        "changeEmail": MessageLookupByLibrary.simpleMessage("更改电子邮件"),
        "changePassword": MessageLookupByLibrary.simpleMessage("更改密码"),
        "confirmFolderDelete": m0,
        "create": MessageLookupByLibrary.simpleMessage("创建"),
        "createFolder": MessageLookupByLibrary.simpleMessage("创建文件夹"),
        "delete": MessageLookupByLibrary.simpleMessage("删除"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("删除账户"),
        "deleteFile": MessageLookupByLibrary.simpleMessage("删除文件"),
        "deleteFolder": MessageLookupByLibrary.simpleMessage("删除文件夹"),
        "deleteYourAccountAfter90DaysOfInactivityUsersWith":
            MessageLookupByLibrary.simpleMessage(
                "在90天不活动后删除您的账户。始终忽略具有活跃订阅的用户。"),
        "downloaded": MessageLookupByLibrary.simpleMessage("已下载"),
        "downloading": MessageLookupByLibrary.simpleMessage("正在下载..."),
        "downloadingGetfilenamefilekey": m1,
        "email": MessageLookupByLibrary.simpleMessage("电子邮件"),
        "emailDomainNotAllowed":
            MessageLookupByLibrary.simpleMessage("不允许使用的电子邮件域"),
        "emptyDirectory": MessageLookupByLibrary.simpleMessage("没有文件或文件夹"),
        "errorErr": MessageLookupByLibrary.simpleMessage("错误：\$err"),
        "errorOpeningFileE":
            MessageLookupByLibrary.simpleMessage("打开文件时出错：\$e"),
        "errorSendingPasswordResetEmail":
            MessageLookupByLibrary.simpleMessage("发送密码重置电子邮件时出错"),
        "errorSendingRequest": MessageLookupByLibrary.simpleMessage("发送请求时出错"),
        "errorUpdatingUserPleaseTryAgain":
            MessageLookupByLibrary.simpleMessage("更新用户时出错。请重试。"),
        "failedLogingInAfterSignup":
            MessageLookupByLibrary.simpleMessage("注册后登录失败"),
        "failedToDeleteAccount": MessageLookupByLibrary.simpleMessage("删除账户失败"),
        "failedToOpenPleaseTrySavingTheFileFirst":
            MessageLookupByLibrary.simpleMessage("无法打开。请先尝试保存文件"),
        "fileGetfilenamefilekeyIsNotAvailableOffline": m2,
        "files": MessageLookupByLibrary.simpleMessage("文件"),
        "folderName": MessageLookupByLibrary.simpleMessage("文件夹名称"),
        "forgotPassword": MessageLookupByLibrary.simpleMessage("忘记密码？"),
        "invalidEmailOrPassword":
            MessageLookupByLibrary.simpleMessage("无效的电子邮件或密码"),
        "linkCopiedToClipboard":
            MessageLookupByLibrary.simpleMessage("链接已复制到剪贴板"),
        "login": MessageLookupByLibrary.simpleMessage("登录"),
        "offlineFilesAreStoredAtSnapshotdata": m3,
        "ok": MessageLookupByLibrary.simpleMessage("确定"),
        "open": MessageLookupByLibrary.simpleMessage("打开"),
        "openingFileGetfilenamefilekey": m4,
        "openingInBrowser": MessageLookupByLibrary.simpleMessage("在浏览器中打开..."),
        "password": MessageLookupByLibrary.simpleMessage("密码"),
        "passwordMustBePasswordminlengthCharactersLong":
            MessageLookupByLibrary.simpleMessage(
                "密码必须至少包含\$passwordMinLength个字符"),
        "passwordResetEmailSent":
            MessageLookupByLibrary.simpleMessage("密码重置电子邮件已发送！"),
        "pickFolder": MessageLookupByLibrary.simpleMessage("选择文件夹"),
        "pleaseSelectADirectoryWhereYouWouldLikeToDownload":
            MessageLookupByLibrary.simpleMessage("请在下一屏幕中选择您想要下载文件的目录。"),
        "purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion":
            MessageLookupByLibrary.simpleMessage(
                "使用Play商店版本购买1TB。完成后，您可以卸载该版本。"),
        "requestSent": MessageLookupByLibrary.simpleMessage("请求已发送！"),
        "requireBiometricsToOpenApp":
            MessageLookupByLibrary.simpleMessage("要求使用生物识别打开应用"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("重置密码"),
        "save": MessageLookupByLibrary.simpleMessage("保存"),
        "selectDownloadDirectory":
            MessageLookupByLibrary.simpleMessage("选择下载目录"),
        "send": MessageLookupByLibrary.simpleMessage("发送"),
        "serverMaintenance":
            MessageLookupByLibrary.simpleMessage("服务器当前正在维护中。请稍后再试。"),
        "settings": MessageLookupByLibrary.simpleMessage("设置"),
        "share": MessageLookupByLibrary.simpleMessage("分享"),
        "shareFile": MessageLookupByLibrary.simpleMessage("分享文件"),
        "signOut": MessageLookupByLibrary.simpleMessage("注销"),
        "signUp": MessageLookupByLibrary.simpleMessage("注册"),
        "storageUsage": MessageLookupByLibrary.simpleMessage("存储使用"),
        "transfers": MessageLookupByLibrary.simpleMessage("传输"),
        "uploaded": MessageLookupByLibrary.simpleMessage("已上传"),
        "uploading": MessageLookupByLibrary.simpleMessage("正在上传..."),
        "viewBackendOnGithub":
            MessageLookupByLibrary.simpleMessage("在Github上查看后端"),
        "viewOnGithub": MessageLookupByLibrary.simpleMessage("在Github上查看"),
        "willSendALinkToYourEmailToCompleteThe":
            MessageLookupByLibrary.simpleMessage("将通过电子邮件发送链接以完成更改"),
        "willSendALinkToYourEmailToResetYour":
            MessageLookupByLibrary.simpleMessage("将通过电子邮件发送链接以重置您的密码"),
        "yourAccountHasBeenDeleted":
            MessageLookupByLibrary.simpleMessage("您的账户已被删除。")
      };
}
