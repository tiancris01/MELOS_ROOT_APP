import 'package:test/test.dart';
import 'package:utils/utils.dart';

void main() {
  group('StringUtils', () {
    test('capitalize should capitalize first letter', () {
      expect(StringUtils.capitalize('hello'), equals('Hello'));
      expect(StringUtils.capitalize('WORLD'), equals('World'));
      expect(StringUtils.capitalize(''), equals(''));
    });

    test('reverse should reverse string', () {
      expect(StringUtils.reverse('hello'), equals('olleh'));
      expect(StringUtils.reverse('world'), equals('dlrow'));
      expect(StringUtils.reverse(''), equals(''));
    });

    test('isPalindrome should detect palindromes', () {
      expect(StringUtils.isPalindrome('racecar'), isTrue);
      expect(StringUtils.isPalindrome('A man a plan a canal Panama'), isTrue);
      expect(StringUtils.isPalindrome('hello'), isFalse);
    });
  });

  group('MathUtils', () {
    test('factorial should calculate correctly', () {
      expect(MathUtils.factorial(0), equals(1));
      expect(MathUtils.factorial(1), equals(1));
      expect(MathUtils.factorial(5), equals(120));
      expect(() => MathUtils.factorial(-1), throwsArgumentError);
    });

    test('isPrime should detect prime numbers', () {
      expect(MathUtils.isPrime(2), isTrue);
      expect(MathUtils.isPrime(3), isTrue);
      expect(MathUtils.isPrime(17), isTrue);
      expect(MathUtils.isPrime(1), isFalse);
      expect(MathUtils.isPrime(4), isFalse);
      expect(MathUtils.isPrime(9), isFalse);
    });

    test('gcd should calculate greatest common divisor', () {
      expect(MathUtils.gcd(48, 18), equals(6));
      expect(MathUtils.gcd(17, 13), equals(1));
      expect(MathUtils.gcd(100, 25), equals(25));
    });
  });
}
