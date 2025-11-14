import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';

class AddUnit extends StatefulWidget {
  // final int index;
  const AddUnit({
    super.key,
    // required this.index
  });

  @override
  State<AddUnit> createState() => _AddUnitState();
}

class _AddUnitState extends State<AddUnit> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final uqcController = TextEditingController();
  final decimalController = TextEditingController();

  bool _submitted = false;
  String? nameError;
  String? descriptionError;
  String? uqcError;
  String? decimalError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: ColorResources.indigoBlue,
          ),
        ),
        title: Text(
          "Add Unit",
          style: context.textStyle.s20.indigoBlue.bold.roboto,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 25),
          child: Container(color: Colors.white),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  "Name",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Unit Name",
                  controller: nameController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && nameError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && nameError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        nameError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "Unit description",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Unit description",
                  controller: descriptionController,
                  backgroundColor: ColorResources.lightGray,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && descriptionError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && descriptionError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        descriptionError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "UQC",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter UQC",
                  controller: uqcController,
                  backgroundColor: ColorResources.lightGray,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && uqcError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && uqcError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        uqcError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "Decimal",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Decimal",
                  controller: decimalController,
                  backgroundColor: ColorResources.lightGray,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && decimalError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && decimalError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        decimalError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h60,
              ]),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.getSize.width / 3,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomButton(
                    onTap: () {
                      setState(() {
                        _submitted = true;
                        nameError = null;
                        descriptionError = null;
                        uqcError = null;
                        decimalError = null;

                        if (nameController.text.isEmpty) {
                          nameError = "Please enter Name";
                        }
                        if (descriptionController.text.isEmpty) {
                          descriptionError = "Please enter unit description";
                        }
                        if (uqcController.text.isEmpty) {
                          uqcError = "Please enter UQC";
                        }
                        if (decimalController.text.isEmpty) {
                          decimalError = "Please enter decimal";
                        }
                        if (nameError == null &&
                            descriptionError == null &&
                            uqcError == null &&
                            decimalError == null) {
                          nameController.clear();
                          descriptionController.clear();
                          uqcController.clear();
                          decimalController.clear();

                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            context.pop();
                          });
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(16),
                    textStyle: context.textStyle.s12.w500.white.roboto,
                    buttonText: "Save",
                    isborderEnable: false,
                  ),
                  h24,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
