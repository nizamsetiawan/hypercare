part of 'widgets.dart';


class AppSwitch extends StatelessWidget {
  const AppSwitch(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.rightColor,
      required this.leftColor,
      this.isForGender = false});

  final bool value;
  final bool? isForGender;
  final ValueChanged<bool> onChanged;
  final Color rightColor;
  final Color leftColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 55.w,
        height: 30.w,
        decoration: BoxDecoration(
          color: value ? rightColor : leftColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(66, 92, 88, 88),
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 150),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 24.0,
            height: 24.0,
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: Colors.grey.shade300, width: 1.0),
            ),
            child: isForGender!
                ? value
                    ? const Icon(
                        Icons.man,
                        color: SMColors.naturalGrey50,
                      )
                    : const Icon(
                        Icons.woman,
                        color: SMColors.naturalGrey50,
                      )
                : null,
          ),
        ),
      ),
    );
  }
}
