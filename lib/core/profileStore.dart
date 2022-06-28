import 'package:clash_of_clans_app/core/profile_client.dart';
import 'package:clash_of_clans_app/model/profile.dart';
import 'package:mobx/mobx.dart';

part 'profileStore.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  // constructor for the store
  _ProfileStore(ProfileClient client) : _client = client;

  // profile client instance
  late final ProfileClient _client;

  @observable
  // profile data object
  Profile profile;

  @observable
  // loading state
  bool isLoading = false;

  @action
  // fetch profile data
  Future<void> fetchProfile(String tag) async {
    // set loading state to true
    isLoading = true;

    // fetch profile data
    final profileData = await _client.getPlayer(tag);

    // set profile data
    profile = profileData;

    // set loading state to false when done
    isLoading = false;
  }
}