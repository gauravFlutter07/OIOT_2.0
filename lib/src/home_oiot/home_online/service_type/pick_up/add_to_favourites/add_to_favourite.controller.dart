import 'package:flutter/material.dart';

class BottomSheetProvider with ChangeNotifier {
  String _selectedOption = ''; // Track selected option
  bool _isAddingCustom = false; // Track if adding custom favorite

  bool get isAddingCustom => _isAddingCustom; // Getter for isAddingCustom

  String get selectedOption => _selectedOption; // Getter for selectedOption

  bool get isElevatedButtonEnabled {
    // Determine if the button should be enabled
    if (_isAddingCustom) {
      // Button is enabled if custom input is provided
      return _selectedOption.isNotEmpty;
    } else {
      // Button is enabled for predefined options
      return _selectedOption == 'Home' ||
          _selectedOption == 'Work' ||
          _selectedOption == 'Gym';
    }
  }

  void selectOption(String option) {
    _selectedOption = option; // Update selected option
    notifyListeners(); // Notify listeners of change
  }

  void enableCustomInput() {
    _isAddingCustom = true; // Enable custom input mode
    notifyListeners(); // Notify listeners of change
  }

  void disableCustomInput() {
    _isAddingCustom = false; // Disable custom input mode
    notifyListeners(); // Notify listeners of change
  }
}
