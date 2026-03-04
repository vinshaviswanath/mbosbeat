import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:mpos_beat/core/service/file_picker_serveice.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';
import 'package:mpos_beat/domain/request/update_company_profile_params.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/company_creation_provider.dart';

class CompanyInfoForm extends StatefulWidget {
  final CompanyViewList? company;
  final VoidCallBack onUpdate;
  const CompanyInfoForm({super.key, required this.onUpdate, this.company});

  @override
  State<CompanyInfoForm> createState() => _CompanyInfoFormState();
}

class _CompanyInfoFormState extends State<CompanyInfoForm> {
  late TextEditingController compnyController;
  late TextEditingController officePhoneController;
  late TextEditingController mobileNumberController;
  late TextEditingController emailController;
  File? imgPath;

  @override
  void initState() {
    compnyController = TextEditingController(
      text: widget.company?.companyName ?? "",
    );
    officePhoneController = TextEditingController(
      text: widget.company?.officeNo ?? "",
    );
    mobileNumberController = TextEditingController(
      text: widget.company?.mobile ?? "",
    );
    emailController = TextEditingController(text: widget.company?.email ?? "");
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

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CompanyCreationProvider>();

    if (provider.updatedCompany != null) {
      final updated = provider.updatedCompany!;

      officePhoneController.text = updated.officeNumber;
      mobileNumberController.text = updated.mobileNumber;
      emailController.text = updated.emailId;
    }
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                : widget.company?.companyLogoUrl != null
                                ? CachedNetworkImage(
                                    imageUrl:
                                        "${Urls.baseURL}${widget.company?.companyLogoUrl}",
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.broken_image),
                                  )
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
              hint: "Enter Company Name",
              controller: compnyController,
              readOnly: true,
              backgroundColor: ColorResources.white,
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

              backgroundColor: ColorResources.white,
              onChange: (_) {},
              inputType: TextInputType.phone,
              maxLength: 10,
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

              backgroundColor: ColorResources.white,
              onChange: (_) {},
              inputType: TextInputType.phone,
              maxLength: 10,
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

              backgroundColor: ColorResources.white,
              onChange: (_) {},
              inputType: TextInputType.emailAddress,
              borderRadius: 15,
              hintColor: ColorResources.silverGray,
              borderColor: ColorResources.bluishGray,
            ),
            h20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onTap: () {
                    final company = widget.company;
                    provider
                        .updateCompanyProfile(
                          context: context,
                          params: CompanyProfileModel(
                            companyId: company?.id.toString() ?? "",
                            companyCode: company?.companyCode.toString() ?? "",
                            officeNumber: officePhoneController.text,
                            mobileNumber: mobileNumberController.text,
                            emailId: emailController.text,
                            cmpLogo: imgPath,
                          ),
                        )
                        .then((value) {
                          if (value != null) {
                            widget.onUpdate.call();
                          }
                        });
                  },
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
