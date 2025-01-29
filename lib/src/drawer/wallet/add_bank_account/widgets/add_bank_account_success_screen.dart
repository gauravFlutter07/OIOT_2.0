import '../../../../../imports.dart';
import '../../../../../widgets/app_text_widget.dart';

class AddBankAccountSuccessScreen extends StatelessWidget {
  const AddBankAccountSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(successPng),
          ),
          textWidget('Successfully', pureBlack, FontWeight.bold, 30.0, false,
              null, 0.0, 30.0, 0.0, 0.0),
          textWidget('Will be Approved in 24 hrs', pureBlack, FontWeight.w300,
              20.0, false, null, 0.0, 20.0, 0.0, 0.0)
        ],
      ),
    );
  }
}
