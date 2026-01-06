import 'package:avatar_glow/avatar_glow.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';

class CompanyCreationSuccessScreen extends StatefulWidget {
  final CompanyViewList? companyData;
  const CompanyCreationSuccessScreen({super.key, this.companyData});

  @override
  State<CompanyCreationSuccessScreen> createState() =>
      _CompanyCreationSuccessScreenState();
}

class _CompanyCreationSuccessScreenState
    extends State<CompanyCreationSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    print(
      'companyDATA in success screen ...........................///////////////////////////////////: ${widget.companyData}',
    );
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32, top: 52, right: 32),
                    child: AvatarGlow(
                      glowColor: ColorResources.amber,
                      glowShape: BoxShape.circle,
                      glowRadiusFactor: 0.3,
                      animate: true,
                      repeat: true,
                      child: SvgPicture.asset(AppAssets.tick, height: 144),
                    ),
                  ),
                  h40,
                  Column(
                    children: [
                      Text(
                        widget.companyData == null
                            ? "Company Created\n    Successfully!"
                            : "Company Updated\n    Successfully!",
                        textAlign: TextAlign.center,
                        style: context.textStyle.s22.indigoBlue.bold,
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        widget.companyData == null
                            ? "You are successfully created Company"
                            : "You are successfully updated Company",
                        textAlign: TextAlign.center,
                        style: context.textStyle.s12.silverGray,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              bottom: context.getSize.height * 0.08,
              left: context.getSize.width / 3.6,
              right: context.getSize.width / 3.6,
            ),
            child: CustomButton(
              onTap: () {
                context.pushNamed(AppRouterConst.adminDashboard);
              },

              buttonText: "Next",
              textStyle: context.textStyle.s16.white.bold,
              isborderEnable: false,
            ),
          ),
        ],
      ),
    );
  }
}
