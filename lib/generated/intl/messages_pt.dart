// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
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
  String get localeName => 'pt';

  static String m0(foldername) =>
      "Tem certeza de que deseja excluir esta pasta? ${foldername}";

  static String m1(filename) => "Baixando ${filename}";

  static String m2(err) => "Erro: ${err}";

  static String m3(filename) => "Erro ao abrir arquivo: ${filename}";

  static String m4(filename) =>
      "Arquivo ${filename} não está disponível offline";

  static String m5(path) => "Os arquivos offline são armazenados em ${path}";

  static String m6(filename) => "Abrindo arquivo: ${filename}";

  static String m7(length) => "A senha deve ter ${length} caracteres";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountDeleted":
            MessageLookupByLibrary.simpleMessage("Conta excluída"),
        "allowedEmails":
            MessageLookupByLibrary.simpleMessage("Emails Permitidos"),
        "appName": MessageLookupByLibrary.simpleMessage("Blazed Cloud"),
        "areYouSureYouWantToDeleteThisFile":
            MessageLookupByLibrary.simpleMessage(
                "Tem certeza de que deseja excluir este arquivo?"),
        "areYouSureYouWantToDeleteYourAccountThis":
            MessageLookupByLibrary.simpleMessage(
                "Tem certeza de que deseja excluir sua conta? Isso é irreversível. Por favor, observe que você precisará cancelar sua assinatura manualmente pela loja de aplicativos (se tiver uma)"),
        "areYouSureYouWantToSignOut": MessageLookupByLibrary.simpleMessage(
            "Tem certeza de que deseja sair?"),
        "authenticationRequired":
            MessageLookupByLibrary.simpleMessage("Autenticação necessária"),
        "autoDeleteAcount": MessageLookupByLibrary.simpleMessage(
            "Excluir conta automaticamente"),
        "blazedExplorer":
            MessageLookupByLibrary.simpleMessage("Blazed Explorer"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "changeDownloadLocation":
            MessageLookupByLibrary.simpleMessage("Alterar local de download"),
        "changeEmail": MessageLookupByLibrary.simpleMessage("Alterar Email"),
        "changePassword": MessageLookupByLibrary.simpleMessage("Alterar senha"),
        "close": MessageLookupByLibrary.simpleMessage("Fechar"),
        "confirmFolderDelete": m0,
        "create": MessageLookupByLibrary.simpleMessage("Criar"),
        "createAnAccount":
            MessageLookupByLibrary.simpleMessage("Criar uma Conta"),
        "createFolder": MessageLookupByLibrary.simpleMessage("Criar pasta"),
        "delete": MessageLookupByLibrary.simpleMessage("Excluir"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("Excluir conta"),
        "deleteFile": MessageLookupByLibrary.simpleMessage("Excluir arquivo"),
        "deleteFolder": MessageLookupByLibrary.simpleMessage("Excluir pasta"),
        "deleteYourAccountAfter90DaysOfInactivityUsersWith":
            MessageLookupByLibrary.simpleMessage(
                "Excluir sua conta após 90 dias de inatividade. Sempre ignorado para usuários com assinaturas ativas."),
        "downloaded": MessageLookupByLibrary.simpleMessage("Baixado"),
        "downloading": MessageLookupByLibrary.simpleMessage("Baixando..."),
        "downloadingGetfilenamefilekey": m1,
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailDomainNotAllowed": MessageLookupByLibrary.simpleMessage(
            "Domínio de email não permitido"),
        "emailSent": MessageLookupByLibrary.simpleMessage("E-mail enviado"),
        "emptyDirectory":
            MessageLookupByLibrary.simpleMessage("Nenhum arquivo ou pasta"),
        "errorErr": m2,
        "errorOpeningFileE": m3,
        "errorSendingPasswordResetEmail": MessageLookupByLibrary.simpleMessage(
            "Erro ao enviar email de redefinição de senha"),
        "errorSendingRequest":
            MessageLookupByLibrary.simpleMessage("Erro ao enviar solicitação"),
        "errorUpdatingUserPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
            "Erro ao atualizar usuário. Por favor, tente novamente."),
        "failedLogingInAfterSignup": MessageLookupByLibrary.simpleMessage(
            "Falha no login após o cadastro"),
        "failedToDeleteAccount":
            MessageLookupByLibrary.simpleMessage("Falha ao excluir conta"),
        "failedToOpenPleaseTrySavingTheFileFirst":
            MessageLookupByLibrary.simpleMessage(
                "Falha ao abrir. Por favor, tente salvar o arquivo primeiro"),
        "failedToOpenPortal":
            MessageLookupByLibrary.simpleMessage("Falha ao abrir o portal"),
        "fileGetfilenamefilekeyIsNotAvailableOffline": m4,
        "files": MessageLookupByLibrary.simpleMessage("Arquivos"),
        "folderName": MessageLookupByLibrary.simpleMessage("Nome da pasta"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Esqueceu a senha?"),
        "howLongToShare": MessageLookupByLibrary.simpleMessage(
            "Por quanto tempo o arquivo deve ficar disponível para compartilhamento?"),
        "invalidEmailOrPassword":
            MessageLookupByLibrary.simpleMessage("Email ou senha inválidos"),
        "linkCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Link copiado para a área de transferência"),
        "login": MessageLookupByLibrary.simpleMessage("Entrar"),
        "manageAccount":
            MessageLookupByLibrary.simpleMessage("Gerenciar Conta"),
        "notVerified":
            MessageLookupByLibrary.simpleMessage("E-mail não verificado"),
        "offlineFilesAreStoredAtSnapshotdata": m5,
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "open": MessageLookupByLibrary.simpleMessage("Abrir"),
        "openingFileGetfilenamefilekey": m6,
        "openingInBrowser":
            MessageLookupByLibrary.simpleMessage("Abrindo no navegador..."),
        "password": MessageLookupByLibrary.simpleMessage("Senha"),
        "passwordMustBePasswordminlengthCharactersLong": m7,
        "passwordResetEmailSent": MessageLookupByLibrary.simpleMessage(
            "Email de redefinição de senha enviado!"),
        "pickFolder": MessageLookupByLibrary.simpleMessage("Escolher Pasta"),
        "pleaseSelectADirectoryWhereYouWouldLikeToDownload":
            MessageLookupByLibrary.simpleMessage(
                "Por favor, selecione um diretório onde deseja baixar seus arquivos na próxima tela."),
        "privacyPolicy":
            MessageLookupByLibrary.simpleMessage("Política de Privacidade"),
        "purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion":
            MessageLookupByLibrary.simpleMessage(
                "Compre 1TB usando a versão da Playstore. Você pode desinstalar essa versão quando terminar."),
        "requestSent":
            MessageLookupByLibrary.simpleMessage("Solicitação enviada!"),
        "requireBiometricsToOpenApp": MessageLookupByLibrary.simpleMessage(
            "Exigir biometria para abrir o aplicativo"),
        "resetPassword":
            MessageLookupByLibrary.simpleMessage("Redefinir senha"),
        "save": MessageLookupByLibrary.simpleMessage("Salvar"),
        "selectDownloadDirectory": MessageLookupByLibrary.simpleMessage(
            "Selecionar diretório de download"),
        "send": MessageLookupByLibrary.simpleMessage("Enviar"),
        "sendEmail": MessageLookupByLibrary.simpleMessage("Enviar E-mail"),
        "serverMaintenance": MessageLookupByLibrary.simpleMessage(
            "O servidor está passando por manutenção. Por favor, tente novamente mais tarde."),
        "settings": MessageLookupByLibrary.simpleMessage("Configurações"),
        "share": MessageLookupByLibrary.simpleMessage("Compartilhar"),
        "shareEmailVerificationNeeded": MessageLookupByLibrary.simpleMessage(
            "E-mail precisa ser verificado, ou ter uma assinatura ativa para compartilhar arquivos."),
        "shareFile":
            MessageLookupByLibrary.simpleMessage("Compartilhar arquivo"),
        "signOut": MessageLookupByLibrary.simpleMessage("Sair"),
        "signUp": MessageLookupByLibrary.simpleMessage("Cadastrar"),
        "storageUsage":
            MessageLookupByLibrary.simpleMessage("Uso de armazenamento"),
        "subscribedThroughPlaystoreOrAppstore":
            MessageLookupByLibrary.simpleMessage(
                "Inscrito através da Play Store ou App Store"),
        "termsOfService":
            MessageLookupByLibrary.simpleMessage("Termos de Serviço"),
        "transfers": MessageLookupByLibrary.simpleMessage("Transferências"),
        "upgradeStorage":
            MessageLookupByLibrary.simpleMessage("Atualizar Armazenamento"),
        "upgradeStorage1Terabyte":
            MessageLookupByLibrary.simpleMessage("Compre 1 Terabyte"),
        "uploaded": MessageLookupByLibrary.simpleMessage("Enviado"),
        "uploading": MessageLookupByLibrary.simpleMessage("Enviando..."),
        "viewAllowedEmailDomains": MessageLookupByLibrary.simpleMessage(
            "Ver Domínios de Email Permitidos"),
        "viewBackendOnGithub": MessageLookupByLibrary.simpleMessage(
            "Visualizar backend no Github"),
        "viewOnGithub":
            MessageLookupByLibrary.simpleMessage("Visualizar no Github"),
        "welcomeBack":
            MessageLookupByLibrary.simpleMessage("Bem-Vindo de Volta!"),
        "willSendALinkToYourEmailToCompleteThe":
            MessageLookupByLibrary.simpleMessage(
                "Enviaremos um link para o seu email para concluir a alteração"),
        "willSendALinkToYourEmailToResetYour":
            MessageLookupByLibrary.simpleMessage(
                "Enviaremos um link para o seu email para redefinir sua senha"),
        "yourAccountHasBeenDeleted":
            MessageLookupByLibrary.simpleMessage("Sua conta foi excluída.")
      };
}
