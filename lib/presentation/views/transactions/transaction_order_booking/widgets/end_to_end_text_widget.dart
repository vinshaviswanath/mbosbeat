import 'package:mpos_beat/core/utils/imports.dart';

class EndToEndTextWidget extends StatelessWidget {
  const EndToEndTextWidget({
    super.key,
    required this.text1,
    required this.text2,
    this.textStyle1,
    this.textStyle2,
  });
  final String text1;
  final TextStyle? textStyle1;
  final String text2;
  final TextStyle? textStyle2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: textStyle1 ?? context.textStyle.s09.w400.dustyBlue.roboto,
        ),
        Text(
          text2,
          style: textStyle2 ?? context.textStyle.s09.w400.dustyBlue.roboto,
        ),
      ],
    );
  }
}
