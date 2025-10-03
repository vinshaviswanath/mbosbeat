import 'package:mpos_beat/core/failures/value_object/value_failure.dart';
import 'package:mpos_beat/core/utils/imports.dart';

class CustomDropdown extends StatefulWidget {
  final String label;
  final String hintText;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? value;

  /// 👇 Same as CustomTextField
  final ValueFailure? failure;
  final AutovalidateMode? autovalidateMode;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.value,
    this.failure,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final isError =
        widget.autovalidateMode == AutovalidateMode.always &&
        widget.failure != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(widget.label, style: context.textStyle.s12.bluishGray.w400.roboto),
        h6,

        // Dropdown container
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: isError
                  ? Colors.red
                  : (widget.borderColor ?? Colors.transparent),
            ),
            color: widget.backgroundColor ?? ColorResources.lightGray,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              isExpanded: true,
              hint: Text(
                widget.hintText,
                style: context.textStyle.s12.silverGray.w300.roboto,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: ColorResources.indigoBlue,
              ),
              items: widget.items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: context.textStyle.s12.black.w400.roboto,
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue;
                });
                widget.onChanged(newValue);
              },
            ),
          ),
        ),

        if (isError)  h5,
        if (isError)
          Row(
            children: [
              SvgPicture.asset(AppAssets.alertError, height: 16),
              w2,
              Text(
                widget.failure!.errorMsg,
                style: context.textStyle.s10.w300.roseRed.raleway,
              ),
            ],
          ),
      ],
    );
  }
}
