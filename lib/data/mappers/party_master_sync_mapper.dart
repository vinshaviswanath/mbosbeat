import 'package:drift/drift.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/tables/partymaster_sync_tables.dart';
import 'package:mpos_beat/data/models/data/party_MasterSync_data.dart';
import 'package:mpos_beat/data/models/party_MasterSync_model.dart';
extension PartyMasterMapper on PartyMasterListData {
  PartyMasterCompanion toCompanion() {
    return PartyMasterCompanion(
      ledgerId: Value(ledgerId),
      ledgerName: Value(ledgerName),
      ledgerNameLocal: Value(ledgerNameLocal),
      aliasName: Value(aliasName),
      ledDesc: Value(ledDesc),
      groupId: Value(groupId),
      groupName: Value(nameValues.reverse[groupName]),
      isActive: Value(isActive),
      isDeleted: Value(isDeleted),
      creditLimit: Value(creditLimit.toDouble()),
      dueDays: Value(dueDays),
      address1: Value(address1),
      address2: Value(address2),
      address3: Value(address3),
      city: Value(cityValues.reverse[city]),
      stateId: Value(stateId),
      stateName: Value(stateNameValues.reverse[stateName]),
      countryId: Value(countryId),
      countryName: Value(countryNameValues.reverse[countryName]),
      pinCode: Value(pinCode),
      latitude: Value(latitude.toDouble()),
      longitude: Value(longitude.toDouble()),
      distanceFromCompanyKM: Value(distanceFromCompanyKm.toDouble()),
      mailingName: Value(mailingName),
      contactPerson: Value(contactPerson),
      mobile: Value(mobile),
      whatsappNo: Value(whatsappNo),
      email: Value(emailValues.reverse[email]?.trim()),
      taxType: Value(taxTypeValues.reverse[taxType]),
      taxNumber: Value(taxNumber),
      stateCode: Value(stateCode),
      closingBalance: Value(closingBalance),
      onAccountValue: Value(onAccountValue.toDouble()),
      routeId: Value(routeId),
      routeName: Value(nameValues.reverse[routeName]),
      lastSyncOn: Value(lastSyncOn),
      syncAction: Value(syncActionValues.reverse[syncAction]),
    );
  }
}
