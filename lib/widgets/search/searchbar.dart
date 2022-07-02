import 'package:clash_of_clans_app/constants/app_colors.dart';
import 'package:clash_of_clans_app/locator.dart';
import 'package:clash_of_clans_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/profileStore.dart';
import 'custom_debouncer.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  // Text controller for the search bar
  final TextEditingController _controller = TextEditingController();

  // Debouncer for the search bar
  Debouncer debouncer = Debouncer(milliseconds: 2500);

  // Profile Store for the search bar
  final _profileStore = getIt.get<ProfileStore>();

  // focus node for the search bar
  FocusNode _focusNode = FocusNode();

  // Text
  String _valueText = '';

  // form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Get Profile data
  // Build context and void callback cause the future to be executed in the background thread and not the main thread which is what the future is executed in.
  Future<void> _getPlayerData(String tag, BuildContext context, VoidCallback onSuccess) async {
    await _profileStore.fetchProfile(tag);
    onSuccess.call();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? get _errorText {
    if (_valueText.isEmpty && _focusNode.hasFocus) {
      return 'Cant\'t be empty';
    }
    if (_valueText.length < 6 && _focusNode.hasFocus) {
      return 'Must be at least 6 characters';
    }
    if (_valueText.contains('#') && _focusNode.hasFocus) {
      return 'Must not contain #';
    }
    // If no error, return null
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SizedBox(
          width: 315.w,
          height: 69.h,
          child: Observer(
            builder: (_) {
              return Form(
                key: formKey,
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  // Controller for the search bar
                  controller: _controller,

                  // Focus node for the search bar
                  focusNode: _focusNode,

                  // validator for the search bar
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Cant\'t be empty';
                    }
                    if (value.length < 6) {
                      return 'Must be at least 6 characters';
                    }
                    if (value.contains('#')) {
                      return 'Must not contain #';
                    }
                  },
                  // On changed for the search bar
                  onChanged: (value) {
                    setState(() {
                      // Update the value of the text
                      _valueText = value.toString();
                        _profileStore.isError = false;
                    });
                  },

                  // Decoration for the search bar
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                    labelStyle: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: _profileStore.isError ? Colors.red : black,
                    ),
                    helperText: ' ',
                    fillColor: const Color(0xFFF0F3F7),
                    filled: true,
                    errorText: _errorText,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30.w),
                    ),
                    labelText: 'Player Tag',
                  ),
                ),
              );
            }
          ),
        ),
        Observer(
          builder: (_) {
            return Positioned(
              top: 0.h,
              child: CircleAvatar(
                backgroundColor: _profileStore.isError ? red : const Color(0xFFFFB82A),
                radius: 22.w,
                child: IconButton(
                  icon: const Icon(Icons.search,color: Colors.white,),
                  onPressed: () {
                    if(formKey.currentState!.validate()) {
                      _getPlayerData(_controller.text, context, () {
                        if(_profileStore.isError == false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileScreen(),
                            ),
                          );
                        }
                      });
                    }
                    _focusNode.unfocus();
                  },
                ),
              ),
            );
          }
        ),
      ],
    );
  }
}
