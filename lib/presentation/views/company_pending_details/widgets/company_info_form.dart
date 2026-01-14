import 'dart:io';

import 'package:mpos_beat/core/service/file_picker_serveice.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';

class CompanyInfoForm extends StatefulWidget {
  final CompanyViewList? company;
  const CompanyInfoForm({super.key, required this.company});

  @override
  State<CompanyInfoForm> createState() => _CompanyInfoFormState();
}

class _CompanyInfoFormState extends State<CompanyInfoForm> {
  late TextEditingController compnyController;
  late TextEditingController officePhoneController;
  late TextEditingController mobileNumberController;
  late TextEditingController emailController;

  @override
  void initState() {
    compnyController = TextEditingController();
    officePhoneController = TextEditingController();
    mobileNumberController = TextEditingController();
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    compnyController.dispose();
    officePhoneController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
    super.dispose();
  }

  File? imgPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4, left: 16, right: 16),
      padding: EdgeInsets.only(left: 9, right: 9, top: 12, bottom: 20),
      decoration: BoxDecoration(
        color: ColorResources.lavenderblueMist,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              mainAxisAlignment: .center,
              children: [
                Column(
                  crossAxisAlignment: .center,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(100),
                          child: Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: ColorResources.iceBlue,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorResources.lightAccent,
                                width: 1,
                              ),
                            ),
                            child: imgPath != null
                                ? Image.file(imgPath!)
                                : SizedBox.shrink(),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              PickImages.callPicker(
                                onCompleted: (file) {
                                  setState(() {
                                    imgPath = File(file);
                                    Logger.logSuccess("Image file :: $imgPath");
                                  });
                                },
                              );
                            },
                            child: SvgPicture.asset(AppAssets.cam, height: 20),
                          ),
                        ),
                      ],
                    ),
                    h5,
                    Text(
                      "Change Photo",
                      style: context.textStyle.s12.w500.bluishGray,
                    ),
                  ],
                ),
              ],
            ),
            h16,
            Text(
              "Company Name",
              style: context.textStyle.s12.bluishGray.w400.roboto,
            ),
            h4,
            CustomTextField(
              hint: "Enter Company Code",
              controller: compnyController,
              // focusNode: compnyFocusNode,
              // onFieldSubmitted: (_) {
              //   FocusScope.of(context).requestFocus(phoneFocusNode);
              // },
              backgroundColor: ColorResources.white,
              // inputFormatters: [noEmojiFormatter],
              onChange: (_) {},
              borderRadius: 15,
              hintColor: ColorResources.silverGray,
              borderColor: ColorResources.bluishGray,
            ),
            h20,
            Text(
              "Office Phone",
              style: context.textStyle.s12.bluishGray.w400.roboto,
            ),
            h4,
            CustomTextField(
              hint: "Enter Office Phone",
              controller: officePhoneController,
              // focusNode: compnyFocusNode,
              // onFieldSubmitted: (_) {
              //   FocusScope.of(context).requestFocus(phoneFocusNode);
              // },
              backgroundColor: ColorResources.white,
              // inputFormatters: [noEmojiFormatter],
              onChange: (_) {},
              borderRadius: 15,
              hintColor: ColorResources.silverGray,
              borderColor: ColorResources.bluishGray,
            ),
            h20,
            Text(
              "Mobile Number",
              style: context.textStyle.s12.bluishGray.w400.roboto,
            ),
            h4,
            CustomTextField(
              hint: "Enter Mobile Number",
              controller: mobileNumberController,
              // focusNode: compnyFocusNode,
              // onFieldSubmitted: (_) {
              //   FocusScope.of(context).requestFocus(phoneFocusNode);
              // },
              backgroundColor: ColorResources.white,
              // inputFormatters: [noEmojiFormatter],
              onChange: (_) {},
              inputType: TextInputType.phone,
              borderRadius: 15,
              hintColor: ColorResources.silverGray,
              borderColor: ColorResources.bluishGray,
            ),
            h20,
            Text(
              "Email ID",
              style: context.textStyle.s12.bluishGray.w400.roboto,
            ),
            h4,
            CustomTextField(
              hint: "Enter Email ID",
              controller: emailController,
              // focusNode: compnyFocusNode,
              // onFieldSubmitted: (_) {
              //   FocusScope.of(context).requestFocus(phoneFocusNode);
              // },
              backgroundColor: ColorResources.white,
              // inputFormatters: [noEmojiFormatter],
              onChange: (_) {},
              inputType: TextInputType.emailAddress,
              borderRadius: 15,
              hintColor: ColorResources.silverGray,
              borderColor: ColorResources.bluishGray,
            ),
            h20,
            Row(
              mainAxisAlignment: .center,
              children: [
                CustomButton(
                  width: context.getSize.width * 1 / 2.2,
                  buttonText: "Save",
                  isborderEnable: false,
                  borderRadius: BorderRadius.circular(20),
                  textStyle: context.textStyle.s12.w500.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
