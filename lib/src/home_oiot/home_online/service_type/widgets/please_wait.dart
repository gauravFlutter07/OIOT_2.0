import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:oiot/src/home_oiot/home_online/service_type/widgets/thank_you.dart';

import '../../../../../imports.dart';

class PleaseWait extends StatefulWidget {
  const PleaseWait({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PleaseWaitState createState() => _PleaseWaitState();
}

class _PleaseWaitState extends State<PleaseWait> {
  double _progress = 0;

  @override
  void initState() {
    super.initState();

    startProgress();
  }

  void startProgress() async {
    while (_progress < 100) {
      await Future.delayed(
        const Duration(milliseconds: 25),
      );
      setState(() {
        _progress += 1;
      });
    }

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ThankYou(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CircularSeekBar with dynamic progress and text
            CircularSeekBar(
              width: double.infinity,
              height: 250,
              progress: _progress,
              barWidth: 25,
              startAngle: 180,
              sweepAngle: 360,
              strokeCap: StrokeCap.butt,
              progressGradientColors: [blueMain, blueMain, blueMain],
              dashWidth: 10,
              dashGap: 2,
              animation: true,
              child: Center(
                child: Text(
                  '${_progress.toInt()}%',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            height50,
            Text(
              AppLocalizations.of(context)!.pleaseWait,
              style: tsExtraLargeBold,
            ),
            height20,
            Text(
              "${AppLocalizations.of(context)!.pleaseWaitUnlessUntilYou}\n${AppLocalizations.of(context)!.getConfirmationFromUs}",
              style: tsLargeGrey,
              textAlign: centreAlign,
            ),
          ],
        ),
      ),
    );
  }
}
