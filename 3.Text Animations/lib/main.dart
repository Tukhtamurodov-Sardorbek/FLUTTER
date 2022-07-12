import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:marquee/marquee.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // * StatusBar & NavigationBar Color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.deepPurpleAccent,
      systemNavigationBarColor: Colors.deepPurpleAccent,
    ),
  );

  // * Orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Text Animations',
      theme: ThemeData.light(),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          AnimatedTextKitPackage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(46),
                  primary: Colors.deepPurpleAccent,
                ),
                child: const Text(
                  'animated_text_kit package',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const MarqueePackage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(46),
                  primary: Colors.deepPurpleAccent,
                ),
                child: const Text(
                  'marquee package',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedTextKitPackage extends StatelessWidget {
  AnimatedTextKitPackage({Key? key}) : super(key: key);
  final colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  static const fontSize = 32.0;

  final colorizeTextStyle = const TextStyle(
    fontSize: 40.0,
    fontFamily: 'Horizon',
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('animated_text_kit package'),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          // * TypewriterAnimatedText
          const Text(
            'TypewriterAnimatedText',
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Divider(thickness: 3, color: Colors.deepPurpleAccent),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Hello world!',
                  textStyle: const TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 300),
                ),
              ],
              totalRepeatCount: 4,
              pause: const Duration(milliseconds: 500),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ),
          const SizedBox(height: 14.0),

          // * Rotate
          const Text(
            'Rotate',
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Divider(thickness: 3, color: Colors.deepPurpleAccent),
          SizedBox(
            height: 100,
            child: Row(
              children: <Widget>[
                const SizedBox(width: 20.0, height: 100.0),
                const Text(
                  'Be',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: fontSize,
                    fontFamily: 'Horizon',
                  ),
                ),
                const SizedBox(width: 20.0, height: 100.0),
                DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: fontSize,
                    fontFamily: 'Horizon',
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      RotateAnimatedText('AWESOME'),
                      RotateAnimatedText('OPTIMISTIC'),
                      RotateAnimatedText('DIFFERENT'),
                    ],
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14.0),

          // * Fade
          const Text(
            'Fade',
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Divider(thickness: 3, color: Colors.deepPurpleAccent),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FadeAnimatedText('do IT!'),
                    FadeAnimatedText('do it RIGHT!!'),
                    FadeAnimatedText('do it RIGHT NOW!!!'),
                  ],
                  onTap: () {},
                ),
              ),
            ),
          ),
          const SizedBox(height: 14.0),

          // * Typer
          const Text(
            'Typer',
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Divider(thickness: 3, color: Colors.deepPurpleAccent),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Bobbers',
                  color: Colors.black,
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText('It is not enough to do your best,'),
                    TyperAnimatedText('you must know what to do,'),
                    TyperAnimatedText('and then do your best'),
                    TyperAnimatedText('- W.Edwards Deming'),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 14.0),

          // * Typewriter
          const Text(
            'Typewriter',
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Divider(thickness: 3, color: Colors.deepPurpleAccent),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: fontSize,
                  fontFamily: 'Agne',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Discipline is the best tool'),
                    TypewriterAnimatedText('Design first, then code'),
                    TypewriterAnimatedText(
                        'Do not patch bugs out, rewrite them'),
                    TypewriterAnimatedText(
                        'Do not test bugs out, design them out'),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 14.0),

          // * Scale
          const Text(
            'Scale',
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Divider(thickness: 3, color: Colors.deepPurpleAccent),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: fontSize,
                  fontFamily: 'Canterbury',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    ScaleAnimatedText('Think'),
                    ScaleAnimatedText('Build'),
                    ScaleAnimatedText('Ship'),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 14.0),

          // * Colorize
          const Text(
            'Colorize',
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Divider(thickness: 3, color: Colors.deepPurpleAccent),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              width: 250.0,
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Larry Page',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                  ColorizeAnimatedText(
                    'Bill Gates',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                  ColorizeAnimatedText(
                    'Steve Jobs',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                ],
                isRepeatingAnimation: true,
                onTap: () {},
              ),
            ),
          ),
          const SizedBox(height: 14.0),

          // * Wavy
          const Text(
            'Wavy',
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Divider(thickness: 3, color: Colors.deepPurpleAccent),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  WavyAnimatedText('Hello World'),
                  WavyAnimatedText('Look at the waves'),
                ],
                isRepeatingAnimation: true,
                onTap: () {},
              ),
            ),
          ),
          const SizedBox(height: 14.0),

          // * Flicker
          const Text(
            'Flicker',
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Divider(thickness: 3, color: Colors.deepPurpleAccent),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 7.0,
                      color: Colors.white,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FlickerAnimatedText('Flicker Frenzy'),
                    FlickerAnimatedText('Night Vibes On'),
                    FlickerAnimatedText("C'est La Vie !"),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 14.0),

          // * TextLiquidFill
          const Text(
            'TextLiquidFill ',
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Divider(thickness: 3, color: Colors.deepPurpleAccent),
          SizedBox(
            width: 250.0,
            child: TextLiquidFill(
              text: 'LIQUIDY',
              waveColor: Colors.cyanAccent,
              boxBackgroundColor: Colors.deepPurpleAccent,
              textStyle: const TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
              boxHeight: 200.0,
            ),
          ),
          const SizedBox(height: 14.0),
        ],
      ),
    );
  }
}

class MarqueePackage extends StatefulWidget {
  const MarqueePackage({Key? key}) : super(key: key);

  @override
  State<MarqueePackage> createState() => _MarqueePackageState();
}

class _MarqueePackageState extends State<MarqueePackage> {
  bool _useRtlText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 50),
        children: [
          _buildMarquee(),
          _buildComplexMarquee(),
        ].map(_wrapWithStuff).toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() => _useRtlText = !_useRtlText),
        label: !_useRtlText
            ? const Text('Switch to Hebrew')
            : const Text('החלף לאנגלית'),
        backgroundColor: Colors.pink,
      ),
    );
  }

  Widget _buildMarquee() {
    return Marquee(
      key: Key("$_useRtlText"),
      text: !_useRtlText
          ? 'There once was a boy who told this story about a boy: "'
          : 'פעם היה ילד אשר סיפר סיפור על ילד:"',
      velocity: 50.0,
    );
  }

  Widget _buildComplexMarquee() {
    return Marquee(
      key: Key("$_useRtlText"),
      text: !_useRtlText
          ? 'Some sample text that takes some space.'
          : 'זהו משפט ראשון של הטקסט הארוך. זהו המשפט השני של הטקסט הארוך',
      style: TextStyle(fontWeight: FontWeight.bold),
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 20,
      velocity: 100,
      pauseAfterRound: Duration(seconds: 1),
      showFadingOnlyWhenScrolling: true,
      fadingEdgeStartFraction: 0.1,
      fadingEdgeEndFraction: 0.1,
      numberOfRounds: 3,
      startPadding: 10,
      accelerationDuration: Duration(seconds: 1),
      accelerationCurve: Curves.linear,
      decelerationDuration: Duration(milliseconds: 500),
      decelerationCurve: Curves.easeOut,
      textDirection: _useRtlText ? TextDirection.rtl : TextDirection.ltr,
    );
  }

  Widget _wrapWithStuff(Widget child) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(height: 50, color: Colors.white, child: child),
    );
  }
}