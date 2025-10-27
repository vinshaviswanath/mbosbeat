import 'package:mpos_beat/core/failures/value_object/value_failure.dart';
import 'package:mpos_beat/core/utils/imports.dart';

abstract class ObjectWithIdAndName {
  String? get name;
  int? get id;
}

class CustomDropdownTypeGeneric<T extends ObjectWithIdAndName> extends StatefulWidget {
  final String? label;
  final String hintText;
  final List<T> items;
  final void Function(dynamic) onChanged;
  final T? value;

  /// 👇 Same as CustomTextField
  final ValueFailure? failure;
  final AutovalidateMode? autovalidateMode;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final TextStyle? labelTextStyle;
  final TextStyle? hintTextStyle;
  final double? arrowSize;

  const CustomDropdownTypeGeneric({
    super.key,
    this.label,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.value,
    this.failure,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.height,
    this.width,
    this.labelTextStyle,
    this.hintTextStyle,
    this.arrowSize,
  });

  @override
  State<CustomDropdownTypeGeneric> createState() => _CustomDropdownTypeGenericState();
}

class _CustomDropdownTypeGenericState<T extends ObjectWithIdAndName>
    extends State<CustomDropdownTypeGeneric<T>> {
  T? selectedValue;

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
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style:
                widget.labelTextStyle ??
                context.textStyle.s12.bluishGray.w400.roboto,
          ),
          h6,
        ],

        // Dropdown container
        Container(
          height: widget.height,
          width: widget.width,
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
            child: DropdownButton<T>(
              value: selectedValue,
              isExpanded: true,
              hint: Text(
                widget.hintText,
                style:
                    widget.hintTextStyle ??
                    context.textStyle.s12.silverGray.w300.roboto,
              ),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: ColorResources.indigoBlue,
                size: widget.arrowSize,
              ),
              items: widget.items.map((value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(
                    value.name ?? '',
                    style: context.textStyle.s12.black.w400.roboto,
                  ),
                );
              }).toList(),
              // onChanged: widget.onChanged,
              onChanged: (newValue) {
                Logger.logWarning(newValue);
                if (newValue != null) {
                  widget.onChanged(newValue);
                  setState(() {
                    selectedValue = newValue;
                  });
                }
              },
            ),
          ),
        ),
        if (isError) h5,
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
