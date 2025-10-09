import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/presentation/views/admin_user_management/add_company/widgets/add_company_widget.dart';

class AddCompanyScreen extends StatefulWidget {
  const AddCompanyScreen({
    super.key,
    required this.name,
    required this.companyName,
  });

  final String name;
  final String companyName;

  @override
  State<AddCompanyScreen> createState() => _AddCompanyScreenState();
}

class _AddCompanyScreenState extends State<AddCompanyScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> companies = [
    {"title": "KM Supermarket", "subtitle": "Chokli, Kannur"},
    {"title": "Jilbab Fantasy", "subtitle": "Palarivattom, Ernakulam"},
    {"title": "Kings Duty Paid Shop", "subtitle": "Good Shepherd Rd, Kottayam"},
    {
      "title": "Meyown Oils & Super Shoppee",
      "subtitle": "Kanjikuzhi, Kottayam",
    },
    {"title": "Dhanya Super Market", "subtitle": "Bishop Jerome Nagar, Kollam"},
    {"title": "DD Corner Stone", "subtitle": "Ernakulam, Ernakulam"},
    {"title": "Lifestyle Stores", "subtitle": "Collectorate, Kottayam"},
  ];

  final Set<int> selectedIndices = {};

  @override
  Widget build(BuildContext context) {
    final filteredCompanies = companies.where((company) {
      final query = _searchController.text.toLowerCase();
      return query.isEmpty || company["title"]!.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.cloudGray,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: ColorResources.indigoBlue,
          ),
        ),
        title: Text(
          "Add Company",
          style: context.textStyle.s20.indigoBlue.bold.roboto,
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                h12,
                Text(
                  widget.name,
                  style: context.textStyle.s12.w500.indigoBlue.roboto,
                ),
                h4,
                Text(
                  widget.companyName,
                  style: context.textStyle.s10.w400.dustyBlue.roboto,
                ),
                h12,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search Company",
                      hintStyle: context.textStyle.s12.w300.bluishGray.roboto,
                      fillColor: ColorResources.cloudGray,
                      filled: true,
                      suffixIcon: const Icon(
                        Icons.search,
                        color: ColorResources.bluishGray,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) => setState(() {}),
                  ),
                ),
                h10,
                Divider(thickness: 1, color: Colors.grey.shade200),
                h5,
              ],
            ),
          ),
          if (filteredCompanies.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  "No data available",
                  style: context.textStyle.s14.w500.bluishGray.roboto,
                ),
              ),
            ),
          if (filteredCompanies.isNotEmpty)
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final company = filteredCompanies[index];
                return AddCompanyWidget(
                  title: company["title"]!,
                  subtitle: company["subtitle"]!,
                  isSelected: selectedIndices.contains(index),
                  onTap: () {
                    setState(() {
                      if (selectedIndices.contains(index)) {
                        selectedIndices.remove(index);
                      } else {
                        selectedIndices.add(index);
                      }
                    });
                  },
                );
              }, childCount: filteredCompanies.length),
            ),
          if (filteredCompanies.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.getSize.width / 4,
                  vertical: 16,
                ),
                child: CustomButton(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonText: "Save",
                  isborderEnable: false,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
