import 'package:clash_of_clans_app/core/profileStore.dart';
import 'package:clash_of_clans_app/core/profile_client.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton(ProfileClient());
  getIt.registerSingleton(ProfileStore(getIt.get<ProfileClient>()));
}
