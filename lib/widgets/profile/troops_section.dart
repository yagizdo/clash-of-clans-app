import 'package:clash_of_clans_app/constants/app_colors.dart';
import 'package:clash_of_clans_app/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/profileStore.dart';
import '../../locator.dart';
import '../../model/profile.dart';

class TroopsSection extends StatelessWidget {
  const TroopsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Profile Store
    final _profileStore = getIt.get<ProfileStore>();

    // Profile Data
    Profile? _profile = _profileStore.profile;

    // Troops
    const troops = {
      // Heroes
      'Barbarian King': barbarianKing,
      'Archer Queen': archerQueen,
      'Battle Machine': battleMachine,
      'Grand Warden': grandWarden,
      'Royal Champion': royalChampion,

      // Troops
      'Barbarian': barbarian,
      'Archer': archer,
      'Goblin': goblin,
      'Giant': giant,
      'Wall Breaker': wall_breaker,
      'Balloon': balloon,
      'Wizard': wizard,
      'Healer': healer,
      'Dragon': dragon,
      'P.E.K.K.A': pekka,
      'Minion': minion,
      'Hog Rider': hog_rider,
      'Valkyrie': valkyrie,
      'Golem': golem,
      'Witch': witch,
      'Lava Hound': lava_hound,
      'Bowler': bowler,
      'Baby Dragon': baby_dragon,
      'Miner': miner,
      'Electro Dragon': electro_dragon,
      'Ice Golem': ice_golem,

      // Super Troopies
      'Super Barbarian': super_barbarian,
      'Super Archer': super_archer,
      'Super Wall Breaker': super_wall_breaker,
      'Super Giant': super_giant,
      'Super Wizard': super_wizard,
      'Super Dragon': super_dragon,
      'Super Minion': super_minion,
      'Super Bowler': super_bowler,
      'Super Valkyrie': super_valkyrie,
      'Super Witch': super_witch,
      'Inferno Dragon': inferno_dragon,
      'Rocket Balloon': rocket_balloon,
      'Sneaky Goblin': sneaky_goblin,
      'Ice Hound': ice_hound,

      // Builder hall troopies
      'Raged Barbarian': raged_barbarian,
      'Sneaky Archer': sneaky_archer,
      'Boxer Giant': boxer_giant,
      'Beta Minion': beta_minion,
      'Bomber': bomber,
      'Cannon Cart': cannon_cart,
      'Night Witch': night_witch,
      'Drop Ship': drop_ship,
      'Super Pekka': super_pekka,
      'Hog Glider': hog_glider,
    };

    // Heroes List
    List? heroes = _profile?.heroes;
    // Village Troops
    List? villageTroops = _profile?.troops
        ?.where((element) => element.village == 'home')
        .toList();

    // Super Troops
    const superTroopsFilters = [
      'Super',
      'Inferno',
      'Rocket',
      'Ice Hound',
      'Sneaky'
    ];
    List? superTroops = [];

    // Super Troops List filter by superTroopsFilters list and add to superTroops list
    for (var i = 0; i < _profile!.troops!.length; i++) {
      for (var j = 0; j < superTroopsFilters.length; j++) {
        if (_profile.troops![i].name!.contains(superTroopsFilters[j])) {
          // Add to superTroops list
          superTroops.add(_profile.troops![i]);

          // Remove from villageTroops list
          int index = villageTroops!.indexOf(_profile.troops![i]);

          if (index != -1) {
            villageTroops.removeAt(index);
          }
        }
      }
    }

    // Builder Hall Troops
    List? builderHallTroops = _profile.troops
        ?.where((element) => element.village == 'builderBase')
        .toList();

    return Column(
      children: [
        customTroopsList(heroes, 'Heroes', troops),
        SizedBox(height: 13.h),
        customTroopsList(villageTroops, 'Village Troops', troops),
        SizedBox(height: 13.h),
        customTroopsList(superTroops, 'Super Troops', troops),
        SizedBox(height: 13.h),
        customTroopsList(builderHallTroops, 'Builder Hall Troops', troops),
        SizedBox(height: 13.h),
      ],
    );
  }

  Widget customTroopsList(List? list, String title, var troopsObject) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Text(title,
                style: TextStyle(
                    fontSize: 30.sp, fontWeight: FontWeight.w600, color: brown)),
          ),
          SizedBox(
            height: 165.h,
            width: 1.sw,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: Container(
                    width: 110.w,
                    height: 145.h,
                    decoration: BoxDecoration(
                      color: villageGridColor,
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: 30.w, top: 5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            troopsObject[list[index].name! ?? ''],
                            scale: title == 'Super Troops'
                                ? 3.5
                                : title == 'Builder Hall Troops'
                                    ? 3
                                    : title == 'Heroes'
                                        ? 4
                                        : 2,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            list[index].name ?? '',
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                                color: brown),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Level : ${list[index].level ?? ''}',
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                                color: brown),
                          ),
                          Text(
                            'Max Level : ${list[index].maxLevel ?? ''}',
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                                color: brown),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
