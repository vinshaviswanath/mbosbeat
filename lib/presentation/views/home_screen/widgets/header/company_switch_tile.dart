import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';

class CompanySwitchTile extends StatelessWidget {   
  final Company company;

  const CompanySwitchTile({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () =>
            context.pushNamed(AppRouterConst.userCompanySelectionScreen),
        child: Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFEDEBF5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                company.companyName ?? '',
                style: context.textStyle.s14.w400.dustyBlue,
              ),
              SvgPicture.asset(AppAssets.switchIcon),
            ],
          ),
        ),
      ),
    );
  }
}