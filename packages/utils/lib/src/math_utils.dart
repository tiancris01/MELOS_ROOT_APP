/// Math utility functions
class MathUtils {
  /// Calculates the factorial of a number
  static int factorial(int n) {
    if (n < 0)
      throw ArgumentError('Factorial is not defined for negative numbers');
    if (n == 0 || n == 1) return 1;
    return n * factorial(n - 1);
  }

  /// Checks if a number is prime
  static bool isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i <= n ~/ 2; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  /// Calculates the greatest common divisor
  static int gcd(int a, int b) {
    while (b != 0) {
      final temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }
}
