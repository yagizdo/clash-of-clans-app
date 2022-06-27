import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/profile_client.dart';
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
  Debouncer debouncer = Debouncer(milliseconds: 500);

// Profile client for the search bar
  ProfileClient profileClient = ProfileClient();

  // focus node for the search bar
  FocusNode _focusNode = FocusNode();

  // Text
  String _valueText = '';

  @override
  void initState() {
    super.initState();
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
    return Padding(
      padding: EdgeInsets.all(10.w),
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
                profileClient.getPlayer(value).then((value) {
                  print(value.name);
                });
              });
            }
          });
        },

        // Decoration for the search bar
        decoration: InputDecoration(
          errorText: _errorText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.w),
          ),
          labelText: 'Search Account with #tag',
        ),
      ),
    );
  }
}
