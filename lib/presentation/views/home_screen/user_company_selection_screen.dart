import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';

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

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appDb = sl<AppDb>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.softLavender,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Select Company",
          style: context.textStyle.s20.indigoBlue.bold.roboto,
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 5),
          child: SizedBox.shrink(),
        ),
      ),

      /// 1️⃣ First stream → get logged-in user
      body: Column(
        children: [
          Padding(
            padding: .only(top: 8, bottom: 4, left: 16, right: 16),
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
                      return const Center(child: Text("No companies assigned"));
                    }

                    final companies = snapshot.data!;

                    return ListView.separated(
                      padding: .symmetric(horizontal: 16),
                      itemCount: companies.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final company = companies[index];
                        bool isSelected = selectedIndex == index;

                        return InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            Logger.logInfo("Selected company: ${company.id}");
                            setState(() {
                              selectedIndex = index;
                            });
                            context.pushNamed(AppRouterConst.homeScreen,extra: company);
                          },
                          child: Container(
                            padding: .only(
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
                                      ? context.textStyle.s12.w500.white.roboto
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
    );
  }
}
