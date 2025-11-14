import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';

class AddGodown extends StatefulWidget {
  // final int index;
  const AddGodown({
    super.key,
    // required this.index
  });

  @override
  State<AddGodown> createState() => _AddGodownState();
}

class _AddGodownState extends State<AddGodown> {
  final godownController = TextEditingController();

  bool _submitted = false;
  String? godownError;

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
          "Godown",
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
                  "Godown Name",
                  style: context.textStyle.s12.bluishGray.w400.roboto,
                ),
                h4,
                CustomTextField(
                  hint: "Enter Godown Name",
                  controller: godownController,
                  backgroundColor: ColorResources.lightGray,
                  inputType: TextInputType.text,
                  borderRadius: 12,
                  hintColor: ColorResources.silverGray,
                  borderColor: _submitted && godownError != null
                      ? ColorResources.roseRed
                      : ColorResources.transparent,
                ),
                if (_submitted && godownError != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.alertError, height: 16),
                      const SizedBox(width: 2),
                      Text(
                        godownError!,
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
                        godownError = null;

                        if (godownController.text.isEmpty) {
                          godownError = "Please enter Godown name";
                        }
                        if (godownError == null ) {
                          godownController.clear();
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
