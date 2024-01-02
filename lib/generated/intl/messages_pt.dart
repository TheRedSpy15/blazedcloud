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

  static String m2(filename) =>
      "Arquivo ${filename} não está disponível offline";

  static String m3(path) => "Os arquivos offline são armazenados em ${path}";

  static String m4(filename) => "Abrindo arquivo: ${filename}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountDeleted":
            MessageLookupByLibrary.simpleMessage("Conta excluída"),
        "appName": MessageLookupByLibrary.simpleMessage("Blazed Cloud"),
        "areYouSureYouWantToDeleteThisFile":
            MessageLookupByLibrary.simpleMessage(
                "Tem certeza de que deseja excluir este arquivo?"),
        "areYouSureYouWantToDeleteYourAccountThis":
            MessageLookupByLibrary.simpleMessage(
                "Tem certeza de que deseja excluir sua conta? Isso é irreversível.\\n\\nPor favor, observe que você precisará cancelar sua assinatura manualmente através da loja de aplicativos (se tiver uma)"),
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
        "changeEmail": MessageLookupByLibrary.simpleMessage("Alterar email"),
        "changePassword": MessageLookupByLibrary.simpleMessage("Alterar senha"),
        "confirmFolderDelete": m0,
        "create": MessageLookupByLibrary.simpleMessage("Criar"),
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
        "emptyDirectory":
            MessageLookupByLibrary.simpleMessage("Nenhum arquivo ou pasta"),
        "errorErr": MessageLookupByLibrary.simpleMessage("Erro: \$err"),
        "errorOpeningFileE":
            MessageLookupByLibrary.simpleMessage("Erro ao abrir arquivo: \$e"),
        "errorSendingPasswordResetEmail": MessageLookupByLibrary.simpleMessage(
            "Erro ao enviar email de redefinição de senha"),
        "errorSendingRequest":
            MessageLookupByLibrary.simpleMessage("Erro ao enviar solicitação"),
        "errorUpdatingUserPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
            "Erro ao atualizar usuário. Por favor, tente novamente."),
        "failedLogingInAfterSignup": MessageLookupByLibrary.simpleMessage(
            "Falha ao entrar após o cadastro"),
        "failedToDeleteAccount":
            MessageLookupByLibrary.simpleMessage("Falha ao excluir conta"),
        "failedToOpenPleaseTrySavingTheFileFirst":
            MessageLookupByLibrary.simpleMessage(
                "Falha ao abrir. Por favor, tente salvar o arquivo primeiro"),
        "fileGetfilenamefilekeyIsNotAvailableOffline": m2,
        "files": MessageLookupByLibrary.simpleMessage("Arquivos"),
        "folderName": MessageLookupByLibrary.simpleMessage("Nome da pasta"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Esqueceu a senha?"),
        "invalidEmailOrPassword":
            MessageLookupByLibrary.simpleMessage("Email ou senha inválidos"),
        "linkCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Link copiado para a área de transferência"),
        "login": MessageLookupByLibrary.simpleMessage("Entrar"),
        "offlineFilesAreStoredAtSnapshotdata": m3,
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "open": MessageLookupByLibrary.simpleMessage("Abrir"),
        "openingFileGetfilenamefilekey": m4,
        "openingInBrowser":
            MessageLookupByLibrary.simpleMessage("Abrindo no navegador..."),
        "password": MessageLookupByLibrary.simpleMessage("Senha"),
        "passwordMustBePasswordminlengthCharactersLong":
            MessageLookupByLibrary.simpleMessage(
                "A senha deve ter pelo menos \$passwordMinLength caracteres"),
        "passwordResetEmailSent": MessageLookupByLibrary.simpleMessage(
            "Email de redefinição de senha enviado!"),
        "pickFolder": MessageLookupByLibrary.simpleMessage("Escolher pasta"),
        "pleaseSelectADirectoryWhereYouWouldLikeToDownload":
            MessageLookupByLibrary.simpleMessage(
                "Por favor, selecione um diretório onde você gostaria de baixar seus arquivos na próxima tela."),
        "purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion":
            MessageLookupByLibrary.simpleMessage(
                "Compre 1TB usando a versão da Play Store. Você pode desinstalar essa versão quando terminar."),
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
        "serverMaintenance": MessageLookupByLibrary.simpleMessage(
            "O servidor está passando por manutenção. Por favor, tente novamente mais tarde."),
        "settings": MessageLookupByLibrary.simpleMessage("Configurações"),
        "share": MessageLookupByLibrary.simpleMessage("Compartilhar"),
        "shareFile":
            MessageLookupByLibrary.simpleMessage("Compartilhar arquivo"),
        "signOut": MessageLookupByLibrary.simpleMessage("Sair"),
        "signUp": MessageLookupByLibrary.simpleMessage("Cadastre-se"),
        "storageUsage":
            MessageLookupByLibrary.simpleMessage("Uso do armazenamento"),
        "transfers": MessageLookupByLibrary.simpleMessage("Transferências"),
        "uploaded": MessageLookupByLibrary.simpleMessage("Enviado"),
        "uploading": MessageLookupByLibrary.simpleMessage("Enviando..."),
        "viewBackendOnGithub":
            MessageLookupByLibrary.simpleMessage("Ver backend no Github"),
        "viewOnGithub": MessageLookupByLibrary.simpleMessage("Ver no Github"),
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
