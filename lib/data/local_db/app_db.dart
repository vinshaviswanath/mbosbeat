// import 'dart:io';

// import 'package:drift/drift.dart';
// // These imports are used to open the database
// import 'package:drift/native.dart';
// import 'package:injectable/injectable.dart';
// import 'package:mpos_beat/data/local_db/daos/company_dao.dart';
// import 'package:mpos_beat/data/local_db/tables/company_tables.dart';
// import 'package:mpos_beat/data/local_db/tables/registration_details_tables.dart';
// import 'package:mpos_beat/data/local_db/tables/user_tables.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;
// import 'package:sqlite3/sqlite3.dart';
// import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
// part 'app_db.g.dart';

// @singleton
// @DriftDatabase(tables: [Users,RegistrationDetails,Companies],daos: [
//   CompanyDao,
// ])
// class AppDb extends _$AppDb {
//   AppDb() : super(_openConnection());

//   @override
//   int get schemaVersion => 1;
// }

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));

//     if (Platform.isAndroid) {
//       await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
//     }

//     final catcebase = (await getTemporaryDirectory()).path;

//     sqlite3.tempDirectory = catcebase;

//     return NativeDatabase.createInBackground(file);
//   });
// }

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:mpos_beat/data/local_db/daos/company_settings_dao/company_settings_dao.dart';
import 'package:mpos_beat/data/local_db/daos/godown_vehicles_dao/godown_vehicle_dao.dart';
import 'package:mpos_beat/data/local_db/daos/godown_voucher_type_dao/godown_voucher_type_dao.dart';
import 'package:mpos_beat/data/local_db/daos/item_master_dao/item_master_dao.dart';
import 'package:mpos_beat/data/local_db/daos/item_price_details_dao/item_price_details_dao.dart';
import 'package:mpos_beat/data/local_db/daos/partymaster_sync_dao/party_master_sync_dao.dart';
import 'package:mpos_beat/data/local_db/daos/price_lavel_dao/price_level_sync_dao.dart';
import 'package:mpos_beat/data/local_db/daos/route_dao/route_dao.dart';
import 'package:mpos_beat/data/local_db/daos/route_voucher_type_dao/route_voucher_type_dao.dart';
import 'package:mpos_beat/data/local_db/daos/sales_order_master_dao/sales_order_master_dao.dart';
import 'package:mpos_beat/data/local_db/daos/user_setting_dao/user_setting_dao.dart';
import 'package:mpos_beat/data/local_db/daos/voucher_type_dao/voucher_type_dao.dart';
import 'package:mpos_beat/data/local_db/tables/category_tables.dart';
import 'package:mpos_beat/data/local_db/tables/company_settings_tables.dart';
import 'package:mpos_beat/data/local_db/tables/godown_vehicles_tables.dart';
import 'package:mpos_beat/data/local_db/tables/godown_voucher_types_tables.dart';
import 'package:mpos_beat/data/local_db/tables/group_name_tables.dart';
import 'package:mpos_beat/data/local_db/tables/item_master_sync_tables.dart';
import 'package:mpos_beat/data/local_db/tables/item_price_details_tables.dart';
import 'package:mpos_beat/data/local_db/tables/partymaster_sync_tables.dart';
import 'package:mpos_beat/data/local_db/tables/price_level_tables.dart';
import 'package:mpos_beat/data/local_db/tables/receipt/receipt_entry_ledger_table.dart';
import 'package:mpos_beat/data/local_db/tables/receipt/receipt_entry_table.dart';
import 'package:mpos_beat/data/local_db/tables/route_voucher_types_tables.dart';
import 'package:mpos_beat/data/local_db/tables/routes_table.dart';
import 'package:mpos_beat/data/local_db/tables/sales/sale_auto_receipt_table.dart';
import 'package:mpos_beat/data/local_db/tables/sales/sales_details_table.dart';
import 'package:mpos_beat/data/local_db/tables/sales/sales_ledger_details_table.dart';
import 'package:mpos_beat/data/local_db/tables/sales/sales_master_table.dart';
import 'package:mpos_beat/data/local_db/tables/sales_order/sale_order_details_table.dart';
import 'package:mpos_beat/data/local_db/tables/sales_order/sale_order_ledger_details_table.dart';
import 'package:mpos_beat/data/local_db/tables/sales_order/sale_order_master_table.dart';
import 'package:mpos_beat/data/local_db/tables/sales_order/voucher_controls_table.dart';
import 'package:mpos_beat/data/local_db/tables/sales_return/sales_return_details_table.dart';
import 'package:mpos_beat/data/local_db/tables/sales_return/sales_return_ledger_details.dart';
import 'package:mpos_beat/data/local_db/tables/sales_return/sales_return_master_table.dart';
import 'package:mpos_beat/data/local_db/tables/user_settings_tables.dart';
import 'package:mpos_beat/data/local_db/tables/voucher_types_tables.dart';
import 'package:mpos_beat/presentation/views/transactions/sales_return/sales_return.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'tables/registration_details_tables.dart';
import 'tables/company_tables.dart';

