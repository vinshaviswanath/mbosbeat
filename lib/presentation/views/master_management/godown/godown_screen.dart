import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/models/users_list_model.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_text_field.dart';
import 'package:mpos_beat/presentation/logic/user_management_provider.dart';
import 'package:mpos_beat/presentation/views/admin_home/admin_dashboard.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/list_card.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/user_manage/widgets/no_user_widget.dart';

class GodownScreen extends StatefulWidget {
  const GodownScreen({super.key});

  @override
  State<GodownScreen> createState() => _GodownScreenState();
}

class _GodownScreenState extends State<GodownScreen> {
  int? selectedIndex;
  int? optionIndex;
  final TextEditingController searchController = TextEditingController();
  bool firstLoad = true;
  GoRouterDelegate? routerDelegate;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   routerDelegate ??= GoRouter.of(context).routerDelegate;
  //   routerDelegate?.addListener(_routerListener);
  // }

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
    // WidgetsBinding.instance.addPostFrameCallback((_) => _loadData());
  }

  // @override
  // void dispose() {
  //   routerDelegate?.removeListener(_routerListener);
  //   searchController.removeListener(_onSearchChanged);
  //   searchController.dispose();
  //   super.dispose();
  // }

  // void _routerListener() {
  //   if (!mounted) return;
  //   final route = ModalRoute.of(context);
  //   if (route != null && route.isCurrent) {
  //     context.read<UserManagementProvider>().getAllUsersList(context);
  //   }
  // }

  // Future<void> _loadData() async {
  //   final provider = context.read<UserManagementProvider>();
  //   await provider
  //       .getAllCompanies(context: context)
  //       .then((_) => provider.getAllUsersList(context))
  //       .then((_) => provider.getDesignationList(context))
  //       .whenComplete(() {
  //         if (!mounted) return;
  //         setState(() => firstLoad = false);
  //       });
  // }

  void _onSearchChanged() => setState(() {});

  final groupList = ["Godown 1", "Godown 2", "Godown 3", "Godown 4", "Godown 5"];

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.l10n;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (context.canPop()) {
          context.pop();
        } else {
          context.pushReplacementNamed(AppRouterConst.adminDashboard);
        }
      },
      child: Consumer<UserManagementProvider>(
        builder: (context, provider, child) {
          return StreamBuilder<List<UserMasterList>>(
            stream: provider.usersStream,
            builder: (context, snapshot) {
              final users = snapshot.data ?? [];
              final query = searchController.text.toLowerCase();

              final filteredItems = groupList.where((item) {
                return query.isEmpty || (item).toLowerCase().contains(query);
              }).toList();

              return Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  backgroundColor: ColorResources.cloudGray,
                  leading: IconButton(
                    onPressed: () => context.pop(),
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
                  actions: [
                    InkWell(
                      onTap: () {
                        context.pushNamed(AppRouterConst.addGodown);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.add_circle,
                          color: ColorResources.indigoBlue,
                        ),
                      ),
                    ),
                  ],
                  bottom: PreferredSize(
                    preferredSize: Size(
                      MediaQuery.sizeOf(context).width,
                      context.getSize.height * 0.13,
                    ),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              Text(
                                "Gopakumar_23",
                                style: context.textStyle.w500.s12.indigoBlue,
                              ),
                              Text(
                                "KM Supermarket, Kannur",
                                style: context.textStyle.w400.s10.dustyBlue,
                              ),
                              h5,
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CustomTextField(
                              controller: searchController,
                              hint: 'Search Group',
                              suffixIcon: const Padding(
                                padding: EdgeInsets.all(12),
                                child: Icon(
                                  Icons.search,
                                  color: ColorResources.bluishGray,
                                  size: 24,
                                ),
                              ),
                              backgroundColor: ColorResources.lightGray,
                              borderRadius: 12,
                              hintColor: ColorResources.silverGray,
                              borderColor: ColorResources.transparent,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Divider(
                            thickness: 1,
                            color: ColorResources.black.withValues(alpha: 0.1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                body:
                    // provider.isLoading && firstLoad
                    //     ? const Center(child: CircularProgressIndicator())
                    //     :
                    CustomScrollView(
                      slivers: [
                        if (filteredItems.isNotEmpty)
                          SliverList(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              final item = filteredItems[index];
                              final isSelected = index == selectedIndex;

                              return GestureDetector(
                                onTap: () async {
                                  // await _handleUserTap(item, index, provider);
                                  setState(() => selectedIndex = index);
                                },
                                child: ListCard(
                                  suffixWidget: InkWell(
                                    onTap: () {},
                                    // item.isBlocked
                                    //     ? null
                                    //     : () async {
                                    //         await _showUserOptionsDialog(
                                    //           context,
                                    //           index,
                                    //           item,
                                    //           provider,
                                    //           appLocalizations,
                                    //         );
                                    //       },
                                    child: NavButton(
                                      color: isSelected
                                          ? ColorResources.amber
                                          : ColorResources.dustyBlue,
                                      svgArrowPath: AppAssets.arrowToRight,
                                    ),
                                  ),
                                  showIndex: false,
                                  isSelected: isSelected,
                                  // item: item,
                                  title: item,
                                  index: index,
                                ),
                              );
                            }, childCount: filteredItems.length),
                          ),
                        if (filteredItems.isEmpty)
                          const SliverFillRemaining(
                            hasScrollBody: false,
                            child: NoUserWidget(),
                          ),
                      ],
                    ),
              );
            },
          );
        },
      ),
    );
  }
}