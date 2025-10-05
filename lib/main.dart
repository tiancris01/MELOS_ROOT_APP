import 'package:flutter/material.dart';
import 'package:utils/utils.dart';
import 'package:ui_components/ui_components.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melos Root App Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Melos useRootAsPackage Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _testString = 'hello world';
  String _result = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _testUtils() {
    setState(() {
      // Test StringUtils
      final capitalized = StringUtils.capitalize(_testString);
      final reversed = StringUtils.reverse(_testString);
      final isPalindrome = StringUtils.isPalindrome('racecar');

      // Test MathUtils
      final factorial = MathUtils.factorial(5);
      final isPrime = MathUtils.isPrime(_counter);
      final gcd = MathUtils.gcd(48, 18);

      _result =
          'Utils Test Results:\n'
          'Capitalized: $capitalized\n'
          'Reversed: $reversed\n'
          'Is "racecar" palindrome: $isPalindrome\n'
          'Factorial of 5: $factorial\n'
          'Is $_counter prime: $isPrime\n'
          'GCD of 48,18: $gcd';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomCard(
              child: Column(
                children: [
                  Text(
                    'Counter Demo',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'You have pushed the button this many times:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    text: 'increment counter',
                    onPressed: _incrementCounter,
                    backgroundColor: Colors.blue,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            CustomCard(
              child: Column(
                children: [
                  Text(
                    'Utils Package Demo',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Test string: "$_testString"',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    text: 'test utilities',
                    onPressed: _testUtils,
                    backgroundColor: Colors.green,
                  ),
                  if (_result.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _result,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16),
            CustomCard(
              backgroundColor: Colors.purple[50],
              child: Column(
                children: [
                  Text(
                    'Melos useRootAsPackage Demo',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'This app demonstrates the useRootAsPackage feature of Melos. '
                    'The root directory is treated as a package and can use local packages:',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '• utils package - String and Math utilities\n'
                    '• ui_components package - Custom UI widgets\n'
                    '• Root app package - This Flutter application',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
