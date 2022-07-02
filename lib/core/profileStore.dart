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
  // loading state
  bool isLoading = false;

  @observable
  Profile? profile;

  @observable
  bool isError = false;

  @action
  // fetch profile data
  Future<void> fetchProfile(String tag) async {

    // set loading state to true
    isLoading = true;

    // fetch profile data
    final profileData = await _client.getPlayer(tag);

    if(profileData.runtimeType != String && profileData != null) {
      // set profile data
      Profile profileObject = profileData;
      // set profile data
      profile = profileObject;

      // error state is false
      isError = false;
    } else {
     isError = true;
    }

    // set loading state to false when done
    isLoading = false;

    print(profile?.name);
  }

  dispose() {
    profile = null;
  }
}