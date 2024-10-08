import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:vendorsouqjumla/domain/dependence_injection/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configurationInjection() async {
  getIt.init(environment: Environment.prod);
}
