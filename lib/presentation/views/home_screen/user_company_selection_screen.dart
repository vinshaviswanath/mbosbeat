import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/dialogs/auth_dialogs.dart';
import 'package:mpos_beat/presentation/views/admin_home/widget/common_logoutdialogbox.dart';

class UserCompanySelectionScreen extends StatefulWidget {
  const UserCompanySelectionScreen({super.key});

  @override
  State<UserCompanySelectionScreen> createState() =>
      _UserCompanySelectionScreenState();
}

class _UserCompanySelectionScreenState
    extends State<UserCompanySelectionScreen> {
  late TextEditingController searchController;

  int? selectedIndex;

  String searchText = "";

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();

    searchController.addListener(() {
      setState(() {
        searchText = searchController.text.trim().toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    searchController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appDb = sl<AppDb>();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final shouldExit = await AuthDialogs.show(context);
        if (shouldExit) {
          AuthDialogs.exitApp();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorResources.white,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Company Listing",
            style: context.textStyle.s20.indigoBlue.bold.roboto,
          ),
          actions: [
            GestureDetector(
              onTap: () => CommonLogoutDialog(context),
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SvgPicture.asset(
                  AppAssets.logout2,
                  height: context.getSize.height * 0.025,
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 5),
            child: SizedBox.shrink(),
          ),
        ),

        /// 1️⃣ First stream → get logged-in user
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 4, left: 16, right: 16),
              child: CustomTextField(
                suffixIcon: const Icon(
                  Icons.search,
                  color: ColorResources.bluishGray,
                ),
                controller: searchController,
                hint: "Search Company",
                backgroundColor: ColorResources.white,
                borderRadius: 12,
                borderColor: ColorResources.transparent,
              ),
            ),
            Divider(color: ColorResources.cloudGray, thickness: 1),
            h6,
            StreamBuilder<RegistrationDetail?>(
              stream: appDb.registrationDetailDao.watchLoggedInUser(),
              builder: (context, userSnapshot) {
                // if (userSnapshot.connectionState == ConnectionState.waiting) {
                //   return const Center(child: CircularProgressIndicator());
                // }

                if (!userSnapshot.hasData || userSnapshot.data == null) {
                  return const Center(child: Text("User not found"));
                }

                final int userId = userSnapshot.data!.userId;

                /// 2️⃣ Second stream → get companies by userId
                return Expanded(
                  child: StreamBuilder<List<Company>>(
                    stream: appDb.companyDao.watchCompaniesByUserId(userId),
                    builder: (context, snapshot) {
                      // if (snapshot.connectionState == ConnectionState.waiting) {
                      //   return const Center(child: CircularProgressIndicator());
                      // }

                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppAssets.noCompanies,
                              height: context.getSize.height * 0.156,
                            ),
                            h16,
                            Text(
                              "No Company listing found!\nContact Administrator.",
                              style: context.textStyle.s11.w400.dustyBlue,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      }

                      final companies = snapshot.data!;

                      final filteredCompanies = companies.where((company) {
                        final name = company.companyName?.toLowerCase() ?? "";
                        final id = company.id.toString();
                        final mobile = company.mobile?.toString() ?? "";

                        return name.contains(searchText) ||
                            id.contains(searchText) ||
                            mobile.contains(searchText);
                      }).toList();

                      if (filteredCompanies.isEmpty) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.noData,
                              height: context.getSize.height * 0.25,
                            ),
                            h4,
                            Text(
                              "No company listing found",
                              style:
                                  context.textStyle.s12.w400.bluishGray.roboto,
                            ),
                          ],
                        );
                      }

                      return ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemCount: filteredCompanies.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final company = filteredCompanies[index];
                          bool isSelected = selectedIndex == index;

                          return InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              Logger.logInfo(
                                "Selected company id...................................: ${company.id}",
                              );

                              setState(() {
                                selectedIndex = index;
                              });
                              context.pushNamed(
                                AppRouterConst.homeScreen,
                                extra: company,
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                                bottom: 12,
                                top: 12,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? ColorResources.indigoBlue
                                    : ColorResources.softLavender,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    company.id.toString(),
                                    style: isSelected
                                        ? context
                                              .textStyle
                                              .s12
                                              .w500
                                              .white
                                              .roboto
                                        : context
                                              .textStyle
                                              .s12
                                              .w500
                                              .indigoBlue
                                              .roboto,
                                  ),
                                  w20,

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          company.companyName ?? "-",
                                          style: isSelected
                                              ? context
                                                    .textStyle
                                                    .s14
                                                    .w600
                                                    .white
                                                    .roboto
                                              : context
                                                    .textStyle
                                                    .s14
                                                    .w600
                                                    .indigoBlue
                                                    .roboto,
                                        ),
                                        Text(
                                          company.address1!,
                                          style: context
                                              .textStyle
                                              .s10
                                              .dustyBlue
                                              .roboto,
                                        ),
                                      ],
                                    ),
                                  ),

                                  Text(
                                    company.mobile.toString(),
                                    style: context
                                        .textStyle
                                        .s12
                                        .w500
                                        .indigoBlue
                                        .roboto,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
