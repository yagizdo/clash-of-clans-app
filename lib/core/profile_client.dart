import 'package:clash_of_clans_app/core/api_client.dart';
import 'package:clash_of_clans_app/model/profile.dart';

class ProfileClient extends ApiClient {

  // Get profile by profile tag
  Future<dynamic> getPlayer(String tag) async {

    // Add the api key to the header
    super.dio.options.headers['Authorization'] = 'Bearer ${super.apiKey}';

    // Get the player profile
    final response = await dio.get('${super.baseUrl}v1/players/%23$tag');

    // Convert the response to a profile object
    final profile = Profile.fromJson(response.data);

    //print(profile.heroes![0].name);

    // Return the profile object
    return profile;
  }
}

