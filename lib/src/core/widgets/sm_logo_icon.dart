part of 'widgets.dart';

class LogoIcon extends StatelessWidget {
  const LogoIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Image.asset(
        'assets/images/logos/star.png',
        width: 46.w,
        height: 40.w,
      ),
    );
  }
}
