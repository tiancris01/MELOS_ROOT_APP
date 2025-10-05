/// String utility functions
class StringUtils {
  /// Capitalizes the first letter of a string
  static String capitalize(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  /// Reverses a string
  static String reverse(String input) {
    return input.split('').reversed.join('');
  }

  /// Checks if a string is a palindrome
  static bool isPalindrome(String input) {
    final cleaned = input.toLowerCase().replaceAll(' ', '');
    return cleaned == reverse(cleaned);
  }

  /// Checks if a string is empty or contains only whitespace
  static bool isBlank(String? input) {
    return input == null || input.trim().isEmpty;
  }
}
