// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(foldername) =>
      "¿Estás seguro de que quieres eliminar esta carpeta? ${foldername}";

  static String m1(filename) => "Descargando ${filename}";

  static String m2(err) => "Error: ${err}";

  static String m3(filename) => "Error al abrir el archivo: ${filename}";

  static String m4(filename) =>
      "El archivo ${filename} no está disponible sin conexión";

  static String m5(path) => "Los archivos sin conexión se almacenan en ${path}";

  static String m6(filename) => "Abriendo archivo: ${filename}";

  static String m7(length) =>
      "La contraseña debe tener ${length} caracteres de longitud";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Cuenta"),
        "accountDeleted":
            MessageLookupByLibrary.simpleMessage("Cuenta eliminada"),
        "allowMeteredConnections": MessageLookupByLibrary.simpleMessage(
            "Permitir conexiones con tarifa"),
        "allowedEmails": MessageLookupByLibrary.simpleMessage(
            "Correos electrónicos permitidos"),
        "appName": MessageLookupByLibrary.simpleMessage("Blazed Cloud"),
        "areYouSureYouWantToDeleteThisFile":
            MessageLookupByLibrary.simpleMessage(
                "¿Estás seguro de que quieres eliminar este archivo?"),
        "areYouSureYouWantToDeleteYourAccountThis":
            MessageLookupByLibrary.simpleMessage(
                "¿Estás seguro de que quieres eliminar tu cuenta? Esto es irreversible. Ten en cuenta que deberás cancelar tu suscripción a través de la tienda de juegos manualmente (si tienes una)"),
        "areYouSureYouWantToSignOut": MessageLookupByLibrary.simpleMessage(
            "¿Estás seguro de que quieres cerrar sesión?"),
        "authenticationRequired":
            MessageLookupByLibrary.simpleMessage("Autenticación requerida"),
        "autoDeleteAcount": MessageLookupByLibrary.simpleMessage(
            "Eliminar cuenta automáticamente"),
        "blazedExplorer":
            MessageLookupByLibrary.simpleMessage("Blazed Explorer"),
        "camSyncDesc": MessageLookupByLibrary.simpleMessage(
            "Seleccione la carpeta en su dispositivo donde su aplicación de cámara guarda fotos y videos. No busca de forma recursiva archivos. Sincroniza aproximadamente cada 6 horas."),
        "cameraRollSync": MessageLookupByLibrary.simpleMessage(
            "Sincronización de rollo de cámara"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "changeDownloadLocation": MessageLookupByLibrary.simpleMessage(
            "Cambiar ubicación de descarga"),
        "changeEmail":
            MessageLookupByLibrary.simpleMessage("Cambiar correo electrónico"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Cambiar contraseña"),
        "changeSyncPath": MessageLookupByLibrary.simpleMessage("Cambiar ruta"),
        "close": MessageLookupByLibrary.simpleMessage("Cerrar"),
        "confirmFolderDelete": m0,
        "create": MessageLookupByLibrary.simpleMessage("Crear"),
        "createAnAccount":
            MessageLookupByLibrary.simpleMessage("Crear una cuenta"),
        "createFolder": MessageLookupByLibrary.simpleMessage("Crear carpeta"),
        "currentlyNestedFoldersAreNotSupported":
            MessageLookupByLibrary.simpleMessage(
                "Actualmente no se admiten carpetas anidadas."),
        "delete": MessageLookupByLibrary.simpleMessage("Eliminar"),
        "deleteAccount":
            MessageLookupByLibrary.simpleMessage("Eliminar cuenta"),
        "deleteFile": MessageLookupByLibrary.simpleMessage("Eliminar archivo"),
        "deleteFolder":
            MessageLookupByLibrary.simpleMessage("Eliminar carpeta"),
        "deleteYourAccountAfter90DaysOfInactivityUsersWith":
            MessageLookupByLibrary.simpleMessage(
                "Eliminar tu cuenta después de 90 días de inactividad. Siempre se ignora para usuarios con suscripciones activas."),
        "downloaded": MessageLookupByLibrary.simpleMessage("Descargado"),
        "downloading": MessageLookupByLibrary.simpleMessage("Descargando..."),
        "downloadingGetfilenamefilekey": m1,
        "email": MessageLookupByLibrary.simpleMessage("Correo electrónico"),
        "emailDomainNotAllowed": MessageLookupByLibrary.simpleMessage(
            "Dominio de correo electrónico no permitido"),
        "emailSent":
            MessageLookupByLibrary.simpleMessage("Correo electrónico enviado"),
        "emptyDirectory":
            MessageLookupByLibrary.simpleMessage("Sin archivos o carpetas"),
        "errorErr": m2,
        "errorOpeningFileE": m3,
        "errorSendingPasswordResetEmail": MessageLookupByLibrary.simpleMessage(
            "Error al enviar el correo electrónico de restablecimiento de contraseña"),
        "errorSendingRequest": MessageLookupByLibrary.simpleMessage(
            "Error al enviar la solicitud"),
        "errorUpdatingUserPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
            "Error al actualizar el usuario. Por favor, inténtalo de nuevo."),
        "failedLogingInAfterSignup": MessageLookupByLibrary.simpleMessage(
            "Fallo al iniciar sesión después del registro"),
        "failedToDeleteAccount":
            MessageLookupByLibrary.simpleMessage("Error al eliminar la cuenta"),
        "failedToOpenPleaseTrySavingTheFileFirst":
            MessageLookupByLibrary.simpleMessage(
                "Error al abrir. Por favor, intenta guardar el archivo primero"),
        "failedToOpenPortal":
            MessageLookupByLibrary.simpleMessage("Error al abrir el portal"),
        "fileGetfilenamefilekeyIsNotAvailableOffline": m4,
        "files": MessageLookupByLibrary.simpleMessage("Archivos"),
        "folderName":
            MessageLookupByLibrary.simpleMessage("Nombre de la carpeta"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("¿Olvidaste la contraseña?"),
        "general": MessageLookupByLibrary.simpleMessage("General"),
        "howLongToShare": MessageLookupByLibrary.simpleMessage(
            "¿Cuánto tiempo debería estar disponible el archivo para compartir?"),
        "invalidEmailOrPassword": MessageLookupByLibrary.simpleMessage(
            "Correo electrónico o contraseña inválidos"),
        "linkCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Enlace copiado al portapapeles"),
        "login": MessageLookupByLibrary.simpleMessage("Iniciar sesión"),
        "manageAccount":
            MessageLookupByLibrary.simpleMessage("Gestionar Cuenta"),
        "notVerified": MessageLookupByLibrary.simpleMessage(
            "Correo electrónico no verificado"),
        "offlineFilesAreStoredAtSnapshotdata": m5,
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "open": MessageLookupByLibrary.simpleMessage("Abrir"),
        "openingFileGetfilenamefilekey": m6,
        "openingInBrowser":
            MessageLookupByLibrary.simpleMessage("Abriendo en el navegador..."),
        "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
        "passwordMustBePasswordminlengthCharactersLong": m7,
        "passwordResetEmailSent": MessageLookupByLibrary.simpleMessage(
            "¡Correo electrónico de restablecimiento de contraseña enviado!"),
        "periodicallyBackingUpSelectedFolder": MessageLookupByLibrary.simpleMessage(
            "Haciendo copia de seguridad periódicamente de la carpeta seleccionada"),
        "pickFolder":
            MessageLookupByLibrary.simpleMessage("Seleccionar carpeta"),
        "pleaseAuthenticateToAccessYourCloud":
            MessageLookupByLibrary.simpleMessage(
                "Por favor, autentíquese para acceder a su nube"),
        "pleaseSelectADirectoryWhereYouWouldLikeToDownload":
            MessageLookupByLibrary.simpleMessage(
                "Por favor, selecciona un directorio donde te gustaría descargar tus archivos en la próxima pantalla."),
        "privacyPolicy":
            MessageLookupByLibrary.simpleMessage("Política de privacidad"),
        "purchase1tbUsingPlaystoreBuildYouCanUninstallThatVersion":
            MessageLookupByLibrary.simpleMessage(
                "Compra 1TB utilizando la versión de Playstore. Puedes desinstalar esa versión cuando hayas terminado."),
        "requestSent":
            MessageLookupByLibrary.simpleMessage("¡Solicitud enviada!"),
        "requireBiometricsToOpenApp": MessageLookupByLibrary.simpleMessage(
            "Requerir biometría para abrir la aplicación"),
        "requireCharging":
            MessageLookupByLibrary.simpleMessage("Requiere carga"),
        "resetPassword":
            MessageLookupByLibrary.simpleMessage("Restablecer contraseña"),
        "save": MessageLookupByLibrary.simpleMessage("Guardar"),
        "security": MessageLookupByLibrary.simpleMessage("Seguridad"),
        "selectDownloadDirectory": MessageLookupByLibrary.simpleMessage(
            "Seleccionar directorio de descarga"),
        "selectSyncLocation":
            MessageLookupByLibrary.simpleMessage("Seleccionar ubicación"),
        "send": MessageLookupByLibrary.simpleMessage("Enviar"),
        "sendEmail":
            MessageLookupByLibrary.simpleMessage("Enviar correo electrónico"),
        "serverMaintenance": MessageLookupByLibrary.simpleMessage(
            "El servidor está actualmente en mantenimiento. Por favor, inténtalo de nuevo más tarde."),
        "settings": MessageLookupByLibrary.simpleMessage("Configuraciones"),
        "share": MessageLookupByLibrary.simpleMessage("Compartir"),
        "shareEmailVerificationNeeded": MessageLookupByLibrary.simpleMessage(
            "Es necesario verificar el correo electrónico o tener una suscripción activa para compartir archivos."),
        "shareFile": MessageLookupByLibrary.simpleMessage("Compartir archivo"),
        "signOut": MessageLookupByLibrary.simpleMessage("Cerrar sesión"),
        "signUp": MessageLookupByLibrary.simpleMessage("Registrarse"),
        "storageUsage":
            MessageLookupByLibrary.simpleMessage("Uso de almacenamiento"),
        "subscribedThroughPlaystoreOrAppstore":
            MessageLookupByLibrary.simpleMessage(
                "Suscripto a través de Playstore o Appstore"),
        "syncEnabled":
            MessageLookupByLibrary.simpleMessage("Sincronización activada"),
        "syncNow": MessageLookupByLibrary.simpleMessage("Sincronizar ahora"),
        "syncSettings": MessageLookupByLibrary.simpleMessage(
            "Configuración de sincronización"),
        "syncing": MessageLookupByLibrary.simpleMessage("Sincronizando..."),
        "termsOfService":
            MessageLookupByLibrary.simpleMessage("Términos de servicio"),
        "transfers": MessageLookupByLibrary.simpleMessage("Transferencias"),
        "upgradeStorage":
            MessageLookupByLibrary.simpleMessage("Actualizar Almacenamiento"),
        "uploaded": MessageLookupByLibrary.simpleMessage("Subido"),
        "uploading": MessageLookupByLibrary.simpleMessage("Subiendo..."),
        "viewAllowedEmailDomains": MessageLookupByLibrary.simpleMessage(
            "Ver dominios de correo electrónico permitidos"),
        "viewBackendOnGithub":
            MessageLookupByLibrary.simpleMessage("Ver backend en Github"),
        "viewOnGithub": MessageLookupByLibrary.simpleMessage("Ver en Github"),
        "welcomeBack":
            MessageLookupByLibrary.simpleMessage("¡Bienvenido de nuevo!"),
        "willSendALinkToYourEmailToCompleteThe":
            MessageLookupByLibrary.simpleMessage(
                "Enviaremos un enlace a tu correo electrónico para completar el cambio"),
        "willSendALinkToYourEmailToResetYour": MessageLookupByLibrary.simpleMessage(
            "Enviaremos un enlace a tu correo electrónico para restablecer tu contraseña"),
        "yourAccountHasBeenDeleted":
            MessageLookupByLibrary.simpleMessage("Tu cuenta ha sido eliminada.")
      };
}
