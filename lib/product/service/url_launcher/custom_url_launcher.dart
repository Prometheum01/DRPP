import 'package:dont_read_privacy_policy/core/extensions/string_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomUrlLauncher {
  static Future<void> customLaunchUrl(String url) async {
    final Uri uri =
        Uri.https(url.divideAuthority.toString(), url.divideParams.toString());

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Cant launch Url';
    }
  }
}
