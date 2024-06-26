// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
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
  String get localeName => 'ko';

  static String m0(foldername) => "이 폴더를 삭제하시겠습니까? ${foldername}";

  static String m1(filename) => "${filename} 다운로드 중";

  static String m2(err) => "오류: ${err}";

  static String m3(filename) => "파일 열기 오류: ${filename}";

  static String m4(filename) => "${filename} 파일은 오프라인에서 사용할 수 없습니다";

  static String m5(path) => "오프라인 파일은 ${path}에 저장됩니다";

  static String m6(filename) => "${filename} 파일 열기 중";

  static String m7(length) => "비밀번호는 ${length}자 이상이어야 합니다";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("계정"),
        "accountDeleted": MessageLookupByLibrary.simpleMessage("계정이 삭제되었습니다"),
        "allowMeteredConnections":
            MessageLookupByLibrary.simpleMessage("계량 연결 허용"),
        "allowedEmails": MessageLookupByLibrary.simpleMessage("허용된 이메일"),
        "appName": MessageLookupByLibrary.simpleMessage("Blazed Cloud"),
        "areYouSureYouWantToDeleteThisFile":
            MessageLookupByLibrary.simpleMessage("이 파일을 삭제하시겠습니까?"),
        "areYouSureYouWantToDeleteYourAccountThis":
            MessageLookupByLibrary.simpleMessage(
                "계정을 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다. 참고로, 구독이 있는 경우 Play 스토어에서 수동으로 취소해야 합니다."),
        "areYouSureYouWantToSignOut":
            MessageLookupByLibrary.simpleMessage("로그아웃하시겠습니까?"),
        "authenticationRequired": MessageLookupByLibrary.simpleMessage("인증 필요"),
        "autoDeleteAcount": MessageLookupByLibrary.simpleMessage("자동 계정 삭제"),
        "blazedExplorer":
            MessageLookupByLibrary.simpleMessage("Blazed Explorer"),
        "camSyncDesc": MessageLookupByLibrary.simpleMessage(
            "카메라 앱이 사진과 비디오를 저장하는 기기의 폴더를 선택합니다. 파일을 재귀적으로 검색하지 않습니다. 대략 6시간마다 동기화됩니다."),
        "cameraRollSync": MessageLookupByLibrary.simpleMessage("카메라 롤 동기화"),
        "cameraSync": MessageLookupByLibrary.simpleMessage("카메라 동기화"),
        "cancel": MessageLookupByLibrary.simpleMessage("취소"),
        "changeDownloadLocation":
            MessageLookupByLibrary.simpleMessage("다운로드 위치 변경"),
        "changeEmail": MessageLookupByLibrary.simpleMessage("이메일 변경"),
        "changePassword": MessageLookupByLibrary.simpleMessage("비밀번호 변경"),
        "changeSyncPath": MessageLookupByLibrary.simpleMessage("경로 변경"),
        "close": MessageLookupByLibrary.simpleMessage("닫기"),
        "confirmFolderDelete": m0,
        "create": MessageLookupByLibrary.simpleMessage("생성"),
        "createAnAccount": MessageLookupByLibrary.simpleMessage("계정 만들기"),
        "createFolder": MessageLookupByLibrary.simpleMessage("폴더 생성"),
        "currentlyNestedFoldersAreNotSupported":
            MessageLookupByLibrary.simpleMessage("현재 중첩된 폴더는 지원되지 않습니다."),
        "delete": MessageLookupByLibrary.simpleMessage("삭제"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("계정 삭제"),
        "deleteFile": MessageLookupByLibrary.simpleMessage("파일 삭제"),
        "deleteFolder": MessageLookupByLibrary.simpleMessage("폴더 삭제"),
        "deleteYourAccountAfter90DaysOfInactivityUsersWith":
            MessageLookupByLibrary.simpleMessage(
                "90일 동안 활동이 없으면 계정을 삭제합니다. 활성 구독이 있는 사용자는 항상 무시됩니다."),
        "downloaded": MessageLookupByLibrary.simpleMessage("다운로드 완료"),
        "downloading": MessageLookupByLibrary.simpleMessage("다운로드 중..."),
        "downloadingGetfilenamefilekey": m1,
        "email": MessageLookupByLibrary.simpleMessage("이메일"),
        "emailDomainNotAllowed":
            MessageLookupByLibrary.simpleMessage("허용되지 않는 이메일 도메인"),
        "emailSent": MessageLookupByLibrary.simpleMessage("이메일 전송됨"),
        "emptyDirectory":
            MessageLookupByLibrary.simpleMessage("파일 또는 폴더가 없습니다"),
        "errorErr": m2,
        "errorOpeningFileE": m3,
        "errorSendingPasswordResetEmail": MessageLookupByLibrary.simpleMessage(
            "비밀번호 재설정 이메일 전송 중 오류가 발생했습니다"),
        "errorSendingRequest":
            MessageLookupByLibrary.simpleMessage("요청을 전송하는 중 오류가 발생했습니다"),
        "errorUpdatingUserPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
            "사용자 업데이트 중 오류가 발생했습니다. 다시 시도해주세요."),
        "failedLogingInAfterSignup":
            MessageLookupByLibrary.simpleMessage("가입 후 로그인에 실패했습니다"),
        "failedToDeleteAccount":
            MessageLookupByLibrary.simpleMessage("계정 삭제 실패"),
        "failedToOpenPleaseTrySavingTheFileFirst":
            MessageLookupByLibrary.simpleMessage("열지 못했습니다. 먼저 파일을 저장해보세요"),
        "failedToOpenPortal": MessageLookupByLibrary.simpleMessage("포털 열기 실패"),
        "fileGetfilenamefilekeyIsNotAvailableOffline": m4,
        "files": MessageLookupByLibrary.simpleMessage("파일"),
        "folderName": MessageLookupByLibrary.simpleMessage("폴더 이름"),
        "forgotPassword": MessageLookupByLibrary.simpleMessage("비밀번호를 잊으셨나요?"),
        "general": MessageLookupByLibrary.simpleMessage("일반"),
        "howLongToShare":
            MessageLookupByLibrary.simpleMessage("파일을 공유할 기간은 얼마나 되어야 합니까?"),
        "invalidEmailOrPassword":
            MessageLookupByLibrary.simpleMessage("잘못된 이메일 또는 비밀번호"),
        "linkCopiedToClipboard":
            MessageLookupByLibrary.simpleMessage("링크가 클립보드에 복사되었습니다"),
        "login": MessageLookupByLibrary.simpleMessage("로그인"),
        "manageAccount": MessageLookupByLibrary.simpleMessage("계정 관리"),
        "noTransfers": MessageLookupByLibrary.simpleMessage("No transfers"),
        "notVerified": MessageLookupByLibrary.simpleMessage("이메일 확인되지 않음"),
        "offlineFilesAreStoredAtSnapshotdata": m5,
        "ok": MessageLookupByLibrary.simpleMessage("확인"),
        "open": MessageLookupByLibrary.simpleMessage("열기"),
        "openingFileGetfilenamefilekey": m6,
        "openingInBrowser":
            MessageLookupByLibrary.simpleMessage("브라우저에서 열기..."),
        "password": MessageLookupByLibrary.simpleMessage("비밀번호"),
        "passwordMustBePasswordminlengthCharactersLong": m7,
        "passwordResetEmailSent":
            MessageLookupByLibrary.simpleMessage("비밀번호 재설정 이메일이 전송되었습니다!"),
        "periodicallyBackingUpSelectedFolder":
            MessageLookupByLibrary.simpleMessage("선택한 폴더 주기적으로 백업"),
        "pickFolder": MessageLookupByLibrary.simpleMessage("폴더 선택"),
        "pleaseAuthenticateToAccessYourCloud":
            MessageLookupByLibrary.simpleMessage("클라우드에 액세스하려면 인증하세요"),
        "pleaseSelectADirectoryWhereYouWouldLikeToDownload":
            MessageLookupByLibrary.simpleMessage(
                "다음 화면에서 파일을 다운로드할 디렉토리를 선택하세요."),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("개인정보 보호 정책"),
        "purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion":
            MessageLookupByLibrary.simpleMessage(
                "Play 스토어 빌드를 사용하여 1TB를 구매하세요. 완료되면 해당 버전을 삭제할 수 있습니다."),
        "requestSent": MessageLookupByLibrary.simpleMessage("요청이 전송되었습니다!"),
        "requireBiometricsToOpenApp":
            MessageLookupByLibrary.simpleMessage("앱을 열 때 생체 인식이 필요합니다"),
        "requireCharging": MessageLookupByLibrary.simpleMessage("충전 필요"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("비밀번호 재설정"),
        "save": MessageLookupByLibrary.simpleMessage("저장"),
        "security": MessageLookupByLibrary.simpleMessage("보안"),
        "selectDownloadDirectory":
            MessageLookupByLibrary.simpleMessage("다운로드 디렉토리 선택"),
        "selectSyncLocation": MessageLookupByLibrary.simpleMessage("위치 선택"),
        "send": MessageLookupByLibrary.simpleMessage("보내기"),
        "sendEmail": MessageLookupByLibrary.simpleMessage("이메일 보내기"),
        "serverMaintenance": MessageLookupByLibrary.simpleMessage(
            "서버가 현재 유지 보수 중입니다. 나중에 다시 시도해주세요."),
        "settings": MessageLookupByLibrary.simpleMessage("설정"),
        "share": MessageLookupByLibrary.simpleMessage("공유"),
        "shareEmailVerificationNeeded": MessageLookupByLibrary.simpleMessage(
            "파일을 공유하려면 이메일을 확인하거나 활성 구독이 필요합니다."),
        "shareFile": MessageLookupByLibrary.simpleMessage("파일 공유"),
        "signOut": MessageLookupByLibrary.simpleMessage("로그아웃"),
        "signUp": MessageLookupByLibrary.simpleMessage("가입"),
        "storageUsage": MessageLookupByLibrary.simpleMessage("저장 공간 사용량"),
        "subscribedThroughPlaystoreOrAppstore":
            MessageLookupByLibrary.simpleMessage(
                "Playstore 또는 Appstore를 통해 구독 중"),
        "syncEnabled": MessageLookupByLibrary.simpleMessage("동기화 활성화"),
        "syncNow": MessageLookupByLibrary.simpleMessage("지금 동기화"),
        "syncSettings": MessageLookupByLibrary.simpleMessage("동기화 설정"),
        "syncing": MessageLookupByLibrary.simpleMessage("동기화 중..."),
        "termsOfService": MessageLookupByLibrary.simpleMessage("서비스 이용 약관"),
        "transfers": MessageLookupByLibrary.simpleMessage("전송"),
        "upgradeStorage": MessageLookupByLibrary.simpleMessage("스토리지 업그레이드"),
        "uploaded": MessageLookupByLibrary.simpleMessage("업로드 완료"),
        "uploading": MessageLookupByLibrary.simpleMessage("업로드 중..."),
        "viewAllowedEmailDomains":
            MessageLookupByLibrary.simpleMessage("허용된 이메일 도메인 보기"),
        "viewBackendOnGithub":
            MessageLookupByLibrary.simpleMessage("Github에서 백엔드 보기"),
        "viewOnGithub": MessageLookupByLibrary.simpleMessage("Github에서 보기"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("다시 환영합니다!"),
        "willSendALinkToYourEmailToCompleteThe":
            MessageLookupByLibrary.simpleMessage("변경을 완료하려면 이메일로 링크를 보내드립니다"),
        "willSendALinkToYourEmailToResetYour":
            MessageLookupByLibrary.simpleMessage(
                "비밀번호를 재설정하려면 이메일로 링크를 보내드립니다"),
        "yourAccountHasBeenDeleted":
            MessageLookupByLibrary.simpleMessage("귀하의 계정이 삭제되었습니다.")
      };
}
