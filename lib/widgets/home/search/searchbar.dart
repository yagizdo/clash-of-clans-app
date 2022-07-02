import 'package:clash_of_clans_app/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/profileStore.dart';
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

  // Get Profile data
  Future<void> _getPlayerData(String tag) async {
    await _profileStore.fetchProfile(tag);
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
          child: TextField(
            // Controller for the search bar
            controller: _controller,

            // Focus node for the search bar
            focusNode: _focusNode,

            // On changed for the search bar
            onChanged: (value) {
              setState(() {
                // Update the value of the text
                _valueText = value.toString();

                if (_errorText == null) {
                  // Run the debouncer
                  debouncer.run(() {

                  });
                }
              });
            },

            // Decoration for the search bar
            decoration: InputDecoration(
              helperText: ' ',
              fillColor: Color(0xFFF0F3F7),
              filled: true,
              errorText: _errorText,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30.w),
              ),
              labelText: 'Player Tag',
            ),
          ),
        ),
        Positioned(
          child: ElevatedButton(
            // On pressed for the search bar
            onPressed: () {
              _getPlayerData(_controller.text);
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Color(0xFFFFB82A),
              shape: const CircleBorder(), //<-- SEE HERE
              fixedSize: Size(20.w, 50.h),
            ),
            child: const Icon(Icons.search),
          ),
        ),
      ],
    );
  }
}
