import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseConfig {
  const SupabaseConfig._();

  static const _urlFromDefine = String.fromEnvironment('SUPABASE_URL');
  static const _anonKeyFromDefine = String.fromEnvironment('SUPABASE_ANON_KEY');

  static String get environmentFile =>
      kDebugMode ? '.env.debug' : '.env.release';

  static String get url =>
      _readValue(key: 'SUPABASE_URL', fallback: _urlFromDefine);

  static String get anonKey =>
      _readValue(key: 'SUPABASE_ANON_KEY', fallback: _anonKeyFromDefine);

  static bool get isConfigured => url.isNotEmpty && anonKey.isNotEmpty;

  static Future<void> load() async {
    await dotenv.load(fileName: environmentFile);
  }

  static void validate() {
    if (isConfigured) {
      return;
    }

    throw StateError(
      'Missing SUPABASE_URL or SUPABASE_ANON_KEY. '
      'Set them in $environmentFile or pass them via '
      '--dart-define=SUPABASE_URL=... '
      'and --dart-define=SUPABASE_ANON_KEY=....',
    );
  }

  static String _readValue({required String key, required String fallback}) {
    final envValue = (dotenv.maybeGet(key) ?? '').trim();
    if (envValue.isNotEmpty) {
      return envValue;
    }

    return fallback.trim();
  }
}