import 'daos/company_dao/company_dao.dart';
import 'daos/registration_detail_dao/registration_detail_dao.dart';

part 'app_db.g.dart';

@DriftDatabase(
  tables: [
    // Users,
    RegistrationDetails,
    Companies,
    UserSettingsTable,
    VoucherTypes,
    GodownVoucherTypes,
    RouteVoucherTypes,
    CompanySettingsTable,
    GodownVehicles,
    GodownRoutes,
    PartyMaster,
    ItemMaster,
    PriceLevelsTable,
    ItemPriceDetailsTables,
    GroupNameTable,
    CategoryTable,
    SaleOrderDetailsTable,
    SaleOrderLedgerDetailsTable,
    SaleOrderMasterTable,
    SaleMasterTable,
    SaleDetailsTable,
    SaleLedgerDetailsTable,
    SaleAutoReceiptTable,
    SaleReturnMasterTable,
    SaleReturnDetailsTable,
    SaleReturnLedgerDetailsTable,
    ReceiptEntryTable,
    ReceiptEntryLedgerTable,
    VoucherControlTable,
  ],
  daos: [
    CompanyDao,
    // UserDao,
    RegistrationDetailDao,
    UserSettingsDao,
    VoucherTypesDao,
    GodownVoucherTypesDao,
    RouteVoucherTypesDao,
    CompanySettingsDao,
    GodownVehicleDao,
    RouteDao,
    PartyMasterDao,
    ItemMasterDao,
    PriceLevelDao,
    PriceListDetailsDao,
    SaleOrderMasterDao,
  ],
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 35;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      if (from < 4) {
        await m.createTable(companies);
        await m.alterTable(TableMigration(registrationDetails));
      }

      if (from < 5) {
        await m.createTable(userSettingsTable);
      }

      if (from < 6) {
        await m.createTable(voucherTypes);
      }

      // ✅ ADD THIS
      if (from < 7) {
        await m.createTable(godownVoucherTypes);
        await m.createTable(routeVoucherTypes);
      }

      if (from < 8) {
        await m.createTable(companySettingsTable);
      }

      if (from < 9) {
        await m.createTable(godownVehicles);
      }

      if (from < 10) {
        await m.createTable(godownRoutes);
      }

      if (from < 11) {
        await m.createTable(godownRoutes);

        // OPTIONAL but recommended
        await m.database.customStatement('DROP TABLE IF EXISTS routes');
      }
      if (from < 12) {
        await m.createTable(partyMaster);
      }
      if (from < 13) {
        await m.alterTable(
          TableMigration(
            companies,

            newColumns: [
              companies.companyLogoUrl,
              companies.companyProfileUpdated,
              companies.companyBankUpdated,
              companies.companyRegUpdated,
            ],
          ),
        );
      }
      if (from < 14) {
        await m.createTable(itemMaster);
      }
      if (from < 15) {
        await m.createTable(priceLevelsTable);
      }
      if (from < 16) {
        await m.createTable(itemPriceDetailsTables);
      }
      if (from < 17) {
        await m.deleteTable(itemPriceDetailsTables.actualTableName);
        await m.createTable(itemPriceDetailsTables);
      }
      if (from < 18) {
        await m.alterTable(
          TableMigration(partyMaster, newColumns: [partyMaster.priceList]),
        );
      }
      if (from < 19) {
        await m.addColumn(partyMaster, partyMaster.companyId);
        await m.addColumn(itemMaster, itemMaster.companyId);
      }

      if (from < 20) {
        await m.addColumn(priceLevelsTable, priceLevelsTable.companyId);
      }
      if (from < 21) {
        await m.createTable(groupNameTable);
        await m.createTable(categoryTable);
      }
      if (from < 22) {
        await m.createTable(saleOrderDetailsTable);
        await m.createTable(saleOrderLedgerDetailsTable);
        await m.createTable(saleOrderMasterTable);
      }
      if (from < 23) {
        await m.createTable(saleDetailsTable);
        await m.createTable(saleLedgerDetailsTable);
        await m.createTable(saleMasterTable);
      }
      if (from < 24) {
        await m.createTable(saleAutoReceiptTable);
      }
      if (from < 25) {
        await m.createTable(saleReturnMasterTable);
        await m.createTable(saleReturnDetailsTable);
        await m.createTable(saleReturnLedgerDetailsTable);
      }

      if (from < 28) {
        await m.createTable(receiptEntryTable);
        await m.createTable(receiptEntryLedgerTable);
      }
      if (from < 29) {
        await m.createTable(voucherControlTable);

        await m.addColumn(
          saleOrderMasterTable,
          saleOrderMasterTable.isCancelled,
        );
      }
      if (from < 30) {
        await m.addColumn(itemMaster, itemMaster.closingStock);
        await m.addColumn(itemMaster, itemMaster.cess);
        await m.addColumn(itemMaster, itemMaster.cost);
      }
      if (from < 31) {
        await m.database.customStatement(
          'CREATE INDEX IF NOT EXISTS idx_item_company '
          'ON item_master(company_id)',
        );

        await m.database.customStatement(
          'CREATE INDEX IF NOT EXISTS idx_item_category '
          'ON item_master(category_name)',
        );

        await m.database.customStatement(
          'CREATE INDEX IF NOT EXISTS idx_item_group '
          'ON item_master(group_name)',
        );

        await m.database.customStatement(
          'CREATE INDEX IF NOT EXISTS idx_item_name_nocase '
          'ON item_master(item_name COLLATE NOCASE)',
        );

        await m.database.customStatement(
          'CREATE INDEX IF NOT EXISTS idx_item_alias_nocase '
          'ON item_master(alias_name COLLATE NOCASE)',
        );

        await m.database.customStatement(
          'CREATE INDEX IF NOT EXISTS idx_item_part_number '
          'ON item_master(part_number)',
        );

        await m.database.customStatement(
          'CREATE INDEX IF NOT EXISTS idx_price_item '
          'ON item_price_details_tables(item_id, price_list)',
        );
      }

      if (from < 32) {
        await m.deleteTable(saleOrderLedgerDetailsTable.actualTableName);
        await m.createTable(saleOrderLedgerDetailsTable);
      }
      if (from < 34) {
        await m.addColumn(
          saleLedgerDetailsTable,
          saleLedgerDetailsTable.voucherName,
        );
        await m.addColumn(
          saleLedgerDetailsTable,
          saleLedgerDetailsTable.discountType,
        );

        await m.addColumn(
          saleLedgerDetailsTable,
          saleLedgerDetailsTable.discountAmount,
        );

        await m.addColumn(
          saleLedgerDetailsTable,
          saleLedgerDetailsTable.saleAmount,
        );

        await m.addColumn(
          saleLedgerDetailsTable,
          saleLedgerDetailsTable.couponDiscountAmount,
        );

        await m.addColumn(saleLedgerDetailsTable, saleLedgerDetailsTable.igst);

        await m.addColumn(saleLedgerDetailsTable, saleLedgerDetailsTable.cgst);

        await m.addColumn(saleLedgerDetailsTable, saleLedgerDetailsTable.sgst);

        await m.addColumn(saleLedgerDetailsTable, saleLedgerDetailsTable.cess);

        // ================= SALE RETURN LEDGER TABLE =================

        await m.addColumn(
          saleReturnLedgerDetailsTable,
          saleReturnLedgerDetailsTable.igst,
        );

        await m.addColumn(
          saleReturnLedgerDetailsTable,
          saleReturnLedgerDetailsTable.cgst,
        );

        await m.addColumn(
          saleReturnLedgerDetailsTable,
          saleReturnLedgerDetailsTable.sgst,
        );

        await m.addColumn(
          saleReturnLedgerDetailsTable,
          saleReturnLedgerDetailsTable.cess,
        );
      }

      if (from < 35) {
        await m.database.customStatement(
          'CREATE INDEX IF NOT EXISTS idx_item_company_name '
          'ON item_master(company_id, item_name COLLATE NOCASE)',
        );
      }
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final folder = await getApplicationDocumentsDirectory();
    final file = File(p.join(folder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    sqlite3.tempDirectory = (await getTemporaryDirectory()).path;

    return NativeDatabase.createInBackground(file);
  });
}
