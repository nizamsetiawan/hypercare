part of 'widgets.dart';



class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 39.w,
          height: 39.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: SMColors.naturalGrey50,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
        ),
        const LogoIcon(),
      ],
    );
  }
}
