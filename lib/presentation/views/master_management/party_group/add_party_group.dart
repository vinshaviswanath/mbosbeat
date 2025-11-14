import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';

class AddPartyGroup extends StatefulWidget {
  // final int index;
  const AddPartyGroup({
    super.key,
    // required this.index
  });

  @override
  State<AddPartyGroup> createState() => _AddPartyGroupState();
}

class _AddPartyGroupState extends State<AddPartyGroup> {
  final groupNameController = TextEditingController();
  final parentController = TextEditingController();

  bool _submitted = false;
  String? groupNameError;
  String? parentError;

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
          "Add Party Group",
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
                  "Group Name",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Group Name",
                  controller: groupNameController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && groupNameError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && groupNameError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        groupNameError!,
                        style: context.textStyle.s09.roseRed.w400.roboto,
                      ),
                    ],
                  ),
                ],
                h16,
                Text(
                  "Parent",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Select Group Name",
                  controller: parentController,
                  backgroundColor: ColorResources.lightGray,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && parentError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && parentError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        parentError!,
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
                        groupNameError = null;
                        parentError = null;

                        if (groupNameController.text.isEmpty) {
                          groupNameError = "Please enter Group name";
                        }
                        if (parentController.text.isEmpty) {
                          parentError = "Please enter Parent name";
                        }
                        if (groupNameError == null && parentError == null) {
                          groupNameController.clear();
                          parentController.clear();
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
