import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/views/home_screen/transactions_container.dart';

class CustomerTransactions extends StatefulWidget {
  final TransactionArgs data;
  const CustomerTransactions({super.key, required this.data});

  @override
  State<CustomerTransactions> createState() => _CustomerTransactionsState();
}

class _CustomerTransactionsState extends State<CustomerTransactions> {
  TextEditingController searchController = TextEditingController();
  final AppDb appDb = sl<AppDb>();

  List<PartyMasterData> allParties = [];
  List<PartyMasterData> filteredParties = [];
  bool isLoading = true;
  Future<void> loadParties() async {
    final list = await appDb.partyMasterDao.getAllParties();

    setState(() {
      allParties = list;
      filteredParties = list;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadParties();

      searchController.addListener(() {
        final keyword = searchController.text.toLowerCase();

        setState(() {
          filteredParties = allParties.where((p) {
            final name = p.ledgerName?.toLowerCase() ?? "";
            final mobile = p.mobile ?? "";
            return name.contains(keyword) || mobile.contains(keyword);
          }).toList();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalization = context.l10n;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorResources.white,
      appBar: AppBar(
        title: Text(
          appLocalization.customer_transactions_screen_title,
          style: context.textStyle.roboto.s20.bold.indigoBlue,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          CircleAvatar(
            backgroundColor: ColorResources.indigoBlue,
            radius: 11,
            child: Icon(Icons.add, size: 18, color: ColorResources.white),
          ),
          w18,
        ],
      ),

      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomTextField(
              suffixIcon: const Icon(
                Icons.search,
                color: ColorResources.bluishGray,
              ),
              controller: searchController,
              hint:
                  appLocalization.customer_transactions_screen_search_customer,
              backgroundColor: ColorResources.lightGray,
              borderRadius: 12,
              borderColor: ColorResources.transparent,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          const Divider(
            color: ColorResources.lightGray,
            height: 3,
            thickness: 1.4,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : allParties.isEmpty
                ? Center(
                    child: Text(
                      "No customers found, Please Sync first..",
                      style: context.textStyle.s12.dustyBlue.roboto,
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredParties.length,

                    itemBuilder: (context, index) {
                      final party = filteredParties[index];
                      return GestureDetector(
                        onTap: () {
                          context.pushNamed(
                            AppRouterConst.transactionDetailpage,
                            extra: {"base": widget.data, "party": party},
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorResources.indigoBlue.withValues(
                                    alpha: 0.1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              party.ledgerName ?? "N/A",
                                              maxLines: 2,
                                              softWrap: true,
                                              style: context
                                                  .textStyle
                                                  .s12
                                                  .w600
                                                  .indigoBlue
                                                  .roboto,
                                            ),
                                          ),
                                          // Spacer(),
                                          Text(
                                            "Balance",
                                            style: context
                                                .textStyle
                                                .s09
                                                .dustyBlue
                                                .roboto,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height * 0.002),

                                      //contact person
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.person,
                                            color: ColorResources.bluishGray,
                                            size: 13,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "Contact Person : ${party.contactPerson}",
                                              style: context
                                                  .textStyle
                                                  .s08
                                                  .dustyBlue
                                                  .roboto,
                                              softWrap: true,
                                            ),
                                          ),
                                          //  Spacer(),
                                          Text(
                                            party.closingBalance.toString(),
                                            style: context
                                                .textStyle
                                                .s12
                                                .rosePink
                                                .roboto
                                                .w600,
                                          ),
                                        ],
                                      ),

                                      //mobile number
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.phone_android,
                                            color: ColorResources.bluishGray,
                                            size: 13,
                                          ),
                                          Text(
                                            "Mobile : ${party.mobile}",
                                            style: context
                                                .textStyle
                                                .s08
                                                .dustyBlue
                                                .roboto,
                                          ),
                                          Spacer(),
                                          const CircleAvatar(
                                            backgroundColor:
                                                ColorResources.freshgreen,

                                            radius: 10,
                                            child: Icon(
                                              Icons.call_rounded,
                                              size: 12,
                                              color: ColorResources.white,
                                            ),
                                          ),
                                          SizedBox(width: width * 0.01),
                                          const CircleAvatar(
                                            backgroundColor:
                                                ColorResources.dustyBlue,
                                            radius: 10,
                                            child: Icon(
                                              Icons.location_on_sharp,
                                              size: 12,
                                              color: ColorResources.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ), 
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.005,
                              ),
                              const Divider(
                                color: ColorResources.lightGray,
                                height: 3,
                                thickness: 1.4,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.005,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
