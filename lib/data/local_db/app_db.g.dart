// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $RegistrationDetailsTable extends RegistrationDetails
    with TableInfo<$RegistrationDetailsTable, RegistrationDetail> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RegistrationDetailsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
    'customer_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mobileMeta = const VerificationMeta('mobile');
  @override
  late final GeneratedColumn<String> mobile = GeneratedColumn<String>(
    'mobile',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _whatsappNoMeta = const VerificationMeta(
    'whatsappNo',
  );
  @override
  late final GeneratedColumn<String> whatsappNo = GeneratedColumn<String>(
    'whatsapp_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _designationMeta = const VerificationMeta(
    'designation',
  );
  @override
  late final GeneratedColumn<String> designation = GeneratedColumn<String>(
    'designation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userActiveMeta = const VerificationMeta(
    'userActive',
  );
  @override
  late final GeneratedColumn<int> userActive = GeneratedColumn<int>(
    'user_active',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _companyNameMeta = const VerificationMeta(
    'companyName',
  );
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
    'company_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryIdMeta = const VerificationMeta(
    'countryId',
  );
  @override
  late final GeneratedColumn<int> countryId = GeneratedColumn<int>(
    'country_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stateIdMeta = const VerificationMeta(
    'stateId',
  );
  @override
  late final GeneratedColumn<int> stateId = GeneratedColumn<int>(
    'state_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activationTypeMeta = const VerificationMeta(
    'activationType',
  );
  @override
  late final GeneratedColumn<String> activationType = GeneratedColumn<String>(
    'activation_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expiryDateMeta = const VerificationMeta(
    'expiryDate',
  );
  @override
  late final GeneratedColumn<DateTime> expiryDate = GeneratedColumn<DateTime>(
    'expiry_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _custActiveMeta = const VerificationMeta(
    'custActive',
  );
  @override
  late final GeneratedColumn<int> custActive = GeneratedColumn<int>(
    'cust_active',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
    'token',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dbNameMeta = const VerificationMeta('dbName');
  @override
  late final GeneratedColumn<String> dbName = GeneratedColumn<String>(
    'db_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    userId,
    customerId,
    fullName,
    mobile,
    whatsappNo,
    email,
    designation,
    username,
    userActive,
    companyName,
    address,
    countryId,
    stateId,
    activationType,
    expiryDate,
    custActive,
    token,
    dbName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'registration_details';
  @override
  VerificationContext validateIntegrity(
    Insertable<RegistrationDetail> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    }
    if (data.containsKey('mobile')) {
      context.handle(
        _mobileMeta,
        mobile.isAcceptableOrUnknown(data['mobile']!, _mobileMeta),
      );
    }
    if (data.containsKey('whatsapp_no')) {
      context.handle(
        _whatsappNoMeta,
        whatsappNo.isAcceptableOrUnknown(data['whatsapp_no']!, _whatsappNoMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('designation')) {
      context.handle(
        _designationMeta,
        designation.isAcceptableOrUnknown(
          data['designation']!,
          _designationMeta,
        ),
      );
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    }
    if (data.containsKey('user_active')) {
      context.handle(
        _userActiveMeta,
        userActive.isAcceptableOrUnknown(data['user_active']!, _userActiveMeta),
      );
    }
    if (data.containsKey('company_name')) {
      context.handle(
        _companyNameMeta,
        companyName.isAcceptableOrUnknown(
          data['company_name']!,
          _companyNameMeta,
        ),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('country_id')) {
      context.handle(
        _countryIdMeta,
        countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta),
      );
    }
    if (data.containsKey('state_id')) {
      context.handle(
        _stateIdMeta,
        stateId.isAcceptableOrUnknown(data['state_id']!, _stateIdMeta),
      );
    }
    if (data.containsKey('activation_type')) {
      context.handle(
        _activationTypeMeta,
        activationType.isAcceptableOrUnknown(
          data['activation_type']!,
          _activationTypeMeta,
        ),
      );
    }
    if (data.containsKey('expiry_date')) {
      context.handle(
        _expiryDateMeta,
        expiryDate.isAcceptableOrUnknown(data['expiry_date']!, _expiryDateMeta),
      );
    }
    if (data.containsKey('cust_active')) {
      context.handle(
        _custActiveMeta,
        custActive.isAcceptableOrUnknown(data['cust_active']!, _custActiveMeta),
      );
    }
    if (data.containsKey('token')) {
      context.handle(
        _tokenMeta,
        token.isAcceptableOrUnknown(data['token']!, _tokenMeta),
      );
    }
    if (data.containsKey('db_name')) {
      context.handle(
        _dbNameMeta,
        dbName.isAcceptableOrUnknown(data['db_name']!, _dbNameMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  RegistrationDetail map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RegistrationDetail(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}customer_id'],
      ),
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      ),
      mobile: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mobile'],
      ),
      whatsappNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}whatsapp_no'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      designation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}designation'],
      ),
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      ),
      userActive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_active'],
      ),
      companyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_name'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      countryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}country_id'],
      ),
      stateId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}state_id'],
      ),
      activationType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}activation_type'],
      ),
      expiryDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expiry_date'],
      ),
      custActive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cust_active'],
      ),
      token: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}token'],
      ),
      dbName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}db_name'],
      ),
    );
  }

  @override
  $RegistrationDetailsTable createAlias(String alias) {
    return $RegistrationDetailsTable(attachedDatabase, alias);
  }
}

class RegistrationDetail extends DataClass
    implements Insertable<RegistrationDetail> {
  final int userId;
  final int? customerId;
  final String? fullName;
  final String? mobile;
  final String? whatsappNo;
  final String? email;
  final String? designation;
  final String? username;
  final int? userActive;
  final String? companyName;
  final String? address;
  final int? countryId;
  final int? stateId;
  final String? activationType;
  final DateTime? expiryDate;
  final int? custActive;
  final String? token;
  final String? dbName;
  const RegistrationDetail({
    required this.userId,
    this.customerId,
    this.fullName,
    this.mobile,
    this.whatsappNo,
    this.email,
    this.designation,
    this.username,
    this.userActive,
    this.companyName,
    this.address,
    this.countryId,
    this.stateId,
    this.activationType,
    this.expiryDate,
    this.custActive,
    this.token,
    this.dbName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    if (!nullToAbsent || customerId != null) {
      map['customer_id'] = Variable<int>(customerId);
    }
    if (!nullToAbsent || fullName != null) {
      map['full_name'] = Variable<String>(fullName);
    }
    if (!nullToAbsent || mobile != null) {
      map['mobile'] = Variable<String>(mobile);
    }
    if (!nullToAbsent || whatsappNo != null) {
      map['whatsapp_no'] = Variable<String>(whatsappNo);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || designation != null) {
      map['designation'] = Variable<String>(designation);
    }
    if (!nullToAbsent || username != null) {
      map['username'] = Variable<String>(username);
    }
    if (!nullToAbsent || userActive != null) {
      map['user_active'] = Variable<int>(userActive);
    }
    if (!nullToAbsent || companyName != null) {
      map['company_name'] = Variable<String>(companyName);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<int>(countryId);
    }
    if (!nullToAbsent || stateId != null) {
      map['state_id'] = Variable<int>(stateId);
    }
    if (!nullToAbsent || activationType != null) {
      map['activation_type'] = Variable<String>(activationType);
    }
    if (!nullToAbsent || expiryDate != null) {
      map['expiry_date'] = Variable<DateTime>(expiryDate);
    }
    if (!nullToAbsent || custActive != null) {
      map['cust_active'] = Variable<int>(custActive);
    }
    if (!nullToAbsent || token != null) {
      map['token'] = Variable<String>(token);
    }
    if (!nullToAbsent || dbName != null) {
      map['db_name'] = Variable<String>(dbName);
    }
    return map;
  }

  RegistrationDetailsCompanion toCompanion(bool nullToAbsent) {
    return RegistrationDetailsCompanion(
      userId: Value(userId),
      customerId: customerId == null && nullToAbsent
          ? const Value.absent()
          : Value(customerId),
      fullName: fullName == null && nullToAbsent
          ? const Value.absent()
          : Value(fullName),
      mobile: mobile == null && nullToAbsent
          ? const Value.absent()
          : Value(mobile),
      whatsappNo: whatsappNo == null && nullToAbsent
          ? const Value.absent()
          : Value(whatsappNo),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      designation: designation == null && nullToAbsent
          ? const Value.absent()
          : Value(designation),
      username: username == null && nullToAbsent
          ? const Value.absent()
          : Value(username),
      userActive: userActive == null && nullToAbsent
          ? const Value.absent()
          : Value(userActive),
      companyName: companyName == null && nullToAbsent
          ? const Value.absent()
          : Value(companyName),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      stateId: stateId == null && nullToAbsent
          ? const Value.absent()
          : Value(stateId),
      activationType: activationType == null && nullToAbsent
          ? const Value.absent()
          : Value(activationType),
      expiryDate: expiryDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expiryDate),
      custActive: custActive == null && nullToAbsent
          ? const Value.absent()
          : Value(custActive),
      token: token == null && nullToAbsent
          ? const Value.absent()
          : Value(token),
      dbName: dbName == null && nullToAbsent
          ? const Value.absent()
          : Value(dbName),
    );
  }

  factory RegistrationDetail.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RegistrationDetail(
      userId: serializer.fromJson<int>(json['userId']),
      customerId: serializer.fromJson<int?>(json['customerId']),
      fullName: serializer.fromJson<String?>(json['fullName']),
      mobile: serializer.fromJson<String?>(json['mobile']),
      whatsappNo: serializer.fromJson<String?>(json['whatsappNo']),
      email: serializer.fromJson<String?>(json['email']),
      designation: serializer.fromJson<String?>(json['designation']),
      username: serializer.fromJson<String?>(json['username']),
      userActive: serializer.fromJson<int?>(json['userActive']),
      companyName: serializer.fromJson<String?>(json['companyName']),
      address: serializer.fromJson<String?>(json['address']),
      countryId: serializer.fromJson<int?>(json['countryId']),
      stateId: serializer.fromJson<int?>(json['stateId']),
      activationType: serializer.fromJson<String?>(json['activationType']),
      expiryDate: serializer.fromJson<DateTime?>(json['expiryDate']),
      custActive: serializer.fromJson<int?>(json['custActive']),
      token: serializer.fromJson<String?>(json['token']),
      dbName: serializer.fromJson<String?>(json['dbName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'customerId': serializer.toJson<int?>(customerId),
      'fullName': serializer.toJson<String?>(fullName),
      'mobile': serializer.toJson<String?>(mobile),
      'whatsappNo': serializer.toJson<String?>(whatsappNo),
      'email': serializer.toJson<String?>(email),
      'designation': serializer.toJson<String?>(designation),
      'username': serializer.toJson<String?>(username),
      'userActive': serializer.toJson<int?>(userActive),
      'companyName': serializer.toJson<String?>(companyName),
      'address': serializer.toJson<String?>(address),
      'countryId': serializer.toJson<int?>(countryId),
      'stateId': serializer.toJson<int?>(stateId),
      'activationType': serializer.toJson<String?>(activationType),
      'expiryDate': serializer.toJson<DateTime?>(expiryDate),
      'custActive': serializer.toJson<int?>(custActive),
      'token': serializer.toJson<String?>(token),
      'dbName': serializer.toJson<String?>(dbName),
    };
  }

  RegistrationDetail copyWith({
    int? userId,
    Value<int?> customerId = const Value.absent(),
    Value<String?> fullName = const Value.absent(),
    Value<String?> mobile = const Value.absent(),
    Value<String?> whatsappNo = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> designation = const Value.absent(),
    Value<String?> username = const Value.absent(),
    Value<int?> userActive = const Value.absent(),
    Value<String?> companyName = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<int?> countryId = const Value.absent(),
    Value<int?> stateId = const Value.absent(),
    Value<String?> activationType = const Value.absent(),
    Value<DateTime?> expiryDate = const Value.absent(),
    Value<int?> custActive = const Value.absent(),
    Value<String?> token = const Value.absent(),
    Value<String?> dbName = const Value.absent(),
  }) => RegistrationDetail(
    userId: userId ?? this.userId,
    customerId: customerId.present ? customerId.value : this.customerId,
    fullName: fullName.present ? fullName.value : this.fullName,
    mobile: mobile.present ? mobile.value : this.mobile,
    whatsappNo: whatsappNo.present ? whatsappNo.value : this.whatsappNo,
    email: email.present ? email.value : this.email,
    designation: designation.present ? designation.value : this.designation,
    username: username.present ? username.value : this.username,
    userActive: userActive.present ? userActive.value : this.userActive,
    companyName: companyName.present ? companyName.value : this.companyName,
    address: address.present ? address.value : this.address,
    countryId: countryId.present ? countryId.value : this.countryId,
    stateId: stateId.present ? stateId.value : this.stateId,
    activationType: activationType.present
        ? activationType.value
        : this.activationType,
    expiryDate: expiryDate.present ? expiryDate.value : this.expiryDate,
    custActive: custActive.present ? custActive.value : this.custActive,
    token: token.present ? token.value : this.token,
    dbName: dbName.present ? dbName.value : this.dbName,
  );
  RegistrationDetail copyWithCompanion(RegistrationDetailsCompanion data) {
    return RegistrationDetail(
      userId: data.userId.present ? data.userId.value : this.userId,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      mobile: data.mobile.present ? data.mobile.value : this.mobile,
      whatsappNo: data.whatsappNo.present
          ? data.whatsappNo.value
          : this.whatsappNo,
      email: data.email.present ? data.email.value : this.email,
      designation: data.designation.present
          ? data.designation.value
          : this.designation,
      username: data.username.present ? data.username.value : this.username,
      userActive: data.userActive.present
          ? data.userActive.value
          : this.userActive,
      companyName: data.companyName.present
          ? data.companyName.value
          : this.companyName,
      address: data.address.present ? data.address.value : this.address,
      countryId: data.countryId.present ? data.countryId.value : this.countryId,
      stateId: data.stateId.present ? data.stateId.value : this.stateId,
      activationType: data.activationType.present
          ? data.activationType.value
          : this.activationType,
      expiryDate: data.expiryDate.present
          ? data.expiryDate.value
          : this.expiryDate,
      custActive: data.custActive.present
          ? data.custActive.value
          : this.custActive,
      token: data.token.present ? data.token.value : this.token,
      dbName: data.dbName.present ? data.dbName.value : this.dbName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RegistrationDetail(')
          ..write('userId: $userId, ')
          ..write('customerId: $customerId, ')
          ..write('fullName: $fullName, ')
          ..write('mobile: $mobile, ')
          ..write('whatsappNo: $whatsappNo, ')
          ..write('email: $email, ')
          ..write('designation: $designation, ')
          ..write('username: $username, ')
          ..write('userActive: $userActive, ')
          ..write('companyName: $companyName, ')
          ..write('address: $address, ')
          ..write('countryId: $countryId, ')
          ..write('stateId: $stateId, ')
          ..write('activationType: $activationType, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('custActive: $custActive, ')
          ..write('token: $token, ')
          ..write('dbName: $dbName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    userId,
    customerId,
    fullName,
    mobile,
    whatsappNo,
    email,
    designation,
    username,
    userActive,
    companyName,
    address,
    countryId,
    stateId,
    activationType,
    expiryDate,
    custActive,
    token,
    dbName,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegistrationDetail &&
          other.userId == this.userId &&
          other.customerId == this.customerId &&
          other.fullName == this.fullName &&
          other.mobile == this.mobile &&
          other.whatsappNo == this.whatsappNo &&
          other.email == this.email &&
          other.designation == this.designation &&
          other.username == this.username &&
          other.userActive == this.userActive &&
          other.companyName == this.companyName &&
          other.address == this.address &&
          other.countryId == this.countryId &&
          other.stateId == this.stateId &&
          other.activationType == this.activationType &&
          other.expiryDate == this.expiryDate &&
          other.custActive == this.custActive &&
          other.token == this.token &&
          other.dbName == this.dbName);
}

class RegistrationDetailsCompanion extends UpdateCompanion<RegistrationDetail> {
  final Value<int> userId;
  final Value<int?> customerId;
  final Value<String?> fullName;
  final Value<String?> mobile;
  final Value<String?> whatsappNo;
  final Value<String?> email;
  final Value<String?> designation;
  final Value<String?> username;
  final Value<int?> userActive;
  final Value<String?> companyName;
  final Value<String?> address;
  final Value<int?> countryId;
  final Value<int?> stateId;
  final Value<String?> activationType;
  final Value<DateTime?> expiryDate;
  final Value<int?> custActive;
  final Value<String?> token;
  final Value<String?> dbName;
  const RegistrationDetailsCompanion({
    this.userId = const Value.absent(),
    this.customerId = const Value.absent(),
    this.fullName = const Value.absent(),
    this.mobile = const Value.absent(),
    this.whatsappNo = const Value.absent(),
    this.email = const Value.absent(),
    this.designation = const Value.absent(),
    this.username = const Value.absent(),
    this.userActive = const Value.absent(),
    this.companyName = const Value.absent(),
    this.address = const Value.absent(),
    this.countryId = const Value.absent(),
    this.stateId = const Value.absent(),
    this.activationType = const Value.absent(),
    this.expiryDate = const Value.absent(),
    this.custActive = const Value.absent(),
    this.token = const Value.absent(),
    this.dbName = const Value.absent(),
  });
  RegistrationDetailsCompanion.insert({
    this.userId = const Value.absent(),
    this.customerId = const Value.absent(),
    this.fullName = const Value.absent(),
    this.mobile = const Value.absent(),
    this.whatsappNo = const Value.absent(),
    this.email = const Value.absent(),
    this.designation = const Value.absent(),
    this.username = const Value.absent(),
    this.userActive = const Value.absent(),
    this.companyName = const Value.absent(),
    this.address = const Value.absent(),
    this.countryId = const Value.absent(),
    this.stateId = const Value.absent(),
    this.activationType = const Value.absent(),
    this.expiryDate = const Value.absent(),
    this.custActive = const Value.absent(),
    this.token = const Value.absent(),
    this.dbName = const Value.absent(),
  });
  static Insertable<RegistrationDetail> custom({
    Expression<int>? userId,
    Expression<int>? customerId,
    Expression<String>? fullName,
    Expression<String>? mobile,
    Expression<String>? whatsappNo,
    Expression<String>? email,
    Expression<String>? designation,
    Expression<String>? username,
    Expression<int>? userActive,
    Expression<String>? companyName,
    Expression<String>? address,
    Expression<int>? countryId,
    Expression<int>? stateId,
    Expression<String>? activationType,
    Expression<DateTime>? expiryDate,
    Expression<int>? custActive,
    Expression<String>? token,
    Expression<String>? dbName,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (customerId != null) 'customer_id': customerId,
      if (fullName != null) 'full_name': fullName,
      if (mobile != null) 'mobile': mobile,
      if (whatsappNo != null) 'whatsapp_no': whatsappNo,
      if (email != null) 'email': email,
      if (designation != null) 'designation': designation,
      if (username != null) 'username': username,
      if (userActive != null) 'user_active': userActive,
      if (companyName != null) 'company_name': companyName,
      if (address != null) 'address': address,
      if (countryId != null) 'country_id': countryId,
      if (stateId != null) 'state_id': stateId,
      if (activationType != null) 'activation_type': activationType,
      if (expiryDate != null) 'expiry_date': expiryDate,
      if (custActive != null) 'cust_active': custActive,
      if (token != null) 'token': token,
      if (dbName != null) 'db_name': dbName,
    });
  }

  RegistrationDetailsCompanion copyWith({
    Value<int>? userId,
    Value<int?>? customerId,
    Value<String?>? fullName,
    Value<String?>? mobile,
    Value<String?>? whatsappNo,
    Value<String?>? email,
    Value<String?>? designation,
    Value<String?>? username,
    Value<int?>? userActive,
    Value<String?>? companyName,
    Value<String?>? address,
    Value<int?>? countryId,
    Value<int?>? stateId,
    Value<String?>? activationType,
    Value<DateTime?>? expiryDate,
    Value<int?>? custActive,
    Value<String?>? token,
    Value<String?>? dbName,
  }) {
    return RegistrationDetailsCompanion(
      userId: userId ?? this.userId,
      customerId: customerId ?? this.customerId,
      fullName: fullName ?? this.fullName,
      mobile: mobile ?? this.mobile,
      whatsappNo: whatsappNo ?? this.whatsappNo,
      email: email ?? this.email,
      designation: designation ?? this.designation,
      username: username ?? this.username,
      userActive: userActive ?? this.userActive,
      companyName: companyName ?? this.companyName,
      address: address ?? this.address,
      countryId: countryId ?? this.countryId,
      stateId: stateId ?? this.stateId,
      activationType: activationType ?? this.activationType,
      expiryDate: expiryDate ?? this.expiryDate,
      custActive: custActive ?? this.custActive,
      token: token ?? this.token,
      dbName: dbName ?? this.dbName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (mobile.present) {
      map['mobile'] = Variable<String>(mobile.value);
    }
    if (whatsappNo.present) {
      map['whatsapp_no'] = Variable<String>(whatsappNo.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (designation.present) {
      map['designation'] = Variable<String>(designation.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (userActive.present) {
      map['user_active'] = Variable<int>(userActive.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<int>(countryId.value);
    }
    if (stateId.present) {
      map['state_id'] = Variable<int>(stateId.value);
    }
    if (activationType.present) {
      map['activation_type'] = Variable<String>(activationType.value);
    }
    if (expiryDate.present) {
      map['expiry_date'] = Variable<DateTime>(expiryDate.value);
    }
    if (custActive.present) {
      map['cust_active'] = Variable<int>(custActive.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (dbName.present) {
      map['db_name'] = Variable<String>(dbName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegistrationDetailsCompanion(')
          ..write('userId: $userId, ')
          ..write('customerId: $customerId, ')
          ..write('fullName: $fullName, ')
          ..write('mobile: $mobile, ')
          ..write('whatsappNo: $whatsappNo, ')
          ..write('email: $email, ')
          ..write('designation: $designation, ')
          ..write('username: $username, ')
          ..write('userActive: $userActive, ')
          ..write('companyName: $companyName, ')
          ..write('address: $address, ')
          ..write('countryId: $countryId, ')
          ..write('stateId: $stateId, ')
          ..write('activationType: $activationType, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('custActive: $custActive, ')
          ..write('token: $token, ')
          ..write('dbName: $dbName')
          ..write(')'))
        .toString();
  }
}

class $CompaniesTable extends Companies
    with TableInfo<$CompaniesTable, Company> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompaniesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _companyNameMeta = const VerificationMeta(
    'companyName',
  );
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
    'company_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mailingNameMeta = const VerificationMeta(
    'mailingName',
  );
  @override
  late final GeneratedColumn<String> mailingName = GeneratedColumn<String>(
    'mailing_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _localNameMeta = const VerificationMeta(
    'localName',
  );
  @override
  late final GeneratedColumn<String> localName = GeneratedColumn<String>(
    'local_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _companyCodeMeta = const VerificationMeta(
    'companyCode',
  );
  @override
  late final GeneratedColumn<String> companyCode = GeneratedColumn<String>(
    'company_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _address1Meta = const VerificationMeta(
    'address1',
  );
  @override
  late final GeneratedColumn<String> address1 = GeneratedColumn<String>(
    'address1',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _address2Meta = const VerificationMeta(
    'address2',
  );
  @override
  late final GeneratedColumn<String> address2 = GeneratedColumn<String>(
    'address2',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _address3Meta = const VerificationMeta(
    'address3',
  );
  @override
  late final GeneratedColumn<String> address3 = GeneratedColumn<String>(
    'address3',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pinCodeMeta = const VerificationMeta(
    'pinCode',
  );
  @override
  late final GeneratedColumn<String> pinCode = GeneratedColumn<String>(
    'pin_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _officeNoMeta = const VerificationMeta(
    'officeNo',
  );
  @override
  late final GeneratedColumn<String> officeNo = GeneratedColumn<String>(
    'office_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mobileMeta = const VerificationMeta('mobile');
  @override
  late final GeneratedColumn<String> mobile = GeneratedColumn<String>(
    'mobile',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _regTypeMeta = const VerificationMeta(
    'regType',
  );
  @override
  late final GeneratedColumn<String> regType = GeneratedColumn<String>(
    'reg_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fssaiNoMeta = const VerificationMeta(
    'fssaiNo',
  );
  @override
  late final GeneratedColumn<String> fssaiNo = GeneratedColumn<String>(
    'fssai_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _finYearStartMeta = const VerificationMeta(
    'finYearStart',
  );
  @override
  late final GeneratedColumn<DateTime> finYearStart = GeneratedColumn<DateTime>(
    'fin_year_start',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voucherRepeatMeta = const VerificationMeta(
    'voucherRepeat',
  );
  @override
  late final GeneratedColumn<String> voucherRepeat = GeneratedColumn<String>(
    'voucher_repeat',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSyncDateMeta = const VerificationMeta(
    'lastSyncDate',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncDate = GeneratedColumn<DateTime>(
    'last_sync_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createByMeta = const VerificationMeta(
    'createBy',
  );
  @override
  late final GeneratedColumn<int> createBy = GeneratedColumn<int>(
    'create_by',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdOnMeta = const VerificationMeta(
    'createdOn',
  );
  @override
  late final GeneratedColumn<DateTime> createdOn = GeneratedColumn<DateTime>(
    'created_on',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdFromMeta = const VerificationMeta(
    'createdFrom',
  );
  @override
  late final GeneratedColumn<String> createdFrom = GeneratedColumn<String>(
    'created_from',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bankNameMeta = const VerificationMeta(
    'bankName',
  );
  @override
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
    'bank_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bankBranchMeta = const VerificationMeta(
    'bankBranch',
  );
  @override
  late final GeneratedColumn<String> bankBranch = GeneratedColumn<String>(
    'bank_branch',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _accNoMeta = const VerificationMeta('accNo');
  @override
  late final GeneratedColumn<String> accNo = GeneratedColumn<String>(
    'acc_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ifscCodeMeta = const VerificationMeta(
    'ifscCode',
  );
  @override
  late final GeneratedColumn<String> ifscCode = GeneratedColumn<String>(
    'ifsc_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gPayNumberMeta = const VerificationMeta(
    'gPayNumber',
  );
  @override
  late final GeneratedColumn<String> gPayNumber = GeneratedColumn<String>(
    'g_pay_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _upiAddressMeta = const VerificationMeta(
    'upiAddress',
  );
  @override
  late final GeneratedColumn<String> upiAddress = GeneratedColumn<String>(
    'upi_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _payeeNameMeta = const VerificationMeta(
    'payeeName',
  );
  @override
  late final GeneratedColumn<String> payeeName = GeneratedColumn<String>(
    'payee_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hasIntegrationSettingsMeta =
      const VerificationMeta('hasIntegrationSettings');
  @override
  late final GeneratedColumn<int> hasIntegrationSettings = GeneratedColumn<int>(
    'has_integration_settings',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hasVoucherTypeSettingsMeta =
      const VerificationMeta('hasVoucherTypeSettings');
  @override
  late final GeneratedColumn<int> hasVoucherTypeSettings = GeneratedColumn<int>(
    'has_voucher_type_settings',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hasCompanySettingsMeta =
      const VerificationMeta('hasCompanySettings');
  @override
  late final GeneratedColumn<int> hasCompanySettings = GeneratedColumn<int>(
    'has_company_settings',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userListMeta = const VerificationMeta(
    'userList',
  );
  @override
  late final GeneratedColumn<String> userList = GeneratedColumn<String>(
    'user_list',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _integrationTypeMeta = const VerificationMeta(
    'integrationType',
  );
  @override
  late final GeneratedColumn<String> integrationType = GeneratedColumn<String>(
    'integration_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serialNumberMeta = const VerificationMeta(
    'serialNumber',
  );
  @override
  late final GeneratedColumn<String> serialNumber = GeneratedColumn<String>(
    'serial_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stockInCloudMeta = const VerificationMeta(
    'stockInCloud',
  );
  @override
  late final GeneratedColumn<String> stockInCloud = GeneratedColumn<String>(
    'stock_in_cloud',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _registrationNoMeta = const VerificationMeta(
    'registrationNo',
  );
  @override
  late final GeneratedColumn<String> registrationNo = GeneratedColumn<String>(
    'registration_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vchNumberingModeMeta = const VerificationMeta(
    'vchNumberingMode',
  );
  @override
  late final GeneratedColumn<String> vchNumberingMode = GeneratedColumn<String>(
    'vch_numbering_mode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _companyLogoUrlMeta = const VerificationMeta(
    'companyLogoUrl',
  );
  @override
  late final GeneratedColumn<String> companyLogoUrl = GeneratedColumn<String>(
    'company_logo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _companyProfileUpdatedMeta =
      const VerificationMeta('companyProfileUpdated');
  @override
  late final GeneratedColumn<bool> companyProfileUpdated =
      GeneratedColumn<bool>(
        'company_profile_updated',
        aliasedName,
        true,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("company_profile_updated" IN (0, 1))',
        ),
      );
  static const VerificationMeta _companyBankUpdatedMeta =
      const VerificationMeta('companyBankUpdated');
  @override
  late final GeneratedColumn<bool> companyBankUpdated = GeneratedColumn<bool>(
    'company_bank_updated',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("company_bank_updated" IN (0, 1))',
    ),
  );
  static const VerificationMeta _companyRegUpdatedMeta = const VerificationMeta(
    'companyRegUpdated',
  );
  @override
  late final GeneratedColumn<bool> companyRegUpdated = GeneratedColumn<bool>(
    'company_reg_updated',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("company_reg_updated" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    companyName,
    mailingName,
    localName,
    companyCode,
    address1,
    address2,
    address3,
    pinCode,
    country,
    state,
    officeNo,
    mobile,
    email,
    regType,
    fssaiNo,
    finYearStart,
    voucherRepeat,
    lastSyncDate,
    createBy,
    createdOn,
    createdFrom,
    bankName,
    bankBranch,
    accNo,
    ifscCode,
    gPayNumber,
    upiAddress,
    payeeName,
    currency,
    hasIntegrationSettings,
    hasVoucherTypeSettings,
    hasCompanySettings,
    userList,
    integrationType,
    serialNumber,
    stockInCloud,
    registrationNo,
    vchNumberingMode,
    companyLogoUrl,
    companyProfileUpdated,
    companyBankUpdated,
    companyRegUpdated,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'companies';
  @override
  VerificationContext validateIntegrity(
    Insertable<Company> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('company_name')) {
      context.handle(
        _companyNameMeta,
        companyName.isAcceptableOrUnknown(
          data['company_name']!,
          _companyNameMeta,
        ),
      );
    }
    if (data.containsKey('mailing_name')) {
      context.handle(
        _mailingNameMeta,
        mailingName.isAcceptableOrUnknown(
          data['mailing_name']!,
          _mailingNameMeta,
        ),
      );
    }
    if (data.containsKey('local_name')) {
      context.handle(
        _localNameMeta,
        localName.isAcceptableOrUnknown(data['local_name']!, _localNameMeta),
      );
    }
    if (data.containsKey('company_code')) {
      context.handle(
        _companyCodeMeta,
        companyCode.isAcceptableOrUnknown(
          data['company_code']!,
          _companyCodeMeta,
        ),
      );
    }
    if (data.containsKey('address1')) {
      context.handle(
        _address1Meta,
        address1.isAcceptableOrUnknown(data['address1']!, _address1Meta),
      );
    }
    if (data.containsKey('address2')) {
      context.handle(
        _address2Meta,
        address2.isAcceptableOrUnknown(data['address2']!, _address2Meta),
      );
    }
    if (data.containsKey('address3')) {
      context.handle(
        _address3Meta,
        address3.isAcceptableOrUnknown(data['address3']!, _address3Meta),
      );
    }
    if (data.containsKey('pin_code')) {
      context.handle(
        _pinCodeMeta,
        pinCode.isAcceptableOrUnknown(data['pin_code']!, _pinCodeMeta),
      );
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    }
    if (data.containsKey('office_no')) {
      context.handle(
        _officeNoMeta,
        officeNo.isAcceptableOrUnknown(data['office_no']!, _officeNoMeta),
      );
    }
    if (data.containsKey('mobile')) {
      context.handle(
        _mobileMeta,
        mobile.isAcceptableOrUnknown(data['mobile']!, _mobileMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('reg_type')) {
      context.handle(
        _regTypeMeta,
        regType.isAcceptableOrUnknown(data['reg_type']!, _regTypeMeta),
      );
    }
    if (data.containsKey('fssai_no')) {
      context.handle(
        _fssaiNoMeta,
        fssaiNo.isAcceptableOrUnknown(data['fssai_no']!, _fssaiNoMeta),
      );
    }
    if (data.containsKey('fin_year_start')) {
      context.handle(
        _finYearStartMeta,
        finYearStart.isAcceptableOrUnknown(
          data['fin_year_start']!,
          _finYearStartMeta,
        ),
      );
    }
    if (data.containsKey('voucher_repeat')) {
      context.handle(
        _voucherRepeatMeta,
        voucherRepeat.isAcceptableOrUnknown(
          data['voucher_repeat']!,
          _voucherRepeatMeta,
        ),
      );
    }
    if (data.containsKey('last_sync_date')) {
      context.handle(
        _lastSyncDateMeta,
        lastSyncDate.isAcceptableOrUnknown(
          data['last_sync_date']!,
          _lastSyncDateMeta,
        ),
      );
    }
    if (data.containsKey('create_by')) {
      context.handle(
        _createByMeta,
        createBy.isAcceptableOrUnknown(data['create_by']!, _createByMeta),
      );
    }
    if (data.containsKey('created_on')) {
      context.handle(
        _createdOnMeta,
        createdOn.isAcceptableOrUnknown(data['created_on']!, _createdOnMeta),
      );
    }
    if (data.containsKey('created_from')) {
      context.handle(
        _createdFromMeta,
        createdFrom.isAcceptableOrUnknown(
          data['created_from']!,
          _createdFromMeta,
        ),
      );
    }
    if (data.containsKey('bank_name')) {
      context.handle(
        _bankNameMeta,
        bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta),
      );
    }
    if (data.containsKey('bank_branch')) {
      context.handle(
        _bankBranchMeta,
        bankBranch.isAcceptableOrUnknown(data['bank_branch']!, _bankBranchMeta),
      );
    }
    if (data.containsKey('acc_no')) {
      context.handle(
        _accNoMeta,
        accNo.isAcceptableOrUnknown(data['acc_no']!, _accNoMeta),
      );
    }
    if (data.containsKey('ifsc_code')) {
      context.handle(
        _ifscCodeMeta,
        ifscCode.isAcceptableOrUnknown(data['ifsc_code']!, _ifscCodeMeta),
      );
    }
    if (data.containsKey('g_pay_number')) {
      context.handle(
        _gPayNumberMeta,
        gPayNumber.isAcceptableOrUnknown(
          data['g_pay_number']!,
          _gPayNumberMeta,
        ),
      );
    }
    if (data.containsKey('upi_address')) {
      context.handle(
        _upiAddressMeta,
        upiAddress.isAcceptableOrUnknown(data['upi_address']!, _upiAddressMeta),
      );
    }
    if (data.containsKey('payee_name')) {
      context.handle(
        _payeeNameMeta,
        payeeName.isAcceptableOrUnknown(data['payee_name']!, _payeeNameMeta),
      );
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('has_integration_settings')) {
      context.handle(
        _hasIntegrationSettingsMeta,
        hasIntegrationSettings.isAcceptableOrUnknown(
          data['has_integration_settings']!,
          _hasIntegrationSettingsMeta,
        ),
      );
    }
    if (data.containsKey('has_voucher_type_settings')) {
      context.handle(
        _hasVoucherTypeSettingsMeta,
        hasVoucherTypeSettings.isAcceptableOrUnknown(
          data['has_voucher_type_settings']!,
          _hasVoucherTypeSettingsMeta,
        ),
      );
    }
    if (data.containsKey('has_company_settings')) {
      context.handle(
        _hasCompanySettingsMeta,
        hasCompanySettings.isAcceptableOrUnknown(
          data['has_company_settings']!,
          _hasCompanySettingsMeta,
        ),
      );
    }
    if (data.containsKey('user_list')) {
      context.handle(
        _userListMeta,
        userList.isAcceptableOrUnknown(data['user_list']!, _userListMeta),
      );
    }
    if (data.containsKey('integration_type')) {
      context.handle(
        _integrationTypeMeta,
        integrationType.isAcceptableOrUnknown(
          data['integration_type']!,
          _integrationTypeMeta,
        ),
      );
    }
    if (data.containsKey('serial_number')) {
      context.handle(
        _serialNumberMeta,
        serialNumber.isAcceptableOrUnknown(
          data['serial_number']!,
          _serialNumberMeta,
        ),
      );
    }
    if (data.containsKey('stock_in_cloud')) {
      context.handle(
        _stockInCloudMeta,
        stockInCloud.isAcceptableOrUnknown(
          data['stock_in_cloud']!,
          _stockInCloudMeta,
        ),
      );
    }
    if (data.containsKey('registration_no')) {
      context.handle(
        _registrationNoMeta,
        registrationNo.isAcceptableOrUnknown(
          data['registration_no']!,
          _registrationNoMeta,
        ),
      );
    }
    if (data.containsKey('vch_numbering_mode')) {
      context.handle(
        _vchNumberingModeMeta,
        vchNumberingMode.isAcceptableOrUnknown(
          data['vch_numbering_mode']!,
          _vchNumberingModeMeta,
        ),
      );
    }
    if (data.containsKey('company_logo_url')) {
      context.handle(
        _companyLogoUrlMeta,
        companyLogoUrl.isAcceptableOrUnknown(
          data['company_logo_url']!,
          _companyLogoUrlMeta,
        ),
      );
    }
    if (data.containsKey('company_profile_updated')) {
      context.handle(
        _companyProfileUpdatedMeta,
        companyProfileUpdated.isAcceptableOrUnknown(
          data['company_profile_updated']!,
          _companyProfileUpdatedMeta,
        ),
      );
    }
    if (data.containsKey('company_bank_updated')) {
      context.handle(
        _companyBankUpdatedMeta,
        companyBankUpdated.isAcceptableOrUnknown(
          data['company_bank_updated']!,
          _companyBankUpdatedMeta,
        ),
      );
    }
    if (data.containsKey('company_reg_updated')) {
      context.handle(
        _companyRegUpdatedMeta,
        companyRegUpdated.isAcceptableOrUnknown(
          data['company_reg_updated']!,
          _companyRegUpdatedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Company map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Company(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
      companyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_name'],
      ),
      mailingName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mailing_name'],
      ),
      localName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_name'],
      ),
      companyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_code'],
      ),
      address1: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address1'],
      ),
      address2: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address2'],
      ),
      address3: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address3'],
      ),
      pinCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pin_code'],
      ),
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      ),
      state: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state'],
      ),
      officeNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}office_no'],
      ),
      mobile: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mobile'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      regType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reg_type'],
      ),
      fssaiNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fssai_no'],
      ),
      finYearStart: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fin_year_start'],
      ),
      voucherRepeat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}voucher_repeat'],
      ),
      lastSyncDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_sync_date'],
      ),
      createBy: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}create_by'],
      ),
      createdOn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_on'],
      ),
      createdFrom: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_from'],
      ),
      bankName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_name'],
      ),
      bankBranch: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_branch'],
      ),
      accNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}acc_no'],
      ),
      ifscCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ifsc_code'],
      ),
      gPayNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}g_pay_number'],
      ),
      upiAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}upi_address'],
      ),
      payeeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payee_name'],
      ),
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      ),
      hasIntegrationSettings: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}has_integration_settings'],
      ),
      hasVoucherTypeSettings: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}has_voucher_type_settings'],
      ),
      hasCompanySettings: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}has_company_settings'],
      ),
      userList: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_list'],
      ),
      integrationType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}integration_type'],
      ),
      serialNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}serial_number'],
      ),
      stockInCloud: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stock_in_cloud'],
      ),
      registrationNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}registration_no'],
      ),
      vchNumberingMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vch_numbering_mode'],
      ),
      companyLogoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_logo_url'],
      ),
      companyProfileUpdated: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}company_profile_updated'],
      ),
      companyBankUpdated: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}company_bank_updated'],
      ),
      companyRegUpdated: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}company_reg_updated'],
      ),
    );
  }

  @override
  $CompaniesTable createAlias(String alias) {
    return $CompaniesTable(attachedDatabase, alias);
  }
}

class Company extends DataClass implements Insertable<Company> {
  final int? id;
  final String? companyName;
  final String? mailingName;
  final String? localName;
  final String? companyCode;
  final String? address1;
  final String? address2;
  final String? address3;
  final String? pinCode;
  final String? country;
  final String? state;
  final String? officeNo;
  final String? mobile;
  final String? email;
  final String? regType;
  final String? fssaiNo;
  final DateTime? finYearStart;
  final String? voucherRepeat;
  final DateTime? lastSyncDate;
  final int? createBy;
  final DateTime? createdOn;
  final String? createdFrom;
  final String? bankName;
  final String? bankBranch;
  final String? accNo;
  final String? ifscCode;
  final String? gPayNumber;
  final String? upiAddress;
  final String? payeeName;
  final String? currency;
  final int? hasIntegrationSettings;
  final int? hasVoucherTypeSettings;
  final int? hasCompanySettings;
  final String? userList;
  final String? integrationType;
  final String? serialNumber;
  final String? stockInCloud;
  final String? registrationNo;
  final String? vchNumberingMode;
  final String? companyLogoUrl;
  final bool? companyProfileUpdated;
  final bool? companyBankUpdated;
  final bool? companyRegUpdated;
  const Company({
    this.id,
    this.companyName,
    this.mailingName,
    this.localName,
    this.companyCode,
    this.address1,
    this.address2,
    this.address3,
    this.pinCode,
    this.country,
    this.state,
    this.officeNo,
    this.mobile,
    this.email,
    this.regType,
    this.fssaiNo,
    this.finYearStart,
    this.voucherRepeat,
    this.lastSyncDate,
    this.createBy,
    this.createdOn,
    this.createdFrom,
    this.bankName,
    this.bankBranch,
    this.accNo,
    this.ifscCode,
    this.gPayNumber,
    this.upiAddress,
    this.payeeName,
    this.currency,
    this.hasIntegrationSettings,
    this.hasVoucherTypeSettings,
    this.hasCompanySettings,
    this.userList,
    this.integrationType,
    this.serialNumber,
    this.stockInCloud,
    this.registrationNo,
    this.vchNumberingMode,
    this.companyLogoUrl,
    this.companyProfileUpdated,
    this.companyBankUpdated,
    this.companyRegUpdated,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || companyName != null) {
      map['company_name'] = Variable<String>(companyName);
    }
    if (!nullToAbsent || mailingName != null) {
      map['mailing_name'] = Variable<String>(mailingName);
    }
    if (!nullToAbsent || localName != null) {
      map['local_name'] = Variable<String>(localName);
    }
    if (!nullToAbsent || companyCode != null) {
      map['company_code'] = Variable<String>(companyCode);
    }
    if (!nullToAbsent || address1 != null) {
      map['address1'] = Variable<String>(address1);
    }
    if (!nullToAbsent || address2 != null) {
      map['address2'] = Variable<String>(address2);
    }
    if (!nullToAbsent || address3 != null) {
      map['address3'] = Variable<String>(address3);
    }
    if (!nullToAbsent || pinCode != null) {
      map['pin_code'] = Variable<String>(pinCode);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || officeNo != null) {
      map['office_no'] = Variable<String>(officeNo);
    }
    if (!nullToAbsent || mobile != null) {
      map['mobile'] = Variable<String>(mobile);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || regType != null) {
      map['reg_type'] = Variable<String>(regType);
    }
    if (!nullToAbsent || fssaiNo != null) {
      map['fssai_no'] = Variable<String>(fssaiNo);
    }
    if (!nullToAbsent || finYearStart != null) {
      map['fin_year_start'] = Variable<DateTime>(finYearStart);
    }
    if (!nullToAbsent || voucherRepeat != null) {
      map['voucher_repeat'] = Variable<String>(voucherRepeat);
    }
    if (!nullToAbsent || lastSyncDate != null) {
      map['last_sync_date'] = Variable<DateTime>(lastSyncDate);
    }
    if (!nullToAbsent || createBy != null) {
      map['create_by'] = Variable<int>(createBy);
    }
    if (!nullToAbsent || createdOn != null) {
      map['created_on'] = Variable<DateTime>(createdOn);
    }
    if (!nullToAbsent || createdFrom != null) {
      map['created_from'] = Variable<String>(createdFrom);
    }
    if (!nullToAbsent || bankName != null) {
      map['bank_name'] = Variable<String>(bankName);
    }
    if (!nullToAbsent || bankBranch != null) {
      map['bank_branch'] = Variable<String>(bankBranch);
    }
    if (!nullToAbsent || accNo != null) {
      map['acc_no'] = Variable<String>(accNo);
    }
    if (!nullToAbsent || ifscCode != null) {
      map['ifsc_code'] = Variable<String>(ifscCode);
    }
    if (!nullToAbsent || gPayNumber != null) {
      map['g_pay_number'] = Variable<String>(gPayNumber);
    }
    if (!nullToAbsent || upiAddress != null) {
      map['upi_address'] = Variable<String>(upiAddress);
    }
    if (!nullToAbsent || payeeName != null) {
      map['payee_name'] = Variable<String>(payeeName);
    }
    if (!nullToAbsent || currency != null) {
      map['currency'] = Variable<String>(currency);
    }
    if (!nullToAbsent || hasIntegrationSettings != null) {
      map['has_integration_settings'] = Variable<int>(hasIntegrationSettings);
    }
    if (!nullToAbsent || hasVoucherTypeSettings != null) {
      map['has_voucher_type_settings'] = Variable<int>(hasVoucherTypeSettings);
    }
    if (!nullToAbsent || hasCompanySettings != null) {
      map['has_company_settings'] = Variable<int>(hasCompanySettings);
    }
    if (!nullToAbsent || userList != null) {
      map['user_list'] = Variable<String>(userList);
    }
    if (!nullToAbsent || integrationType != null) {
      map['integration_type'] = Variable<String>(integrationType);
    }
    if (!nullToAbsent || serialNumber != null) {
      map['serial_number'] = Variable<String>(serialNumber);
    }
    if (!nullToAbsent || stockInCloud != null) {
      map['stock_in_cloud'] = Variable<String>(stockInCloud);
    }
    if (!nullToAbsent || registrationNo != null) {
      map['registration_no'] = Variable<String>(registrationNo);
    }
    if (!nullToAbsent || vchNumberingMode != null) {
      map['vch_numbering_mode'] = Variable<String>(vchNumberingMode);
    }
    if (!nullToAbsent || companyLogoUrl != null) {
      map['company_logo_url'] = Variable<String>(companyLogoUrl);
    }
    if (!nullToAbsent || companyProfileUpdated != null) {
      map['company_profile_updated'] = Variable<bool>(companyProfileUpdated);
    }
    if (!nullToAbsent || companyBankUpdated != null) {
      map['company_bank_updated'] = Variable<bool>(companyBankUpdated);
    }
    if (!nullToAbsent || companyRegUpdated != null) {
      map['company_reg_updated'] = Variable<bool>(companyRegUpdated);
    }
    return map;
  }

  CompaniesCompanion toCompanion(bool nullToAbsent) {
    return CompaniesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      companyName: companyName == null && nullToAbsent
          ? const Value.absent()
          : Value(companyName),
      mailingName: mailingName == null && nullToAbsent
          ? const Value.absent()
          : Value(mailingName),
      localName: localName == null && nullToAbsent
          ? const Value.absent()
          : Value(localName),
      companyCode: companyCode == null && nullToAbsent
          ? const Value.absent()
          : Value(companyCode),
      address1: address1 == null && nullToAbsent
          ? const Value.absent()
          : Value(address1),
      address2: address2 == null && nullToAbsent
          ? const Value.absent()
          : Value(address2),
      address3: address3 == null && nullToAbsent
          ? const Value.absent()
          : Value(address3),
      pinCode: pinCode == null && nullToAbsent
          ? const Value.absent()
          : Value(pinCode),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      state: state == null && nullToAbsent
          ? const Value.absent()
          : Value(state),
      officeNo: officeNo == null && nullToAbsent
          ? const Value.absent()
          : Value(officeNo),
      mobile: mobile == null && nullToAbsent
          ? const Value.absent()
          : Value(mobile),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      regType: regType == null && nullToAbsent
          ? const Value.absent()
          : Value(regType),
      fssaiNo: fssaiNo == null && nullToAbsent
          ? const Value.absent()
          : Value(fssaiNo),
      finYearStart: finYearStart == null && nullToAbsent
          ? const Value.absent()
          : Value(finYearStart),
      voucherRepeat: voucherRepeat == null && nullToAbsent
          ? const Value.absent()
          : Value(voucherRepeat),
      lastSyncDate: lastSyncDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncDate),
      createBy: createBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createBy),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
      createdFrom: createdFrom == null && nullToAbsent
          ? const Value.absent()
          : Value(createdFrom),
      bankName: bankName == null && nullToAbsent
          ? const Value.absent()
          : Value(bankName),
      bankBranch: bankBranch == null && nullToAbsent
          ? const Value.absent()
          : Value(bankBranch),
      accNo: accNo == null && nullToAbsent
          ? const Value.absent()
          : Value(accNo),
      ifscCode: ifscCode == null && nullToAbsent
          ? const Value.absent()
          : Value(ifscCode),
      gPayNumber: gPayNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(gPayNumber),
      upiAddress: upiAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(upiAddress),
      payeeName: payeeName == null && nullToAbsent
          ? const Value.absent()
          : Value(payeeName),
      currency: currency == null && nullToAbsent
          ? const Value.absent()
          : Value(currency),
      hasIntegrationSettings: hasIntegrationSettings == null && nullToAbsent
          ? const Value.absent()
          : Value(hasIntegrationSettings),
      hasVoucherTypeSettings: hasVoucherTypeSettings == null && nullToAbsent
          ? const Value.absent()
          : Value(hasVoucherTypeSettings),
      hasCompanySettings: hasCompanySettings == null && nullToAbsent
          ? const Value.absent()
          : Value(hasCompanySettings),
      userList: userList == null && nullToAbsent
          ? const Value.absent()
          : Value(userList),
      integrationType: integrationType == null && nullToAbsent
          ? const Value.absent()
          : Value(integrationType),
      serialNumber: serialNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(serialNumber),
      stockInCloud: stockInCloud == null && nullToAbsent
          ? const Value.absent()
          : Value(stockInCloud),
      registrationNo: registrationNo == null && nullToAbsent
          ? const Value.absent()
          : Value(registrationNo),
      vchNumberingMode: vchNumberingMode == null && nullToAbsent
          ? const Value.absent()
          : Value(vchNumberingMode),
      companyLogoUrl: companyLogoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(companyLogoUrl),
      companyProfileUpdated: companyProfileUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(companyProfileUpdated),
      companyBankUpdated: companyBankUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(companyBankUpdated),
      companyRegUpdated: companyRegUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(companyRegUpdated),
    );
  }

  factory Company.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Company(
      id: serializer.fromJson<int?>(json['id']),
      companyName: serializer.fromJson<String?>(json['companyName']),
      mailingName: serializer.fromJson<String?>(json['mailingName']),
      localName: serializer.fromJson<String?>(json['localName']),
      companyCode: serializer.fromJson<String?>(json['companyCode']),
      address1: serializer.fromJson<String?>(json['address1']),
      address2: serializer.fromJson<String?>(json['address2']),
      address3: serializer.fromJson<String?>(json['address3']),
      pinCode: serializer.fromJson<String?>(json['pinCode']),
      country: serializer.fromJson<String?>(json['country']),
      state: serializer.fromJson<String?>(json['state']),
      officeNo: serializer.fromJson<String?>(json['officeNo']),
      mobile: serializer.fromJson<String?>(json['mobile']),
      email: serializer.fromJson<String?>(json['email']),
      regType: serializer.fromJson<String?>(json['regType']),
      fssaiNo: serializer.fromJson<String?>(json['fssaiNo']),
      finYearStart: serializer.fromJson<DateTime?>(json['finYearStart']),
      voucherRepeat: serializer.fromJson<String?>(json['voucherRepeat']),
      lastSyncDate: serializer.fromJson<DateTime?>(json['lastSyncDate']),
      createBy: serializer.fromJson<int?>(json['createBy']),
      createdOn: serializer.fromJson<DateTime?>(json['createdOn']),
      createdFrom: serializer.fromJson<String?>(json['createdFrom']),
      bankName: serializer.fromJson<String?>(json['bankName']),
      bankBranch: serializer.fromJson<String?>(json['bankBranch']),
      accNo: serializer.fromJson<String?>(json['accNo']),
      ifscCode: serializer.fromJson<String?>(json['ifscCode']),
      gPayNumber: serializer.fromJson<String?>(json['gPayNumber']),
      upiAddress: serializer.fromJson<String?>(json['upiAddress']),
      payeeName: serializer.fromJson<String?>(json['payeeName']),
      currency: serializer.fromJson<String?>(json['currency']),
      hasIntegrationSettings: serializer.fromJson<int?>(
        json['hasIntegrationSettings'],
      ),
      hasVoucherTypeSettings: serializer.fromJson<int?>(
        json['hasVoucherTypeSettings'],
      ),
      hasCompanySettings: serializer.fromJson<int?>(json['hasCompanySettings']),
      userList: serializer.fromJson<String?>(json['userList']),
      integrationType: serializer.fromJson<String?>(json['integrationType']),
      serialNumber: serializer.fromJson<String?>(json['serialNumber']),
      stockInCloud: serializer.fromJson<String?>(json['stockInCloud']),
      registrationNo: serializer.fromJson<String?>(json['registrationNo']),
      vchNumberingMode: serializer.fromJson<String?>(json['vchNumberingMode']),
      companyLogoUrl: serializer.fromJson<String?>(json['companyLogoUrl']),
      companyProfileUpdated: serializer.fromJson<bool?>(
        json['companyProfileUpdated'],
      ),
      companyBankUpdated: serializer.fromJson<bool?>(
        json['companyBankUpdated'],
      ),
      companyRegUpdated: serializer.fromJson<bool?>(json['companyRegUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'companyName': serializer.toJson<String?>(companyName),
      'mailingName': serializer.toJson<String?>(mailingName),
      'localName': serializer.toJson<String?>(localName),
      'companyCode': serializer.toJson<String?>(companyCode),
      'address1': serializer.toJson<String?>(address1),
      'address2': serializer.toJson<String?>(address2),
      'address3': serializer.toJson<String?>(address3),
      'pinCode': serializer.toJson<String?>(pinCode),
      'country': serializer.toJson<String?>(country),
      'state': serializer.toJson<String?>(state),
      'officeNo': serializer.toJson<String?>(officeNo),
      'mobile': serializer.toJson<String?>(mobile),
      'email': serializer.toJson<String?>(email),
      'regType': serializer.toJson<String?>(regType),
      'fssaiNo': serializer.toJson<String?>(fssaiNo),
      'finYearStart': serializer.toJson<DateTime?>(finYearStart),
      'voucherRepeat': serializer.toJson<String?>(voucherRepeat),
      'lastSyncDate': serializer.toJson<DateTime?>(lastSyncDate),
      'createBy': serializer.toJson<int?>(createBy),
      'createdOn': serializer.toJson<DateTime?>(createdOn),
      'createdFrom': serializer.toJson<String?>(createdFrom),
      'bankName': serializer.toJson<String?>(bankName),
      'bankBranch': serializer.toJson<String?>(bankBranch),
      'accNo': serializer.toJson<String?>(accNo),
      'ifscCode': serializer.toJson<String?>(ifscCode),
      'gPayNumber': serializer.toJson<String?>(gPayNumber),
      'upiAddress': serializer.toJson<String?>(upiAddress),
      'payeeName': serializer.toJson<String?>(payeeName),
      'currency': serializer.toJson<String?>(currency),
      'hasIntegrationSettings': serializer.toJson<int?>(hasIntegrationSettings),
      'hasVoucherTypeSettings': serializer.toJson<int?>(hasVoucherTypeSettings),
      'hasCompanySettings': serializer.toJson<int?>(hasCompanySettings),
      'userList': serializer.toJson<String?>(userList),
      'integrationType': serializer.toJson<String?>(integrationType),
      'serialNumber': serializer.toJson<String?>(serialNumber),
      'stockInCloud': serializer.toJson<String?>(stockInCloud),
      'registrationNo': serializer.toJson<String?>(registrationNo),
      'vchNumberingMode': serializer.toJson<String?>(vchNumberingMode),
      'companyLogoUrl': serializer.toJson<String?>(companyLogoUrl),
      'companyProfileUpdated': serializer.toJson<bool?>(companyProfileUpdated),
      'companyBankUpdated': serializer.toJson<bool?>(companyBankUpdated),
      'companyRegUpdated': serializer.toJson<bool?>(companyRegUpdated),
    };
  }

  Company copyWith({
    Value<int?> id = const Value.absent(),
    Value<String?> companyName = const Value.absent(),
    Value<String?> mailingName = const Value.absent(),
    Value<String?> localName = const Value.absent(),
    Value<String?> companyCode = const Value.absent(),
    Value<String?> address1 = const Value.absent(),
    Value<String?> address2 = const Value.absent(),
    Value<String?> address3 = const Value.absent(),
    Value<String?> pinCode = const Value.absent(),
    Value<String?> country = const Value.absent(),
    Value<String?> state = const Value.absent(),
    Value<String?> officeNo = const Value.absent(),
    Value<String?> mobile = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> regType = const Value.absent(),
    Value<String?> fssaiNo = const Value.absent(),
    Value<DateTime?> finYearStart = const Value.absent(),
    Value<String?> voucherRepeat = const Value.absent(),
    Value<DateTime?> lastSyncDate = const Value.absent(),
    Value<int?> createBy = const Value.absent(),
    Value<DateTime?> createdOn = const Value.absent(),
    Value<String?> createdFrom = const Value.absent(),
    Value<String?> bankName = const Value.absent(),
    Value<String?> bankBranch = const Value.absent(),
    Value<String?> accNo = const Value.absent(),
    Value<String?> ifscCode = const Value.absent(),
    Value<String?> gPayNumber = const Value.absent(),
    Value<String?> upiAddress = const Value.absent(),
    Value<String?> payeeName = const Value.absent(),
    Value<String?> currency = const Value.absent(),
    Value<int?> hasIntegrationSettings = const Value.absent(),
    Value<int?> hasVoucherTypeSettings = const Value.absent(),
    Value<int?> hasCompanySettings = const Value.absent(),
    Value<String?> userList = const Value.absent(),
    Value<String?> integrationType = const Value.absent(),
    Value<String?> serialNumber = const Value.absent(),
    Value<String?> stockInCloud = const Value.absent(),
    Value<String?> registrationNo = const Value.absent(),
    Value<String?> vchNumberingMode = const Value.absent(),
    Value<String?> companyLogoUrl = const Value.absent(),
    Value<bool?> companyProfileUpdated = const Value.absent(),
    Value<bool?> companyBankUpdated = const Value.absent(),
    Value<bool?> companyRegUpdated = const Value.absent(),
  }) => Company(
    id: id.present ? id.value : this.id,
    companyName: companyName.present ? companyName.value : this.companyName,
    mailingName: mailingName.present ? mailingName.value : this.mailingName,
    localName: localName.present ? localName.value : this.localName,
    companyCode: companyCode.present ? companyCode.value : this.companyCode,
    address1: address1.present ? address1.value : this.address1,
    address2: address2.present ? address2.value : this.address2,
    address3: address3.present ? address3.value : this.address3,
    pinCode: pinCode.present ? pinCode.value : this.pinCode,
    country: country.present ? country.value : this.country,
    state: state.present ? state.value : this.state,
    officeNo: officeNo.present ? officeNo.value : this.officeNo,
    mobile: mobile.present ? mobile.value : this.mobile,
    email: email.present ? email.value : this.email,
    regType: regType.present ? regType.value : this.regType,
    fssaiNo: fssaiNo.present ? fssaiNo.value : this.fssaiNo,
    finYearStart: finYearStart.present ? finYearStart.value : this.finYearStart,
    voucherRepeat: voucherRepeat.present
        ? voucherRepeat.value
        : this.voucherRepeat,
    lastSyncDate: lastSyncDate.present ? lastSyncDate.value : this.lastSyncDate,
    createBy: createBy.present ? createBy.value : this.createBy,
    createdOn: createdOn.present ? createdOn.value : this.createdOn,
    createdFrom: createdFrom.present ? createdFrom.value : this.createdFrom,
    bankName: bankName.present ? bankName.value : this.bankName,
    bankBranch: bankBranch.present ? bankBranch.value : this.bankBranch,
    accNo: accNo.present ? accNo.value : this.accNo,
    ifscCode: ifscCode.present ? ifscCode.value : this.ifscCode,
    gPayNumber: gPayNumber.present ? gPayNumber.value : this.gPayNumber,
    upiAddress: upiAddress.present ? upiAddress.value : this.upiAddress,
    payeeName: payeeName.present ? payeeName.value : this.payeeName,
    currency: currency.present ? currency.value : this.currency,
    hasIntegrationSettings: hasIntegrationSettings.present
        ? hasIntegrationSettings.value
        : this.hasIntegrationSettings,
    hasVoucherTypeSettings: hasVoucherTypeSettings.present
        ? hasVoucherTypeSettings.value
        : this.hasVoucherTypeSettings,
    hasCompanySettings: hasCompanySettings.present
        ? hasCompanySettings.value
        : this.hasCompanySettings,
    userList: userList.present ? userList.value : this.userList,
    integrationType: integrationType.present
        ? integrationType.value
        : this.integrationType,
    serialNumber: serialNumber.present ? serialNumber.value : this.serialNumber,
    stockInCloud: stockInCloud.present ? stockInCloud.value : this.stockInCloud,
    registrationNo: registrationNo.present
        ? registrationNo.value
        : this.registrationNo,
    vchNumberingMode: vchNumberingMode.present
        ? vchNumberingMode.value
        : this.vchNumberingMode,
    companyLogoUrl: companyLogoUrl.present
        ? companyLogoUrl.value
        : this.companyLogoUrl,
    companyProfileUpdated: companyProfileUpdated.present
        ? companyProfileUpdated.value
        : this.companyProfileUpdated,
    companyBankUpdated: companyBankUpdated.present
        ? companyBankUpdated.value
        : this.companyBankUpdated,
    companyRegUpdated: companyRegUpdated.present
        ? companyRegUpdated.value
        : this.companyRegUpdated,
  );
  Company copyWithCompanion(CompaniesCompanion data) {
    return Company(
      id: data.id.present ? data.id.value : this.id,
      companyName: data.companyName.present
          ? data.companyName.value
          : this.companyName,
      mailingName: data.mailingName.present
          ? data.mailingName.value
          : this.mailingName,
      localName: data.localName.present ? data.localName.value : this.localName,
      companyCode: data.companyCode.present
          ? data.companyCode.value
          : this.companyCode,
      address1: data.address1.present ? data.address1.value : this.address1,
      address2: data.address2.present ? data.address2.value : this.address2,
      address3: data.address3.present ? data.address3.value : this.address3,
      pinCode: data.pinCode.present ? data.pinCode.value : this.pinCode,
      country: data.country.present ? data.country.value : this.country,
      state: data.state.present ? data.state.value : this.state,
      officeNo: data.officeNo.present ? data.officeNo.value : this.officeNo,
      mobile: data.mobile.present ? data.mobile.value : this.mobile,
      email: data.email.present ? data.email.value : this.email,
      regType: data.regType.present ? data.regType.value : this.regType,
      fssaiNo: data.fssaiNo.present ? data.fssaiNo.value : this.fssaiNo,
      finYearStart: data.finYearStart.present
          ? data.finYearStart.value
          : this.finYearStart,
      voucherRepeat: data.voucherRepeat.present
          ? data.voucherRepeat.value
          : this.voucherRepeat,
      lastSyncDate: data.lastSyncDate.present
          ? data.lastSyncDate.value
          : this.lastSyncDate,
      createBy: data.createBy.present ? data.createBy.value : this.createBy,
      createdOn: data.createdOn.present ? data.createdOn.value : this.createdOn,
      createdFrom: data.createdFrom.present
          ? data.createdFrom.value
          : this.createdFrom,
      bankName: data.bankName.present ? data.bankName.value : this.bankName,
      bankBranch: data.bankBranch.present
          ? data.bankBranch.value
          : this.bankBranch,
      accNo: data.accNo.present ? data.accNo.value : this.accNo,
      ifscCode: data.ifscCode.present ? data.ifscCode.value : this.ifscCode,
      gPayNumber: data.gPayNumber.present
          ? data.gPayNumber.value
          : this.gPayNumber,
      upiAddress: data.upiAddress.present
          ? data.upiAddress.value
          : this.upiAddress,
      payeeName: data.payeeName.present ? data.payeeName.value : this.payeeName,
      currency: data.currency.present ? data.currency.value : this.currency,
      hasIntegrationSettings: data.hasIntegrationSettings.present
          ? data.hasIntegrationSettings.value
          : this.hasIntegrationSettings,
      hasVoucherTypeSettings: data.hasVoucherTypeSettings.present
          ? data.hasVoucherTypeSettings.value
          : this.hasVoucherTypeSettings,
      hasCompanySettings: data.hasCompanySettings.present
          ? data.hasCompanySettings.value
          : this.hasCompanySettings,
      userList: data.userList.present ? data.userList.value : this.userList,
      integrationType: data.integrationType.present
          ? data.integrationType.value
          : this.integrationType,
      serialNumber: data.serialNumber.present
          ? data.serialNumber.value
          : this.serialNumber,
      stockInCloud: data.stockInCloud.present
          ? data.stockInCloud.value
          : this.stockInCloud,
      registrationNo: data.registrationNo.present
          ? data.registrationNo.value
          : this.registrationNo,
      vchNumberingMode: data.vchNumberingMode.present
          ? data.vchNumberingMode.value
          : this.vchNumberingMode,
      companyLogoUrl: data.companyLogoUrl.present
          ? data.companyLogoUrl.value
          : this.companyLogoUrl,
      companyProfileUpdated: data.companyProfileUpdated.present
          ? data.companyProfileUpdated.value
          : this.companyProfileUpdated,
      companyBankUpdated: data.companyBankUpdated.present
          ? data.companyBankUpdated.value
          : this.companyBankUpdated,
      companyRegUpdated: data.companyRegUpdated.present
          ? data.companyRegUpdated.value
          : this.companyRegUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Company(')
          ..write('id: $id, ')
          ..write('companyName: $companyName, ')
          ..write('mailingName: $mailingName, ')
          ..write('localName: $localName, ')
          ..write('companyCode: $companyCode, ')
          ..write('address1: $address1, ')
          ..write('address2: $address2, ')
          ..write('address3: $address3, ')
          ..write('pinCode: $pinCode, ')
          ..write('country: $country, ')
          ..write('state: $state, ')
          ..write('officeNo: $officeNo, ')
          ..write('mobile: $mobile, ')
          ..write('email: $email, ')
          ..write('regType: $regType, ')
          ..write('fssaiNo: $fssaiNo, ')
          ..write('finYearStart: $finYearStart, ')
          ..write('voucherRepeat: $voucherRepeat, ')
          ..write('lastSyncDate: $lastSyncDate, ')
          ..write('createBy: $createBy, ')
          ..write('createdOn: $createdOn, ')
          ..write('createdFrom: $createdFrom, ')
          ..write('bankName: $bankName, ')
          ..write('bankBranch: $bankBranch, ')
          ..write('accNo: $accNo, ')
          ..write('ifscCode: $ifscCode, ')
          ..write('gPayNumber: $gPayNumber, ')
          ..write('upiAddress: $upiAddress, ')
          ..write('payeeName: $payeeName, ')
          ..write('currency: $currency, ')
          ..write('hasIntegrationSettings: $hasIntegrationSettings, ')
          ..write('hasVoucherTypeSettings: $hasVoucherTypeSettings, ')
          ..write('hasCompanySettings: $hasCompanySettings, ')
          ..write('userList: $userList, ')
          ..write('integrationType: $integrationType, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('stockInCloud: $stockInCloud, ')
          ..write('registrationNo: $registrationNo, ')
          ..write('vchNumberingMode: $vchNumberingMode, ')
          ..write('companyLogoUrl: $companyLogoUrl, ')
          ..write('companyProfileUpdated: $companyProfileUpdated, ')
          ..write('companyBankUpdated: $companyBankUpdated, ')
          ..write('companyRegUpdated: $companyRegUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    companyName,
    mailingName,
    localName,
    companyCode,
    address1,
    address2,
    address3,
    pinCode,
    country,
    state,
    officeNo,
    mobile,
    email,
    regType,
    fssaiNo,
    finYearStart,
    voucherRepeat,
    lastSyncDate,
    createBy,
    createdOn,
    createdFrom,
    bankName,
    bankBranch,
    accNo,
    ifscCode,
    gPayNumber,
    upiAddress,
    payeeName,
    currency,
    hasIntegrationSettings,
    hasVoucherTypeSettings,
    hasCompanySettings,
    userList,
    integrationType,
    serialNumber,
    stockInCloud,
    registrationNo,
    vchNumberingMode,
    companyLogoUrl,
    companyProfileUpdated,
    companyBankUpdated,
    companyRegUpdated,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Company &&
          other.id == this.id &&
          other.companyName == this.companyName &&
          other.mailingName == this.mailingName &&
          other.localName == this.localName &&
          other.companyCode == this.companyCode &&
          other.address1 == this.address1 &&
          other.address2 == this.address2 &&
          other.address3 == this.address3 &&
          other.pinCode == this.pinCode &&
          other.country == this.country &&
          other.state == this.state &&
          other.officeNo == this.officeNo &&
          other.mobile == this.mobile &&
          other.email == this.email &&
          other.regType == this.regType &&
          other.fssaiNo == this.fssaiNo &&
          other.finYearStart == this.finYearStart &&
          other.voucherRepeat == this.voucherRepeat &&
          other.lastSyncDate == this.lastSyncDate &&
          other.createBy == this.createBy &&
          other.createdOn == this.createdOn &&
          other.createdFrom == this.createdFrom &&
          other.bankName == this.bankName &&
          other.bankBranch == this.bankBranch &&
          other.accNo == this.accNo &&
          other.ifscCode == this.ifscCode &&
          other.gPayNumber == this.gPayNumber &&
          other.upiAddress == this.upiAddress &&
          other.payeeName == this.payeeName &&
          other.currency == this.currency &&
          other.hasIntegrationSettings == this.hasIntegrationSettings &&
          other.hasVoucherTypeSettings == this.hasVoucherTypeSettings &&
          other.hasCompanySettings == this.hasCompanySettings &&
          other.userList == this.userList &&
          other.integrationType == this.integrationType &&
          other.serialNumber == this.serialNumber &&
          other.stockInCloud == this.stockInCloud &&
          other.registrationNo == this.registrationNo &&
          other.vchNumberingMode == this.vchNumberingMode &&
          other.companyLogoUrl == this.companyLogoUrl &&
          other.companyProfileUpdated == this.companyProfileUpdated &&
          other.companyBankUpdated == this.companyBankUpdated &&
          other.companyRegUpdated == this.companyRegUpdated);
}

class CompaniesCompanion extends UpdateCompanion<Company> {
  final Value<int?> id;
  final Value<String?> companyName;
  final Value<String?> mailingName;
  final Value<String?> localName;
  final Value<String?> companyCode;
  final Value<String?> address1;
  final Value<String?> address2;
  final Value<String?> address3;
  final Value<String?> pinCode;
  final Value<String?> country;
  final Value<String?> state;
  final Value<String?> officeNo;
  final Value<String?> mobile;
  final Value<String?> email;
  final Value<String?> regType;
  final Value<String?> fssaiNo;
  final Value<DateTime?> finYearStart;
  final Value<String?> voucherRepeat;
  final Value<DateTime?> lastSyncDate;
  final Value<int?> createBy;
  final Value<DateTime?> createdOn;
  final Value<String?> createdFrom;
  final Value<String?> bankName;
  final Value<String?> bankBranch;
  final Value<String?> accNo;
  final Value<String?> ifscCode;
  final Value<String?> gPayNumber;
  final Value<String?> upiAddress;
  final Value<String?> payeeName;
  final Value<String?> currency;
  final Value<int?> hasIntegrationSettings;
  final Value<int?> hasVoucherTypeSettings;
  final Value<int?> hasCompanySettings;
  final Value<String?> userList;
  final Value<String?> integrationType;
  final Value<String?> serialNumber;
  final Value<String?> stockInCloud;
  final Value<String?> registrationNo;
  final Value<String?> vchNumberingMode;
  final Value<String?> companyLogoUrl;
  final Value<bool?> companyProfileUpdated;
  final Value<bool?> companyBankUpdated;
  final Value<bool?> companyRegUpdated;
  const CompaniesCompanion({
    this.id = const Value.absent(),
    this.companyName = const Value.absent(),
    this.mailingName = const Value.absent(),
    this.localName = const Value.absent(),
    this.companyCode = const Value.absent(),
    this.address1 = const Value.absent(),
    this.address2 = const Value.absent(),
    this.address3 = const Value.absent(),
    this.pinCode = const Value.absent(),
    this.country = const Value.absent(),
    this.state = const Value.absent(),
    this.officeNo = const Value.absent(),
    this.mobile = const Value.absent(),
    this.email = const Value.absent(),
    this.regType = const Value.absent(),
    this.fssaiNo = const Value.absent(),
    this.finYearStart = const Value.absent(),
    this.voucherRepeat = const Value.absent(),
    this.lastSyncDate = const Value.absent(),
    this.createBy = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.createdFrom = const Value.absent(),
    this.bankName = const Value.absent(),
    this.bankBranch = const Value.absent(),
    this.accNo = const Value.absent(),
    this.ifscCode = const Value.absent(),
    this.gPayNumber = const Value.absent(),
    this.upiAddress = const Value.absent(),
    this.payeeName = const Value.absent(),
    this.currency = const Value.absent(),
    this.hasIntegrationSettings = const Value.absent(),
    this.hasVoucherTypeSettings = const Value.absent(),
    this.hasCompanySettings = const Value.absent(),
    this.userList = const Value.absent(),
    this.integrationType = const Value.absent(),
    this.serialNumber = const Value.absent(),
    this.stockInCloud = const Value.absent(),
    this.registrationNo = const Value.absent(),
    this.vchNumberingMode = const Value.absent(),
    this.companyLogoUrl = const Value.absent(),
    this.companyProfileUpdated = const Value.absent(),
    this.companyBankUpdated = const Value.absent(),
    this.companyRegUpdated = const Value.absent(),
  });
  CompaniesCompanion.insert({
    this.id = const Value.absent(),
    this.companyName = const Value.absent(),
    this.mailingName = const Value.absent(),
    this.localName = const Value.absent(),
    this.companyCode = const Value.absent(),
    this.address1 = const Value.absent(),
    this.address2 = const Value.absent(),
    this.address3 = const Value.absent(),
    this.pinCode = const Value.absent(),
    this.country = const Value.absent(),
    this.state = const Value.absent(),
    this.officeNo = const Value.absent(),
    this.mobile = const Value.absent(),
    this.email = const Value.absent(),
    this.regType = const Value.absent(),
    this.fssaiNo = const Value.absent(),
    this.finYearStart = const Value.absent(),
    this.voucherRepeat = const Value.absent(),
    this.lastSyncDate = const Value.absent(),
    this.createBy = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.createdFrom = const Value.absent(),
    this.bankName = const Value.absent(),
    this.bankBranch = const Value.absent(),
    this.accNo = const Value.absent(),
    this.ifscCode = const Value.absent(),
    this.gPayNumber = const Value.absent(),
    this.upiAddress = const Value.absent(),
    this.payeeName = const Value.absent(),
    this.currency = const Value.absent(),
    this.hasIntegrationSettings = const Value.absent(),
    this.hasVoucherTypeSettings = const Value.absent(),
    this.hasCompanySettings = const Value.absent(),
    this.userList = const Value.absent(),
    this.integrationType = const Value.absent(),
    this.serialNumber = const Value.absent(),
    this.stockInCloud = const Value.absent(),
    this.registrationNo = const Value.absent(),
    this.vchNumberingMode = const Value.absent(),
    this.companyLogoUrl = const Value.absent(),
    this.companyProfileUpdated = const Value.absent(),
    this.companyBankUpdated = const Value.absent(),
    this.companyRegUpdated = const Value.absent(),
  });
  static Insertable<Company> custom({
    Expression<int>? id,
    Expression<String>? companyName,
    Expression<String>? mailingName,
    Expression<String>? localName,
    Expression<String>? companyCode,
    Expression<String>? address1,
    Expression<String>? address2,
    Expression<String>? address3,
    Expression<String>? pinCode,
    Expression<String>? country,
    Expression<String>? state,
    Expression<String>? officeNo,
    Expression<String>? mobile,
    Expression<String>? email,
    Expression<String>? regType,
    Expression<String>? fssaiNo,
    Expression<DateTime>? finYearStart,
    Expression<String>? voucherRepeat,
    Expression<DateTime>? lastSyncDate,
    Expression<int>? createBy,
    Expression<DateTime>? createdOn,
    Expression<String>? createdFrom,
    Expression<String>? bankName,
    Expression<String>? bankBranch,
    Expression<String>? accNo,
    Expression<String>? ifscCode,
    Expression<String>? gPayNumber,
    Expression<String>? upiAddress,
    Expression<String>? payeeName,
    Expression<String>? currency,
    Expression<int>? hasIntegrationSettings,
    Expression<int>? hasVoucherTypeSettings,
    Expression<int>? hasCompanySettings,
    Expression<String>? userList,
    Expression<String>? integrationType,
    Expression<String>? serialNumber,
    Expression<String>? stockInCloud,
    Expression<String>? registrationNo,
    Expression<String>? vchNumberingMode,
    Expression<String>? companyLogoUrl,
    Expression<bool>? companyProfileUpdated,
    Expression<bool>? companyBankUpdated,
    Expression<bool>? companyRegUpdated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companyName != null) 'company_name': companyName,
      if (mailingName != null) 'mailing_name': mailingName,
      if (localName != null) 'local_name': localName,
      if (companyCode != null) 'company_code': companyCode,
      if (address1 != null) 'address1': address1,
      if (address2 != null) 'address2': address2,
      if (address3 != null) 'address3': address3,
      if (pinCode != null) 'pin_code': pinCode,
      if (country != null) 'country': country,
      if (state != null) 'state': state,
      if (officeNo != null) 'office_no': officeNo,
      if (mobile != null) 'mobile': mobile,
      if (email != null) 'email': email,
      if (regType != null) 'reg_type': regType,
      if (fssaiNo != null) 'fssai_no': fssaiNo,
      if (finYearStart != null) 'fin_year_start': finYearStart,
      if (voucherRepeat != null) 'voucher_repeat': voucherRepeat,
      if (lastSyncDate != null) 'last_sync_date': lastSyncDate,
      if (createBy != null) 'create_by': createBy,
      if (createdOn != null) 'created_on': createdOn,
      if (createdFrom != null) 'created_from': createdFrom,
      if (bankName != null) 'bank_name': bankName,
      if (bankBranch != null) 'bank_branch': bankBranch,
      if (accNo != null) 'acc_no': accNo,
      if (ifscCode != null) 'ifsc_code': ifscCode,
      if (gPayNumber != null) 'g_pay_number': gPayNumber,
      if (upiAddress != null) 'upi_address': upiAddress,
      if (payeeName != null) 'payee_name': payeeName,
      if (currency != null) 'currency': currency,
      if (hasIntegrationSettings != null)
        'has_integration_settings': hasIntegrationSettings,
      if (hasVoucherTypeSettings != null)
        'has_voucher_type_settings': hasVoucherTypeSettings,
      if (hasCompanySettings != null)
        'has_company_settings': hasCompanySettings,
      if (userList != null) 'user_list': userList,
      if (integrationType != null) 'integration_type': integrationType,
      if (serialNumber != null) 'serial_number': serialNumber,
      if (stockInCloud != null) 'stock_in_cloud': stockInCloud,
      if (registrationNo != null) 'registration_no': registrationNo,
      if (vchNumberingMode != null) 'vch_numbering_mode': vchNumberingMode,
      if (companyLogoUrl != null) 'company_logo_url': companyLogoUrl,
      if (companyProfileUpdated != null)
        'company_profile_updated': companyProfileUpdated,
      if (companyBankUpdated != null)
        'company_bank_updated': companyBankUpdated,
      if (companyRegUpdated != null) 'company_reg_updated': companyRegUpdated,
    });
  }

  CompaniesCompanion copyWith({
    Value<int?>? id,
    Value<String?>? companyName,
    Value<String?>? mailingName,
    Value<String?>? localName,
    Value<String?>? companyCode,
    Value<String?>? address1,
    Value<String?>? address2,
    Value<String?>? address3,
    Value<String?>? pinCode,
    Value<String?>? country,
    Value<String?>? state,
    Value<String?>? officeNo,
    Value<String?>? mobile,
    Value<String?>? email,
    Value<String?>? regType,
    Value<String?>? fssaiNo,
    Value<DateTime?>? finYearStart,
    Value<String?>? voucherRepeat,
    Value<DateTime?>? lastSyncDate,
    Value<int?>? createBy,
    Value<DateTime?>? createdOn,
    Value<String?>? createdFrom,
    Value<String?>? bankName,
    Value<String?>? bankBranch,
    Value<String?>? accNo,
    Value<String?>? ifscCode,
    Value<String?>? gPayNumber,
    Value<String?>? upiAddress,
    Value<String?>? payeeName,
    Value<String?>? currency,
    Value<int?>? hasIntegrationSettings,
    Value<int?>? hasVoucherTypeSettings,
    Value<int?>? hasCompanySettings,
    Value<String?>? userList,
    Value<String?>? integrationType,
    Value<String?>? serialNumber,
    Value<String?>? stockInCloud,
    Value<String?>? registrationNo,
    Value<String?>? vchNumberingMode,
    Value<String?>? companyLogoUrl,
    Value<bool?>? companyProfileUpdated,
    Value<bool?>? companyBankUpdated,
    Value<bool?>? companyRegUpdated,
  }) {
    return CompaniesCompanion(
      id: id ?? this.id,
      companyName: companyName ?? this.companyName,
      mailingName: mailingName ?? this.mailingName,
      localName: localName ?? this.localName,
      companyCode: companyCode ?? this.companyCode,
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      address3: address3 ?? this.address3,
      pinCode: pinCode ?? this.pinCode,
      country: country ?? this.country,
      state: state ?? this.state,
      officeNo: officeNo ?? this.officeNo,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      regType: regType ?? this.regType,
      fssaiNo: fssaiNo ?? this.fssaiNo,
      finYearStart: finYearStart ?? this.finYearStart,
      voucherRepeat: voucherRepeat ?? this.voucherRepeat,
      lastSyncDate: lastSyncDate ?? this.lastSyncDate,
      createBy: createBy ?? this.createBy,
      createdOn: createdOn ?? this.createdOn,
      createdFrom: createdFrom ?? this.createdFrom,
      bankName: bankName ?? this.bankName,
      bankBranch: bankBranch ?? this.bankBranch,
      accNo: accNo ?? this.accNo,
      ifscCode: ifscCode ?? this.ifscCode,
      gPayNumber: gPayNumber ?? this.gPayNumber,
      upiAddress: upiAddress ?? this.upiAddress,
      payeeName: payeeName ?? this.payeeName,
      currency: currency ?? this.currency,
      hasIntegrationSettings:
          hasIntegrationSettings ?? this.hasIntegrationSettings,
      hasVoucherTypeSettings:
          hasVoucherTypeSettings ?? this.hasVoucherTypeSettings,
      hasCompanySettings: hasCompanySettings ?? this.hasCompanySettings,
      userList: userList ?? this.userList,
      integrationType: integrationType ?? this.integrationType,
      serialNumber: serialNumber ?? this.serialNumber,
      stockInCloud: stockInCloud ?? this.stockInCloud,
      registrationNo: registrationNo ?? this.registrationNo,
      vchNumberingMode: vchNumberingMode ?? this.vchNumberingMode,
      companyLogoUrl: companyLogoUrl ?? this.companyLogoUrl,
      companyProfileUpdated:
          companyProfileUpdated ?? this.companyProfileUpdated,
      companyBankUpdated: companyBankUpdated ?? this.companyBankUpdated,
      companyRegUpdated: companyRegUpdated ?? this.companyRegUpdated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (mailingName.present) {
      map['mailing_name'] = Variable<String>(mailingName.value);
    }
    if (localName.present) {
      map['local_name'] = Variable<String>(localName.value);
    }
    if (companyCode.present) {
      map['company_code'] = Variable<String>(companyCode.value);
    }
    if (address1.present) {
      map['address1'] = Variable<String>(address1.value);
    }
    if (address2.present) {
      map['address2'] = Variable<String>(address2.value);
    }
    if (address3.present) {
      map['address3'] = Variable<String>(address3.value);
    }
    if (pinCode.present) {
      map['pin_code'] = Variable<String>(pinCode.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (officeNo.present) {
      map['office_no'] = Variable<String>(officeNo.value);
    }
    if (mobile.present) {
      map['mobile'] = Variable<String>(mobile.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (regType.present) {
      map['reg_type'] = Variable<String>(regType.value);
    }
    if (fssaiNo.present) {
      map['fssai_no'] = Variable<String>(fssaiNo.value);
    }
    if (finYearStart.present) {
      map['fin_year_start'] = Variable<DateTime>(finYearStart.value);
    }
    if (voucherRepeat.present) {
      map['voucher_repeat'] = Variable<String>(voucherRepeat.value);
    }
    if (lastSyncDate.present) {
      map['last_sync_date'] = Variable<DateTime>(lastSyncDate.value);
    }
    if (createBy.present) {
      map['create_by'] = Variable<int>(createBy.value);
    }
    if (createdOn.present) {
      map['created_on'] = Variable<DateTime>(createdOn.value);
    }
    if (createdFrom.present) {
      map['created_from'] = Variable<String>(createdFrom.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (bankBranch.present) {
      map['bank_branch'] = Variable<String>(bankBranch.value);
    }
    if (accNo.present) {
      map['acc_no'] = Variable<String>(accNo.value);
    }
    if (ifscCode.present) {
      map['ifsc_code'] = Variable<String>(ifscCode.value);
    }
    if (gPayNumber.present) {
      map['g_pay_number'] = Variable<String>(gPayNumber.value);
    }
    if (upiAddress.present) {
      map['upi_address'] = Variable<String>(upiAddress.value);
    }
    if (payeeName.present) {
      map['payee_name'] = Variable<String>(payeeName.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (hasIntegrationSettings.present) {
      map['has_integration_settings'] = Variable<int>(
        hasIntegrationSettings.value,
      );
    }
    if (hasVoucherTypeSettings.present) {
      map['has_voucher_type_settings'] = Variable<int>(
        hasVoucherTypeSettings.value,
      );
    }
    if (hasCompanySettings.present) {
      map['has_company_settings'] = Variable<int>(hasCompanySettings.value);
    }
    if (userList.present) {
      map['user_list'] = Variable<String>(userList.value);
    }
    if (integrationType.present) {
      map['integration_type'] = Variable<String>(integrationType.value);
    }
    if (serialNumber.present) {
      map['serial_number'] = Variable<String>(serialNumber.value);
    }
    if (stockInCloud.present) {
      map['stock_in_cloud'] = Variable<String>(stockInCloud.value);
    }
    if (registrationNo.present) {
      map['registration_no'] = Variable<String>(registrationNo.value);
    }
    if (vchNumberingMode.present) {
      map['vch_numbering_mode'] = Variable<String>(vchNumberingMode.value);
    }
    if (companyLogoUrl.present) {
      map['company_logo_url'] = Variable<String>(companyLogoUrl.value);
    }
    if (companyProfileUpdated.present) {
      map['company_profile_updated'] = Variable<bool>(
        companyProfileUpdated.value,
      );
    }
    if (companyBankUpdated.present) {
      map['company_bank_updated'] = Variable<bool>(companyBankUpdated.value);
    }
    if (companyRegUpdated.present) {
      map['company_reg_updated'] = Variable<bool>(companyRegUpdated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompaniesCompanion(')
          ..write('id: $id, ')
          ..write('companyName: $companyName, ')
          ..write('mailingName: $mailingName, ')
          ..write('localName: $localName, ')
          ..write('companyCode: $companyCode, ')
          ..write('address1: $address1, ')
          ..write('address2: $address2, ')
          ..write('address3: $address3, ')
          ..write('pinCode: $pinCode, ')
          ..write('country: $country, ')
          ..write('state: $state, ')
          ..write('officeNo: $officeNo, ')
          ..write('mobile: $mobile, ')
          ..write('email: $email, ')
          ..write('regType: $regType, ')
          ..write('fssaiNo: $fssaiNo, ')
          ..write('finYearStart: $finYearStart, ')
          ..write('voucherRepeat: $voucherRepeat, ')
          ..write('lastSyncDate: $lastSyncDate, ')
          ..write('createBy: $createBy, ')
          ..write('createdOn: $createdOn, ')
          ..write('createdFrom: $createdFrom, ')
          ..write('bankName: $bankName, ')
          ..write('bankBranch: $bankBranch, ')
          ..write('accNo: $accNo, ')
          ..write('ifscCode: $ifscCode, ')
          ..write('gPayNumber: $gPayNumber, ')
          ..write('upiAddress: $upiAddress, ')
          ..write('payeeName: $payeeName, ')
          ..write('currency: $currency, ')
          ..write('hasIntegrationSettings: $hasIntegrationSettings, ')
          ..write('hasVoucherTypeSettings: $hasVoucherTypeSettings, ')
          ..write('hasCompanySettings: $hasCompanySettings, ')
          ..write('userList: $userList, ')
          ..write('integrationType: $integrationType, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('stockInCloud: $stockInCloud, ')
          ..write('registrationNo: $registrationNo, ')
          ..write('vchNumberingMode: $vchNumberingMode, ')
          ..write('companyLogoUrl: $companyLogoUrl, ')
          ..write('companyProfileUpdated: $companyProfileUpdated, ')
          ..write('companyBankUpdated: $companyBankUpdated, ')
          ..write('companyRegUpdated: $companyRegUpdated')
          ..write(')'))
        .toString();
  }
}

class $UserSettingsTableTable extends UserSettingsTable
    with TableInfo<$UserSettingsTableTable, UserSettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _menuNameMeta = const VerificationMeta(
    'menuName',
  );
  @override
  late final GeneratedColumn<String> menuName = GeneratedColumn<String>(
    'menu_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _buttonTypeMeta = const VerificationMeta(
    'buttonType',
  );
  @override
  late final GeneratedColumn<String> buttonType = GeneratedColumn<String>(
    'button_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderNoMeta = const VerificationMeta(
    'orderNo',
  );
  @override
  late final GeneratedColumn<int> orderNo = GeneratedColumn<int>(
    'order_no',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<int> active = GeneratedColumn<int>(
    'active',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    menuName,
    buttonType,
    description,
    orderNo,
    active,
    value,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_settings_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserSettingsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('menu_name')) {
      context.handle(
        _menuNameMeta,
        menuName.isAcceptableOrUnknown(data['menu_name']!, _menuNameMeta),
      );
    }
    if (data.containsKey('button_type')) {
      context.handle(
        _buttonTypeMeta,
        buttonType.isAcceptableOrUnknown(data['button_type']!, _buttonTypeMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('order_no')) {
      context.handle(
        _orderNoMeta,
        orderNo.isAcceptableOrUnknown(data['order_no']!, _orderNoMeta),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserSettingsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserSettingsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      ),
      menuName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}menu_name'],
      ),
      buttonType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}button_type'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      orderNo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_no'],
      ),
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}active'],
      ),
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      ),
    );
  }

  @override
  $UserSettingsTableTable createAlias(String alias) {
    return $UserSettingsTableTable(attachedDatabase, alias);
  }
}

class UserSettingsTableData extends DataClass
    implements Insertable<UserSettingsTableData> {
  final int? id;
  final int? userId;
  final String? menuName;
  final String? buttonType;
  final String? description;
  final int? orderNo;
  final int? active;
  final String? value;
  const UserSettingsTableData({
    this.id,
    this.userId,
    this.menuName,
    this.buttonType,
    this.description,
    this.orderNo,
    this.active,
    this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || menuName != null) {
      map['menu_name'] = Variable<String>(menuName);
    }
    if (!nullToAbsent || buttonType != null) {
      map['button_type'] = Variable<String>(buttonType);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || orderNo != null) {
      map['order_no'] = Variable<int>(orderNo);
    }
    if (!nullToAbsent || active != null) {
      map['active'] = Variable<int>(active);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    return map;
  }

  UserSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return UserSettingsTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      menuName: menuName == null && nullToAbsent
          ? const Value.absent()
          : Value(menuName),
      buttonType: buttonType == null && nullToAbsent
          ? const Value.absent()
          : Value(buttonType),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      orderNo: orderNo == null && nullToAbsent
          ? const Value.absent()
          : Value(orderNo),
      active: active == null && nullToAbsent
          ? const Value.absent()
          : Value(active),
      value: value == null && nullToAbsent
          ? const Value.absent()
          : Value(value),
    );
  }

  factory UserSettingsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserSettingsTableData(
      id: serializer.fromJson<int?>(json['id']),
      userId: serializer.fromJson<int?>(json['userId']),
      menuName: serializer.fromJson<String?>(json['menuName']),
      buttonType: serializer.fromJson<String?>(json['buttonType']),
      description: serializer.fromJson<String?>(json['description']),
      orderNo: serializer.fromJson<int?>(json['orderNo']),
      active: serializer.fromJson<int?>(json['active']),
      value: serializer.fromJson<String?>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'userId': serializer.toJson<int?>(userId),
      'menuName': serializer.toJson<String?>(menuName),
      'buttonType': serializer.toJson<String?>(buttonType),
      'description': serializer.toJson<String?>(description),
      'orderNo': serializer.toJson<int?>(orderNo),
      'active': serializer.toJson<int?>(active),
      'value': serializer.toJson<String?>(value),
    };
  }

  UserSettingsTableData copyWith({
    Value<int?> id = const Value.absent(),
    Value<int?> userId = const Value.absent(),
    Value<String?> menuName = const Value.absent(),
    Value<String?> buttonType = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<int?> orderNo = const Value.absent(),
    Value<int?> active = const Value.absent(),
    Value<String?> value = const Value.absent(),
  }) => UserSettingsTableData(
    id: id.present ? id.value : this.id,
    userId: userId.present ? userId.value : this.userId,
    menuName: menuName.present ? menuName.value : this.menuName,
    buttonType: buttonType.present ? buttonType.value : this.buttonType,
    description: description.present ? description.value : this.description,
    orderNo: orderNo.present ? orderNo.value : this.orderNo,
    active: active.present ? active.value : this.active,
    value: value.present ? value.value : this.value,
  );
  UserSettingsTableData copyWithCompanion(UserSettingsTableCompanion data) {
    return UserSettingsTableData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      menuName: data.menuName.present ? data.menuName.value : this.menuName,
      buttonType: data.buttonType.present
          ? data.buttonType.value
          : this.buttonType,
      description: data.description.present
          ? data.description.value
          : this.description,
      orderNo: data.orderNo.present ? data.orderNo.value : this.orderNo,
      active: data.active.present ? data.active.value : this.active,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserSettingsTableData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('menuName: $menuName, ')
          ..write('buttonType: $buttonType, ')
          ..write('description: $description, ')
          ..write('orderNo: $orderNo, ')
          ..write('active: $active, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    menuName,
    buttonType,
    description,
    orderNo,
    active,
    value,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserSettingsTableData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.menuName == this.menuName &&
          other.buttonType == this.buttonType &&
          other.description == this.description &&
          other.orderNo == this.orderNo &&
          other.active == this.active &&
          other.value == this.value);
}

class UserSettingsTableCompanion
    extends UpdateCompanion<UserSettingsTableData> {
  final Value<int?> id;
  final Value<int?> userId;
  final Value<String?> menuName;
  final Value<String?> buttonType;
  final Value<String?> description;
  final Value<int?> orderNo;
  final Value<int?> active;
  final Value<String?> value;
  const UserSettingsTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.menuName = const Value.absent(),
    this.buttonType = const Value.absent(),
    this.description = const Value.absent(),
    this.orderNo = const Value.absent(),
    this.active = const Value.absent(),
    this.value = const Value.absent(),
  });
  UserSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.menuName = const Value.absent(),
    this.buttonType = const Value.absent(),
    this.description = const Value.absent(),
    this.orderNo = const Value.absent(),
    this.active = const Value.absent(),
    this.value = const Value.absent(),
  });
  static Insertable<UserSettingsTableData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? menuName,
    Expression<String>? buttonType,
    Expression<String>? description,
    Expression<int>? orderNo,
    Expression<int>? active,
    Expression<String>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (menuName != null) 'menu_name': menuName,
      if (buttonType != null) 'button_type': buttonType,
      if (description != null) 'description': description,
      if (orderNo != null) 'order_no': orderNo,
      if (active != null) 'active': active,
      if (value != null) 'value': value,
    });
  }

  UserSettingsTableCompanion copyWith({
    Value<int?>? id,
    Value<int?>? userId,
    Value<String?>? menuName,
    Value<String?>? buttonType,
    Value<String?>? description,
    Value<int?>? orderNo,
    Value<int?>? active,
    Value<String?>? value,
  }) {
    return UserSettingsTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      menuName: menuName ?? this.menuName,
      buttonType: buttonType ?? this.buttonType,
      description: description ?? this.description,
      orderNo: orderNo ?? this.orderNo,
      active: active ?? this.active,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (menuName.present) {
      map['menu_name'] = Variable<String>(menuName.value);
    }
    if (buttonType.present) {
      map['button_type'] = Variable<String>(buttonType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (orderNo.present) {
      map['order_no'] = Variable<int>(orderNo.value);
    }
    if (active.present) {
      map['active'] = Variable<int>(active.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('menuName: $menuName, ')
          ..write('buttonType: $buttonType, ')
          ..write('description: $description, ')
          ..write('orderNo: $orderNo, ')
          ..write('active: $active, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $VoucherTypesTable extends VoucherTypes
    with TableInfo<$VoucherTypesTable, VoucherType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VoucherTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _companyIdMeta = const VerificationMeta(
    'companyId',
  );
  @override
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
    'company_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _voucherMenuNameMeta = const VerificationMeta(
    'voucherMenuName',
  );
  @override
  late final GeneratedColumn<String> voucherMenuName = GeneratedColumn<String>(
    'voucher_menu_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hasB2BB2CMeta = const VerificationMeta(
    'hasB2BB2C',
  );
  @override
  late final GeneratedColumn<String> hasB2BB2C = GeneratedColumn<String>(
    'has_b2_b_b2_c',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _requireDeclarationMeta =
      const VerificationMeta('requireDeclaration');
  @override
  late final GeneratedColumn<String> requireDeclaration =
      GeneratedColumn<String>(
        'require_declaration',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _orderNoMeta = const VerificationMeta(
    'orderNo',
  );
  @override
  late final GeneratedColumn<int> orderNo = GeneratedColumn<int>(
    'order_no',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hasB2BMeta = const VerificationMeta('hasB2B');
  @override
  late final GeneratedColumn<int> hasB2B = GeneratedColumn<int>(
    'has_b2_b',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _b2BPrefixMeta = const VerificationMeta(
    'b2BPrefix',
  );
  @override
  late final GeneratedColumn<String> b2BPrefix = GeneratedColumn<String>(
    'b2_b_prefix',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _b2BSuffixMeta = const VerificationMeta(
    'b2BSuffix',
  );
  @override
  late final GeneratedColumn<String> b2BSuffix = GeneratedColumn<String>(
    'b2_b_suffix',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _b2BWidthMeta = const VerificationMeta(
    'b2BWidth',
  );
  @override
  late final GeneratedColumn<int> b2BWidth = GeneratedColumn<int>(
    'b2_b_width',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _b2BStartFromMeta = const VerificationMeta(
    'b2BStartFrom',
  );
  @override
  late final GeneratedColumn<int> b2BStartFrom = GeneratedColumn<int>(
    'b2_b_start_from',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _b2CPrefixMeta = const VerificationMeta(
    'b2CPrefix',
  );
  @override
  late final GeneratedColumn<String> b2CPrefix = GeneratedColumn<String>(
    'b2_c_prefix',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _b2CSuffixMeta = const VerificationMeta(
    'b2CSuffix',
  );
  @override
  late final GeneratedColumn<String> b2CSuffix = GeneratedColumn<String>(
    'b2_c_suffix',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _b2CWidthMeta = const VerificationMeta(
    'b2CWidth',
  );
  @override
  late final GeneratedColumn<int> b2CWidth = GeneratedColumn<int>(
    'b2_c_width',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _b2CStartFromMeta = const VerificationMeta(
    'b2CStartFrom',
  );
  @override
  late final GeneratedColumn<int> b2CStartFrom = GeneratedColumn<int>(
    'b2_c_start_from',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _b2BDeclarationMeta = const VerificationMeta(
    'b2BDeclaration',
  );
  @override
  late final GeneratedColumn<String> b2BDeclaration = GeneratedColumn<String>(
    'b2_b_declaration',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _b2CDeclarationMeta = const VerificationMeta(
    'b2CDeclaration',
  );
  @override
  late final GeneratedColumn<String> b2CDeclaration = GeneratedColumn<String>(
    'b2_c_declaration',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isEnabledMeta = const VerificationMeta(
    'isEnabled',
  );
  @override
  late final GeneratedColumn<int> isEnabled = GeneratedColumn<int>(
    'is_enabled',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    companyId,
    voucherMenuName,
    description,
    hasB2BB2C,
    requireDeclaration,
    orderNo,
    hasB2B,
    b2BPrefix,
    b2BSuffix,
    b2BWidth,
    b2BStartFrom,
    b2CPrefix,
    b2CSuffix,
    b2CWidth,
    b2CStartFrom,
    b2BDeclaration,
    b2CDeclaration,
    isEnabled,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'voucher_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<VoucherType> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('company_id')) {
      context.handle(
        _companyIdMeta,
        companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    if (data.containsKey('voucher_menu_name')) {
      context.handle(
        _voucherMenuNameMeta,
        voucherMenuName.isAcceptableOrUnknown(
          data['voucher_menu_name']!,
          _voucherMenuNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_voucherMenuNameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('has_b2_b_b2_c')) {
      context.handle(
        _hasB2BB2CMeta,
        hasB2BB2C.isAcceptableOrUnknown(data['has_b2_b_b2_c']!, _hasB2BB2CMeta),
      );
    } else if (isInserting) {
      context.missing(_hasB2BB2CMeta);
    }
    if (data.containsKey('require_declaration')) {
      context.handle(
        _requireDeclarationMeta,
        requireDeclaration.isAcceptableOrUnknown(
          data['require_declaration']!,
          _requireDeclarationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_requireDeclarationMeta);
    }
    if (data.containsKey('order_no')) {
      context.handle(
        _orderNoMeta,
        orderNo.isAcceptableOrUnknown(data['order_no']!, _orderNoMeta),
      );
    } else if (isInserting) {
      context.missing(_orderNoMeta);
    }
    if (data.containsKey('has_b2_b')) {
      context.handle(
        _hasB2BMeta,
        hasB2B.isAcceptableOrUnknown(data['has_b2_b']!, _hasB2BMeta),
      );
    } else if (isInserting) {
      context.missing(_hasB2BMeta);
    }
    if (data.containsKey('b2_b_prefix')) {
      context.handle(
        _b2BPrefixMeta,
        b2BPrefix.isAcceptableOrUnknown(data['b2_b_prefix']!, _b2BPrefixMeta),
      );
    } else if (isInserting) {
      context.missing(_b2BPrefixMeta);
    }
    if (data.containsKey('b2_b_suffix')) {
      context.handle(
        _b2BSuffixMeta,
        b2BSuffix.isAcceptableOrUnknown(data['b2_b_suffix']!, _b2BSuffixMeta),
      );
    } else if (isInserting) {
      context.missing(_b2BSuffixMeta);
    }
    if (data.containsKey('b2_b_width')) {
      context.handle(
        _b2BWidthMeta,
        b2BWidth.isAcceptableOrUnknown(data['b2_b_width']!, _b2BWidthMeta),
      );
    } else if (isInserting) {
      context.missing(_b2BWidthMeta);
    }
    if (data.containsKey('b2_b_start_from')) {
      context.handle(
        _b2BStartFromMeta,
        b2BStartFrom.isAcceptableOrUnknown(
          data['b2_b_start_from']!,
          _b2BStartFromMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_b2BStartFromMeta);
    }
    if (data.containsKey('b2_c_prefix')) {
      context.handle(
        _b2CPrefixMeta,
        b2CPrefix.isAcceptableOrUnknown(data['b2_c_prefix']!, _b2CPrefixMeta),
      );
    } else if (isInserting) {
      context.missing(_b2CPrefixMeta);
    }
    if (data.containsKey('b2_c_suffix')) {
      context.handle(
        _b2CSuffixMeta,
        b2CSuffix.isAcceptableOrUnknown(data['b2_c_suffix']!, _b2CSuffixMeta),
      );
    } else if (isInserting) {
      context.missing(_b2CSuffixMeta);
    }
    if (data.containsKey('b2_c_width')) {
      context.handle(
        _b2CWidthMeta,
        b2CWidth.isAcceptableOrUnknown(data['b2_c_width']!, _b2CWidthMeta),
      );
    } else if (isInserting) {
      context.missing(_b2CWidthMeta);
    }
    if (data.containsKey('b2_c_start_from')) {
      context.handle(
        _b2CStartFromMeta,
        b2CStartFrom.isAcceptableOrUnknown(
          data['b2_c_start_from']!,
          _b2CStartFromMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_b2CStartFromMeta);
    }
    if (data.containsKey('b2_b_declaration')) {
      context.handle(
        _b2BDeclarationMeta,
        b2BDeclaration.isAcceptableOrUnknown(
          data['b2_b_declaration']!,
          _b2BDeclarationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_b2BDeclarationMeta);
    }
    if (data.containsKey('b2_c_declaration')) {
      context.handle(
        _b2CDeclarationMeta,
        b2CDeclaration.isAcceptableOrUnknown(
          data['b2_c_declaration']!,
          _b2CDeclarationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_b2CDeclarationMeta);
    }
    if (data.containsKey('is_enabled')) {
      context.handle(
        _isEnabledMeta,
        isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta),
      );
    } else if (isInserting) {
      context.missing(_isEnabledMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VoucherType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VoucherType(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      companyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}company_id'],
      )!,
      voucherMenuName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}voucher_menu_name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      hasB2BB2C: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}has_b2_b_b2_c'],
      )!,
      requireDeclaration: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}require_declaration'],
      )!,
      orderNo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_no'],
      )!,
      hasB2B: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}has_b2_b'],
      )!,
      b2BPrefix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b2_b_prefix'],
      )!,
      b2BSuffix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b2_b_suffix'],
      )!,
      b2BWidth: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}b2_b_width'],
      )!,
      b2BStartFrom: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}b2_b_start_from'],
      )!,
      b2CPrefix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b2_c_prefix'],
      )!,
      b2CSuffix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b2_c_suffix'],
      )!,
      b2CWidth: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}b2_c_width'],
      )!,
      b2CStartFrom: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}b2_c_start_from'],
      )!,
      b2BDeclaration: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b2_b_declaration'],
      )!,
      b2CDeclaration: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b2_c_declaration'],
      )!,
      isEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_enabled'],
      )!,
    );
  }

  @override
  $VoucherTypesTable createAlias(String alias) {
    return $VoucherTypesTable(attachedDatabase, alias);
  }
}

class VoucherType extends DataClass implements Insertable<VoucherType> {
  final int id;
  final int companyId;
  final String voucherMenuName;
  final String description;
  final String hasB2BB2C;
  final String requireDeclaration;
  final int orderNo;
  final int hasB2B;
  final String b2BPrefix;
  final String b2BSuffix;
  final int b2BWidth;
  final int b2BStartFrom;
  final String b2CPrefix;
  final String b2CSuffix;
  final int b2CWidth;
  final int b2CStartFrom;
  final String b2BDeclaration;
  final String b2CDeclaration;
  final int isEnabled;
  const VoucherType({
    required this.id,
    required this.companyId,
    required this.voucherMenuName,
    required this.description,
    required this.hasB2BB2C,
    required this.requireDeclaration,
    required this.orderNo,
    required this.hasB2B,
    required this.b2BPrefix,
    required this.b2BSuffix,
    required this.b2BWidth,
    required this.b2BStartFrom,
    required this.b2CPrefix,
    required this.b2CSuffix,
    required this.b2CWidth,
    required this.b2CStartFrom,
    required this.b2BDeclaration,
    required this.b2CDeclaration,
    required this.isEnabled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['company_id'] = Variable<int>(companyId);
    map['voucher_menu_name'] = Variable<String>(voucherMenuName);
    map['description'] = Variable<String>(description);
    map['has_b2_b_b2_c'] = Variable<String>(hasB2BB2C);
    map['require_declaration'] = Variable<String>(requireDeclaration);
    map['order_no'] = Variable<int>(orderNo);
    map['has_b2_b'] = Variable<int>(hasB2B);
    map['b2_b_prefix'] = Variable<String>(b2BPrefix);
    map['b2_b_suffix'] = Variable<String>(b2BSuffix);
    map['b2_b_width'] = Variable<int>(b2BWidth);
    map['b2_b_start_from'] = Variable<int>(b2BStartFrom);
    map['b2_c_prefix'] = Variable<String>(b2CPrefix);
    map['b2_c_suffix'] = Variable<String>(b2CSuffix);
    map['b2_c_width'] = Variable<int>(b2CWidth);
    map['b2_c_start_from'] = Variable<int>(b2CStartFrom);
    map['b2_b_declaration'] = Variable<String>(b2BDeclaration);
    map['b2_c_declaration'] = Variable<String>(b2CDeclaration);
    map['is_enabled'] = Variable<int>(isEnabled);
    return map;
  }

  VoucherTypesCompanion toCompanion(bool nullToAbsent) {
    return VoucherTypesCompanion(
      id: Value(id),
      companyId: Value(companyId),
      voucherMenuName: Value(voucherMenuName),
      description: Value(description),
      hasB2BB2C: Value(hasB2BB2C),
      requireDeclaration: Value(requireDeclaration),
      orderNo: Value(orderNo),
      hasB2B: Value(hasB2B),
      b2BPrefix: Value(b2BPrefix),
      b2BSuffix: Value(b2BSuffix),
      b2BWidth: Value(b2BWidth),
      b2BStartFrom: Value(b2BStartFrom),
      b2CPrefix: Value(b2CPrefix),
      b2CSuffix: Value(b2CSuffix),
      b2CWidth: Value(b2CWidth),
      b2CStartFrom: Value(b2CStartFrom),
      b2BDeclaration: Value(b2BDeclaration),
      b2CDeclaration: Value(b2CDeclaration),
      isEnabled: Value(isEnabled),
    );
  }

  factory VoucherType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VoucherType(
      id: serializer.fromJson<int>(json['id']),
      companyId: serializer.fromJson<int>(json['companyId']),
      voucherMenuName: serializer.fromJson<String>(json['voucherMenuName']),
      description: serializer.fromJson<String>(json['description']),
      hasB2BB2C: serializer.fromJson<String>(json['hasB2BB2C']),
      requireDeclaration: serializer.fromJson<String>(
        json['requireDeclaration'],
      ),
      orderNo: serializer.fromJson<int>(json['orderNo']),
      hasB2B: serializer.fromJson<int>(json['hasB2B']),
      b2BPrefix: serializer.fromJson<String>(json['b2BPrefix']),
      b2BSuffix: serializer.fromJson<String>(json['b2BSuffix']),
      b2BWidth: serializer.fromJson<int>(json['b2BWidth']),
      b2BStartFrom: serializer.fromJson<int>(json['b2BStartFrom']),
      b2CPrefix: serializer.fromJson<String>(json['b2CPrefix']),
      b2CSuffix: serializer.fromJson<String>(json['b2CSuffix']),
      b2CWidth: serializer.fromJson<int>(json['b2CWidth']),
      b2CStartFrom: serializer.fromJson<int>(json['b2CStartFrom']),
      b2BDeclaration: serializer.fromJson<String>(json['b2BDeclaration']),
      b2CDeclaration: serializer.fromJson<String>(json['b2CDeclaration']),
      isEnabled: serializer.fromJson<int>(json['isEnabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'companyId': serializer.toJson<int>(companyId),
      'voucherMenuName': serializer.toJson<String>(voucherMenuName),
      'description': serializer.toJson<String>(description),
      'hasB2BB2C': serializer.toJson<String>(hasB2BB2C),
      'requireDeclaration': serializer.toJson<String>(requireDeclaration),
      'orderNo': serializer.toJson<int>(orderNo),
      'hasB2B': serializer.toJson<int>(hasB2B),
      'b2BPrefix': serializer.toJson<String>(b2BPrefix),
      'b2BSuffix': serializer.toJson<String>(b2BSuffix),
      'b2BWidth': serializer.toJson<int>(b2BWidth),
      'b2BStartFrom': serializer.toJson<int>(b2BStartFrom),
      'b2CPrefix': serializer.toJson<String>(b2CPrefix),
      'b2CSuffix': serializer.toJson<String>(b2CSuffix),
      'b2CWidth': serializer.toJson<int>(b2CWidth),
      'b2CStartFrom': serializer.toJson<int>(b2CStartFrom),
      'b2BDeclaration': serializer.toJson<String>(b2BDeclaration),
      'b2CDeclaration': serializer.toJson<String>(b2CDeclaration),
      'isEnabled': serializer.toJson<int>(isEnabled),
    };
  }

  VoucherType copyWith({
    int? id,
    int? companyId,
    String? voucherMenuName,
    String? description,
    String? hasB2BB2C,
    String? requireDeclaration,
    int? orderNo,
    int? hasB2B,
    String? b2BPrefix,
    String? b2BSuffix,
    int? b2BWidth,
    int? b2BStartFrom,
    String? b2CPrefix,
    String? b2CSuffix,
    int? b2CWidth,
    int? b2CStartFrom,
    String? b2BDeclaration,
    String? b2CDeclaration,
    int? isEnabled,
  }) => VoucherType(
    id: id ?? this.id,
    companyId: companyId ?? this.companyId,
    voucherMenuName: voucherMenuName ?? this.voucherMenuName,
    description: description ?? this.description,
    hasB2BB2C: hasB2BB2C ?? this.hasB2BB2C,
    requireDeclaration: requireDeclaration ?? this.requireDeclaration,
    orderNo: orderNo ?? this.orderNo,
    hasB2B: hasB2B ?? this.hasB2B,
    b2BPrefix: b2BPrefix ?? this.b2BPrefix,
    b2BSuffix: b2BSuffix ?? this.b2BSuffix,
    b2BWidth: b2BWidth ?? this.b2BWidth,
    b2BStartFrom: b2BStartFrom ?? this.b2BStartFrom,
    b2CPrefix: b2CPrefix ?? this.b2CPrefix,
    b2CSuffix: b2CSuffix ?? this.b2CSuffix,
    b2CWidth: b2CWidth ?? this.b2CWidth,
    b2CStartFrom: b2CStartFrom ?? this.b2CStartFrom,
    b2BDeclaration: b2BDeclaration ?? this.b2BDeclaration,
    b2CDeclaration: b2CDeclaration ?? this.b2CDeclaration,
    isEnabled: isEnabled ?? this.isEnabled,
  );
  VoucherType copyWithCompanion(VoucherTypesCompanion data) {
    return VoucherType(
      id: data.id.present ? data.id.value : this.id,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      voucherMenuName: data.voucherMenuName.present
          ? data.voucherMenuName.value
          : this.voucherMenuName,
      description: data.description.present
          ? data.description.value
          : this.description,
      hasB2BB2C: data.hasB2BB2C.present ? data.hasB2BB2C.value : this.hasB2BB2C,
      requireDeclaration: data.requireDeclaration.present
          ? data.requireDeclaration.value
          : this.requireDeclaration,
      orderNo: data.orderNo.present ? data.orderNo.value : this.orderNo,
      hasB2B: data.hasB2B.present ? data.hasB2B.value : this.hasB2B,
      b2BPrefix: data.b2BPrefix.present ? data.b2BPrefix.value : this.b2BPrefix,
      b2BSuffix: data.b2BSuffix.present ? data.b2BSuffix.value : this.b2BSuffix,
      b2BWidth: data.b2BWidth.present ? data.b2BWidth.value : this.b2BWidth,
      b2BStartFrom: data.b2BStartFrom.present
          ? data.b2BStartFrom.value
          : this.b2BStartFrom,
      b2CPrefix: data.b2CPrefix.present ? data.b2CPrefix.value : this.b2CPrefix,
      b2CSuffix: data.b2CSuffix.present ? data.b2CSuffix.value : this.b2CSuffix,
      b2CWidth: data.b2CWidth.present ? data.b2CWidth.value : this.b2CWidth,
      b2CStartFrom: data.b2CStartFrom.present
          ? data.b2CStartFrom.value
          : this.b2CStartFrom,
      b2BDeclaration: data.b2BDeclaration.present
          ? data.b2BDeclaration.value
          : this.b2BDeclaration,
      b2CDeclaration: data.b2CDeclaration.present
          ? data.b2CDeclaration.value
          : this.b2CDeclaration,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VoucherType(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('voucherMenuName: $voucherMenuName, ')
          ..write('description: $description, ')
          ..write('hasB2BB2C: $hasB2BB2C, ')
          ..write('requireDeclaration: $requireDeclaration, ')
          ..write('orderNo: $orderNo, ')
          ..write('hasB2B: $hasB2B, ')
          ..write('b2BPrefix: $b2BPrefix, ')
          ..write('b2BSuffix: $b2BSuffix, ')
          ..write('b2BWidth: $b2BWidth, ')
          ..write('b2BStartFrom: $b2BStartFrom, ')
          ..write('b2CPrefix: $b2CPrefix, ')
          ..write('b2CSuffix: $b2CSuffix, ')
          ..write('b2CWidth: $b2CWidth, ')
          ..write('b2CStartFrom: $b2CStartFrom, ')
          ..write('b2BDeclaration: $b2BDeclaration, ')
          ..write('b2CDeclaration: $b2CDeclaration, ')
          ..write('isEnabled: $isEnabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    companyId,
    voucherMenuName,
    description,
    hasB2BB2C,
    requireDeclaration,
    orderNo,
    hasB2B,
    b2BPrefix,
    b2BSuffix,
    b2BWidth,
    b2BStartFrom,
    b2CPrefix,
    b2CSuffix,
    b2CWidth,
    b2CStartFrom,
    b2BDeclaration,
    b2CDeclaration,
    isEnabled,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VoucherType &&
          other.id == this.id &&
          other.companyId == this.companyId &&
          other.voucherMenuName == this.voucherMenuName &&
          other.description == this.description &&
          other.hasB2BB2C == this.hasB2BB2C &&
          other.requireDeclaration == this.requireDeclaration &&
          other.orderNo == this.orderNo &&
          other.hasB2B == this.hasB2B &&
          other.b2BPrefix == this.b2BPrefix &&
          other.b2BSuffix == this.b2BSuffix &&
          other.b2BWidth == this.b2BWidth &&
          other.b2BStartFrom == this.b2BStartFrom &&
          other.b2CPrefix == this.b2CPrefix &&
          other.b2CSuffix == this.b2CSuffix &&
          other.b2CWidth == this.b2CWidth &&
          other.b2CStartFrom == this.b2CStartFrom &&
          other.b2BDeclaration == this.b2BDeclaration &&
          other.b2CDeclaration == this.b2CDeclaration &&
          other.isEnabled == this.isEnabled);
}

class VoucherTypesCompanion extends UpdateCompanion<VoucherType> {
  final Value<int> id;
  final Value<int> companyId;
  final Value<String> voucherMenuName;
  final Value<String> description;
  final Value<String> hasB2BB2C;
  final Value<String> requireDeclaration;
  final Value<int> orderNo;
  final Value<int> hasB2B;
  final Value<String> b2BPrefix;
  final Value<String> b2BSuffix;
  final Value<int> b2BWidth;
  final Value<int> b2BStartFrom;
  final Value<String> b2CPrefix;
  final Value<String> b2CSuffix;
  final Value<int> b2CWidth;
  final Value<int> b2CStartFrom;
  final Value<String> b2BDeclaration;
  final Value<String> b2CDeclaration;
  final Value<int> isEnabled;
  const VoucherTypesCompanion({
    this.id = const Value.absent(),
    this.companyId = const Value.absent(),
    this.voucherMenuName = const Value.absent(),
    this.description = const Value.absent(),
    this.hasB2BB2C = const Value.absent(),
    this.requireDeclaration = const Value.absent(),
    this.orderNo = const Value.absent(),
    this.hasB2B = const Value.absent(),
    this.b2BPrefix = const Value.absent(),
    this.b2BSuffix = const Value.absent(),
    this.b2BWidth = const Value.absent(),
    this.b2BStartFrom = const Value.absent(),
    this.b2CPrefix = const Value.absent(),
    this.b2CSuffix = const Value.absent(),
    this.b2CWidth = const Value.absent(),
    this.b2CStartFrom = const Value.absent(),
    this.b2BDeclaration = const Value.absent(),
    this.b2CDeclaration = const Value.absent(),
    this.isEnabled = const Value.absent(),
  });
  VoucherTypesCompanion.insert({
    this.id = const Value.absent(),
    required int companyId,
    required String voucherMenuName,
    required String description,
    required String hasB2BB2C,
    required String requireDeclaration,
    required int orderNo,
    required int hasB2B,
    required String b2BPrefix,
    required String b2BSuffix,
    required int b2BWidth,
    required int b2BStartFrom,
    required String b2CPrefix,
    required String b2CSuffix,
    required int b2CWidth,
    required int b2CStartFrom,
    required String b2BDeclaration,
    required String b2CDeclaration,
    required int isEnabled,
  }) : companyId = Value(companyId),
       voucherMenuName = Value(voucherMenuName),
       description = Value(description),
       hasB2BB2C = Value(hasB2BB2C),
       requireDeclaration = Value(requireDeclaration),
       orderNo = Value(orderNo),
       hasB2B = Value(hasB2B),
       b2BPrefix = Value(b2BPrefix),
       b2BSuffix = Value(b2BSuffix),
       b2BWidth = Value(b2BWidth),
       b2BStartFrom = Value(b2BStartFrom),
       b2CPrefix = Value(b2CPrefix),
       b2CSuffix = Value(b2CSuffix),
       b2CWidth = Value(b2CWidth),
       b2CStartFrom = Value(b2CStartFrom),
       b2BDeclaration = Value(b2BDeclaration),
       b2CDeclaration = Value(b2CDeclaration),
       isEnabled = Value(isEnabled);
  static Insertable<VoucherType> custom({
    Expression<int>? id,
    Expression<int>? companyId,
    Expression<String>? voucherMenuName,
    Expression<String>? description,
    Expression<String>? hasB2BB2C,
    Expression<String>? requireDeclaration,
    Expression<int>? orderNo,
    Expression<int>? hasB2B,
    Expression<String>? b2BPrefix,
    Expression<String>? b2BSuffix,
    Expression<int>? b2BWidth,
    Expression<int>? b2BStartFrom,
    Expression<String>? b2CPrefix,
    Expression<String>? b2CSuffix,
    Expression<int>? b2CWidth,
    Expression<int>? b2CStartFrom,
    Expression<String>? b2BDeclaration,
    Expression<String>? b2CDeclaration,
    Expression<int>? isEnabled,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companyId != null) 'company_id': companyId,
      if (voucherMenuName != null) 'voucher_menu_name': voucherMenuName,
      if (description != null) 'description': description,
      if (hasB2BB2C != null) 'has_b2_b_b2_c': hasB2BB2C,
      if (requireDeclaration != null) 'require_declaration': requireDeclaration,
      if (orderNo != null) 'order_no': orderNo,
      if (hasB2B != null) 'has_b2_b': hasB2B,
      if (b2BPrefix != null) 'b2_b_prefix': b2BPrefix,
      if (b2BSuffix != null) 'b2_b_suffix': b2BSuffix,
      if (b2BWidth != null) 'b2_b_width': b2BWidth,
      if (b2BStartFrom != null) 'b2_b_start_from': b2BStartFrom,
      if (b2CPrefix != null) 'b2_c_prefix': b2CPrefix,
      if (b2CSuffix != null) 'b2_c_suffix': b2CSuffix,
      if (b2CWidth != null) 'b2_c_width': b2CWidth,
      if (b2CStartFrom != null) 'b2_c_start_from': b2CStartFrom,
      if (b2BDeclaration != null) 'b2_b_declaration': b2BDeclaration,
      if (b2CDeclaration != null) 'b2_c_declaration': b2CDeclaration,
      if (isEnabled != null) 'is_enabled': isEnabled,
    });
  }

  VoucherTypesCompanion copyWith({
    Value<int>? id,
    Value<int>? companyId,
    Value<String>? voucherMenuName,
    Value<String>? description,
    Value<String>? hasB2BB2C,
    Value<String>? requireDeclaration,
    Value<int>? orderNo,
    Value<int>? hasB2B,
    Value<String>? b2BPrefix,
    Value<String>? b2BSuffix,
    Value<int>? b2BWidth,
    Value<int>? b2BStartFrom,
    Value<String>? b2CPrefix,
    Value<String>? b2CSuffix,
    Value<int>? b2CWidth,
    Value<int>? b2CStartFrom,
    Value<String>? b2BDeclaration,
    Value<String>? b2CDeclaration,
    Value<int>? isEnabled,
  }) {
    return VoucherTypesCompanion(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      voucherMenuName: voucherMenuName ?? this.voucherMenuName,
      description: description ?? this.description,
      hasB2BB2C: hasB2BB2C ?? this.hasB2BB2C,
      requireDeclaration: requireDeclaration ?? this.requireDeclaration,
      orderNo: orderNo ?? this.orderNo,
      hasB2B: hasB2B ?? this.hasB2B,
      b2BPrefix: b2BPrefix ?? this.b2BPrefix,
      b2BSuffix: b2BSuffix ?? this.b2BSuffix,
      b2BWidth: b2BWidth ?? this.b2BWidth,
      b2BStartFrom: b2BStartFrom ?? this.b2BStartFrom,
      b2CPrefix: b2CPrefix ?? this.b2CPrefix,
      b2CSuffix: b2CSuffix ?? this.b2CSuffix,
      b2CWidth: b2CWidth ?? this.b2CWidth,
      b2CStartFrom: b2CStartFrom ?? this.b2CStartFrom,
      b2BDeclaration: b2BDeclaration ?? this.b2BDeclaration,
      b2CDeclaration: b2CDeclaration ?? this.b2CDeclaration,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    if (voucherMenuName.present) {
      map['voucher_menu_name'] = Variable<String>(voucherMenuName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (hasB2BB2C.present) {
      map['has_b2_b_b2_c'] = Variable<String>(hasB2BB2C.value);
    }
    if (requireDeclaration.present) {
      map['require_declaration'] = Variable<String>(requireDeclaration.value);
    }
    if (orderNo.present) {
      map['order_no'] = Variable<int>(orderNo.value);
    }
    if (hasB2B.present) {
      map['has_b2_b'] = Variable<int>(hasB2B.value);
    }
    if (b2BPrefix.present) {
      map['b2_b_prefix'] = Variable<String>(b2BPrefix.value);
    }
    if (b2BSuffix.present) {
      map['b2_b_suffix'] = Variable<String>(b2BSuffix.value);
    }
    if (b2BWidth.present) {
      map['b2_b_width'] = Variable<int>(b2BWidth.value);
    }
    if (b2BStartFrom.present) {
      map['b2_b_start_from'] = Variable<int>(b2BStartFrom.value);
    }
    if (b2CPrefix.present) {
      map['b2_c_prefix'] = Variable<String>(b2CPrefix.value);
    }
    if (b2CSuffix.present) {
      map['b2_c_suffix'] = Variable<String>(b2CSuffix.value);
    }
    if (b2CWidth.present) {
      map['b2_c_width'] = Variable<int>(b2CWidth.value);
    }
    if (b2CStartFrom.present) {
      map['b2_c_start_from'] = Variable<int>(b2CStartFrom.value);
    }
    if (b2BDeclaration.present) {
      map['b2_b_declaration'] = Variable<String>(b2BDeclaration.value);
    }
    if (b2CDeclaration.present) {
      map['b2_c_declaration'] = Variable<String>(b2CDeclaration.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<int>(isEnabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VoucherTypesCompanion(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('voucherMenuName: $voucherMenuName, ')
          ..write('description: $description, ')
          ..write('hasB2BB2C: $hasB2BB2C, ')
          ..write('requireDeclaration: $requireDeclaration, ')
          ..write('orderNo: $orderNo, ')
          ..write('hasB2B: $hasB2B, ')
          ..write('b2BPrefix: $b2BPrefix, ')
          ..write('b2BSuffix: $b2BSuffix, ')
          ..write('b2BWidth: $b2BWidth, ')
          ..write('b2BStartFrom: $b2BStartFrom, ')
          ..write('b2CPrefix: $b2CPrefix, ')
          ..write('b2CSuffix: $b2CSuffix, ')
          ..write('b2CWidth: $b2CWidth, ')
          ..write('b2CStartFrom: $b2CStartFrom, ')
          ..write('b2BDeclaration: $b2BDeclaration, ')
          ..write('b2CDeclaration: $b2CDeclaration, ')
          ..write('isEnabled: $isEnabled')
          ..write(')'))
        .toString();
  }
}

class $GodownVoucherTypesTable extends GodownVoucherTypes
    with TableInfo<$GodownVoucherTypesTable, GodownVoucherType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GodownVoucherTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _companyIdMeta = const VerificationMeta(
    'companyId',
  );
  @override
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
    'company_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voucherTypeIdMeta = const VerificationMeta(
    'voucherTypeId',
  );
  @override
  late final GeneratedColumn<int> voucherTypeId = GeneratedColumn<int>(
    'voucher_type_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voucherMenuNameMeta = const VerificationMeta(
    'voucherMenuName',
  );
  @override
  late final GeneratedColumn<String> voucherMenuName = GeneratedColumn<String>(
    'voucher_menu_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voucherModeMeta = const VerificationMeta(
    'voucherMode',
  );
  @override
  late final GeneratedColumn<String> voucherMode = GeneratedColumn<String>(
    'voucher_mode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voucherModeIdMeta = const VerificationMeta(
    'voucherModeId',
  );
  @override
  late final GeneratedColumn<int> voucherModeId = GeneratedColumn<int>(
    'voucher_mode_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voucherModeNameMeta = const VerificationMeta(
    'voucherModeName',
  );
  @override
  late final GeneratedColumn<String> voucherModeName = GeneratedColumn<String>(
    'voucher_mode_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _applicableFromMeta = const VerificationMeta(
    'applicableFrom',
  );
  @override
  late final GeneratedColumn<DateTime> applicableFrom =
      GeneratedColumn<DateTime>(
        'applicable_from',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _hasB2BMeta = const VerificationMeta('hasB2B');
  @override
  late final GeneratedColumn<int> hasB2B = GeneratedColumn<int>(
    'has_b2_b',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2BPrefixMeta = const VerificationMeta(
    'b2BPrefix',
  );
  @override
  late final GeneratedColumn<String> b2BPrefix = GeneratedColumn<String>(
    'b2_b_prefix',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2BSuffixMeta = const VerificationMeta(
    'b2BSuffix',
  );
  @override
  late final GeneratedColumn<String> b2BSuffix = GeneratedColumn<String>(
    'b2_b_suffix',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2BWidthMeta = const VerificationMeta(
    'b2BWidth',
  );
  @override
  late final GeneratedColumn<int> b2BWidth = GeneratedColumn<int>(
    'b2_b_width',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2BStartFromMeta = const VerificationMeta(
    'b2BStartFrom',
  );
  @override
  late final GeneratedColumn<int> b2BStartFrom = GeneratedColumn<int>(
    'b2_b_start_from',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2CPrefixMeta = const VerificationMeta(
    'b2CPrefix',
  );
  @override
  late final GeneratedColumn<String> b2CPrefix = GeneratedColumn<String>(
    'b2_c_prefix',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2CSuffixMeta = const VerificationMeta(
    'b2CSuffix',
  );
  @override
  late final GeneratedColumn<String> b2CSuffix = GeneratedColumn<String>(
    'b2_c_suffix',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2CWidthMeta = const VerificationMeta(
    'b2CWidth',
  );
  @override
  late final GeneratedColumn<int> b2CWidth = GeneratedColumn<int>(
    'b2_c_width',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2CStartFromMeta = const VerificationMeta(
    'b2CStartFrom',
  );
  @override
  late final GeneratedColumn<int> b2CStartFrom = GeneratedColumn<int>(
    'b2_c_start_from',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2BDeclarationMeta = const VerificationMeta(
    'b2BDeclaration',
  );
  @override
  late final GeneratedColumn<String> b2BDeclaration = GeneratedColumn<String>(
    'b2_b_declaration',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2CDeclarationMeta = const VerificationMeta(
    'b2CDeclaration',
  );
  @override
  late final GeneratedColumn<String> b2CDeclaration = GeneratedColumn<String>(
    'b2_c_declaration',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    companyId,
    voucherTypeId,
    voucherMenuName,
    voucherMode,
    voucherModeId,
    voucherModeName,
    applicableFrom,
    hasB2B,
    b2BPrefix,
    b2BSuffix,
    b2BWidth,
    b2BStartFrom,
    b2CPrefix,
    b2CSuffix,
    b2CWidth,
    b2CStartFrom,
    b2BDeclaration,
    b2CDeclaration,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'godown_voucher_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<GodownVoucherType> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('company_id')) {
      context.handle(
        _companyIdMeta,
        companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta),
      );
    }
    if (data.containsKey('voucher_type_id')) {
      context.handle(
        _voucherTypeIdMeta,
        voucherTypeId.isAcceptableOrUnknown(
          data['voucher_type_id']!,
          _voucherTypeIdMeta,
        ),
      );
    }
    if (data.containsKey('voucher_menu_name')) {
      context.handle(
        _voucherMenuNameMeta,
        voucherMenuName.isAcceptableOrUnknown(
          data['voucher_menu_name']!,
          _voucherMenuNameMeta,
        ),
      );
    }
    if (data.containsKey('voucher_mode')) {
      context.handle(
        _voucherModeMeta,
        voucherMode.isAcceptableOrUnknown(
          data['voucher_mode']!,
          _voucherModeMeta,
        ),
      );
    }
    if (data.containsKey('voucher_mode_id')) {
      context.handle(
        _voucherModeIdMeta,
        voucherModeId.isAcceptableOrUnknown(
          data['voucher_mode_id']!,
          _voucherModeIdMeta,
        ),
      );
    }
    if (data.containsKey('voucher_mode_name')) {
      context.handle(
        _voucherModeNameMeta,
        voucherModeName.isAcceptableOrUnknown(
          data['voucher_mode_name']!,
          _voucherModeNameMeta,
        ),
      );
    }
    if (data.containsKey('applicable_from')) {
      context.handle(
        _applicableFromMeta,
        applicableFrom.isAcceptableOrUnknown(
          data['applicable_from']!,
          _applicableFromMeta,
        ),
      );
    }
    if (data.containsKey('has_b2_b')) {
      context.handle(
        _hasB2BMeta,
        hasB2B.isAcceptableOrUnknown(data['has_b2_b']!, _hasB2BMeta),
      );
    }
    if (data.containsKey('b2_b_prefix')) {
      context.handle(
        _b2BPrefixMeta,
        b2BPrefix.isAcceptableOrUnknown(data['b2_b_prefix']!, _b2BPrefixMeta),
      );
    }
    if (data.containsKey('b2_b_suffix')) {
      context.handle(
        _b2BSuffixMeta,
        b2BSuffix.isAcceptableOrUnknown(data['b2_b_suffix']!, _b2BSuffixMeta),
      );
    }
    if (data.containsKey('b2_b_width')) {
      context.handle(
        _b2BWidthMeta,
        b2BWidth.isAcceptableOrUnknown(data['b2_b_width']!, _b2BWidthMeta),
      );
    }
    if (data.containsKey('b2_b_start_from')) {
      context.handle(
        _b2BStartFromMeta,
        b2BStartFrom.isAcceptableOrUnknown(
          data['b2_b_start_from']!,
          _b2BStartFromMeta,
        ),
      );
    }
    if (data.containsKey('b2_c_prefix')) {
      context.handle(
        _b2CPrefixMeta,
        b2CPrefix.isAcceptableOrUnknown(data['b2_c_prefix']!, _b2CPrefixMeta),
      );
    }
    if (data.containsKey('b2_c_suffix')) {
      context.handle(
        _b2CSuffixMeta,
        b2CSuffix.isAcceptableOrUnknown(data['b2_c_suffix']!, _b2CSuffixMeta),
      );
    }
    if (data.containsKey('b2_c_width')) {
      context.handle(
        _b2CWidthMeta,
        b2CWidth.isAcceptableOrUnknown(data['b2_c_width']!, _b2CWidthMeta),
      );
    }
    if (data.containsKey('b2_c_start_from')) {
      context.handle(
        _b2CStartFromMeta,
        b2CStartFrom.isAcceptableOrUnknown(
          data['b2_c_start_from']!,
          _b2CStartFromMeta,
        ),
      );
    }
    if (data.containsKey('b2_b_declaration')) {
      context.handle(
        _b2BDeclarationMeta,
        b2BDeclaration.isAcceptableOrUnknown(
          data['b2_b_declaration']!,
          _b2BDeclarationMeta,
        ),
      );
    }
    if (data.containsKey('b2_c_declaration')) {
      context.handle(
        _b2CDeclarationMeta,
        b2CDeclaration.isAcceptableOrUnknown(
          data['b2_c_declaration']!,
          _b2CDeclarationMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GodownVoucherType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GodownVoucherType(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      companyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}company_id'],
      ),
      voucherTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}voucher_type_id'],
      ),
      voucherMenuName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}voucher_menu_name'],
      ),
      voucherMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}voucher_mode'],
      ),
      voucherModeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}voucher_mode_id'],
      ),
      voucherModeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}voucher_mode_name'],
      ),
      applicableFrom: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}applicable_from'],
      ),
      hasB2B: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}has_b2_b'],
      ),
      b2BPrefix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b2_b_prefix'],
      ),
      b2BSuffix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b2_b_suffix'],
      ),
      b2BWidth: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}b2_b_width'],
      ),
      b2BStartFrom: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}b2_b_start_from'],
      ),
      b2CPrefix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b2_c_prefix'],
      ),
      b2CSuffix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b2_c_suffix'],
      ),
      b2CWidth: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}b2_c_width'],
      ),
      b2CStartFrom: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}b2_c_start_from'],
      ),
      b2BDeclaration: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b2_b_declaration'],
      ),
      b2CDeclaration: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b2_c_declaration'],
      ),
    );
  }

  @override
  $GodownVoucherTypesTable createAlias(String alias) {
    return $GodownVoucherTypesTable(attachedDatabase, alias);
  }
}

class GodownVoucherType extends DataClass
    implements Insertable<GodownVoucherType> {
  final int id;
  final int? companyId;
  final int? voucherTypeId;
  final String? voucherMenuName;
  final String? voucherMode;
  final int? voucherModeId;
  final String? voucherModeName;
  final DateTime? applicableFrom;
  final int? hasB2B;
  final String? b2BPrefix;
  final String? b2BSuffix;
  final int? b2BWidth;
  final int? b2BStartFrom;
  final String? b2CPrefix;
  final String? b2CSuffix;
  final int? b2CWidth;
  final int? b2CStartFrom;
  final String? b2BDeclaration;
  final String? b2CDeclaration;
  const GodownVoucherType({
    required this.id,
    this.companyId,
    this.voucherTypeId,
    this.voucherMenuName,
    this.voucherMode,
    this.voucherModeId,
    this.voucherModeName,
    this.applicableFrom,
    this.hasB2B,
    this.b2BPrefix,
    this.b2BSuffix,
    this.b2BWidth,
    this.b2BStartFrom,
    this.b2CPrefix,
    this.b2CSuffix,
    this.b2CWidth,
    this.b2CStartFrom,
    this.b2BDeclaration,
    this.b2CDeclaration,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || companyId != null) {
      map['company_id'] = Variable<int>(companyId);
    }
    if (!nullToAbsent || voucherTypeId != null) {
      map['voucher_type_id'] = Variable<int>(voucherTypeId);
    }
    if (!nullToAbsent || voucherMenuName != null) {
      map['voucher_menu_name'] = Variable<String>(voucherMenuName);
    }
    if (!nullToAbsent || voucherMode != null) {
      map['voucher_mode'] = Variable<String>(voucherMode);
    }
    if (!nullToAbsent || voucherModeId != null) {
      map['voucher_mode_id'] = Variable<int>(voucherModeId);
    }
    if (!nullToAbsent || voucherModeName != null) {
      map['voucher_mode_name'] = Variable<String>(voucherModeName);
    }
    if (!nullToAbsent || applicableFrom != null) {
      map['applicable_from'] = Variable<DateTime>(applicableFrom);
    }
    if (!nullToAbsent || hasB2B != null) {
      map['has_b2_b'] = Variable<int>(hasB2B);
    }
    if (!nullToAbsent || b2BPrefix != null) {
      map['b2_b_prefix'] = Variable<String>(b2BPrefix);
    }
    if (!nullToAbsent || b2BSuffix != null) {
      map['b2_b_suffix'] = Variable<String>(b2BSuffix);
    }
    if (!nullToAbsent || b2BWidth != null) {
      map['b2_b_width'] = Variable<int>(b2BWidth);
    }
    if (!nullToAbsent || b2BStartFrom != null) {
      map['b2_b_start_from'] = Variable<int>(b2BStartFrom);
    }
    if (!nullToAbsent || b2CPrefix != null) {
      map['b2_c_prefix'] = Variable<String>(b2CPrefix);
    }
    if (!nullToAbsent || b2CSuffix != null) {
      map['b2_c_suffix'] = Variable<String>(b2CSuffix);
    }
    if (!nullToAbsent || b2CWidth != null) {
      map['b2_c_width'] = Variable<int>(b2CWidth);
    }
    if (!nullToAbsent || b2CStartFrom != null) {
      map['b2_c_start_from'] = Variable<int>(b2CStartFrom);
    }
    if (!nullToAbsent || b2BDeclaration != null) {
      map['b2_b_declaration'] = Variable<String>(b2BDeclaration);
    }
    if (!nullToAbsent || b2CDeclaration != null) {
      map['b2_c_declaration'] = Variable<String>(b2CDeclaration);
    }
    return map;
  }

  GodownVoucherTypesCompanion toCompanion(bool nullToAbsent) {
    return GodownVoucherTypesCompanion(
      id: Value(id),
      companyId: companyId == null && nullToAbsent
          ? const Value.absent()
          : Value(companyId),
      voucherTypeId: voucherTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(voucherTypeId),
      voucherMenuName: voucherMenuName == null && nullToAbsent
          ? const Value.absent()
          : Value(voucherMenuName),
      voucherMode: voucherMode == null && nullToAbsent
          ? const Value.absent()
          : Value(voucherMode),
      voucherModeId: voucherModeId == null && nullToAbsent
          ? const Value.absent()
          : Value(voucherModeId),
      voucherModeName: voucherModeName == null && nullToAbsent
          ? const Value.absent()
          : Value(voucherModeName),
      applicableFrom: applicableFrom == null && nullToAbsent
          ? const Value.absent()
          : Value(applicableFrom),
      hasB2B: hasB2B == null && nullToAbsent
          ? const Value.absent()
          : Value(hasB2B),
      b2BPrefix: b2BPrefix == null && nullToAbsent
          ? const Value.absent()
          : Value(b2BPrefix),
      b2BSuffix: b2BSuffix == null && nullToAbsent
          ? const Value.absent()
          : Value(b2BSuffix),
      b2BWidth: b2BWidth == null && nullToAbsent
          ? const Value.absent()
          : Value(b2BWidth),
      b2BStartFrom: b2BStartFrom == null && nullToAbsent
          ? const Value.absent()
          : Value(b2BStartFrom),
      b2CPrefix: b2CPrefix == null && nullToAbsent
          ? const Value.absent()
          : Value(b2CPrefix),
      b2CSuffix: b2CSuffix == null && nullToAbsent
          ? const Value.absent()
          : Value(b2CSuffix),
      b2CWidth: b2CWidth == null && nullToAbsent
          ? const Value.absent()
          : Value(b2CWidth),
      b2CStartFrom: b2CStartFrom == null && nullToAbsent
          ? const Value.absent()
          : Value(b2CStartFrom),
      b2BDeclaration: b2BDeclaration == null && nullToAbsent
          ? const Value.absent()
          : Value(b2BDeclaration),
      b2CDeclaration: b2CDeclaration == null && nullToAbsent
          ? const Value.absent()
          : Value(b2CDeclaration),
    );
  }

  factory GodownVoucherType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GodownVoucherType(
      id: serializer.fromJson<int>(json['id']),
      companyId: serializer.fromJson<int?>(json['companyId']),
      voucherTypeId: serializer.fromJson<int?>(json['voucherTypeId']),
      voucherMenuName: serializer.fromJson<String?>(json['voucherMenuName']),
      voucherMode: serializer.fromJson<String?>(json['voucherMode']),
      voucherModeId: serializer.fromJson<int?>(json['voucherModeId']),
      voucherModeName: serializer.fromJson<String?>(json['voucherModeName']),
      applicableFrom: serializer.fromJson<DateTime?>(json['applicableFrom']),
      hasB2B: serializer.fromJson<int?>(json['hasB2B']),
      b2BPrefix: serializer.fromJson<String?>(json['b2BPrefix']),
      b2BSuffix: serializer.fromJson<String?>(json['b2BSuffix']),
      b2BWidth: serializer.fromJson<int?>(json['b2BWidth']),
      b2BStartFrom: serializer.fromJson<int?>(json['b2BStartFrom']),
      b2CPrefix: serializer.fromJson<String?>(json['b2CPrefix']),
      b2CSuffix: serializer.fromJson<String?>(json['b2CSuffix']),
      b2CWidth: serializer.fromJson<int?>(json['b2CWidth']),
      b2CStartFrom: serializer.fromJson<int?>(json['b2CStartFrom']),
      b2BDeclaration: serializer.fromJson<String?>(json['b2BDeclaration']),
      b2CDeclaration: serializer.fromJson<String?>(json['b2CDeclaration']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'companyId': serializer.toJson<int?>(companyId),
      'voucherTypeId': serializer.toJson<int?>(voucherTypeId),
      'voucherMenuName': serializer.toJson<String?>(voucherMenuName),
      'voucherMode': serializer.toJson<String?>(voucherMode),
      'voucherModeId': serializer.toJson<int?>(voucherModeId),
      'voucherModeName': serializer.toJson<String?>(voucherModeName),
      'applicableFrom': serializer.toJson<DateTime?>(applicableFrom),
      'hasB2B': serializer.toJson<int?>(hasB2B),
      'b2BPrefix': serializer.toJson<String?>(b2BPrefix),
      'b2BSuffix': serializer.toJson<String?>(b2BSuffix),
      'b2BWidth': serializer.toJson<int?>(b2BWidth),
      'b2BStartFrom': serializer.toJson<int?>(b2BStartFrom),
      'b2CPrefix': serializer.toJson<String?>(b2CPrefix),
      'b2CSuffix': serializer.toJson<String?>(b2CSuffix),
      'b2CWidth': serializer.toJson<int?>(b2CWidth),
      'b2CStartFrom': serializer.toJson<int?>(b2CStartFrom),
      'b2BDeclaration': serializer.toJson<String?>(b2BDeclaration),
      'b2CDeclaration': serializer.toJson<String?>(b2CDeclaration),
    };
  }

  GodownVoucherType copyWith({
    int? id,
    Value<int?> companyId = const Value.absent(),
    Value<int?> voucherTypeId = const Value.absent(),
    Value<String?> voucherMenuName = const Value.absent(),
    Value<String?> voucherMode = const Value.absent(),
    Value<int?> voucherModeId = const Value.absent(),
    Value<String?> voucherModeName = const Value.absent(),
    Value<DateTime?> applicableFrom = const Value.absent(),
    Value<int?> hasB2B = const Value.absent(),
    Value<String?> b2BPrefix = const Value.absent(),
    Value<String?> b2BSuffix = const Value.absent(),
    Value<int?> b2BWidth = const Value.absent(),
    Value<int?> b2BStartFrom = const Value.absent(),
    Value<String?> b2CPrefix = const Value.absent(),
    Value<String?> b2CSuffix = const Value.absent(),
    Value<int?> b2CWidth = const Value.absent(),
    Value<int?> b2CStartFrom = const Value.absent(),
    Value<String?> b2BDeclaration = const Value.absent(),
    Value<String?> b2CDeclaration = const Value.absent(),
  }) => GodownVoucherType(
    id: id ?? this.id,
    companyId: companyId.present ? companyId.value : this.companyId,
    voucherTypeId: voucherTypeId.present
        ? voucherTypeId.value
        : this.voucherTypeId,
    voucherMenuName: voucherMenuName.present
        ? voucherMenuName.value
        : this.voucherMenuName,
    voucherMode: voucherMode.present ? voucherMode.value : this.voucherMode,
    voucherModeId: voucherModeId.present
        ? voucherModeId.value
        : this.voucherModeId,
    voucherModeName: voucherModeName.present
        ? voucherModeName.value
        : this.voucherModeName,
    applicableFrom: applicableFrom.present
        ? applicableFrom.value
        : this.applicableFrom,
    hasB2B: hasB2B.present ? hasB2B.value : this.hasB2B,
    b2BPrefix: b2BPrefix.present ? b2BPrefix.value : this.b2BPrefix,
    b2BSuffix: b2BSuffix.present ? b2BSuffix.value : this.b2BSuffix,
    b2BWidth: b2BWidth.present ? b2BWidth.value : this.b2BWidth,
    b2BStartFrom: b2BStartFrom.present ? b2BStartFrom.value : this.b2BStartFrom,
    b2CPrefix: b2CPrefix.present ? b2CPrefix.value : this.b2CPrefix,
    b2CSuffix: b2CSuffix.present ? b2CSuffix.value : this.b2CSuffix,
    b2CWidth: b2CWidth.present ? b2CWidth.value : this.b2CWidth,
    b2CStartFrom: b2CStartFrom.present ? b2CStartFrom.value : this.b2CStartFrom,
    b2BDeclaration: b2BDeclaration.present
        ? b2BDeclaration.value
        : this.b2BDeclaration,
    b2CDeclaration: b2CDeclaration.present
        ? b2CDeclaration.value
        : this.b2CDeclaration,
  );
  GodownVoucherType copyWithCompanion(GodownVoucherTypesCompanion data) {
    return GodownVoucherType(
      id: data.id.present ? data.id.value : this.id,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      voucherTypeId: data.voucherTypeId.present
          ? data.voucherTypeId.value
          : this.voucherTypeId,
      voucherMenuName: data.voucherMenuName.present
          ? data.voucherMenuName.value
          : this.voucherMenuName,
      voucherMode: data.voucherMode.present
          ? data.voucherMode.value
          : this.voucherMode,
      voucherModeId: data.voucherModeId.present
          ? data.voucherModeId.value
          : this.voucherModeId,
      voucherModeName: data.voucherModeName.present
          ? data.voucherModeName.value
          : this.voucherModeName,
      applicableFrom: data.applicableFrom.present
          ? data.applicableFrom.value
          : this.applicableFrom,
      hasB2B: data.hasB2B.present ? data.hasB2B.value : this.hasB2B,
      b2BPrefix: data.b2BPrefix.present ? data.b2BPrefix.value : this.b2BPrefix,
      b2BSuffix: data.b2BSuffix.present ? data.b2BSuffix.value : this.b2BSuffix,
      b2BWidth: data.b2BWidth.present ? data.b2BWidth.value : this.b2BWidth,
      b2BStartFrom: data.b2BStartFrom.present
          ? data.b2BStartFrom.value
          : this.b2BStartFrom,
      b2CPrefix: data.b2CPrefix.present ? data.b2CPrefix.value : this.b2CPrefix,
      b2CSuffix: data.b2CSuffix.present ? data.b2CSuffix.value : this.b2CSuffix,
      b2CWidth: data.b2CWidth.present ? data.b2CWidth.value : this.b2CWidth,
      b2CStartFrom: data.b2CStartFrom.present
          ? data.b2CStartFrom.value
          : this.b2CStartFrom,
      b2BDeclaration: data.b2BDeclaration.present
          ? data.b2BDeclaration.value
          : this.b2BDeclaration,
      b2CDeclaration: data.b2CDeclaration.present
          ? data.b2CDeclaration.value
          : this.b2CDeclaration,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GodownVoucherType(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('voucherTypeId: $voucherTypeId, ')
          ..write('voucherMenuName: $voucherMenuName, ')
          ..write('voucherMode: $voucherMode, ')
          ..write('voucherModeId: $voucherModeId, ')
          ..write('voucherModeName: $voucherModeName, ')
          ..write('applicableFrom: $applicableFrom, ')
          ..write('hasB2B: $hasB2B, ')
          ..write('b2BPrefix: $b2BPrefix, ')
          ..write('b2BSuffix: $b2BSuffix, ')
          ..write('b2BWidth: $b2BWidth, ')
          ..write('b2BStartFrom: $b2BStartFrom, ')
          ..write('b2CPrefix: $b2CPrefix, ')
          ..write('b2CSuffix: $b2CSuffix, ')
          ..write('b2CWidth: $b2CWidth, ')
          ..write('b2CStartFrom: $b2CStartFrom, ')
          ..write('b2BDeclaration: $b2BDeclaration, ')
          ..write('b2CDeclaration: $b2CDeclaration')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    companyId,
    voucherTypeId,
    voucherMenuName,
    voucherMode,
    voucherModeId,
    voucherModeName,
    applicableFrom,
    hasB2B,
    b2BPrefix,
    b2BSuffix,
    b2BWidth,
    b2BStartFrom,
    b2CPrefix,
    b2CSuffix,
    b2CWidth,
    b2CStartFrom,
    b2BDeclaration,
    b2CDeclaration,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GodownVoucherType &&
          other.id == this.id &&
          other.companyId == this.companyId &&
          other.voucherTypeId == this.voucherTypeId &&
          other.voucherMenuName == this.voucherMenuName &&
          other.voucherMode == this.voucherMode &&
          other.voucherModeId == this.voucherModeId &&
          other.voucherModeName == this.voucherModeName &&
          other.applicableFrom == this.applicableFrom &&
          other.hasB2B == this.hasB2B &&
          other.b2BPrefix == this.b2BPrefix &&
          other.b2BSuffix == this.b2BSuffix &&
          other.b2BWidth == this.b2BWidth &&
          other.b2BStartFrom == this.b2BStartFrom &&
          other.b2CPrefix == this.b2CPrefix &&
          other.b2CSuffix == this.b2CSuffix &&
          other.b2CWidth == this.b2CWidth &&
          other.b2CStartFrom == this.b2CStartFrom &&
          other.b2BDeclaration == this.b2BDeclaration &&
          other.b2CDeclaration == this.b2CDeclaration);
}

class GodownVoucherTypesCompanion extends UpdateCompanion<GodownVoucherType> {
  final Value<int> id;
  final Value<int?> companyId;
  final Value<int?> voucherTypeId;
  final Value<String?> voucherMenuName;
  final Value<String?> voucherMode;
  final Value<int?> voucherModeId;
  final Value<String?> voucherModeName;
  final Value<DateTime?> applicableFrom;
  final Value<int?> hasB2B;
  final Value<String?> b2BPrefix;
  final Value<String?> b2BSuffix;
  final Value<int?> b2BWidth;
  final Value<int?> b2BStartFrom;
  final Value<String?> b2CPrefix;
  final Value<String?> b2CSuffix;
  final Value<int?> b2CWidth;
  final Value<int?> b2CStartFrom;
  final Value<String?> b2BDeclaration;
  final Value<String?> b2CDeclaration;
  const GodownVoucherTypesCompanion({
    this.id = const Value.absent(),
    this.companyId = const Value.absent(),
    this.voucherTypeId = const Value.absent(),
    this.voucherMenuName = const Value.absent(),
    this.voucherMode = const Value.absent(),
    this.voucherModeId = const Value.absent(),
    this.voucherModeName = const Value.absent(),
    this.applicableFrom = const Value.absent(),
    this.hasB2B = const Value.absent(),
    this.b2BPrefix = const Value.absent(),
    this.b2BSuffix = const Value.absent(),
    this.b2BWidth = const Value.absent(),
    this.b2BStartFrom = const Value.absent(),
    this.b2CPrefix = const Value.absent(),
    this.b2CSuffix = const Value.absent(),
    this.b2CWidth = const Value.absent(),
    this.b2CStartFrom = const Value.absent(),
    this.b2BDeclaration = const Value.absent(),
    this.b2CDeclaration = const Value.absent(),
  });
  GodownVoucherTypesCompanion.insert({
    this.id = const Value.absent(),
    this.companyId = const Value.absent(),
    this.voucherTypeId = const Value.absent(),
    this.voucherMenuName = const Value.absent(),
    this.voucherMode = const Value.absent(),
    this.voucherModeId = const Value.absent(),
    this.voucherModeName = const Value.absent(),
    this.applicableFrom = const Value.absent(),
    this.hasB2B = const Value.absent(),
    this.b2BPrefix = const Value.absent(),
    this.b2BSuffix = const Value.absent(),
    this.b2BWidth = const Value.absent(),
    this.b2BStartFrom = const Value.absent(),
    this.b2CPrefix = const Value.absent(),
    this.b2CSuffix = const Value.absent(),
    this.b2CWidth = const Value.absent(),
    this.b2CStartFrom = const Value.absent(),
    this.b2BDeclaration = const Value.absent(),
    this.b2CDeclaration = const Value.absent(),
  });
  static Insertable<GodownVoucherType> custom({
    Expression<int>? id,
    Expression<int>? companyId,
    Expression<int>? voucherTypeId,
    Expression<String>? voucherMenuName,
    Expression<String>? voucherMode,
    Expression<int>? voucherModeId,
    Expression<String>? voucherModeName,
    Expression<DateTime>? applicableFrom,
    Expression<int>? hasB2B,
    Expression<String>? b2BPrefix,
    Expression<String>? b2BSuffix,
    Expression<int>? b2BWidth,
    Expression<int>? b2BStartFrom,
    Expression<String>? b2CPrefix,
    Expression<String>? b2CSuffix,
    Expression<int>? b2CWidth,
    Expression<int>? b2CStartFrom,
    Expression<String>? b2BDeclaration,
    Expression<String>? b2CDeclaration,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companyId != null) 'company_id': companyId,
      if (voucherTypeId != null) 'voucher_type_id': voucherTypeId,
      if (voucherMenuName != null) 'voucher_menu_name': voucherMenuName,
      if (voucherMode != null) 'voucher_mode': voucherMode,
      if (voucherModeId != null) 'voucher_mode_id': voucherModeId,
      if (voucherModeName != null) 'voucher_mode_name': voucherModeName,
      if (applicableFrom != null) 'applicable_from': applicableFrom,
      if (hasB2B != null) 'has_b2_b': hasB2B,
      if (b2BPrefix != null) 'b2_b_prefix': b2BPrefix,
      if (b2BSuffix != null) 'b2_b_suffix': b2BSuffix,
      if (b2BWidth != null) 'b2_b_width': b2BWidth,
      if (b2BStartFrom != null) 'b2_b_start_from': b2BStartFrom,
      if (b2CPrefix != null) 'b2_c_prefix': b2CPrefix,
      if (b2CSuffix != null) 'b2_c_suffix': b2CSuffix,
      if (b2CWidth != null) 'b2_c_width': b2CWidth,
      if (b2CStartFrom != null) 'b2_c_start_from': b2CStartFrom,
      if (b2BDeclaration != null) 'b2_b_declaration': b2BDeclaration,
      if (b2CDeclaration != null) 'b2_c_declaration': b2CDeclaration,
    });
  }

  GodownVoucherTypesCompanion copyWith({
    Value<int>? id,
    Value<int?>? companyId,
    Value<int?>? voucherTypeId,
    Value<String?>? voucherMenuName,
    Value<String?>? voucherMode,
    Value<int?>? voucherModeId,
    Value<String?>? voucherModeName,
    Value<DateTime?>? applicableFrom,
    Value<int?>? hasB2B,
    Value<String?>? b2BPrefix,
    Value<String?>? b2BSuffix,
    Value<int?>? b2BWidth,
    Value<int?>? b2BStartFrom,
    Value<String?>? b2CPrefix,
    Value<String?>? b2CSuffix,
    Value<int?>? b2CWidth,
    Value<int?>? b2CStartFrom,
    Value<String?>? b2BDeclaration,
    Value<String?>? b2CDeclaration,
  }) {
    return GodownVoucherTypesCompanion(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      voucherTypeId: voucherTypeId ?? this.voucherTypeId,
      voucherMenuName: voucherMenuName ?? this.voucherMenuName,
      voucherMode: voucherMode ?? this.voucherMode,
      voucherModeId: voucherModeId ?? this.voucherModeId,
      voucherModeName: voucherModeName ?? this.voucherModeName,
      applicableFrom: applicableFrom ?? this.applicableFrom,
      hasB2B: hasB2B ?? this.hasB2B,
      b2BPrefix: b2BPrefix ?? this.b2BPrefix,
      b2BSuffix: b2BSuffix ?? this.b2BSuffix,
      b2BWidth: b2BWidth ?? this.b2BWidth,
      b2BStartFrom: b2BStartFrom ?? this.b2BStartFrom,
      b2CPrefix: b2CPrefix ?? this.b2CPrefix,
      b2CSuffix: b2CSuffix ?? this.b2CSuffix,
      b2CWidth: b2CWidth ?? this.b2CWidth,
      b2CStartFrom: b2CStartFrom ?? this.b2CStartFrom,
      b2BDeclaration: b2BDeclaration ?? this.b2BDeclaration,
      b2CDeclaration: b2CDeclaration ?? this.b2CDeclaration,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    if (voucherTypeId.present) {
      map['voucher_type_id'] = Variable<int>(voucherTypeId.value);
    }
    if (voucherMenuName.present) {
      map['voucher_menu_name'] = Variable<String>(voucherMenuName.value);
    }
    if (voucherMode.present) {
      map['voucher_mode'] = Variable<String>(voucherMode.value);
    }
    if (voucherModeId.present) {
      map['voucher_mode_id'] = Variable<int>(voucherModeId.value);
    }
    if (voucherModeName.present) {
      map['voucher_mode_name'] = Variable<String>(voucherModeName.value);
    }
    if (applicableFrom.present) {
      map['applicable_from'] = Variable<DateTime>(applicableFrom.value);
    }
    if (hasB2B.present) {
      map['has_b2_b'] = Variable<int>(hasB2B.value);
    }
    if (b2BPrefix.present) {
      map['b2_b_prefix'] = Variable<String>(b2BPrefix.value);
    }
    if (b2BSuffix.present) {
      map['b2_b_suffix'] = Variable<String>(b2BSuffix.value);
    }
    if (b2BWidth.present) {
      map['b2_b_width'] = Variable<int>(b2BWidth.value);
    }
    if (b2BStartFrom.present) {
      map['b2_b_start_from'] = Variable<int>(b2BStartFrom.value);
    }
    if (b2CPrefix.present) {
      map['b2_c_prefix'] = Variable<String>(b2CPrefix.value);
    }
    if (b2CSuffix.present) {
      map['b2_c_suffix'] = Variable<String>(b2CSuffix.value);
    }
    if (b2CWidth.present) {
      map['b2_c_width'] = Variable<int>(b2CWidth.value);
    }
    if (b2CStartFrom.present) {
      map['b2_c_start_from'] = Variable<int>(b2CStartFrom.value);
    }
    if (b2BDeclaration.present) {
      map['b2_b_declaration'] = Variable<String>(b2BDeclaration.value);
    }
    if (b2CDeclaration.present) {
      map['b2_c_declaration'] = Variable<String>(b2CDeclaration.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GodownVoucherTypesCompanion(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('voucherTypeId: $voucherTypeId, ')
          ..write('voucherMenuName: $voucherMenuName, ')
          ..write('voucherMode: $voucherMode, ')
          ..write('voucherModeId: $voucherModeId, ')
          ..write('voucherModeName: $voucherModeName, ')
          ..write('applicableFrom: $applicableFrom, ')
          ..write('hasB2B: $hasB2B, ')
          ..write('b2BPrefix: $b2BPrefix, ')
          ..write('b2BSuffix: $b2BSuffix, ')
          ..write('b2BWidth: $b2BWidth, ')
          ..write('b2BStartFrom: $b2BStartFrom, ')
          ..write('b2CPrefix: $b2CPrefix, ')
          ..write('b2CSuffix: $b2CSuffix, ')
          ..write('b2CWidth: $b2CWidth, ')
          ..write('b2CStartFrom: $b2CStartFrom, ')
          ..write('b2BDeclaration: $b2BDeclaration, ')
          ..write('b2CDeclaration: $b2CDeclaration')
          ..write(')'))
        .toString();
  }
}

class $RouteVoucherTypesTable extends RouteVoucherTypes
    with TableInfo<$RouteVoucherTypesTable, RouteVoucherType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RouteVoucherTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _companyIdMeta = const VerificationMeta(
    'companyId',
  );
  @override
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
    'company_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voucherTypeIdMeta = const VerificationMeta(
    'voucherTypeId',
  );
  @override
  late final GeneratedColumn<int> voucherTypeId = GeneratedColumn<int>(
    'voucher_type_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voucherMenuNameMeta = const VerificationMeta(
    'voucherMenuName',
  );
  @override
  late final GeneratedColumn<String> voucherMenuName = GeneratedColumn<String>(
    'voucher_menu_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voucherModeMeta = const VerificationMeta(
    'voucherMode',
  );
  @override
  late final GeneratedColumn<String> voucherMode = GeneratedColumn<String>(
    'voucher_mode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voucherModeIdMeta = const VerificationMeta(
    'voucherModeId',
  );
  @override
  late final GeneratedColumn<int> voucherModeId = GeneratedColumn<int>(
    'voucher_mode_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voucherModeNameMeta = const VerificationMeta(
    'voucherModeName',
  );
  @override
  late final GeneratedColumn<String> voucherModeName = GeneratedColumn<String>(
    'voucher_mode_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _applicableFromMeta = const VerificationMeta(
    'applicableFrom',
  );
  @override
  late final GeneratedColumn<DateTime> applicableFrom =
      GeneratedColumn<DateTime>(
        'applicable_from',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _hasB2BMeta = const VerificationMeta('hasB2B');
  @override
  late final GeneratedColumn<int> hasB2B = GeneratedColumn<int>(
    'has_b2_b',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2BPrefixMeta = const VerificationMeta(
    'b2BPrefix',
  );
  @override
  late final GeneratedColumn<String> b2BPrefix = GeneratedColumn<String>(
    'b2_b_prefix',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2BSuffixMeta = const VerificationMeta(
    'b2BSuffix',
  );
  @override
  late final GeneratedColumn<String> b2BSuffix = GeneratedColumn<String>(
    'b2_b_suffix',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2BWidthMeta = const VerificationMeta(
    'b2BWidth',
  );
  @override
  late final GeneratedColumn<int> b2BWidth = GeneratedColumn<int>(
    'b2_b_width',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2BStartFromMeta = const VerificationMeta(
    'b2BStartFrom',
  );
  @override
  late final GeneratedColumn<int> b2BStartFrom = GeneratedColumn<int>(
    'b2_b_start_from',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2CPrefixMeta = const VerificationMeta(
    'b2CPrefix',
  );
  @override
  late final GeneratedColumn<String> b2CPrefix = GeneratedColumn<String>(
    'b2_c_prefix',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2CSuffixMeta = const VerificationMeta(
    'b2CSuffix',
  );
  @override
  late final GeneratedColumn<String> b2CSuffix = GeneratedColumn<String>(
    'b2_c_suffix',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2CWidthMeta = const VerificationMeta(
    'b2CWidth',
  );
  @override
  late final GeneratedColumn<int> b2CWidth = GeneratedColumn<int>(
    'b2_c_width',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2CStartFromMeta = const VerificationMeta(
    'b2CStartFrom',
  );
  @override
  late final GeneratedColumn<int> b2CStartFrom = GeneratedColumn<int>(
    'b2_c_start_from',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2BDeclarationMeta = const VerificationMeta(
    'b2BDeclaration',
  );
  @override
  late final GeneratedColumn<String> b2BDeclaration = GeneratedColumn<String>(
    'b2_b_declaration',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _b2CDeclarationMeta = const VerificationMeta(
    'b2CDeclaration',
  );
  @override
  late final GeneratedColumn<String> b2CDeclaration = GeneratedColumn<String>(
    'b2_c_declaration',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    companyId,
    voucherTypeId,
    voucherMenuName,
    voucherMode,
    voucherModeId,
    voucherModeName,
    applicableFrom,
    hasB2B,
    b2BPrefix,
    b2BSuffix,
    b2BWidth,
    b2BStartFrom,
    b2CPrefix,
    b2CSuffix,
    b2CWidth,
    b2CStartFrom,
    b2BDeclaration,
    b2CDeclaration,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'route_voucher_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<RouteVoucherType> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('company_id')) {
      context.handle(
        _companyIdMeta,
        companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta),
      );
    }
    if (data.containsKey('voucher_type_id')) {
      context.handle(
        _voucherTypeIdMeta,
        voucherTypeId.isAcceptableOrUnknown(
          data['voucher_type_id']!,
          _voucherTypeIdMeta,
        ),
      );
    }
    if (data.containsKey('voucher_menu_name')) {
      context.handle(
        _voucherMenuNameMeta,
        voucherMenuName.isAcceptableOrUnknown(
          data['voucher_menu_name']!,
          _voucherMenuNameMeta,
        ),
      );
    }
    if (data.containsKey('voucher_mode')) {
      context.handle(
        _voucherModeMeta,
        voucherMode.isAcceptableOrUnknown(
          data['voucher_mode']!,
          _voucherModeMeta,
        ),
      );
    }
    if (data.containsKey('voucher_mode_id')) {
      context.handle(
        _voucherModeIdMeta,
        voucherModeId.isAcceptableOrUnknown(
          data['voucher_mode_id']!,
          _voucherModeIdMeta,
        ),
      );
    }
    if (data.containsKey('voucher_mode_name')) {
      context.handle(
        _voucherModeNameMeta,
        voucherModeName.isAcceptableOrUnknown(
          data['voucher_mode_name']!,
          _voucherModeNameMeta,
        ),
      );
    }
    if (data.containsKey('applicable_from')) {
      context.handle(
        _applicableFromMeta,
        applicableFrom.isAcceptableOrUnknown(
          data['applicable_from']!,
          _applicableFromMeta,
        ),
      );
    }
    if (data.containsKey('has_b2_b')) {
      context.handle(
        _hasB2BMeta,
        hasB2B.isAcceptableOrUnknown(data['has_b2_b']!, _hasB2BMeta),
      );
    }
    if (data.containsKey('b2_b_prefix')) {
      context.handle(
        _b2BPrefixMeta,
        b2BPrefix.isAcceptableOrUnknown(data['b2_b_prefix']!, _b2BPrefixMeta),
      );
    }
    if (data.containsKey('b2_b_suffix')) {
      context.handle(
        _b2BSuffixMeta,
        b2BSuffix.isAcceptableOrUnknown(data['b2_b_suffix']!, _b2BSuffixMeta),
      );
    }
    if (data.containsKey('b2_b_width')) {
      context.handle(
        _b2BWidthMeta,
        b2BWidth.isAcceptableOrUnknown(data['b2_b_width']!, _b2BWidthMeta),
      );
    }
    if (data.containsKey('b2_b_start_from')) {
      context.handle(
        _b2BStartFromMeta,
        b2BStartFrom.isAcceptableOrUnknown(
          data['b2_b_start_from']!,
          _b2BStartFromMeta,
        ),
      );
    }
    if (data.containsKey('b2_c_prefix')) {
      context.handle(
        _b2CPrefixMeta,
        b2CPrefix.isAcceptableOrUnknown(data['b2_c_prefix']!, _b2CPrefixMeta),
      );
    }
    if (data.containsKey('b2_c_suffix')) {
      context.handle(
        _b2CSuffixMeta,
        b2CSuffix.isAcceptableOrUnknown(data['b2_c_suffix']!, _b2CSuffixMeta),
      );
    }
    if (data.containsKey('b2_c_width')) {
      context.handle(
        _b2CWidthMeta,
        b2CWidth.isAcceptableOrUnknown(data['b2_c_width']!, _b2CWidthMeta),
      );
    }
    if (data.containsKey('b2_c_start_from')) {
      context.handle(
        _b2CStartFromMeta,
        b2CStartFrom.isAcceptableOrUnknown(
          data['b2_c_start_from']!,
          _b2CStartFromMeta,
        ),
      );
    }
    if (data.containsKey('b2_b_declaration')) {
      context.handle(
        _b2BDeclarationMeta,
        b2BDeclaration.isAcceptableOrUnknown(
          data['b2_b_declaration']!,
          _b2BDeclarationMeta,
        ),
      );
    }
    if (data.containsKey('b2_c_declaration')) {
      context.handle(
        _b2CDeclarationMeta,
        b2CDeclaration.isAcceptableOrUnknown(
          data['b2_c_declaration']!,
          _b2CDeclarationMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RouteVoucherType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RouteVoucherType(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      companyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}company_id'],
      ),
      voucherTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}voucher_type_id'],
      ),
      voucherMenuName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}voucher_menu_name'],
      ),
      voucherMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}voucher_mode'],
      ),
      voucherModeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}voucher_mode_id'],
      ),
      voucherModeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}voucher_mode_name'],
      ),
      applicableFrom: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}applicable_from'],
      ),
      hasB2B: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}has_b2_b'],
      ),
      b2BPrefix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b2_b_prefix'],
      ),
      b2BSuffix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b2_b_suffix'],
      ),
      b2BWidth: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}b2_b_width'],
      ),
      b2BStartFrom: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}b2_b_start_from'],
      ),
      b2CPrefix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b2_c_prefix'],
      ),
      b2CSuffix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b2_c_suffix'],
      ),
      b2CWidth: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}b2_c_width'],
      ),
      b2CStartFrom: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}b2_c_start_from'],
      ),
      b2BDeclaration: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b2_b_declaration'],
      ),
      b2CDeclaration: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}b2_c_declaration'],
      ),
    );
  }

  @override
  $RouteVoucherTypesTable createAlias(String alias) {
    return $RouteVoucherTypesTable(attachedDatabase, alias);
  }
}

class RouteVoucherType extends DataClass
    implements Insertable<RouteVoucherType> {
  final int id;
  final int? companyId;
  final int? voucherTypeId;
  final String? voucherMenuName;
  final String? voucherMode;
  final int? voucherModeId;
  final String? voucherModeName;
  final DateTime? applicableFrom;
  final int? hasB2B;
  final String? b2BPrefix;
  final String? b2BSuffix;
  final int? b2BWidth;
  final int? b2BStartFrom;
  final String? b2CPrefix;
  final String? b2CSuffix;
  final int? b2CWidth;
  final int? b2CStartFrom;
  final String? b2BDeclaration;
  final String? b2CDeclaration;
  const RouteVoucherType({
    required this.id,
    this.companyId,
    this.voucherTypeId,
    this.voucherMenuName,
    this.voucherMode,
    this.voucherModeId,
    this.voucherModeName,
    this.applicableFrom,
    this.hasB2B,
    this.b2BPrefix,
    this.b2BSuffix,
    this.b2BWidth,
    this.b2BStartFrom,
    this.b2CPrefix,
    this.b2CSuffix,
    this.b2CWidth,
    this.b2CStartFrom,
    this.b2BDeclaration,
    this.b2CDeclaration,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || companyId != null) {
      map['company_id'] = Variable<int>(companyId);
    }
    if (!nullToAbsent || voucherTypeId != null) {
      map['voucher_type_id'] = Variable<int>(voucherTypeId);
    }
    if (!nullToAbsent || voucherMenuName != null) {
      map['voucher_menu_name'] = Variable<String>(voucherMenuName);
    }
    if (!nullToAbsent || voucherMode != null) {
      map['voucher_mode'] = Variable<String>(voucherMode);
    }
    if (!nullToAbsent || voucherModeId != null) {
      map['voucher_mode_id'] = Variable<int>(voucherModeId);
    }
    if (!nullToAbsent || voucherModeName != null) {
      map['voucher_mode_name'] = Variable<String>(voucherModeName);
    }
    if (!nullToAbsent || applicableFrom != null) {
      map['applicable_from'] = Variable<DateTime>(applicableFrom);
    }
    if (!nullToAbsent || hasB2B != null) {
      map['has_b2_b'] = Variable<int>(hasB2B);
    }
    if (!nullToAbsent || b2BPrefix != null) {
      map['b2_b_prefix'] = Variable<String>(b2BPrefix);
    }
    if (!nullToAbsent || b2BSuffix != null) {
      map['b2_b_suffix'] = Variable<String>(b2BSuffix);
    }
    if (!nullToAbsent || b2BWidth != null) {
      map['b2_b_width'] = Variable<int>(b2BWidth);
    }
    if (!nullToAbsent || b2BStartFrom != null) {
      map['b2_b_start_from'] = Variable<int>(b2BStartFrom);
    }
    if (!nullToAbsent || b2CPrefix != null) {
      map['b2_c_prefix'] = Variable<String>(b2CPrefix);
    }
    if (!nullToAbsent || b2CSuffix != null) {
      map['b2_c_suffix'] = Variable<String>(b2CSuffix);
    }
    if (!nullToAbsent || b2CWidth != null) {
      map['b2_c_width'] = Variable<int>(b2CWidth);
    }
    if (!nullToAbsent || b2CStartFrom != null) {
      map['b2_c_start_from'] = Variable<int>(b2CStartFrom);
    }
    if (!nullToAbsent || b2BDeclaration != null) {
      map['b2_b_declaration'] = Variable<String>(b2BDeclaration);
    }
    if (!nullToAbsent || b2CDeclaration != null) {
      map['b2_c_declaration'] = Variable<String>(b2CDeclaration);
    }
    return map;
  }

  RouteVoucherTypesCompanion toCompanion(bool nullToAbsent) {
    return RouteVoucherTypesCompanion(
      id: Value(id),
      companyId: companyId == null && nullToAbsent
          ? const Value.absent()
          : Value(companyId),
      voucherTypeId: voucherTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(voucherTypeId),
      voucherMenuName: voucherMenuName == null && nullToAbsent
          ? const Value.absent()
          : Value(voucherMenuName),
      voucherMode: voucherMode == null && nullToAbsent
          ? const Value.absent()
          : Value(voucherMode),
      voucherModeId: voucherModeId == null && nullToAbsent
          ? const Value.absent()
          : Value(voucherModeId),
      voucherModeName: voucherModeName == null && nullToAbsent
          ? const Value.absent()
          : Value(voucherModeName),
      applicableFrom: applicableFrom == null && nullToAbsent
          ? const Value.absent()
          : Value(applicableFrom),
      hasB2B: hasB2B == null && nullToAbsent
          ? const Value.absent()
          : Value(hasB2B),
      b2BPrefix: b2BPrefix == null && nullToAbsent
          ? const Value.absent()
          : Value(b2BPrefix),
      b2BSuffix: b2BSuffix == null && nullToAbsent
          ? const Value.absent()
          : Value(b2BSuffix),
      b2BWidth: b2BWidth == null && nullToAbsent
          ? const Value.absent()
          : Value(b2BWidth),
      b2BStartFrom: b2BStartFrom == null && nullToAbsent
          ? const Value.absent()
          : Value(b2BStartFrom),
      b2CPrefix: b2CPrefix == null && nullToAbsent
          ? const Value.absent()
          : Value(b2CPrefix),
      b2CSuffix: b2CSuffix == null && nullToAbsent
          ? const Value.absent()
          : Value(b2CSuffix),
      b2CWidth: b2CWidth == null && nullToAbsent
          ? const Value.absent()
          : Value(b2CWidth),
      b2CStartFrom: b2CStartFrom == null && nullToAbsent
          ? const Value.absent()
          : Value(b2CStartFrom),
      b2BDeclaration: b2BDeclaration == null && nullToAbsent
          ? const Value.absent()
          : Value(b2BDeclaration),
      b2CDeclaration: b2CDeclaration == null && nullToAbsent
          ? const Value.absent()
          : Value(b2CDeclaration),
    );
  }

  factory RouteVoucherType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RouteVoucherType(
      id: serializer.fromJson<int>(json['id']),
      companyId: serializer.fromJson<int?>(json['companyId']),
      voucherTypeId: serializer.fromJson<int?>(json['voucherTypeId']),
      voucherMenuName: serializer.fromJson<String?>(json['voucherMenuName']),
      voucherMode: serializer.fromJson<String?>(json['voucherMode']),
      voucherModeId: serializer.fromJson<int?>(json['voucherModeId']),
      voucherModeName: serializer.fromJson<String?>(json['voucherModeName']),
      applicableFrom: serializer.fromJson<DateTime?>(json['applicableFrom']),
      hasB2B: serializer.fromJson<int?>(json['hasB2B']),
      b2BPrefix: serializer.fromJson<String?>(json['b2BPrefix']),
      b2BSuffix: serializer.fromJson<String?>(json['b2BSuffix']),
      b2BWidth: serializer.fromJson<int?>(json['b2BWidth']),
      b2BStartFrom: serializer.fromJson<int?>(json['b2BStartFrom']),
      b2CPrefix: serializer.fromJson<String?>(json['b2CPrefix']),
      b2CSuffix: serializer.fromJson<String?>(json['b2CSuffix']),
      b2CWidth: serializer.fromJson<int?>(json['b2CWidth']),
      b2CStartFrom: serializer.fromJson<int?>(json['b2CStartFrom']),
      b2BDeclaration: serializer.fromJson<String?>(json['b2BDeclaration']),
      b2CDeclaration: serializer.fromJson<String?>(json['b2CDeclaration']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'companyId': serializer.toJson<int?>(companyId),
      'voucherTypeId': serializer.toJson<int?>(voucherTypeId),
      'voucherMenuName': serializer.toJson<String?>(voucherMenuName),
      'voucherMode': serializer.toJson<String?>(voucherMode),
      'voucherModeId': serializer.toJson<int?>(voucherModeId),
      'voucherModeName': serializer.toJson<String?>(voucherModeName),
      'applicableFrom': serializer.toJson<DateTime?>(applicableFrom),
      'hasB2B': serializer.toJson<int?>(hasB2B),
      'b2BPrefix': serializer.toJson<String?>(b2BPrefix),
      'b2BSuffix': serializer.toJson<String?>(b2BSuffix),
      'b2BWidth': serializer.toJson<int?>(b2BWidth),
      'b2BStartFrom': serializer.toJson<int?>(b2BStartFrom),
      'b2CPrefix': serializer.toJson<String?>(b2CPrefix),
      'b2CSuffix': serializer.toJson<String?>(b2CSuffix),
      'b2CWidth': serializer.toJson<int?>(b2CWidth),
      'b2CStartFrom': serializer.toJson<int?>(b2CStartFrom),
      'b2BDeclaration': serializer.toJson<String?>(b2BDeclaration),
      'b2CDeclaration': serializer.toJson<String?>(b2CDeclaration),
    };
  }

  RouteVoucherType copyWith({
    int? id,
    Value<int?> companyId = const Value.absent(),
    Value<int?> voucherTypeId = const Value.absent(),
    Value<String?> voucherMenuName = const Value.absent(),
    Value<String?> voucherMode = const Value.absent(),
    Value<int?> voucherModeId = const Value.absent(),
    Value<String?> voucherModeName = const Value.absent(),
    Value<DateTime?> applicableFrom = const Value.absent(),
    Value<int?> hasB2B = const Value.absent(),
    Value<String?> b2BPrefix = const Value.absent(),
    Value<String?> b2BSuffix = const Value.absent(),
    Value<int?> b2BWidth = const Value.absent(),
    Value<int?> b2BStartFrom = const Value.absent(),
    Value<String?> b2CPrefix = const Value.absent(),
    Value<String?> b2CSuffix = const Value.absent(),
    Value<int?> b2CWidth = const Value.absent(),
    Value<int?> b2CStartFrom = const Value.absent(),
    Value<String?> b2BDeclaration = const Value.absent(),
    Value<String?> b2CDeclaration = const Value.absent(),
  }) => RouteVoucherType(
    id: id ?? this.id,
    companyId: companyId.present ? companyId.value : this.companyId,
    voucherTypeId: voucherTypeId.present
        ? voucherTypeId.value
        : this.voucherTypeId,
    voucherMenuName: voucherMenuName.present
        ? voucherMenuName.value
        : this.voucherMenuName,
    voucherMode: voucherMode.present ? voucherMode.value : this.voucherMode,
    voucherModeId: voucherModeId.present
        ? voucherModeId.value
        : this.voucherModeId,
    voucherModeName: voucherModeName.present
        ? voucherModeName.value
        : this.voucherModeName,
    applicableFrom: applicableFrom.present
        ? applicableFrom.value
        : this.applicableFrom,
    hasB2B: hasB2B.present ? hasB2B.value : this.hasB2B,
    b2BPrefix: b2BPrefix.present ? b2BPrefix.value : this.b2BPrefix,
    b2BSuffix: b2BSuffix.present ? b2BSuffix.value : this.b2BSuffix,
    b2BWidth: b2BWidth.present ? b2BWidth.value : this.b2BWidth,
    b2BStartFrom: b2BStartFrom.present ? b2BStartFrom.value : this.b2BStartFrom,
    b2CPrefix: b2CPrefix.present ? b2CPrefix.value : this.b2CPrefix,
    b2CSuffix: b2CSuffix.present ? b2CSuffix.value : this.b2CSuffix,
    b2CWidth: b2CWidth.present ? b2CWidth.value : this.b2CWidth,
    b2CStartFrom: b2CStartFrom.present ? b2CStartFrom.value : this.b2CStartFrom,
    b2BDeclaration: b2BDeclaration.present
        ? b2BDeclaration.value
        : this.b2BDeclaration,
    b2CDeclaration: b2CDeclaration.present
        ? b2CDeclaration.value
        : this.b2CDeclaration,
  );
  RouteVoucherType copyWithCompanion(RouteVoucherTypesCompanion data) {
    return RouteVoucherType(
      id: data.id.present ? data.id.value : this.id,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      voucherTypeId: data.voucherTypeId.present
          ? data.voucherTypeId.value
          : this.voucherTypeId,
      voucherMenuName: data.voucherMenuName.present
          ? data.voucherMenuName.value
          : this.voucherMenuName,
      voucherMode: data.voucherMode.present
          ? data.voucherMode.value
          : this.voucherMode,
      voucherModeId: data.voucherModeId.present
          ? data.voucherModeId.value
          : this.voucherModeId,
      voucherModeName: data.voucherModeName.present
          ? data.voucherModeName.value
          : this.voucherModeName,
      applicableFrom: data.applicableFrom.present
          ? data.applicableFrom.value
          : this.applicableFrom,
      hasB2B: data.hasB2B.present ? data.hasB2B.value : this.hasB2B,
      b2BPrefix: data.b2BPrefix.present ? data.b2BPrefix.value : this.b2BPrefix,
      b2BSuffix: data.b2BSuffix.present ? data.b2BSuffix.value : this.b2BSuffix,
      b2BWidth: data.b2BWidth.present ? data.b2BWidth.value : this.b2BWidth,
      b2BStartFrom: data.b2BStartFrom.present
          ? data.b2BStartFrom.value
          : this.b2BStartFrom,
      b2CPrefix: data.b2CPrefix.present ? data.b2CPrefix.value : this.b2CPrefix,
      b2CSuffix: data.b2CSuffix.present ? data.b2CSuffix.value : this.b2CSuffix,
      b2CWidth: data.b2CWidth.present ? data.b2CWidth.value : this.b2CWidth,
      b2CStartFrom: data.b2CStartFrom.present
          ? data.b2CStartFrom.value
          : this.b2CStartFrom,
      b2BDeclaration: data.b2BDeclaration.present
          ? data.b2BDeclaration.value
          : this.b2BDeclaration,
      b2CDeclaration: data.b2CDeclaration.present
          ? data.b2CDeclaration.value
          : this.b2CDeclaration,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RouteVoucherType(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('voucherTypeId: $voucherTypeId, ')
          ..write('voucherMenuName: $voucherMenuName, ')
          ..write('voucherMode: $voucherMode, ')
          ..write('voucherModeId: $voucherModeId, ')
          ..write('voucherModeName: $voucherModeName, ')
          ..write('applicableFrom: $applicableFrom, ')
          ..write('hasB2B: $hasB2B, ')
          ..write('b2BPrefix: $b2BPrefix, ')
          ..write('b2BSuffix: $b2BSuffix, ')
          ..write('b2BWidth: $b2BWidth, ')
          ..write('b2BStartFrom: $b2BStartFrom, ')
          ..write('b2CPrefix: $b2CPrefix, ')
          ..write('b2CSuffix: $b2CSuffix, ')
          ..write('b2CWidth: $b2CWidth, ')
          ..write('b2CStartFrom: $b2CStartFrom, ')
          ..write('b2BDeclaration: $b2BDeclaration, ')
          ..write('b2CDeclaration: $b2CDeclaration')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    companyId,
    voucherTypeId,
    voucherMenuName,
    voucherMode,
    voucherModeId,
    voucherModeName,
    applicableFrom,
    hasB2B,
    b2BPrefix,
    b2BSuffix,
    b2BWidth,
    b2BStartFrom,
    b2CPrefix,
    b2CSuffix,
    b2CWidth,
    b2CStartFrom,
    b2BDeclaration,
    b2CDeclaration,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RouteVoucherType &&
          other.id == this.id &&
          other.companyId == this.companyId &&
          other.voucherTypeId == this.voucherTypeId &&
          other.voucherMenuName == this.voucherMenuName &&
          other.voucherMode == this.voucherMode &&
          other.voucherModeId == this.voucherModeId &&
          other.voucherModeName == this.voucherModeName &&
          other.applicableFrom == this.applicableFrom &&
          other.hasB2B == this.hasB2B &&
          other.b2BPrefix == this.b2BPrefix &&
          other.b2BSuffix == this.b2BSuffix &&
          other.b2BWidth == this.b2BWidth &&
          other.b2BStartFrom == this.b2BStartFrom &&
          other.b2CPrefix == this.b2CPrefix &&
          other.b2CSuffix == this.b2CSuffix &&
          other.b2CWidth == this.b2CWidth &&
          other.b2CStartFrom == this.b2CStartFrom &&
          other.b2BDeclaration == this.b2BDeclaration &&
          other.b2CDeclaration == this.b2CDeclaration);
}

class RouteVoucherTypesCompanion extends UpdateCompanion<RouteVoucherType> {
  final Value<int> id;
  final Value<int?> companyId;
  final Value<int?> voucherTypeId;
  final Value<String?> voucherMenuName;
  final Value<String?> voucherMode;
  final Value<int?> voucherModeId;
  final Value<String?> voucherModeName;
  final Value<DateTime?> applicableFrom;
  final Value<int?> hasB2B;
  final Value<String?> b2BPrefix;
  final Value<String?> b2BSuffix;
  final Value<int?> b2BWidth;
  final Value<int?> b2BStartFrom;
  final Value<String?> b2CPrefix;
  final Value<String?> b2CSuffix;
  final Value<int?> b2CWidth;
  final Value<int?> b2CStartFrom;
  final Value<String?> b2BDeclaration;
  final Value<String?> b2CDeclaration;
  const RouteVoucherTypesCompanion({
    this.id = const Value.absent(),
    this.companyId = const Value.absent(),
    this.voucherTypeId = const Value.absent(),
    this.voucherMenuName = const Value.absent(),
    this.voucherMode = const Value.absent(),
    this.voucherModeId = const Value.absent(),
    this.voucherModeName = const Value.absent(),
    this.applicableFrom = const Value.absent(),
    this.hasB2B = const Value.absent(),
    this.b2BPrefix = const Value.absent(),
    this.b2BSuffix = const Value.absent(),
    this.b2BWidth = const Value.absent(),
    this.b2BStartFrom = const Value.absent(),
    this.b2CPrefix = const Value.absent(),
    this.b2CSuffix = const Value.absent(),
    this.b2CWidth = const Value.absent(),
    this.b2CStartFrom = const Value.absent(),
    this.b2BDeclaration = const Value.absent(),
    this.b2CDeclaration = const Value.absent(),
  });
  RouteVoucherTypesCompanion.insert({
    this.id = const Value.absent(),
    this.companyId = const Value.absent(),
    this.voucherTypeId = const Value.absent(),
    this.voucherMenuName = const Value.absent(),
    this.voucherMode = const Value.absent(),
    this.voucherModeId = const Value.absent(),
    this.voucherModeName = const Value.absent(),
    this.applicableFrom = const Value.absent(),
    this.hasB2B = const Value.absent(),
    this.b2BPrefix = const Value.absent(),
    this.b2BSuffix = const Value.absent(),
    this.b2BWidth = const Value.absent(),
    this.b2BStartFrom = const Value.absent(),
    this.b2CPrefix = const Value.absent(),
    this.b2CSuffix = const Value.absent(),
    this.b2CWidth = const Value.absent(),
    this.b2CStartFrom = const Value.absent(),
    this.b2BDeclaration = const Value.absent(),
    this.b2CDeclaration = const Value.absent(),
  });
  static Insertable<RouteVoucherType> custom({
    Expression<int>? id,
    Expression<int>? companyId,
    Expression<int>? voucherTypeId,
    Expression<String>? voucherMenuName,
    Expression<String>? voucherMode,
    Expression<int>? voucherModeId,
    Expression<String>? voucherModeName,
    Expression<DateTime>? applicableFrom,
    Expression<int>? hasB2B,
    Expression<String>? b2BPrefix,
    Expression<String>? b2BSuffix,
    Expression<int>? b2BWidth,
    Expression<int>? b2BStartFrom,
    Expression<String>? b2CPrefix,
    Expression<String>? b2CSuffix,
    Expression<int>? b2CWidth,
    Expression<int>? b2CStartFrom,
    Expression<String>? b2BDeclaration,
    Expression<String>? b2CDeclaration,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companyId != null) 'company_id': companyId,
      if (voucherTypeId != null) 'voucher_type_id': voucherTypeId,
      if (voucherMenuName != null) 'voucher_menu_name': voucherMenuName,
      if (voucherMode != null) 'voucher_mode': voucherMode,
      if (voucherModeId != null) 'voucher_mode_id': voucherModeId,
      if (voucherModeName != null) 'voucher_mode_name': voucherModeName,
      if (applicableFrom != null) 'applicable_from': applicableFrom,
      if (hasB2B != null) 'has_b2_b': hasB2B,
      if (b2BPrefix != null) 'b2_b_prefix': b2BPrefix,
      if (b2BSuffix != null) 'b2_b_suffix': b2BSuffix,
      if (b2BWidth != null) 'b2_b_width': b2BWidth,
      if (b2BStartFrom != null) 'b2_b_start_from': b2BStartFrom,
      if (b2CPrefix != null) 'b2_c_prefix': b2CPrefix,
      if (b2CSuffix != null) 'b2_c_suffix': b2CSuffix,
      if (b2CWidth != null) 'b2_c_width': b2CWidth,
      if (b2CStartFrom != null) 'b2_c_start_from': b2CStartFrom,
      if (b2BDeclaration != null) 'b2_b_declaration': b2BDeclaration,
      if (b2CDeclaration != null) 'b2_c_declaration': b2CDeclaration,
    });
  }

  RouteVoucherTypesCompanion copyWith({
    Value<int>? id,
    Value<int?>? companyId,
    Value<int?>? voucherTypeId,
    Value<String?>? voucherMenuName,
    Value<String?>? voucherMode,
    Value<int?>? voucherModeId,
    Value<String?>? voucherModeName,
    Value<DateTime?>? applicableFrom,
    Value<int?>? hasB2B,
    Value<String?>? b2BPrefix,
    Value<String?>? b2BSuffix,
    Value<int?>? b2BWidth,
    Value<int?>? b2BStartFrom,
    Value<String?>? b2CPrefix,
    Value<String?>? b2CSuffix,
    Value<int?>? b2CWidth,
    Value<int?>? b2CStartFrom,
    Value<String?>? b2BDeclaration,
    Value<String?>? b2CDeclaration,
  }) {
    return RouteVoucherTypesCompanion(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      voucherTypeId: voucherTypeId ?? this.voucherTypeId,
      voucherMenuName: voucherMenuName ?? this.voucherMenuName,
      voucherMode: voucherMode ?? this.voucherMode,
      voucherModeId: voucherModeId ?? this.voucherModeId,
      voucherModeName: voucherModeName ?? this.voucherModeName,
      applicableFrom: applicableFrom ?? this.applicableFrom,
      hasB2B: hasB2B ?? this.hasB2B,
      b2BPrefix: b2BPrefix ?? this.b2BPrefix,
      b2BSuffix: b2BSuffix ?? this.b2BSuffix,
      b2BWidth: b2BWidth ?? this.b2BWidth,
      b2BStartFrom: b2BStartFrom ?? this.b2BStartFrom,
      b2CPrefix: b2CPrefix ?? this.b2CPrefix,
      b2CSuffix: b2CSuffix ?? this.b2CSuffix,
      b2CWidth: b2CWidth ?? this.b2CWidth,
      b2CStartFrom: b2CStartFrom ?? this.b2CStartFrom,
      b2BDeclaration: b2BDeclaration ?? this.b2BDeclaration,
      b2CDeclaration: b2CDeclaration ?? this.b2CDeclaration,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    if (voucherTypeId.present) {
      map['voucher_type_id'] = Variable<int>(voucherTypeId.value);
    }
    if (voucherMenuName.present) {
      map['voucher_menu_name'] = Variable<String>(voucherMenuName.value);
    }
    if (voucherMode.present) {
      map['voucher_mode'] = Variable<String>(voucherMode.value);
    }
    if (voucherModeId.present) {
      map['voucher_mode_id'] = Variable<int>(voucherModeId.value);
    }
    if (voucherModeName.present) {
      map['voucher_mode_name'] = Variable<String>(voucherModeName.value);
    }
    if (applicableFrom.present) {
      map['applicable_from'] = Variable<DateTime>(applicableFrom.value);
    }
    if (hasB2B.present) {
      map['has_b2_b'] = Variable<int>(hasB2B.value);
    }
    if (b2BPrefix.present) {
      map['b2_b_prefix'] = Variable<String>(b2BPrefix.value);
    }
    if (b2BSuffix.present) {
      map['b2_b_suffix'] = Variable<String>(b2BSuffix.value);
    }
    if (b2BWidth.present) {
      map['b2_b_width'] = Variable<int>(b2BWidth.value);
    }
    if (b2BStartFrom.present) {
      map['b2_b_start_from'] = Variable<int>(b2BStartFrom.value);
    }
    if (b2CPrefix.present) {
      map['b2_c_prefix'] = Variable<String>(b2CPrefix.value);
    }
    if (b2CSuffix.present) {
      map['b2_c_suffix'] = Variable<String>(b2CSuffix.value);
    }
    if (b2CWidth.present) {
      map['b2_c_width'] = Variable<int>(b2CWidth.value);
    }
    if (b2CStartFrom.present) {
      map['b2_c_start_from'] = Variable<int>(b2CStartFrom.value);
    }
    if (b2BDeclaration.present) {
      map['b2_b_declaration'] = Variable<String>(b2BDeclaration.value);
    }
    if (b2CDeclaration.present) {
      map['b2_c_declaration'] = Variable<String>(b2CDeclaration.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RouteVoucherTypesCompanion(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('voucherTypeId: $voucherTypeId, ')
          ..write('voucherMenuName: $voucherMenuName, ')
          ..write('voucherMode: $voucherMode, ')
          ..write('voucherModeId: $voucherModeId, ')
          ..write('voucherModeName: $voucherModeName, ')
          ..write('applicableFrom: $applicableFrom, ')
          ..write('hasB2B: $hasB2B, ')
          ..write('b2BPrefix: $b2BPrefix, ')
          ..write('b2BSuffix: $b2BSuffix, ')
          ..write('b2BWidth: $b2BWidth, ')
          ..write('b2BStartFrom: $b2BStartFrom, ')
          ..write('b2CPrefix: $b2CPrefix, ')
          ..write('b2CSuffix: $b2CSuffix, ')
          ..write('b2CWidth: $b2CWidth, ')
          ..write('b2CStartFrom: $b2CStartFrom, ')
          ..write('b2BDeclaration: $b2BDeclaration, ')
          ..write('b2CDeclaration: $b2CDeclaration')
          ..write(')'))
        .toString();
  }
}

class $CompanySettingsTableTable extends CompanySettingsTable
    with TableInfo<$CompanySettingsTableTable, CompanySettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompanySettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _companyIdMeta = const VerificationMeta(
    'companyId',
  );
  @override
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
    'company_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _settingsMenuNameMeta = const VerificationMeta(
    'settingsMenuName',
  );
  @override
  late final GeneratedColumn<String> settingsMenuName = GeneratedColumn<String>(
    'settings_menu_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _buttonTypeMeta = const VerificationMeta(
    'buttonType',
  );
  @override
  late final GeneratedColumn<String> buttonType = GeneratedColumn<String>(
    'button_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
    'parent_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderNoMeta = const VerificationMeta(
    'orderNo',
  );
  @override
  late final GeneratedColumn<int> orderNo = GeneratedColumn<int>(
    'order_no',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _menuTypeMeta = const VerificationMeta(
    'menuType',
  );
  @override
  late final GeneratedColumn<String> menuType = GeneratedColumn<String>(
    'menu_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _settingsValueMeta = const VerificationMeta(
    'settingsValue',
  );
  @override
  late final GeneratedColumn<String> settingsValue = GeneratedColumn<String>(
    'settings_value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    companyId,
    settingsMenuName,
    buttonType,
    description,
    parentId,
    orderNo,
    menuType,
    settingsValue,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'company_settings_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CompanySettingsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('company_id')) {
      context.handle(
        _companyIdMeta,
        companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    if (data.containsKey('settings_menu_name')) {
      context.handle(
        _settingsMenuNameMeta,
        settingsMenuName.isAcceptableOrUnknown(
          data['settings_menu_name']!,
          _settingsMenuNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_settingsMenuNameMeta);
    }
    if (data.containsKey('button_type')) {
      context.handle(
        _buttonTypeMeta,
        buttonType.isAcceptableOrUnknown(data['button_type']!, _buttonTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_buttonTypeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('order_no')) {
      context.handle(
        _orderNoMeta,
        orderNo.isAcceptableOrUnknown(data['order_no']!, _orderNoMeta),
      );
    } else if (isInserting) {
      context.missing(_orderNoMeta);
    }
    if (data.containsKey('menu_type')) {
      context.handle(
        _menuTypeMeta,
        menuType.isAcceptableOrUnknown(data['menu_type']!, _menuTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_menuTypeMeta);
    }
    if (data.containsKey('settings_value')) {
      context.handle(
        _settingsValueMeta,
        settingsValue.isAcceptableOrUnknown(
          data['settings_value']!,
          _settingsValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_settingsValueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, companyId};
  @override
  CompanySettingsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompanySettingsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      companyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}company_id'],
      )!,
      settingsMenuName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}settings_menu_name'],
      )!,
      buttonType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}button_type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_id'],
      )!,
      orderNo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_no'],
      )!,
      menuType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}menu_type'],
      )!,
      settingsValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}settings_value'],
      )!,
    );
  }

  @override
  $CompanySettingsTableTable createAlias(String alias) {
    return $CompanySettingsTableTable(attachedDatabase, alias);
  }
}

class CompanySettingsTableData extends DataClass
    implements Insertable<CompanySettingsTableData> {
  final int id;
  final int companyId;
  final String settingsMenuName;

  /// Stored as TEXT → "Toggle"
  final String buttonType;
  final String description;
  final int parentId;
  final int orderNo;

  /// Stored as TEXT → "Free"
  final String menuType;

  /// Stored as TEXT → "", "Yes"
  final String settingsValue;
  const CompanySettingsTableData({
    required this.id,
    required this.companyId,
    required this.settingsMenuName,
    required this.buttonType,
    required this.description,
    required this.parentId,
    required this.orderNo,
    required this.menuType,
    required this.settingsValue,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['company_id'] = Variable<int>(companyId);
    map['settings_menu_name'] = Variable<String>(settingsMenuName);
    map['button_type'] = Variable<String>(buttonType);
    map['description'] = Variable<String>(description);
    map['parent_id'] = Variable<int>(parentId);
    map['order_no'] = Variable<int>(orderNo);
    map['menu_type'] = Variable<String>(menuType);
    map['settings_value'] = Variable<String>(settingsValue);
    return map;
  }

  CompanySettingsTableCompanion toCompanion(bool nullToAbsent) {
    return CompanySettingsTableCompanion(
      id: Value(id),
      companyId: Value(companyId),
      settingsMenuName: Value(settingsMenuName),
      buttonType: Value(buttonType),
      description: Value(description),
      parentId: Value(parentId),
      orderNo: Value(orderNo),
      menuType: Value(menuType),
      settingsValue: Value(settingsValue),
    );
  }

  factory CompanySettingsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CompanySettingsTableData(
      id: serializer.fromJson<int>(json['id']),
      companyId: serializer.fromJson<int>(json['companyId']),
      settingsMenuName: serializer.fromJson<String>(json['settingsMenuName']),
      buttonType: serializer.fromJson<String>(json['buttonType']),
      description: serializer.fromJson<String>(json['description']),
      parentId: serializer.fromJson<int>(json['parentId']),
      orderNo: serializer.fromJson<int>(json['orderNo']),
      menuType: serializer.fromJson<String>(json['menuType']),
      settingsValue: serializer.fromJson<String>(json['settingsValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'companyId': serializer.toJson<int>(companyId),
      'settingsMenuName': serializer.toJson<String>(settingsMenuName),
      'buttonType': serializer.toJson<String>(buttonType),
      'description': serializer.toJson<String>(description),
      'parentId': serializer.toJson<int>(parentId),
      'orderNo': serializer.toJson<int>(orderNo),
      'menuType': serializer.toJson<String>(menuType),
      'settingsValue': serializer.toJson<String>(settingsValue),
    };
  }

  CompanySettingsTableData copyWith({
    int? id,
    int? companyId,
    String? settingsMenuName,
    String? buttonType,
    String? description,
    int? parentId,
    int? orderNo,
    String? menuType,
    String? settingsValue,
  }) => CompanySettingsTableData(
    id: id ?? this.id,
    companyId: companyId ?? this.companyId,
    settingsMenuName: settingsMenuName ?? this.settingsMenuName,
    buttonType: buttonType ?? this.buttonType,
    description: description ?? this.description,
    parentId: parentId ?? this.parentId,
    orderNo: orderNo ?? this.orderNo,
    menuType: menuType ?? this.menuType,
    settingsValue: settingsValue ?? this.settingsValue,
  );
  CompanySettingsTableData copyWithCompanion(
    CompanySettingsTableCompanion data,
  ) {
    return CompanySettingsTableData(
      id: data.id.present ? data.id.value : this.id,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      settingsMenuName: data.settingsMenuName.present
          ? data.settingsMenuName.value
          : this.settingsMenuName,
      buttonType: data.buttonType.present
          ? data.buttonType.value
          : this.buttonType,
      description: data.description.present
          ? data.description.value
          : this.description,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      orderNo: data.orderNo.present ? data.orderNo.value : this.orderNo,
      menuType: data.menuType.present ? data.menuType.value : this.menuType,
      settingsValue: data.settingsValue.present
          ? data.settingsValue.value
          : this.settingsValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CompanySettingsTableData(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('settingsMenuName: $settingsMenuName, ')
          ..write('buttonType: $buttonType, ')
          ..write('description: $description, ')
          ..write('parentId: $parentId, ')
          ..write('orderNo: $orderNo, ')
          ..write('menuType: $menuType, ')
          ..write('settingsValue: $settingsValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    companyId,
    settingsMenuName,
    buttonType,
    description,
    parentId,
    orderNo,
    menuType,
    settingsValue,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CompanySettingsTableData &&
          other.id == this.id &&
          other.companyId == this.companyId &&
          other.settingsMenuName == this.settingsMenuName &&
          other.buttonType == this.buttonType &&
          other.description == this.description &&
          other.parentId == this.parentId &&
          other.orderNo == this.orderNo &&
          other.menuType == this.menuType &&
          other.settingsValue == this.settingsValue);
}

class CompanySettingsTableCompanion
    extends UpdateCompanion<CompanySettingsTableData> {
  final Value<int> id;
  final Value<int> companyId;
  final Value<String> settingsMenuName;
  final Value<String> buttonType;
  final Value<String> description;
  final Value<int> parentId;
  final Value<int> orderNo;
  final Value<String> menuType;
  final Value<String> settingsValue;
  final Value<int> rowid;
  const CompanySettingsTableCompanion({
    this.id = const Value.absent(),
    this.companyId = const Value.absent(),
    this.settingsMenuName = const Value.absent(),
    this.buttonType = const Value.absent(),
    this.description = const Value.absent(),
    this.parentId = const Value.absent(),
    this.orderNo = const Value.absent(),
    this.menuType = const Value.absent(),
    this.settingsValue = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CompanySettingsTableCompanion.insert({
    required int id,
    required int companyId,
    required String settingsMenuName,
    required String buttonType,
    required String description,
    required int parentId,
    required int orderNo,
    required String menuType,
    required String settingsValue,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       companyId = Value(companyId),
       settingsMenuName = Value(settingsMenuName),
       buttonType = Value(buttonType),
       description = Value(description),
       parentId = Value(parentId),
       orderNo = Value(orderNo),
       menuType = Value(menuType),
       settingsValue = Value(settingsValue);
  static Insertable<CompanySettingsTableData> custom({
    Expression<int>? id,
    Expression<int>? companyId,
    Expression<String>? settingsMenuName,
    Expression<String>? buttonType,
    Expression<String>? description,
    Expression<int>? parentId,
    Expression<int>? orderNo,
    Expression<String>? menuType,
    Expression<String>? settingsValue,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companyId != null) 'company_id': companyId,
      if (settingsMenuName != null) 'settings_menu_name': settingsMenuName,
      if (buttonType != null) 'button_type': buttonType,
      if (description != null) 'description': description,
      if (parentId != null) 'parent_id': parentId,
      if (orderNo != null) 'order_no': orderNo,
      if (menuType != null) 'menu_type': menuType,
      if (settingsValue != null) 'settings_value': settingsValue,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CompanySettingsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? companyId,
    Value<String>? settingsMenuName,
    Value<String>? buttonType,
    Value<String>? description,
    Value<int>? parentId,
    Value<int>? orderNo,
    Value<String>? menuType,
    Value<String>? settingsValue,
    Value<int>? rowid,
  }) {
    return CompanySettingsTableCompanion(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      settingsMenuName: settingsMenuName ?? this.settingsMenuName,
      buttonType: buttonType ?? this.buttonType,
      description: description ?? this.description,
      parentId: parentId ?? this.parentId,
      orderNo: orderNo ?? this.orderNo,
      menuType: menuType ?? this.menuType,
      settingsValue: settingsValue ?? this.settingsValue,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    if (settingsMenuName.present) {
      map['settings_menu_name'] = Variable<String>(settingsMenuName.value);
    }
    if (buttonType.present) {
      map['button_type'] = Variable<String>(buttonType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (orderNo.present) {
      map['order_no'] = Variable<int>(orderNo.value);
    }
    if (menuType.present) {
      map['menu_type'] = Variable<String>(menuType.value);
    }
    if (settingsValue.present) {
      map['settings_value'] = Variable<String>(settingsValue.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompanySettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('settingsMenuName: $settingsMenuName, ')
          ..write('buttonType: $buttonType, ')
          ..write('description: $description, ')
          ..write('parentId: $parentId, ')
          ..write('orderNo: $orderNo, ')
          ..write('menuType: $menuType, ')
          ..write('settingsValue: $settingsValue, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GodownVehiclesTable extends GodownVehicles
    with TableInfo<$GodownVehiclesTable, GodownVehicle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GodownVehiclesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _companyIdMeta = const VerificationMeta(
    'companyId',
  );
  @override
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
    'company_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<int> active = GeneratedColumn<int>(
    'active',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, companyId, code, name, active];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'godown_vehicles';
  @override
  VerificationContext validateIntegrity(
    Insertable<GodownVehicle> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('company_id')) {
      context.handle(
        _companyIdMeta,
        companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta),
      );
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GodownVehicle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GodownVehicle(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      companyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}company_id'],
      ),
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}active'],
      ),
    );
  }

  @override
  $GodownVehiclesTable createAlias(String alias) {
    return $GodownVehiclesTable(attachedDatabase, alias);
  }
}

class GodownVehicle extends DataClass implements Insertable<GodownVehicle> {
  final int id;
  final int? companyId;
  final String? code;
  final String? name;
  final int? active;
  const GodownVehicle({
    required this.id,
    this.companyId,
    this.code,
    this.name,
    this.active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || companyId != null) {
      map['company_id'] = Variable<int>(companyId);
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || active != null) {
      map['active'] = Variable<int>(active);
    }
    return map;
  }

  GodownVehiclesCompanion toCompanion(bool nullToAbsent) {
    return GodownVehiclesCompanion(
      id: Value(id),
      companyId: companyId == null && nullToAbsent
          ? const Value.absent()
          : Value(companyId),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      active: active == null && nullToAbsent
          ? const Value.absent()
          : Value(active),
    );
  }

  factory GodownVehicle.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GodownVehicle(
      id: serializer.fromJson<int>(json['id']),
      companyId: serializer.fromJson<int?>(json['companyId']),
      code: serializer.fromJson<String?>(json['code']),
      name: serializer.fromJson<String?>(json['name']),
      active: serializer.fromJson<int?>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'companyId': serializer.toJson<int?>(companyId),
      'code': serializer.toJson<String?>(code),
      'name': serializer.toJson<String?>(name),
      'active': serializer.toJson<int?>(active),
    };
  }

  GodownVehicle copyWith({
    int? id,
    Value<int?> companyId = const Value.absent(),
    Value<String?> code = const Value.absent(),
    Value<String?> name = const Value.absent(),
    Value<int?> active = const Value.absent(),
  }) => GodownVehicle(
    id: id ?? this.id,
    companyId: companyId.present ? companyId.value : this.companyId,
    code: code.present ? code.value : this.code,
    name: name.present ? name.value : this.name,
    active: active.present ? active.value : this.active,
  );
  GodownVehicle copyWithCompanion(GodownVehiclesCompanion data) {
    return GodownVehicle(
      id: data.id.present ? data.id.value : this.id,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GodownVehicle(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, companyId, code, name, active);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GodownVehicle &&
          other.id == this.id &&
          other.companyId == this.companyId &&
          other.code == this.code &&
          other.name == this.name &&
          other.active == this.active);
}

class GodownVehiclesCompanion extends UpdateCompanion<GodownVehicle> {
  final Value<int> id;
  final Value<int?> companyId;
  final Value<String?> code;
  final Value<String?> name;
  final Value<int?> active;
  const GodownVehiclesCompanion({
    this.id = const Value.absent(),
    this.companyId = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.active = const Value.absent(),
  });
  GodownVehiclesCompanion.insert({
    this.id = const Value.absent(),
    this.companyId = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.active = const Value.absent(),
  });
  static Insertable<GodownVehicle> custom({
    Expression<int>? id,
    Expression<int>? companyId,
    Expression<String>? code,
    Expression<String>? name,
    Expression<int>? active,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companyId != null) 'company_id': companyId,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (active != null) 'active': active,
    });
  }

  GodownVehiclesCompanion copyWith({
    Value<int>? id,
    Value<int?>? companyId,
    Value<String?>? code,
    Value<String?>? name,
    Value<int?>? active,
  }) {
    return GodownVehiclesCompanion(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      code: code ?? this.code,
      name: name ?? this.name,
      active: active ?? this.active,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (active.present) {
      map['active'] = Variable<int>(active.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GodownVehiclesCompanion(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }
}

class $GodownRoutesTable extends GodownRoutes
    with TableInfo<$GodownRoutesTable, GodownRoute> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GodownRoutesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _companyIdMeta = const VerificationMeta(
    'companyId',
  );
  @override
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
    'company_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _routeCodeMeta = const VerificationMeta(
    'routeCode',
  );
  @override
  late final GeneratedColumn<String> routeCode = GeneratedColumn<String>(
    'route_code',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _routeNameMeta = const VerificationMeta(
    'routeName',
  );
  @override
  late final GeneratedColumn<String> routeName = GeneratedColumn<String>(
    'route_name',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<int> active = GeneratedColumn<int>(
    'active',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    companyId,
    routeCode,
    routeName,
    active,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'godown_routes';
  @override
  VerificationContext validateIntegrity(
    Insertable<GodownRoute> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('company_id')) {
      context.handle(
        _companyIdMeta,
        companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta),
      );
    }
    if (data.containsKey('route_code')) {
      context.handle(
        _routeCodeMeta,
        routeCode.isAcceptableOrUnknown(data['route_code']!, _routeCodeMeta),
      );
    }
    if (data.containsKey('route_name')) {
      context.handle(
        _routeNameMeta,
        routeName.isAcceptableOrUnknown(data['route_name']!, _routeNameMeta),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GodownRoute map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GodownRoute(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
      companyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}company_id'],
      ),
      routeCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}route_code'],
      ),
      routeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}route_name'],
      ),
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}active'],
      ),
    );
  }

  @override
  $GodownRoutesTable createAlias(String alias) {
    return $GodownRoutesTable(attachedDatabase, alias);
  }
}

class GodownRoute extends DataClass implements Insertable<GodownRoute> {
  final int? id;
  final int? companyId;
  final String? routeCode;
  final String? routeName;
  final int? active;
  const GodownRoute({
    this.id,
    this.companyId,
    this.routeCode,
    this.routeName,
    this.active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || companyId != null) {
      map['company_id'] = Variable<int>(companyId);
    }
    if (!nullToAbsent || routeCode != null) {
      map['route_code'] = Variable<String>(routeCode);
    }
    if (!nullToAbsent || routeName != null) {
      map['route_name'] = Variable<String>(routeName);
    }
    if (!nullToAbsent || active != null) {
      map['active'] = Variable<int>(active);
    }
    return map;
  }

  GodownRoutesCompanion toCompanion(bool nullToAbsent) {
    return GodownRoutesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      companyId: companyId == null && nullToAbsent
          ? const Value.absent()
          : Value(companyId),
      routeCode: routeCode == null && nullToAbsent
          ? const Value.absent()
          : Value(routeCode),
      routeName: routeName == null && nullToAbsent
          ? const Value.absent()
          : Value(routeName),
      active: active == null && nullToAbsent
          ? const Value.absent()
          : Value(active),
    );
  }

  factory GodownRoute.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GodownRoute(
      id: serializer.fromJson<int?>(json['id']),
      companyId: serializer.fromJson<int?>(json['companyId']),
      routeCode: serializer.fromJson<String?>(json['routeCode']),
      routeName: serializer.fromJson<String?>(json['routeName']),
      active: serializer.fromJson<int?>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'companyId': serializer.toJson<int?>(companyId),
      'routeCode': serializer.toJson<String?>(routeCode),
      'routeName': serializer.toJson<String?>(routeName),
      'active': serializer.toJson<int?>(active),
    };
  }

  GodownRoute copyWith({
    Value<int?> id = const Value.absent(),
    Value<int?> companyId = const Value.absent(),
    Value<String?> routeCode = const Value.absent(),
    Value<String?> routeName = const Value.absent(),
    Value<int?> active = const Value.absent(),
  }) => GodownRoute(
    id: id.present ? id.value : this.id,
    companyId: companyId.present ? companyId.value : this.companyId,
    routeCode: routeCode.present ? routeCode.value : this.routeCode,
    routeName: routeName.present ? routeName.value : this.routeName,
    active: active.present ? active.value : this.active,
  );
  GodownRoute copyWithCompanion(GodownRoutesCompanion data) {
    return GodownRoute(
      id: data.id.present ? data.id.value : this.id,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      routeCode: data.routeCode.present ? data.routeCode.value : this.routeCode,
      routeName: data.routeName.present ? data.routeName.value : this.routeName,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GodownRoute(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('routeCode: $routeCode, ')
          ..write('routeName: $routeName, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, companyId, routeCode, routeName, active);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GodownRoute &&
          other.id == this.id &&
          other.companyId == this.companyId &&
          other.routeCode == this.routeCode &&
          other.routeName == this.routeName &&
          other.active == this.active);
}

class GodownRoutesCompanion extends UpdateCompanion<GodownRoute> {
  final Value<int?> id;
  final Value<int?> companyId;
  final Value<String?> routeCode;
  final Value<String?> routeName;
  final Value<int?> active;
  const GodownRoutesCompanion({
    this.id = const Value.absent(),
    this.companyId = const Value.absent(),
    this.routeCode = const Value.absent(),
    this.routeName = const Value.absent(),
    this.active = const Value.absent(),
  });
  GodownRoutesCompanion.insert({
    this.id = const Value.absent(),
    this.companyId = const Value.absent(),
    this.routeCode = const Value.absent(),
    this.routeName = const Value.absent(),
    this.active = const Value.absent(),
  });
  static Insertable<GodownRoute> custom({
    Expression<int>? id,
    Expression<int>? companyId,
    Expression<String>? routeCode,
    Expression<String>? routeName,
    Expression<int>? active,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companyId != null) 'company_id': companyId,
      if (routeCode != null) 'route_code': routeCode,
      if (routeName != null) 'route_name': routeName,
      if (active != null) 'active': active,
    });
  }

  GodownRoutesCompanion copyWith({
    Value<int?>? id,
    Value<int?>? companyId,
    Value<String?>? routeCode,
    Value<String?>? routeName,
    Value<int?>? active,
  }) {
    return GodownRoutesCompanion(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      routeCode: routeCode ?? this.routeCode,
      routeName: routeName ?? this.routeName,
      active: active ?? this.active,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    if (routeCode.present) {
      map['route_code'] = Variable<String>(routeCode.value);
    }
    if (routeName.present) {
      map['route_name'] = Variable<String>(routeName.value);
    }
    if (active.present) {
      map['active'] = Variable<int>(active.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GodownRoutesCompanion(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('routeCode: $routeCode, ')
          ..write('routeName: $routeName, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }
}

class $PartyMasterTable extends PartyMaster
    with TableInfo<$PartyMasterTable, PartyMasterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartyMasterTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _ledgerIdMeta = const VerificationMeta(
    'ledgerId',
  );
  @override
  late final GeneratedColumn<int> ledgerId = GeneratedColumn<int>(
    'ledger_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ledgerNameMeta = const VerificationMeta(
    'ledgerName',
  );
  @override
  late final GeneratedColumn<String> ledgerName = GeneratedColumn<String>(
    'ledger_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ledgerNameLocalMeta = const VerificationMeta(
    'ledgerNameLocal',
  );
  @override
  late final GeneratedColumn<String> ledgerNameLocal = GeneratedColumn<String>(
    'ledger_name_local',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aliasNameMeta = const VerificationMeta(
    'aliasName',
  );
  @override
  late final GeneratedColumn<String> aliasName = GeneratedColumn<String>(
    'alias_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ledDescMeta = const VerificationMeta(
    'ledDesc',
  );
  @override
  late final GeneratedColumn<String> ledDesc = GeneratedColumn<String>(
    'led_desc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _groupIdMeta = const VerificationMeta(
    'groupId',
  );
  @override
  late final GeneratedColumn<int> groupId = GeneratedColumn<int>(
    'group_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _groupNameMeta = const VerificationMeta(
    'groupName',
  );
  @override
  late final GeneratedColumn<String> groupName = GeneratedColumn<String>(
    'group_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _creditLimitMeta = const VerificationMeta(
    'creditLimit',
  );
  @override
  late final GeneratedColumn<double> creditLimit = GeneratedColumn<double>(
    'credit_limit',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dueDaysMeta = const VerificationMeta(
    'dueDays',
  );
  @override
  late final GeneratedColumn<int> dueDays = GeneratedColumn<int>(
    'due_days',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _address1Meta = const VerificationMeta(
    'address1',
  );
  @override
  late final GeneratedColumn<String> address1 = GeneratedColumn<String>(
    'address1',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _address2Meta = const VerificationMeta(
    'address2',
  );
  @override
  late final GeneratedColumn<String> address2 = GeneratedColumn<String>(
    'address2',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _address3Meta = const VerificationMeta(
    'address3',
  );
  @override
  late final GeneratedColumn<String> address3 = GeneratedColumn<String>(
    'address3',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stateIdMeta = const VerificationMeta(
    'stateId',
  );
  @override
  late final GeneratedColumn<int> stateId = GeneratedColumn<int>(
    'state_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stateNameMeta = const VerificationMeta(
    'stateName',
  );
  @override
  late final GeneratedColumn<String> stateName = GeneratedColumn<String>(
    'state_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryIdMeta = const VerificationMeta(
    'countryId',
  );
  @override
  late final GeneratedColumn<int> countryId = GeneratedColumn<int>(
    'country_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryNameMeta = const VerificationMeta(
    'countryName',
  );
  @override
  late final GeneratedColumn<String> countryName = GeneratedColumn<String>(
    'country_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pinCodeMeta = const VerificationMeta(
    'pinCode',
  );
  @override
  late final GeneratedColumn<String> pinCode = GeneratedColumn<String>(
    'pin_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _distanceFromCompanyKMMeta =
      const VerificationMeta('distanceFromCompanyKM');
  @override
  late final GeneratedColumn<double> distanceFromCompanyKM =
      GeneratedColumn<double>(
        'distance_from_company_k_m',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _mailingNameMeta = const VerificationMeta(
    'mailingName',
  );
  @override
  late final GeneratedColumn<String> mailingName = GeneratedColumn<String>(
    'mailing_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contactPersonMeta = const VerificationMeta(
    'contactPerson',
  );
  @override
  late final GeneratedColumn<String> contactPerson = GeneratedColumn<String>(
    'contact_person',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mobileMeta = const VerificationMeta('mobile');
  @override
  late final GeneratedColumn<String> mobile = GeneratedColumn<String>(
    'mobile',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _whatsappNoMeta = const VerificationMeta(
    'whatsappNo',
  );
  @override
  late final GeneratedColumn<String> whatsappNo = GeneratedColumn<String>(
    'whatsapp_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _taxTypeMeta = const VerificationMeta(
    'taxType',
  );
  @override
  late final GeneratedColumn<String> taxType = GeneratedColumn<String>(
    'tax_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _taxNumberMeta = const VerificationMeta(
    'taxNumber',
  );
  @override
  late final GeneratedColumn<String> taxNumber = GeneratedColumn<String>(
    'tax_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stateCodeMeta = const VerificationMeta(
    'stateCode',
  );
  @override
  late final GeneratedColumn<String> stateCode = GeneratedColumn<String>(
    'state_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _closingBalanceMeta = const VerificationMeta(
    'closingBalance',
  );
  @override
  late final GeneratedColumn<double> closingBalance = GeneratedColumn<double>(
    'closing_balance',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _onAccountValueMeta = const VerificationMeta(
    'onAccountValue',
  );
  @override
  late final GeneratedColumn<double> onAccountValue = GeneratedColumn<double>(
    'on_account_value',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _routeIdMeta = const VerificationMeta(
    'routeId',
  );
  @override
  late final GeneratedColumn<int> routeId = GeneratedColumn<int>(
    'route_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _routeNameMeta = const VerificationMeta(
    'routeName',
  );
  @override
  late final GeneratedColumn<String> routeName = GeneratedColumn<String>(
    'route_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priceListMeta = const VerificationMeta(
    'priceList',
  );
  @override
  late final GeneratedColumn<int> priceList = GeneratedColumn<int>(
    'price_list',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSyncOnMeta = const VerificationMeta(
    'lastSyncOn',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncOn = GeneratedColumn<DateTime>(
    'last_sync_on',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncActionMeta = const VerificationMeta(
    'syncAction',
  );
  @override
  late final GeneratedColumn<String> syncAction = GeneratedColumn<String>(
    'sync_action',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    ledgerId,
    ledgerName,
    ledgerNameLocal,
    aliasName,
    ledDesc,
    groupId,
    groupName,
    isActive,
    isDeleted,
    creditLimit,
    dueDays,
    address1,
    address2,
    address3,
    city,
    stateId,
    stateName,
    countryId,
    countryName,
    pinCode,
    latitude,
    longitude,
    distanceFromCompanyKM,
    mailingName,
    contactPerson,
    mobile,
    whatsappNo,
    email,
    taxType,
    taxNumber,
    stateCode,
    closingBalance,
    onAccountValue,
    routeId,
    routeName,
    priceList,
    lastSyncOn,
    syncAction,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'party_master';
  @override
  VerificationContext validateIntegrity(
    Insertable<PartyMasterData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ledger_id')) {
      context.handle(
        _ledgerIdMeta,
        ledgerId.isAcceptableOrUnknown(data['ledger_id']!, _ledgerIdMeta),
      );
    }
    if (data.containsKey('ledger_name')) {
      context.handle(
        _ledgerNameMeta,
        ledgerName.isAcceptableOrUnknown(data['ledger_name']!, _ledgerNameMeta),
      );
    }
    if (data.containsKey('ledger_name_local')) {
      context.handle(
        _ledgerNameLocalMeta,
        ledgerNameLocal.isAcceptableOrUnknown(
          data['ledger_name_local']!,
          _ledgerNameLocalMeta,
        ),
      );
    }
    if (data.containsKey('alias_name')) {
      context.handle(
        _aliasNameMeta,
        aliasName.isAcceptableOrUnknown(data['alias_name']!, _aliasNameMeta),
      );
    }
    if (data.containsKey('led_desc')) {
      context.handle(
        _ledDescMeta,
        ledDesc.isAcceptableOrUnknown(data['led_desc']!, _ledDescMeta),
      );
    }
    if (data.containsKey('group_id')) {
      context.handle(
        _groupIdMeta,
        groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta),
      );
    }
    if (data.containsKey('group_name')) {
      context.handle(
        _groupNameMeta,
        groupName.isAcceptableOrUnknown(data['group_name']!, _groupNameMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('credit_limit')) {
      context.handle(
        _creditLimitMeta,
        creditLimit.isAcceptableOrUnknown(
          data['credit_limit']!,
          _creditLimitMeta,
        ),
      );
    }
    if (data.containsKey('due_days')) {
      context.handle(
        _dueDaysMeta,
        dueDays.isAcceptableOrUnknown(data['due_days']!, _dueDaysMeta),
      );
    }
    if (data.containsKey('address1')) {
      context.handle(
        _address1Meta,
        address1.isAcceptableOrUnknown(data['address1']!, _address1Meta),
      );
    }
    if (data.containsKey('address2')) {
      context.handle(
        _address2Meta,
        address2.isAcceptableOrUnknown(data['address2']!, _address2Meta),
      );
    }
    if (data.containsKey('address3')) {
      context.handle(
        _address3Meta,
        address3.isAcceptableOrUnknown(data['address3']!, _address3Meta),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('state_id')) {
      context.handle(
        _stateIdMeta,
        stateId.isAcceptableOrUnknown(data['state_id']!, _stateIdMeta),
      );
    }
    if (data.containsKey('state_name')) {
      context.handle(
        _stateNameMeta,
        stateName.isAcceptableOrUnknown(data['state_name']!, _stateNameMeta),
      );
    }
    if (data.containsKey('country_id')) {
      context.handle(
        _countryIdMeta,
        countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta),
      );
    }
    if (data.containsKey('country_name')) {
      context.handle(
        _countryNameMeta,
        countryName.isAcceptableOrUnknown(
          data['country_name']!,
          _countryNameMeta,
        ),
      );
    }
    if (data.containsKey('pin_code')) {
      context.handle(
        _pinCodeMeta,
        pinCode.isAcceptableOrUnknown(data['pin_code']!, _pinCodeMeta),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    }
    if (data.containsKey('distance_from_company_k_m')) {
      context.handle(
        _distanceFromCompanyKMMeta,
        distanceFromCompanyKM.isAcceptableOrUnknown(
          data['distance_from_company_k_m']!,
          _distanceFromCompanyKMMeta,
        ),
      );
    }
    if (data.containsKey('mailing_name')) {
      context.handle(
        _mailingNameMeta,
        mailingName.isAcceptableOrUnknown(
          data['mailing_name']!,
          _mailingNameMeta,
        ),
      );
    }
    if (data.containsKey('contact_person')) {
      context.handle(
        _contactPersonMeta,
        contactPerson.isAcceptableOrUnknown(
          data['contact_person']!,
          _contactPersonMeta,
        ),
      );
    }
    if (data.containsKey('mobile')) {
      context.handle(
        _mobileMeta,
        mobile.isAcceptableOrUnknown(data['mobile']!, _mobileMeta),
      );
    }
    if (data.containsKey('whatsapp_no')) {
      context.handle(
        _whatsappNoMeta,
        whatsappNo.isAcceptableOrUnknown(data['whatsapp_no']!, _whatsappNoMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('tax_type')) {
      context.handle(
        _taxTypeMeta,
        taxType.isAcceptableOrUnknown(data['tax_type']!, _taxTypeMeta),
      );
    }
    if (data.containsKey('tax_number')) {
      context.handle(
        _taxNumberMeta,
        taxNumber.isAcceptableOrUnknown(data['tax_number']!, _taxNumberMeta),
      );
    }
    if (data.containsKey('state_code')) {
      context.handle(
        _stateCodeMeta,
        stateCode.isAcceptableOrUnknown(data['state_code']!, _stateCodeMeta),
      );
    }
    if (data.containsKey('closing_balance')) {
      context.handle(
        _closingBalanceMeta,
        closingBalance.isAcceptableOrUnknown(
          data['closing_balance']!,
          _closingBalanceMeta,
        ),
      );
    }
    if (data.containsKey('on_account_value')) {
      context.handle(
        _onAccountValueMeta,
        onAccountValue.isAcceptableOrUnknown(
          data['on_account_value']!,
          _onAccountValueMeta,
        ),
      );
    }
    if (data.containsKey('route_id')) {
      context.handle(
        _routeIdMeta,
        routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta),
      );
    }
    if (data.containsKey('route_name')) {
      context.handle(
        _routeNameMeta,
        routeName.isAcceptableOrUnknown(data['route_name']!, _routeNameMeta),
      );
    }
    if (data.containsKey('price_list')) {
      context.handle(
        _priceListMeta,
        priceList.isAcceptableOrUnknown(data['price_list']!, _priceListMeta),
      );
    }
    if (data.containsKey('last_sync_on')) {
      context.handle(
        _lastSyncOnMeta,
        lastSyncOn.isAcceptableOrUnknown(
          data['last_sync_on']!,
          _lastSyncOnMeta,
        ),
      );
    }
    if (data.containsKey('sync_action')) {
      context.handle(
        _syncActionMeta,
        syncAction.isAcceptableOrUnknown(data['sync_action']!, _syncActionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ledgerId};
  @override
  PartyMasterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PartyMasterData(
      ledgerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ledger_id'],
      )!,
      ledgerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ledger_name'],
      ),
      ledgerNameLocal: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ledger_name_local'],
      ),
      aliasName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alias_name'],
      ),
      ledDesc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}led_desc'],
      ),
      groupId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}group_id'],
      ),
      groupName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_name'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      creditLimit: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}credit_limit'],
      ),
      dueDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}due_days'],
      ),
      address1: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address1'],
      ),
      address2: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address2'],
      ),
      address3: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address3'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      stateId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}state_id'],
      ),
      stateName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state_name'],
      ),
      countryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}country_id'],
      ),
      countryName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country_name'],
      ),
      pinCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pin_code'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      ),
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      ),
      distanceFromCompanyKM: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}distance_from_company_k_m'],
      ),
      mailingName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mailing_name'],
      ),
      contactPerson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact_person'],
      ),
      mobile: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mobile'],
      ),
      whatsappNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}whatsapp_no'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      taxType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tax_type'],
      ),
      taxNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tax_number'],
      ),
      stateCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state_code'],
      ),
      closingBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}closing_balance'],
      ),
      onAccountValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}on_account_value'],
      ),
      routeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}route_id'],
      ),
      routeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}route_name'],
      ),
      priceList: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price_list'],
      ),
      lastSyncOn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_sync_on'],
      ),
      syncAction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_action'],
      ),
    );
  }

  @override
  $PartyMasterTable createAlias(String alias) {
    return $PartyMasterTable(attachedDatabase, alias);
  }
}

class PartyMasterData extends DataClass implements Insertable<PartyMasterData> {
  final int ledgerId;
  final String? ledgerName;
  final String? ledgerNameLocal;
  final String? aliasName;
  final String? ledDesc;
  final int? groupId;
  final String? groupName;
  final bool isActive;
  final bool isDeleted;
  final double? creditLimit;
  final int? dueDays;
  final String? address1;
  final String? address2;
  final String? address3;
  final String? city;
  final int? stateId;
  final String? stateName;
  final int? countryId;
  final String? countryName;
  final String? pinCode;
  final double? latitude;
  final double? longitude;
  final double? distanceFromCompanyKM;
  final String? mailingName;
  final String? contactPerson;
  final String? mobile;
  final String? whatsappNo;
  final String? email;
  final String? taxType;
  final String? taxNumber;
  final String? stateCode;
  final double? closingBalance;
  final double? onAccountValue;
  final int? routeId;
  final String? routeName;
  final int? priceList;
  final DateTime? lastSyncOn;
  final String? syncAction;
  const PartyMasterData({
    required this.ledgerId,
    this.ledgerName,
    this.ledgerNameLocal,
    this.aliasName,
    this.ledDesc,
    this.groupId,
    this.groupName,
    required this.isActive,
    required this.isDeleted,
    this.creditLimit,
    this.dueDays,
    this.address1,
    this.address2,
    this.address3,
    this.city,
    this.stateId,
    this.stateName,
    this.countryId,
    this.countryName,
    this.pinCode,
    this.latitude,
    this.longitude,
    this.distanceFromCompanyKM,
    this.mailingName,
    this.contactPerson,
    this.mobile,
    this.whatsappNo,
    this.email,
    this.taxType,
    this.taxNumber,
    this.stateCode,
    this.closingBalance,
    this.onAccountValue,
    this.routeId,
    this.routeName,
    this.priceList,
    this.lastSyncOn,
    this.syncAction,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ledger_id'] = Variable<int>(ledgerId);
    if (!nullToAbsent || ledgerName != null) {
      map['ledger_name'] = Variable<String>(ledgerName);
    }
    if (!nullToAbsent || ledgerNameLocal != null) {
      map['ledger_name_local'] = Variable<String>(ledgerNameLocal);
    }
    if (!nullToAbsent || aliasName != null) {
      map['alias_name'] = Variable<String>(aliasName);
    }
    if (!nullToAbsent || ledDesc != null) {
      map['led_desc'] = Variable<String>(ledDesc);
    }
    if (!nullToAbsent || groupId != null) {
      map['group_id'] = Variable<int>(groupId);
    }
    if (!nullToAbsent || groupName != null) {
      map['group_name'] = Variable<String>(groupName);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || creditLimit != null) {
      map['credit_limit'] = Variable<double>(creditLimit);
    }
    if (!nullToAbsent || dueDays != null) {
      map['due_days'] = Variable<int>(dueDays);
    }
    if (!nullToAbsent || address1 != null) {
      map['address1'] = Variable<String>(address1);
    }
    if (!nullToAbsent || address2 != null) {
      map['address2'] = Variable<String>(address2);
    }
    if (!nullToAbsent || address3 != null) {
      map['address3'] = Variable<String>(address3);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || stateId != null) {
      map['state_id'] = Variable<int>(stateId);
    }
    if (!nullToAbsent || stateName != null) {
      map['state_name'] = Variable<String>(stateName);
    }
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<int>(countryId);
    }
    if (!nullToAbsent || countryName != null) {
      map['country_name'] = Variable<String>(countryName);
    }
    if (!nullToAbsent || pinCode != null) {
      map['pin_code'] = Variable<String>(pinCode);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || distanceFromCompanyKM != null) {
      map['distance_from_company_k_m'] = Variable<double>(
        distanceFromCompanyKM,
      );
    }
    if (!nullToAbsent || mailingName != null) {
      map['mailing_name'] = Variable<String>(mailingName);
    }
    if (!nullToAbsent || contactPerson != null) {
      map['contact_person'] = Variable<String>(contactPerson);
    }
    if (!nullToAbsent || mobile != null) {
      map['mobile'] = Variable<String>(mobile);
    }
    if (!nullToAbsent || whatsappNo != null) {
      map['whatsapp_no'] = Variable<String>(whatsappNo);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || taxType != null) {
      map['tax_type'] = Variable<String>(taxType);
    }
    if (!nullToAbsent || taxNumber != null) {
      map['tax_number'] = Variable<String>(taxNumber);
    }
    if (!nullToAbsent || stateCode != null) {
      map['state_code'] = Variable<String>(stateCode);
    }
    if (!nullToAbsent || closingBalance != null) {
      map['closing_balance'] = Variable<double>(closingBalance);
    }
    if (!nullToAbsent || onAccountValue != null) {
      map['on_account_value'] = Variable<double>(onAccountValue);
    }
    if (!nullToAbsent || routeId != null) {
      map['route_id'] = Variable<int>(routeId);
    }
    if (!nullToAbsent || routeName != null) {
      map['route_name'] = Variable<String>(routeName);
    }
    if (!nullToAbsent || priceList != null) {
      map['price_list'] = Variable<int>(priceList);
    }
    if (!nullToAbsent || lastSyncOn != null) {
      map['last_sync_on'] = Variable<DateTime>(lastSyncOn);
    }
    if (!nullToAbsent || syncAction != null) {
      map['sync_action'] = Variable<String>(syncAction);
    }
    return map;
  }

  PartyMasterCompanion toCompanion(bool nullToAbsent) {
    return PartyMasterCompanion(
      ledgerId: Value(ledgerId),
      ledgerName: ledgerName == null && nullToAbsent
          ? const Value.absent()
          : Value(ledgerName),
      ledgerNameLocal: ledgerNameLocal == null && nullToAbsent
          ? const Value.absent()
          : Value(ledgerNameLocal),
      aliasName: aliasName == null && nullToAbsent
          ? const Value.absent()
          : Value(aliasName),
      ledDesc: ledDesc == null && nullToAbsent
          ? const Value.absent()
          : Value(ledDesc),
      groupId: groupId == null && nullToAbsent
          ? const Value.absent()
          : Value(groupId),
      groupName: groupName == null && nullToAbsent
          ? const Value.absent()
          : Value(groupName),
      isActive: Value(isActive),
      isDeleted: Value(isDeleted),
      creditLimit: creditLimit == null && nullToAbsent
          ? const Value.absent()
          : Value(creditLimit),
      dueDays: dueDays == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDays),
      address1: address1 == null && nullToAbsent
          ? const Value.absent()
          : Value(address1),
      address2: address2 == null && nullToAbsent
          ? const Value.absent()
          : Value(address2),
      address3: address3 == null && nullToAbsent
          ? const Value.absent()
          : Value(address3),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      stateId: stateId == null && nullToAbsent
          ? const Value.absent()
          : Value(stateId),
      stateName: stateName == null && nullToAbsent
          ? const Value.absent()
          : Value(stateName),
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      countryName: countryName == null && nullToAbsent
          ? const Value.absent()
          : Value(countryName),
      pinCode: pinCode == null && nullToAbsent
          ? const Value.absent()
          : Value(pinCode),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      distanceFromCompanyKM: distanceFromCompanyKM == null && nullToAbsent
          ? const Value.absent()
          : Value(distanceFromCompanyKM),
      mailingName: mailingName == null && nullToAbsent
          ? const Value.absent()
          : Value(mailingName),
      contactPerson: contactPerson == null && nullToAbsent
          ? const Value.absent()
          : Value(contactPerson),
      mobile: mobile == null && nullToAbsent
          ? const Value.absent()
          : Value(mobile),
      whatsappNo: whatsappNo == null && nullToAbsent
          ? const Value.absent()
          : Value(whatsappNo),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      taxType: taxType == null && nullToAbsent
          ? const Value.absent()
          : Value(taxType),
      taxNumber: taxNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(taxNumber),
      stateCode: stateCode == null && nullToAbsent
          ? const Value.absent()
          : Value(stateCode),
      closingBalance: closingBalance == null && nullToAbsent
          ? const Value.absent()
          : Value(closingBalance),
      onAccountValue: onAccountValue == null && nullToAbsent
          ? const Value.absent()
          : Value(onAccountValue),
      routeId: routeId == null && nullToAbsent
          ? const Value.absent()
          : Value(routeId),
      routeName: routeName == null && nullToAbsent
          ? const Value.absent()
          : Value(routeName),
      priceList: priceList == null && nullToAbsent
          ? const Value.absent()
          : Value(priceList),
      lastSyncOn: lastSyncOn == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncOn),
      syncAction: syncAction == null && nullToAbsent
          ? const Value.absent()
          : Value(syncAction),
    );
  }

  factory PartyMasterData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PartyMasterData(
      ledgerId: serializer.fromJson<int>(json['ledgerId']),
      ledgerName: serializer.fromJson<String?>(json['ledgerName']),
      ledgerNameLocal: serializer.fromJson<String?>(json['ledgerNameLocal']),
      aliasName: serializer.fromJson<String?>(json['aliasName']),
      ledDesc: serializer.fromJson<String?>(json['ledDesc']),
      groupId: serializer.fromJson<int?>(json['groupId']),
      groupName: serializer.fromJson<String?>(json['groupName']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      creditLimit: serializer.fromJson<double?>(json['creditLimit']),
      dueDays: serializer.fromJson<int?>(json['dueDays']),
      address1: serializer.fromJson<String?>(json['address1']),
      address2: serializer.fromJson<String?>(json['address2']),
      address3: serializer.fromJson<String?>(json['address3']),
      city: serializer.fromJson<String?>(json['city']),
      stateId: serializer.fromJson<int?>(json['stateId']),
      stateName: serializer.fromJson<String?>(json['stateName']),
      countryId: serializer.fromJson<int?>(json['countryId']),
      countryName: serializer.fromJson<String?>(json['countryName']),
      pinCode: serializer.fromJson<String?>(json['pinCode']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      distanceFromCompanyKM: serializer.fromJson<double?>(
        json['distanceFromCompanyKM'],
      ),
      mailingName: serializer.fromJson<String?>(json['mailingName']),
      contactPerson: serializer.fromJson<String?>(json['contactPerson']),
      mobile: serializer.fromJson<String?>(json['mobile']),
      whatsappNo: serializer.fromJson<String?>(json['whatsappNo']),
      email: serializer.fromJson<String?>(json['email']),
      taxType: serializer.fromJson<String?>(json['taxType']),
      taxNumber: serializer.fromJson<String?>(json['taxNumber']),
      stateCode: serializer.fromJson<String?>(json['stateCode']),
      closingBalance: serializer.fromJson<double?>(json['closingBalance']),
      onAccountValue: serializer.fromJson<double?>(json['onAccountValue']),
      routeId: serializer.fromJson<int?>(json['routeId']),
      routeName: serializer.fromJson<String?>(json['routeName']),
      priceList: serializer.fromJson<int?>(json['priceList']),
      lastSyncOn: serializer.fromJson<DateTime?>(json['lastSyncOn']),
      syncAction: serializer.fromJson<String?>(json['syncAction']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ledgerId': serializer.toJson<int>(ledgerId),
      'ledgerName': serializer.toJson<String?>(ledgerName),
      'ledgerNameLocal': serializer.toJson<String?>(ledgerNameLocal),
      'aliasName': serializer.toJson<String?>(aliasName),
      'ledDesc': serializer.toJson<String?>(ledDesc),
      'groupId': serializer.toJson<int?>(groupId),
      'groupName': serializer.toJson<String?>(groupName),
      'isActive': serializer.toJson<bool>(isActive),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'creditLimit': serializer.toJson<double?>(creditLimit),
      'dueDays': serializer.toJson<int?>(dueDays),
      'address1': serializer.toJson<String?>(address1),
      'address2': serializer.toJson<String?>(address2),
      'address3': serializer.toJson<String?>(address3),
      'city': serializer.toJson<String?>(city),
      'stateId': serializer.toJson<int?>(stateId),
      'stateName': serializer.toJson<String?>(stateName),
      'countryId': serializer.toJson<int?>(countryId),
      'countryName': serializer.toJson<String?>(countryName),
      'pinCode': serializer.toJson<String?>(pinCode),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'distanceFromCompanyKM': serializer.toJson<double?>(
        distanceFromCompanyKM,
      ),
      'mailingName': serializer.toJson<String?>(mailingName),
      'contactPerson': serializer.toJson<String?>(contactPerson),
      'mobile': serializer.toJson<String?>(mobile),
      'whatsappNo': serializer.toJson<String?>(whatsappNo),
      'email': serializer.toJson<String?>(email),
      'taxType': serializer.toJson<String?>(taxType),
      'taxNumber': serializer.toJson<String?>(taxNumber),
      'stateCode': serializer.toJson<String?>(stateCode),
      'closingBalance': serializer.toJson<double?>(closingBalance),
      'onAccountValue': serializer.toJson<double?>(onAccountValue),
      'routeId': serializer.toJson<int?>(routeId),
      'routeName': serializer.toJson<String?>(routeName),
      'priceList': serializer.toJson<int?>(priceList),
      'lastSyncOn': serializer.toJson<DateTime?>(lastSyncOn),
      'syncAction': serializer.toJson<String?>(syncAction),
    };
  }

  PartyMasterData copyWith({
    int? ledgerId,
    Value<String?> ledgerName = const Value.absent(),
    Value<String?> ledgerNameLocal = const Value.absent(),
    Value<String?> aliasName = const Value.absent(),
    Value<String?> ledDesc = const Value.absent(),
    Value<int?> groupId = const Value.absent(),
    Value<String?> groupName = const Value.absent(),
    bool? isActive,
    bool? isDeleted,
    Value<double?> creditLimit = const Value.absent(),
    Value<int?> dueDays = const Value.absent(),
    Value<String?> address1 = const Value.absent(),
    Value<String?> address2 = const Value.absent(),
    Value<String?> address3 = const Value.absent(),
    Value<String?> city = const Value.absent(),
    Value<int?> stateId = const Value.absent(),
    Value<String?> stateName = const Value.absent(),
    Value<int?> countryId = const Value.absent(),
    Value<String?> countryName = const Value.absent(),
    Value<String?> pinCode = const Value.absent(),
    Value<double?> latitude = const Value.absent(),
    Value<double?> longitude = const Value.absent(),
    Value<double?> distanceFromCompanyKM = const Value.absent(),
    Value<String?> mailingName = const Value.absent(),
    Value<String?> contactPerson = const Value.absent(),
    Value<String?> mobile = const Value.absent(),
    Value<String?> whatsappNo = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> taxType = const Value.absent(),
    Value<String?> taxNumber = const Value.absent(),
    Value<String?> stateCode = const Value.absent(),
    Value<double?> closingBalance = const Value.absent(),
    Value<double?> onAccountValue = const Value.absent(),
    Value<int?> routeId = const Value.absent(),
    Value<String?> routeName = const Value.absent(),
    Value<int?> priceList = const Value.absent(),
    Value<DateTime?> lastSyncOn = const Value.absent(),
    Value<String?> syncAction = const Value.absent(),
  }) => PartyMasterData(
    ledgerId: ledgerId ?? this.ledgerId,
    ledgerName: ledgerName.present ? ledgerName.value : this.ledgerName,
    ledgerNameLocal: ledgerNameLocal.present
        ? ledgerNameLocal.value
        : this.ledgerNameLocal,
    aliasName: aliasName.present ? aliasName.value : this.aliasName,
    ledDesc: ledDesc.present ? ledDesc.value : this.ledDesc,
    groupId: groupId.present ? groupId.value : this.groupId,
    groupName: groupName.present ? groupName.value : this.groupName,
    isActive: isActive ?? this.isActive,
    isDeleted: isDeleted ?? this.isDeleted,
    creditLimit: creditLimit.present ? creditLimit.value : this.creditLimit,
    dueDays: dueDays.present ? dueDays.value : this.dueDays,
    address1: address1.present ? address1.value : this.address1,
    address2: address2.present ? address2.value : this.address2,
    address3: address3.present ? address3.value : this.address3,
    city: city.present ? city.value : this.city,
    stateId: stateId.present ? stateId.value : this.stateId,
    stateName: stateName.present ? stateName.value : this.stateName,
    countryId: countryId.present ? countryId.value : this.countryId,
    countryName: countryName.present ? countryName.value : this.countryName,
    pinCode: pinCode.present ? pinCode.value : this.pinCode,
    latitude: latitude.present ? latitude.value : this.latitude,
    longitude: longitude.present ? longitude.value : this.longitude,
    distanceFromCompanyKM: distanceFromCompanyKM.present
        ? distanceFromCompanyKM.value
        : this.distanceFromCompanyKM,
    mailingName: mailingName.present ? mailingName.value : this.mailingName,
    contactPerson: contactPerson.present
        ? contactPerson.value
        : this.contactPerson,
    mobile: mobile.present ? mobile.value : this.mobile,
    whatsappNo: whatsappNo.present ? whatsappNo.value : this.whatsappNo,
    email: email.present ? email.value : this.email,
    taxType: taxType.present ? taxType.value : this.taxType,
    taxNumber: taxNumber.present ? taxNumber.value : this.taxNumber,
    stateCode: stateCode.present ? stateCode.value : this.stateCode,
    closingBalance: closingBalance.present
        ? closingBalance.value
        : this.closingBalance,
    onAccountValue: onAccountValue.present
        ? onAccountValue.value
        : this.onAccountValue,
    routeId: routeId.present ? routeId.value : this.routeId,
    routeName: routeName.present ? routeName.value : this.routeName,
    priceList: priceList.present ? priceList.value : this.priceList,
    lastSyncOn: lastSyncOn.present ? lastSyncOn.value : this.lastSyncOn,
    syncAction: syncAction.present ? syncAction.value : this.syncAction,
  );
  PartyMasterData copyWithCompanion(PartyMasterCompanion data) {
    return PartyMasterData(
      ledgerId: data.ledgerId.present ? data.ledgerId.value : this.ledgerId,
      ledgerName: data.ledgerName.present
          ? data.ledgerName.value
          : this.ledgerName,
      ledgerNameLocal: data.ledgerNameLocal.present
          ? data.ledgerNameLocal.value
          : this.ledgerNameLocal,
      aliasName: data.aliasName.present ? data.aliasName.value : this.aliasName,
      ledDesc: data.ledDesc.present ? data.ledDesc.value : this.ledDesc,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      groupName: data.groupName.present ? data.groupName.value : this.groupName,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      creditLimit: data.creditLimit.present
          ? data.creditLimit.value
          : this.creditLimit,
      dueDays: data.dueDays.present ? data.dueDays.value : this.dueDays,
      address1: data.address1.present ? data.address1.value : this.address1,
      address2: data.address2.present ? data.address2.value : this.address2,
      address3: data.address3.present ? data.address3.value : this.address3,
      city: data.city.present ? data.city.value : this.city,
      stateId: data.stateId.present ? data.stateId.value : this.stateId,
      stateName: data.stateName.present ? data.stateName.value : this.stateName,
      countryId: data.countryId.present ? data.countryId.value : this.countryId,
      countryName: data.countryName.present
          ? data.countryName.value
          : this.countryName,
      pinCode: data.pinCode.present ? data.pinCode.value : this.pinCode,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      distanceFromCompanyKM: data.distanceFromCompanyKM.present
          ? data.distanceFromCompanyKM.value
          : this.distanceFromCompanyKM,
      mailingName: data.mailingName.present
          ? data.mailingName.value
          : this.mailingName,
      contactPerson: data.contactPerson.present
          ? data.contactPerson.value
          : this.contactPerson,
      mobile: data.mobile.present ? data.mobile.value : this.mobile,
      whatsappNo: data.whatsappNo.present
          ? data.whatsappNo.value
          : this.whatsappNo,
      email: data.email.present ? data.email.value : this.email,
      taxType: data.taxType.present ? data.taxType.value : this.taxType,
      taxNumber: data.taxNumber.present ? data.taxNumber.value : this.taxNumber,
      stateCode: data.stateCode.present ? data.stateCode.value : this.stateCode,
      closingBalance: data.closingBalance.present
          ? data.closingBalance.value
          : this.closingBalance,
      onAccountValue: data.onAccountValue.present
          ? data.onAccountValue.value
          : this.onAccountValue,
      routeId: data.routeId.present ? data.routeId.value : this.routeId,
      routeName: data.routeName.present ? data.routeName.value : this.routeName,
      priceList: data.priceList.present ? data.priceList.value : this.priceList,
      lastSyncOn: data.lastSyncOn.present
          ? data.lastSyncOn.value
          : this.lastSyncOn,
      syncAction: data.syncAction.present
          ? data.syncAction.value
          : this.syncAction,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PartyMasterData(')
          ..write('ledgerId: $ledgerId, ')
          ..write('ledgerName: $ledgerName, ')
          ..write('ledgerNameLocal: $ledgerNameLocal, ')
          ..write('aliasName: $aliasName, ')
          ..write('ledDesc: $ledDesc, ')
          ..write('groupId: $groupId, ')
          ..write('groupName: $groupName, ')
          ..write('isActive: $isActive, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('dueDays: $dueDays, ')
          ..write('address1: $address1, ')
          ..write('address2: $address2, ')
          ..write('address3: $address3, ')
          ..write('city: $city, ')
          ..write('stateId: $stateId, ')
          ..write('stateName: $stateName, ')
          ..write('countryId: $countryId, ')
          ..write('countryName: $countryName, ')
          ..write('pinCode: $pinCode, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('distanceFromCompanyKM: $distanceFromCompanyKM, ')
          ..write('mailingName: $mailingName, ')
          ..write('contactPerson: $contactPerson, ')
          ..write('mobile: $mobile, ')
          ..write('whatsappNo: $whatsappNo, ')
          ..write('email: $email, ')
          ..write('taxType: $taxType, ')
          ..write('taxNumber: $taxNumber, ')
          ..write('stateCode: $stateCode, ')
          ..write('closingBalance: $closingBalance, ')
          ..write('onAccountValue: $onAccountValue, ')
          ..write('routeId: $routeId, ')
          ..write('routeName: $routeName, ')
          ..write('priceList: $priceList, ')
          ..write('lastSyncOn: $lastSyncOn, ')
          ..write('syncAction: $syncAction')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    ledgerId,
    ledgerName,
    ledgerNameLocal,
    aliasName,
    ledDesc,
    groupId,
    groupName,
    isActive,
    isDeleted,
    creditLimit,
    dueDays,
    address1,
    address2,
    address3,
    city,
    stateId,
    stateName,
    countryId,
    countryName,
    pinCode,
    latitude,
    longitude,
    distanceFromCompanyKM,
    mailingName,
    contactPerson,
    mobile,
    whatsappNo,
    email,
    taxType,
    taxNumber,
    stateCode,
    closingBalance,
    onAccountValue,
    routeId,
    routeName,
    priceList,
    lastSyncOn,
    syncAction,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PartyMasterData &&
          other.ledgerId == this.ledgerId &&
          other.ledgerName == this.ledgerName &&
          other.ledgerNameLocal == this.ledgerNameLocal &&
          other.aliasName == this.aliasName &&
          other.ledDesc == this.ledDesc &&
          other.groupId == this.groupId &&
          other.groupName == this.groupName &&
          other.isActive == this.isActive &&
          other.isDeleted == this.isDeleted &&
          other.creditLimit == this.creditLimit &&
          other.dueDays == this.dueDays &&
          other.address1 == this.address1 &&
          other.address2 == this.address2 &&
          other.address3 == this.address3 &&
          other.city == this.city &&
          other.stateId == this.stateId &&
          other.stateName == this.stateName &&
          other.countryId == this.countryId &&
          other.countryName == this.countryName &&
          other.pinCode == this.pinCode &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.distanceFromCompanyKM == this.distanceFromCompanyKM &&
          other.mailingName == this.mailingName &&
          other.contactPerson == this.contactPerson &&
          other.mobile == this.mobile &&
          other.whatsappNo == this.whatsappNo &&
          other.email == this.email &&
          other.taxType == this.taxType &&
          other.taxNumber == this.taxNumber &&
          other.stateCode == this.stateCode &&
          other.closingBalance == this.closingBalance &&
          other.onAccountValue == this.onAccountValue &&
          other.routeId == this.routeId &&
          other.routeName == this.routeName &&
          other.priceList == this.priceList &&
          other.lastSyncOn == this.lastSyncOn &&
          other.syncAction == this.syncAction);
}

class PartyMasterCompanion extends UpdateCompanion<PartyMasterData> {
  final Value<int> ledgerId;
  final Value<String?> ledgerName;
  final Value<String?> ledgerNameLocal;
  final Value<String?> aliasName;
  final Value<String?> ledDesc;
  final Value<int?> groupId;
  final Value<String?> groupName;
  final Value<bool> isActive;
  final Value<bool> isDeleted;
  final Value<double?> creditLimit;
  final Value<int?> dueDays;
  final Value<String?> address1;
  final Value<String?> address2;
  final Value<String?> address3;
  final Value<String?> city;
  final Value<int?> stateId;
  final Value<String?> stateName;
  final Value<int?> countryId;
  final Value<String?> countryName;
  final Value<String?> pinCode;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<double?> distanceFromCompanyKM;
  final Value<String?> mailingName;
  final Value<String?> contactPerson;
  final Value<String?> mobile;
  final Value<String?> whatsappNo;
  final Value<String?> email;
  final Value<String?> taxType;
  final Value<String?> taxNumber;
  final Value<String?> stateCode;
  final Value<double?> closingBalance;
  final Value<double?> onAccountValue;
  final Value<int?> routeId;
  final Value<String?> routeName;
  final Value<int?> priceList;
  final Value<DateTime?> lastSyncOn;
  final Value<String?> syncAction;
  const PartyMasterCompanion({
    this.ledgerId = const Value.absent(),
    this.ledgerName = const Value.absent(),
    this.ledgerNameLocal = const Value.absent(),
    this.aliasName = const Value.absent(),
    this.ledDesc = const Value.absent(),
    this.groupId = const Value.absent(),
    this.groupName = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.creditLimit = const Value.absent(),
    this.dueDays = const Value.absent(),
    this.address1 = const Value.absent(),
    this.address2 = const Value.absent(),
    this.address3 = const Value.absent(),
    this.city = const Value.absent(),
    this.stateId = const Value.absent(),
    this.stateName = const Value.absent(),
    this.countryId = const Value.absent(),
    this.countryName = const Value.absent(),
    this.pinCode = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.distanceFromCompanyKM = const Value.absent(),
    this.mailingName = const Value.absent(),
    this.contactPerson = const Value.absent(),
    this.mobile = const Value.absent(),
    this.whatsappNo = const Value.absent(),
    this.email = const Value.absent(),
    this.taxType = const Value.absent(),
    this.taxNumber = const Value.absent(),
    this.stateCode = const Value.absent(),
    this.closingBalance = const Value.absent(),
    this.onAccountValue = const Value.absent(),
    this.routeId = const Value.absent(),
    this.routeName = const Value.absent(),
    this.priceList = const Value.absent(),
    this.lastSyncOn = const Value.absent(),
    this.syncAction = const Value.absent(),
  });
  PartyMasterCompanion.insert({
    this.ledgerId = const Value.absent(),
    this.ledgerName = const Value.absent(),
    this.ledgerNameLocal = const Value.absent(),
    this.aliasName = const Value.absent(),
    this.ledDesc = const Value.absent(),
    this.groupId = const Value.absent(),
    this.groupName = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.creditLimit = const Value.absent(),
    this.dueDays = const Value.absent(),
    this.address1 = const Value.absent(),
    this.address2 = const Value.absent(),
    this.address3 = const Value.absent(),
    this.city = const Value.absent(),
    this.stateId = const Value.absent(),
    this.stateName = const Value.absent(),
    this.countryId = const Value.absent(),
    this.countryName = const Value.absent(),
    this.pinCode = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.distanceFromCompanyKM = const Value.absent(),
    this.mailingName = const Value.absent(),
    this.contactPerson = const Value.absent(),
    this.mobile = const Value.absent(),
    this.whatsappNo = const Value.absent(),
    this.email = const Value.absent(),
    this.taxType = const Value.absent(),
    this.taxNumber = const Value.absent(),
    this.stateCode = const Value.absent(),
    this.closingBalance = const Value.absent(),
    this.onAccountValue = const Value.absent(),
    this.routeId = const Value.absent(),
    this.routeName = const Value.absent(),
    this.priceList = const Value.absent(),
    this.lastSyncOn = const Value.absent(),
    this.syncAction = const Value.absent(),
  });
  static Insertable<PartyMasterData> custom({
    Expression<int>? ledgerId,
    Expression<String>? ledgerName,
    Expression<String>? ledgerNameLocal,
    Expression<String>? aliasName,
    Expression<String>? ledDesc,
    Expression<int>? groupId,
    Expression<String>? groupName,
    Expression<bool>? isActive,
    Expression<bool>? isDeleted,
    Expression<double>? creditLimit,
    Expression<int>? dueDays,
    Expression<String>? address1,
    Expression<String>? address2,
    Expression<String>? address3,
    Expression<String>? city,
    Expression<int>? stateId,
    Expression<String>? stateName,
    Expression<int>? countryId,
    Expression<String>? countryName,
    Expression<String>? pinCode,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<double>? distanceFromCompanyKM,
    Expression<String>? mailingName,
    Expression<String>? contactPerson,
    Expression<String>? mobile,
    Expression<String>? whatsappNo,
    Expression<String>? email,
    Expression<String>? taxType,
    Expression<String>? taxNumber,
    Expression<String>? stateCode,
    Expression<double>? closingBalance,
    Expression<double>? onAccountValue,
    Expression<int>? routeId,
    Expression<String>? routeName,
    Expression<int>? priceList,
    Expression<DateTime>? lastSyncOn,
    Expression<String>? syncAction,
  }) {
    return RawValuesInsertable({
      if (ledgerId != null) 'ledger_id': ledgerId,
      if (ledgerName != null) 'ledger_name': ledgerName,
      if (ledgerNameLocal != null) 'ledger_name_local': ledgerNameLocal,
      if (aliasName != null) 'alias_name': aliasName,
      if (ledDesc != null) 'led_desc': ledDesc,
      if (groupId != null) 'group_id': groupId,
      if (groupName != null) 'group_name': groupName,
      if (isActive != null) 'is_active': isActive,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (creditLimit != null) 'credit_limit': creditLimit,
      if (dueDays != null) 'due_days': dueDays,
      if (address1 != null) 'address1': address1,
      if (address2 != null) 'address2': address2,
      if (address3 != null) 'address3': address3,
      if (city != null) 'city': city,
      if (stateId != null) 'state_id': stateId,
      if (stateName != null) 'state_name': stateName,
      if (countryId != null) 'country_id': countryId,
      if (countryName != null) 'country_name': countryName,
      if (pinCode != null) 'pin_code': pinCode,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (distanceFromCompanyKM != null)
        'distance_from_company_k_m': distanceFromCompanyKM,
      if (mailingName != null) 'mailing_name': mailingName,
      if (contactPerson != null) 'contact_person': contactPerson,
      if (mobile != null) 'mobile': mobile,
      if (whatsappNo != null) 'whatsapp_no': whatsappNo,
      if (email != null) 'email': email,
      if (taxType != null) 'tax_type': taxType,
      if (taxNumber != null) 'tax_number': taxNumber,
      if (stateCode != null) 'state_code': stateCode,
      if (closingBalance != null) 'closing_balance': closingBalance,
      if (onAccountValue != null) 'on_account_value': onAccountValue,
      if (routeId != null) 'route_id': routeId,
      if (routeName != null) 'route_name': routeName,
      if (priceList != null) 'price_list': priceList,
      if (lastSyncOn != null) 'last_sync_on': lastSyncOn,
      if (syncAction != null) 'sync_action': syncAction,
    });
  }

  PartyMasterCompanion copyWith({
    Value<int>? ledgerId,
    Value<String?>? ledgerName,
    Value<String?>? ledgerNameLocal,
    Value<String?>? aliasName,
    Value<String?>? ledDesc,
    Value<int?>? groupId,
    Value<String?>? groupName,
    Value<bool>? isActive,
    Value<bool>? isDeleted,
    Value<double?>? creditLimit,
    Value<int?>? dueDays,
    Value<String?>? address1,
    Value<String?>? address2,
    Value<String?>? address3,
    Value<String?>? city,
    Value<int?>? stateId,
    Value<String?>? stateName,
    Value<int?>? countryId,
    Value<String?>? countryName,
    Value<String?>? pinCode,
    Value<double?>? latitude,
    Value<double?>? longitude,
    Value<double?>? distanceFromCompanyKM,
    Value<String?>? mailingName,
    Value<String?>? contactPerson,
    Value<String?>? mobile,
    Value<String?>? whatsappNo,
    Value<String?>? email,
    Value<String?>? taxType,
    Value<String?>? taxNumber,
    Value<String?>? stateCode,
    Value<double?>? closingBalance,
    Value<double?>? onAccountValue,
    Value<int?>? routeId,
    Value<String?>? routeName,
    Value<int?>? priceList,
    Value<DateTime?>? lastSyncOn,
    Value<String?>? syncAction,
  }) {
    return PartyMasterCompanion(
      ledgerId: ledgerId ?? this.ledgerId,
      ledgerName: ledgerName ?? this.ledgerName,
      ledgerNameLocal: ledgerNameLocal ?? this.ledgerNameLocal,
      aliasName: aliasName ?? this.aliasName,
      ledDesc: ledDesc ?? this.ledDesc,
      groupId: groupId ?? this.groupId,
      groupName: groupName ?? this.groupName,
      isActive: isActive ?? this.isActive,
      isDeleted: isDeleted ?? this.isDeleted,
      creditLimit: creditLimit ?? this.creditLimit,
      dueDays: dueDays ?? this.dueDays,
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      address3: address3 ?? this.address3,
      city: city ?? this.city,
      stateId: stateId ?? this.stateId,
      stateName: stateName ?? this.stateName,
      countryId: countryId ?? this.countryId,
      countryName: countryName ?? this.countryName,
      pinCode: pinCode ?? this.pinCode,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      distanceFromCompanyKM:
          distanceFromCompanyKM ?? this.distanceFromCompanyKM,
      mailingName: mailingName ?? this.mailingName,
      contactPerson: contactPerson ?? this.contactPerson,
      mobile: mobile ?? this.mobile,
      whatsappNo: whatsappNo ?? this.whatsappNo,
      email: email ?? this.email,
      taxType: taxType ?? this.taxType,
      taxNumber: taxNumber ?? this.taxNumber,
      stateCode: stateCode ?? this.stateCode,
      closingBalance: closingBalance ?? this.closingBalance,
      onAccountValue: onAccountValue ?? this.onAccountValue,
      routeId: routeId ?? this.routeId,
      routeName: routeName ?? this.routeName,
      priceList: priceList ?? this.priceList,
      lastSyncOn: lastSyncOn ?? this.lastSyncOn,
      syncAction: syncAction ?? this.syncAction,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ledgerId.present) {
      map['ledger_id'] = Variable<int>(ledgerId.value);
    }
    if (ledgerName.present) {
      map['ledger_name'] = Variable<String>(ledgerName.value);
    }
    if (ledgerNameLocal.present) {
      map['ledger_name_local'] = Variable<String>(ledgerNameLocal.value);
    }
    if (aliasName.present) {
      map['alias_name'] = Variable<String>(aliasName.value);
    }
    if (ledDesc.present) {
      map['led_desc'] = Variable<String>(ledDesc.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
    }
    if (groupName.present) {
      map['group_name'] = Variable<String>(groupName.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (creditLimit.present) {
      map['credit_limit'] = Variable<double>(creditLimit.value);
    }
    if (dueDays.present) {
      map['due_days'] = Variable<int>(dueDays.value);
    }
    if (address1.present) {
      map['address1'] = Variable<String>(address1.value);
    }
    if (address2.present) {
      map['address2'] = Variable<String>(address2.value);
    }
    if (address3.present) {
      map['address3'] = Variable<String>(address3.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (stateId.present) {
      map['state_id'] = Variable<int>(stateId.value);
    }
    if (stateName.present) {
      map['state_name'] = Variable<String>(stateName.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<int>(countryId.value);
    }
    if (countryName.present) {
      map['country_name'] = Variable<String>(countryName.value);
    }
    if (pinCode.present) {
      map['pin_code'] = Variable<String>(pinCode.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (distanceFromCompanyKM.present) {
      map['distance_from_company_k_m'] = Variable<double>(
        distanceFromCompanyKM.value,
      );
    }
    if (mailingName.present) {
      map['mailing_name'] = Variable<String>(mailingName.value);
    }
    if (contactPerson.present) {
      map['contact_person'] = Variable<String>(contactPerson.value);
    }
    if (mobile.present) {
      map['mobile'] = Variable<String>(mobile.value);
    }
    if (whatsappNo.present) {
      map['whatsapp_no'] = Variable<String>(whatsappNo.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (taxType.present) {
      map['tax_type'] = Variable<String>(taxType.value);
    }
    if (taxNumber.present) {
      map['tax_number'] = Variable<String>(taxNumber.value);
    }
    if (stateCode.present) {
      map['state_code'] = Variable<String>(stateCode.value);
    }
    if (closingBalance.present) {
      map['closing_balance'] = Variable<double>(closingBalance.value);
    }
    if (onAccountValue.present) {
      map['on_account_value'] = Variable<double>(onAccountValue.value);
    }
    if (routeId.present) {
      map['route_id'] = Variable<int>(routeId.value);
    }
    if (routeName.present) {
      map['route_name'] = Variable<String>(routeName.value);
    }
    if (priceList.present) {
      map['price_list'] = Variable<int>(priceList.value);
    }
    if (lastSyncOn.present) {
      map['last_sync_on'] = Variable<DateTime>(lastSyncOn.value);
    }
    if (syncAction.present) {
      map['sync_action'] = Variable<String>(syncAction.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartyMasterCompanion(')
          ..write('ledgerId: $ledgerId, ')
          ..write('ledgerName: $ledgerName, ')
          ..write('ledgerNameLocal: $ledgerNameLocal, ')
          ..write('aliasName: $aliasName, ')
          ..write('ledDesc: $ledDesc, ')
          ..write('groupId: $groupId, ')
          ..write('groupName: $groupName, ')
          ..write('isActive: $isActive, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('dueDays: $dueDays, ')
          ..write('address1: $address1, ')
          ..write('address2: $address2, ')
          ..write('address3: $address3, ')
          ..write('city: $city, ')
          ..write('stateId: $stateId, ')
          ..write('stateName: $stateName, ')
          ..write('countryId: $countryId, ')
          ..write('countryName: $countryName, ')
          ..write('pinCode: $pinCode, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('distanceFromCompanyKM: $distanceFromCompanyKM, ')
          ..write('mailingName: $mailingName, ')
          ..write('contactPerson: $contactPerson, ')
          ..write('mobile: $mobile, ')
          ..write('whatsappNo: $whatsappNo, ')
          ..write('email: $email, ')
          ..write('taxType: $taxType, ')
          ..write('taxNumber: $taxNumber, ')
          ..write('stateCode: $stateCode, ')
          ..write('closingBalance: $closingBalance, ')
          ..write('onAccountValue: $onAccountValue, ')
          ..write('routeId: $routeId, ')
          ..write('routeName: $routeName, ')
          ..write('priceList: $priceList, ')
          ..write('lastSyncOn: $lastSyncOn, ')
          ..write('syncAction: $syncAction')
          ..write(')'))
        .toString();
  }
}

class $ItemMasterTable extends ItemMaster
    with TableInfo<$ItemMasterTable, ItemMasterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemMasterTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _stockItemIdMeta = const VerificationMeta(
    'stockItemId',
  );
  @override
  late final GeneratedColumn<int> stockItemId = GeneratedColumn<int>(
    'stock_item_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemNameMeta = const VerificationMeta(
    'itemName',
  );
  @override
  late final GeneratedColumn<String> itemName = GeneratedColumn<String>(
    'item_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _aliasNameMeta = const VerificationMeta(
    'aliasName',
  );
  @override
  late final GeneratedColumn<String> aliasName = GeneratedColumn<String>(
    'alias_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _partNumberMeta = const VerificationMeta(
    'partNumber',
  );
  @override
  late final GeneratedColumn<String> partNumber = GeneratedColumn<String>(
    'part_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _itemNameLclMeta = const VerificationMeta(
    'itemNameLcl',
  );
  @override
  late final GeneratedColumn<String> itemNameLcl = GeneratedColumn<String>(
    'item_name_lcl',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _groupNameMeta = const VerificationMeta(
    'groupName',
  );
  @override
  late final GeneratedColumn<String> groupName = GeneratedColumn<String>(
    'group_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryNameMeta = const VerificationMeta(
    'categoryName',
  );
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
    'category_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitNameMeta = const VerificationMeta(
    'unitName',
  );
  @override
  late final GeneratedColumn<String> unitName = GeneratedColumn<String>(
    'unit_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _decimalPlacesMeta = const VerificationMeta(
    'decimalPlaces',
  );
  @override
  late final GeneratedColumn<int> decimalPlaces = GeneratedColumn<int>(
    'decimal_places',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _altUnitMeta = const VerificationMeta(
    'altUnit',
  );
  @override
  late final GeneratedColumn<String> altUnit = GeneratedColumn<String>(
    'alt_unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _altDecimalPlacesMeta = const VerificationMeta(
    'altDecimalPlaces',
  );
  @override
  late final GeneratedColumn<int> altDecimalPlaces = GeneratedColumn<int>(
    'alt_decimal_places',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitConversionMeta = const VerificationMeta(
    'unitConversion',
  );
  @override
  late final GeneratedColumn<double> unitConversion = GeneratedColumn<double>(
    'unit_conversion',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _unitDenominatorMeta = const VerificationMeta(
    'unitDenominator',
  );
  @override
  late final GeneratedColumn<double> unitDenominator = GeneratedColumn<double>(
    'unit_denominator',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hsnCodeMeta = const VerificationMeta(
    'hsnCode',
  );
  @override
  late final GeneratedColumn<String> hsnCode = GeneratedColumn<String>(
    'hsn_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _taxPercentMeta = const VerificationMeta(
    'taxPercent',
  );
  @override
  late final GeneratedColumn<double> taxPercent = GeneratedColumn<double>(
    'tax_percent',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    stockItemId,
    itemName,
    aliasName,
    partNumber,
    itemNameLcl,
    groupName,
    categoryName,
    unitName,
    decimalPlaces,
    altUnit,
    altDecimalPlaces,
    unitConversion,
    unitDenominator,
    isActive,
    isDeleted,
    hsnCode,
    taxPercent,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item_master';
  @override
  VerificationContext validateIntegrity(
    Insertable<ItemMasterData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('stock_item_id')) {
      context.handle(
        _stockItemIdMeta,
        stockItemId.isAcceptableOrUnknown(
          data['stock_item_id']!,
          _stockItemIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_stockItemIdMeta);
    }
    if (data.containsKey('item_name')) {
      context.handle(
        _itemNameMeta,
        itemName.isAcceptableOrUnknown(data['item_name']!, _itemNameMeta),
      );
    } else if (isInserting) {
      context.missing(_itemNameMeta);
    }
    if (data.containsKey('alias_name')) {
      context.handle(
        _aliasNameMeta,
        aliasName.isAcceptableOrUnknown(data['alias_name']!, _aliasNameMeta),
      );
    }
    if (data.containsKey('part_number')) {
      context.handle(
        _partNumberMeta,
        partNumber.isAcceptableOrUnknown(data['part_number']!, _partNumberMeta),
      );
    }
    if (data.containsKey('item_name_lcl')) {
      context.handle(
        _itemNameLclMeta,
        itemNameLcl.isAcceptableOrUnknown(
          data['item_name_lcl']!,
          _itemNameLclMeta,
        ),
      );
    }
    if (data.containsKey('group_name')) {
      context.handle(
        _groupNameMeta,
        groupName.isAcceptableOrUnknown(data['group_name']!, _groupNameMeta),
      );
    }
    if (data.containsKey('category_name')) {
      context.handle(
        _categoryNameMeta,
        categoryName.isAcceptableOrUnknown(
          data['category_name']!,
          _categoryNameMeta,
        ),
      );
    }
    if (data.containsKey('unit_name')) {
      context.handle(
        _unitNameMeta,
        unitName.isAcceptableOrUnknown(data['unit_name']!, _unitNameMeta),
      );
    } else if (isInserting) {
      context.missing(_unitNameMeta);
    }
    if (data.containsKey('decimal_places')) {
      context.handle(
        _decimalPlacesMeta,
        decimalPlaces.isAcceptableOrUnknown(
          data['decimal_places']!,
          _decimalPlacesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_decimalPlacesMeta);
    }
    if (data.containsKey('alt_unit')) {
      context.handle(
        _altUnitMeta,
        altUnit.isAcceptableOrUnknown(data['alt_unit']!, _altUnitMeta),
      );
    }
    if (data.containsKey('alt_decimal_places')) {
      context.handle(
        _altDecimalPlacesMeta,
        altDecimalPlaces.isAcceptableOrUnknown(
          data['alt_decimal_places']!,
          _altDecimalPlacesMeta,
        ),
      );
    }
    if (data.containsKey('unit_conversion')) {
      context.handle(
        _unitConversionMeta,
        unitConversion.isAcceptableOrUnknown(
          data['unit_conversion']!,
          _unitConversionMeta,
        ),
      );
    }
    if (data.containsKey('unit_denominator')) {
      context.handle(
        _unitDenominatorMeta,
        unitDenominator.isAcceptableOrUnknown(
          data['unit_denominator']!,
          _unitDenominatorMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('hsn_code')) {
      context.handle(
        _hsnCodeMeta,
        hsnCode.isAcceptableOrUnknown(data['hsn_code']!, _hsnCodeMeta),
      );
    }
    if (data.containsKey('tax_percent')) {
      context.handle(
        _taxPercentMeta,
        taxPercent.isAcceptableOrUnknown(data['tax_percent']!, _taxPercentMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {stockItemId},
  ];
  @override
  ItemMasterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemMasterData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      stockItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock_item_id'],
      )!,
      itemName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_name'],
      )!,
      aliasName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alias_name'],
      )!,
      partNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}part_number'],
      )!,
      itemNameLcl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_name_lcl'],
      ),
      groupName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_name'],
      ),
      categoryName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_name'],
      ),
      unitName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_name'],
      )!,
      decimalPlaces: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}decimal_places'],
      )!,
      altUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alt_unit'],
      ),
      altDecimalPlaces: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}alt_decimal_places'],
      ),
      unitConversion: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}unit_conversion'],
      )!,
      unitDenominator: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}unit_denominator'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      hsnCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hsn_code'],
      ),
      taxPercent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tax_percent'],
      ),
    );
  }

  @override
  $ItemMasterTable createAlias(String alias) {
    return $ItemMasterTable(attachedDatabase, alias);
  }
}

class ItemMasterData extends DataClass implements Insertable<ItemMasterData> {
  /// Local auto-increment primary key
  final int id;

  /// Server ID
  final int stockItemId;
  final String itemName;
  final String aliasName;
  final String partNumber;
  final String? itemNameLcl;
  final String? groupName;
  final String? categoryName;
  final String unitName;
  final int decimalPlaces;
  final String? altUnit;
  final int? altDecimalPlaces;
  final double unitConversion;
  final double unitDenominator;
  final bool isActive;
  final bool isDeleted;
  final String? hsnCode;
  final double? taxPercent;
  const ItemMasterData({
    required this.id,
    required this.stockItemId,
    required this.itemName,
    required this.aliasName,
    required this.partNumber,
    this.itemNameLcl,
    this.groupName,
    this.categoryName,
    required this.unitName,
    required this.decimalPlaces,
    this.altUnit,
    this.altDecimalPlaces,
    required this.unitConversion,
    required this.unitDenominator,
    required this.isActive,
    required this.isDeleted,
    this.hsnCode,
    this.taxPercent,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['stock_item_id'] = Variable<int>(stockItemId);
    map['item_name'] = Variable<String>(itemName);
    map['alias_name'] = Variable<String>(aliasName);
    map['part_number'] = Variable<String>(partNumber);
    if (!nullToAbsent || itemNameLcl != null) {
      map['item_name_lcl'] = Variable<String>(itemNameLcl);
    }
    if (!nullToAbsent || groupName != null) {
      map['group_name'] = Variable<String>(groupName);
    }
    if (!nullToAbsent || categoryName != null) {
      map['category_name'] = Variable<String>(categoryName);
    }
    map['unit_name'] = Variable<String>(unitName);
    map['decimal_places'] = Variable<int>(decimalPlaces);
    if (!nullToAbsent || altUnit != null) {
      map['alt_unit'] = Variable<String>(altUnit);
    }
    if (!nullToAbsent || altDecimalPlaces != null) {
      map['alt_decimal_places'] = Variable<int>(altDecimalPlaces);
    }
    map['unit_conversion'] = Variable<double>(unitConversion);
    map['unit_denominator'] = Variable<double>(unitDenominator);
    map['is_active'] = Variable<bool>(isActive);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || hsnCode != null) {
      map['hsn_code'] = Variable<String>(hsnCode);
    }
    if (!nullToAbsent || taxPercent != null) {
      map['tax_percent'] = Variable<double>(taxPercent);
    }
    return map;
  }

  ItemMasterCompanion toCompanion(bool nullToAbsent) {
    return ItemMasterCompanion(
      id: Value(id),
      stockItemId: Value(stockItemId),
      itemName: Value(itemName),
      aliasName: Value(aliasName),
      partNumber: Value(partNumber),
      itemNameLcl: itemNameLcl == null && nullToAbsent
          ? const Value.absent()
          : Value(itemNameLcl),
      groupName: groupName == null && nullToAbsent
          ? const Value.absent()
          : Value(groupName),
      categoryName: categoryName == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryName),
      unitName: Value(unitName),
      decimalPlaces: Value(decimalPlaces),
      altUnit: altUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(altUnit),
      altDecimalPlaces: altDecimalPlaces == null && nullToAbsent
          ? const Value.absent()
          : Value(altDecimalPlaces),
      unitConversion: Value(unitConversion),
      unitDenominator: Value(unitDenominator),
      isActive: Value(isActive),
      isDeleted: Value(isDeleted),
      hsnCode: hsnCode == null && nullToAbsent
          ? const Value.absent()
          : Value(hsnCode),
      taxPercent: taxPercent == null && nullToAbsent
          ? const Value.absent()
          : Value(taxPercent),
    );
  }

  factory ItemMasterData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemMasterData(
      id: serializer.fromJson<int>(json['id']),
      stockItemId: serializer.fromJson<int>(json['stockItemId']),
      itemName: serializer.fromJson<String>(json['itemName']),
      aliasName: serializer.fromJson<String>(json['aliasName']),
      partNumber: serializer.fromJson<String>(json['partNumber']),
      itemNameLcl: serializer.fromJson<String?>(json['itemNameLcl']),
      groupName: serializer.fromJson<String?>(json['groupName']),
      categoryName: serializer.fromJson<String?>(json['categoryName']),
      unitName: serializer.fromJson<String>(json['unitName']),
      decimalPlaces: serializer.fromJson<int>(json['decimalPlaces']),
      altUnit: serializer.fromJson<String?>(json['altUnit']),
      altDecimalPlaces: serializer.fromJson<int?>(json['altDecimalPlaces']),
      unitConversion: serializer.fromJson<double>(json['unitConversion']),
      unitDenominator: serializer.fromJson<double>(json['unitDenominator']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      hsnCode: serializer.fromJson<String?>(json['hsnCode']),
      taxPercent: serializer.fromJson<double?>(json['taxPercent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'stockItemId': serializer.toJson<int>(stockItemId),
      'itemName': serializer.toJson<String>(itemName),
      'aliasName': serializer.toJson<String>(aliasName),
      'partNumber': serializer.toJson<String>(partNumber),
      'itemNameLcl': serializer.toJson<String?>(itemNameLcl),
      'groupName': serializer.toJson<String?>(groupName),
      'categoryName': serializer.toJson<String?>(categoryName),
      'unitName': serializer.toJson<String>(unitName),
      'decimalPlaces': serializer.toJson<int>(decimalPlaces),
      'altUnit': serializer.toJson<String?>(altUnit),
      'altDecimalPlaces': serializer.toJson<int?>(altDecimalPlaces),
      'unitConversion': serializer.toJson<double>(unitConversion),
      'unitDenominator': serializer.toJson<double>(unitDenominator),
      'isActive': serializer.toJson<bool>(isActive),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'hsnCode': serializer.toJson<String?>(hsnCode),
      'taxPercent': serializer.toJson<double?>(taxPercent),
    };
  }

  ItemMasterData copyWith({
    int? id,
    int? stockItemId,
    String? itemName,
    String? aliasName,
    String? partNumber,
    Value<String?> itemNameLcl = const Value.absent(),
    Value<String?> groupName = const Value.absent(),
    Value<String?> categoryName = const Value.absent(),
    String? unitName,
    int? decimalPlaces,
    Value<String?> altUnit = const Value.absent(),
    Value<int?> altDecimalPlaces = const Value.absent(),
    double? unitConversion,
    double? unitDenominator,
    bool? isActive,
    bool? isDeleted,
    Value<String?> hsnCode = const Value.absent(),
    Value<double?> taxPercent = const Value.absent(),
  }) => ItemMasterData(
    id: id ?? this.id,
    stockItemId: stockItemId ?? this.stockItemId,
    itemName: itemName ?? this.itemName,
    aliasName: aliasName ?? this.aliasName,
    partNumber: partNumber ?? this.partNumber,
    itemNameLcl: itemNameLcl.present ? itemNameLcl.value : this.itemNameLcl,
    groupName: groupName.present ? groupName.value : this.groupName,
    categoryName: categoryName.present ? categoryName.value : this.categoryName,
    unitName: unitName ?? this.unitName,
    decimalPlaces: decimalPlaces ?? this.decimalPlaces,
    altUnit: altUnit.present ? altUnit.value : this.altUnit,
    altDecimalPlaces: altDecimalPlaces.present
        ? altDecimalPlaces.value
        : this.altDecimalPlaces,
    unitConversion: unitConversion ?? this.unitConversion,
    unitDenominator: unitDenominator ?? this.unitDenominator,
    isActive: isActive ?? this.isActive,
    isDeleted: isDeleted ?? this.isDeleted,
    hsnCode: hsnCode.present ? hsnCode.value : this.hsnCode,
    taxPercent: taxPercent.present ? taxPercent.value : this.taxPercent,
  );
  ItemMasterData copyWithCompanion(ItemMasterCompanion data) {
    return ItemMasterData(
      id: data.id.present ? data.id.value : this.id,
      stockItemId: data.stockItemId.present
          ? data.stockItemId.value
          : this.stockItemId,
      itemName: data.itemName.present ? data.itemName.value : this.itemName,
      aliasName: data.aliasName.present ? data.aliasName.value : this.aliasName,
      partNumber: data.partNumber.present
          ? data.partNumber.value
          : this.partNumber,
      itemNameLcl: data.itemNameLcl.present
          ? data.itemNameLcl.value
          : this.itemNameLcl,
      groupName: data.groupName.present ? data.groupName.value : this.groupName,
      categoryName: data.categoryName.present
          ? data.categoryName.value
          : this.categoryName,
      unitName: data.unitName.present ? data.unitName.value : this.unitName,
      decimalPlaces: data.decimalPlaces.present
          ? data.decimalPlaces.value
          : this.decimalPlaces,
      altUnit: data.altUnit.present ? data.altUnit.value : this.altUnit,
      altDecimalPlaces: data.altDecimalPlaces.present
          ? data.altDecimalPlaces.value
          : this.altDecimalPlaces,
      unitConversion: data.unitConversion.present
          ? data.unitConversion.value
          : this.unitConversion,
      unitDenominator: data.unitDenominator.present
          ? data.unitDenominator.value
          : this.unitDenominator,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      hsnCode: data.hsnCode.present ? data.hsnCode.value : this.hsnCode,
      taxPercent: data.taxPercent.present
          ? data.taxPercent.value
          : this.taxPercent,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemMasterData(')
          ..write('id: $id, ')
          ..write('stockItemId: $stockItemId, ')
          ..write('itemName: $itemName, ')
          ..write('aliasName: $aliasName, ')
          ..write('partNumber: $partNumber, ')
          ..write('itemNameLcl: $itemNameLcl, ')
          ..write('groupName: $groupName, ')
          ..write('categoryName: $categoryName, ')
          ..write('unitName: $unitName, ')
          ..write('decimalPlaces: $decimalPlaces, ')
          ..write('altUnit: $altUnit, ')
          ..write('altDecimalPlaces: $altDecimalPlaces, ')
          ..write('unitConversion: $unitConversion, ')
          ..write('unitDenominator: $unitDenominator, ')
          ..write('isActive: $isActive, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('hsnCode: $hsnCode, ')
          ..write('taxPercent: $taxPercent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    stockItemId,
    itemName,
    aliasName,
    partNumber,
    itemNameLcl,
    groupName,
    categoryName,
    unitName,
    decimalPlaces,
    altUnit,
    altDecimalPlaces,
    unitConversion,
    unitDenominator,
    isActive,
    isDeleted,
    hsnCode,
    taxPercent,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemMasterData &&
          other.id == this.id &&
          other.stockItemId == this.stockItemId &&
          other.itemName == this.itemName &&
          other.aliasName == this.aliasName &&
          other.partNumber == this.partNumber &&
          other.itemNameLcl == this.itemNameLcl &&
          other.groupName == this.groupName &&
          other.categoryName == this.categoryName &&
          other.unitName == this.unitName &&
          other.decimalPlaces == this.decimalPlaces &&
          other.altUnit == this.altUnit &&
          other.altDecimalPlaces == this.altDecimalPlaces &&
          other.unitConversion == this.unitConversion &&
          other.unitDenominator == this.unitDenominator &&
          other.isActive == this.isActive &&
          other.isDeleted == this.isDeleted &&
          other.hsnCode == this.hsnCode &&
          other.taxPercent == this.taxPercent);
}

class ItemMasterCompanion extends UpdateCompanion<ItemMasterData> {
  final Value<int> id;
  final Value<int> stockItemId;
  final Value<String> itemName;
  final Value<String> aliasName;
  final Value<String> partNumber;
  final Value<String?> itemNameLcl;
  final Value<String?> groupName;
  final Value<String?> categoryName;
  final Value<String> unitName;
  final Value<int> decimalPlaces;
  final Value<String?> altUnit;
  final Value<int?> altDecimalPlaces;
  final Value<double> unitConversion;
  final Value<double> unitDenominator;
  final Value<bool> isActive;
  final Value<bool> isDeleted;
  final Value<String?> hsnCode;
  final Value<double?> taxPercent;
  const ItemMasterCompanion({
    this.id = const Value.absent(),
    this.stockItemId = const Value.absent(),
    this.itemName = const Value.absent(),
    this.aliasName = const Value.absent(),
    this.partNumber = const Value.absent(),
    this.itemNameLcl = const Value.absent(),
    this.groupName = const Value.absent(),
    this.categoryName = const Value.absent(),
    this.unitName = const Value.absent(),
    this.decimalPlaces = const Value.absent(),
    this.altUnit = const Value.absent(),
    this.altDecimalPlaces = const Value.absent(),
    this.unitConversion = const Value.absent(),
    this.unitDenominator = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.hsnCode = const Value.absent(),
    this.taxPercent = const Value.absent(),
  });
  ItemMasterCompanion.insert({
    this.id = const Value.absent(),
    required int stockItemId,
    required String itemName,
    this.aliasName = const Value.absent(),
    this.partNumber = const Value.absent(),
    this.itemNameLcl = const Value.absent(),
    this.groupName = const Value.absent(),
    this.categoryName = const Value.absent(),
    required String unitName,
    required int decimalPlaces,
    this.altUnit = const Value.absent(),
    this.altDecimalPlaces = const Value.absent(),
    this.unitConversion = const Value.absent(),
    this.unitDenominator = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.hsnCode = const Value.absent(),
    this.taxPercent = const Value.absent(),
  }) : stockItemId = Value(stockItemId),
       itemName = Value(itemName),
       unitName = Value(unitName),
       decimalPlaces = Value(decimalPlaces);
  static Insertable<ItemMasterData> custom({
    Expression<int>? id,
    Expression<int>? stockItemId,
    Expression<String>? itemName,
    Expression<String>? aliasName,
    Expression<String>? partNumber,
    Expression<String>? itemNameLcl,
    Expression<String>? groupName,
    Expression<String>? categoryName,
    Expression<String>? unitName,
    Expression<int>? decimalPlaces,
    Expression<String>? altUnit,
    Expression<int>? altDecimalPlaces,
    Expression<double>? unitConversion,
    Expression<double>? unitDenominator,
    Expression<bool>? isActive,
    Expression<bool>? isDeleted,
    Expression<String>? hsnCode,
    Expression<double>? taxPercent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (stockItemId != null) 'stock_item_id': stockItemId,
      if (itemName != null) 'item_name': itemName,
      if (aliasName != null) 'alias_name': aliasName,
      if (partNumber != null) 'part_number': partNumber,
      if (itemNameLcl != null) 'item_name_lcl': itemNameLcl,
      if (groupName != null) 'group_name': groupName,
      if (categoryName != null) 'category_name': categoryName,
      if (unitName != null) 'unit_name': unitName,
      if (decimalPlaces != null) 'decimal_places': decimalPlaces,
      if (altUnit != null) 'alt_unit': altUnit,
      if (altDecimalPlaces != null) 'alt_decimal_places': altDecimalPlaces,
      if (unitConversion != null) 'unit_conversion': unitConversion,
      if (unitDenominator != null) 'unit_denominator': unitDenominator,
      if (isActive != null) 'is_active': isActive,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (hsnCode != null) 'hsn_code': hsnCode,
      if (taxPercent != null) 'tax_percent': taxPercent,
    });
  }

  ItemMasterCompanion copyWith({
    Value<int>? id,
    Value<int>? stockItemId,
    Value<String>? itemName,
    Value<String>? aliasName,
    Value<String>? partNumber,
    Value<String?>? itemNameLcl,
    Value<String?>? groupName,
    Value<String?>? categoryName,
    Value<String>? unitName,
    Value<int>? decimalPlaces,
    Value<String?>? altUnit,
    Value<int?>? altDecimalPlaces,
    Value<double>? unitConversion,
    Value<double>? unitDenominator,
    Value<bool>? isActive,
    Value<bool>? isDeleted,
    Value<String?>? hsnCode,
    Value<double?>? taxPercent,
  }) {
    return ItemMasterCompanion(
      id: id ?? this.id,
      stockItemId: stockItemId ?? this.stockItemId,
      itemName: itemName ?? this.itemName,
      aliasName: aliasName ?? this.aliasName,
      partNumber: partNumber ?? this.partNumber,
      itemNameLcl: itemNameLcl ?? this.itemNameLcl,
      groupName: groupName ?? this.groupName,
      categoryName: categoryName ?? this.categoryName,
      unitName: unitName ?? this.unitName,
      decimalPlaces: decimalPlaces ?? this.decimalPlaces,
      altUnit: altUnit ?? this.altUnit,
      altDecimalPlaces: altDecimalPlaces ?? this.altDecimalPlaces,
      unitConversion: unitConversion ?? this.unitConversion,
      unitDenominator: unitDenominator ?? this.unitDenominator,
      isActive: isActive ?? this.isActive,
      isDeleted: isDeleted ?? this.isDeleted,
      hsnCode: hsnCode ?? this.hsnCode,
      taxPercent: taxPercent ?? this.taxPercent,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (stockItemId.present) {
      map['stock_item_id'] = Variable<int>(stockItemId.value);
    }
    if (itemName.present) {
      map['item_name'] = Variable<String>(itemName.value);
    }
    if (aliasName.present) {
      map['alias_name'] = Variable<String>(aliasName.value);
    }
    if (partNumber.present) {
      map['part_number'] = Variable<String>(partNumber.value);
    }
    if (itemNameLcl.present) {
      map['item_name_lcl'] = Variable<String>(itemNameLcl.value);
    }
    if (groupName.present) {
      map['group_name'] = Variable<String>(groupName.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    if (unitName.present) {
      map['unit_name'] = Variable<String>(unitName.value);
    }
    if (decimalPlaces.present) {
      map['decimal_places'] = Variable<int>(decimalPlaces.value);
    }
    if (altUnit.present) {
      map['alt_unit'] = Variable<String>(altUnit.value);
    }
    if (altDecimalPlaces.present) {
      map['alt_decimal_places'] = Variable<int>(altDecimalPlaces.value);
    }
    if (unitConversion.present) {
      map['unit_conversion'] = Variable<double>(unitConversion.value);
    }
    if (unitDenominator.present) {
      map['unit_denominator'] = Variable<double>(unitDenominator.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (hsnCode.present) {
      map['hsn_code'] = Variable<String>(hsnCode.value);
    }
    if (taxPercent.present) {
      map['tax_percent'] = Variable<double>(taxPercent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemMasterCompanion(')
          ..write('id: $id, ')
          ..write('stockItemId: $stockItemId, ')
          ..write('itemName: $itemName, ')
          ..write('aliasName: $aliasName, ')
          ..write('partNumber: $partNumber, ')
          ..write('itemNameLcl: $itemNameLcl, ')
          ..write('groupName: $groupName, ')
          ..write('categoryName: $categoryName, ')
          ..write('unitName: $unitName, ')
          ..write('decimalPlaces: $decimalPlaces, ')
          ..write('altUnit: $altUnit, ')
          ..write('altDecimalPlaces: $altDecimalPlaces, ')
          ..write('unitConversion: $unitConversion, ')
          ..write('unitDenominator: $unitDenominator, ')
          ..write('isActive: $isActive, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('hsnCode: $hsnCode, ')
          ..write('taxPercent: $taxPercent')
          ..write(')'))
        .toString();
  }
}

class $PriceLevelsTableTable extends PriceLevelsTable
    with TableInfo<$PriceLevelsTableTable, PriceLevelsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PriceLevelsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priceLevelMeta = const VerificationMeta(
    'priceLevel',
  );
  @override
  late final GeneratedColumn<String> priceLevel = GeneratedColumn<String>(
    'price_level',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rateInclusiveMeta = const VerificationMeta(
    'rateInclusive',
  );
  @override
  late final GeneratedColumn<bool> rateInclusive = GeneratedColumn<bool>(
    'rate_inclusive',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("rate_inclusive" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isDefaultMeta = const VerificationMeta(
    'isDefault',
  );
  @override
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
    'is_default',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_default" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    priceLevel,
    rateInclusive,
    isDefault,
    active,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'price_levels_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PriceLevelsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('price_level')) {
      context.handle(
        _priceLevelMeta,
        priceLevel.isAcceptableOrUnknown(data['price_level']!, _priceLevelMeta),
      );
    }
    if (data.containsKey('rate_inclusive')) {
      context.handle(
        _rateInclusiveMeta,
        rateInclusive.isAcceptableOrUnknown(
          data['rate_inclusive']!,
          _rateInclusiveMeta,
        ),
      );
    }
    if (data.containsKey('is_default')) {
      context.handle(
        _isDefaultMeta,
        isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PriceLevelsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PriceLevelsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      priceLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}price_level'],
      ),
      rateInclusive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}rate_inclusive'],
      )!,
      isDefault: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_default'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
    );
  }

  @override
  $PriceLevelsTableTable createAlias(String alias) {
    return $PriceLevelsTableTable(attachedDatabase, alias);
  }
}

class PriceLevelsTableData extends DataClass
    implements Insertable<PriceLevelsTableData> {
  final int id;
  final String? priceLevel;
  final bool rateInclusive;
  final bool isDefault;
  final bool active;
  const PriceLevelsTableData({
    required this.id,
    this.priceLevel,
    required this.rateInclusive,
    required this.isDefault,
    required this.active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || priceLevel != null) {
      map['price_level'] = Variable<String>(priceLevel);
    }
    map['rate_inclusive'] = Variable<bool>(rateInclusive);
    map['is_default'] = Variable<bool>(isDefault);
    map['active'] = Variable<bool>(active);
    return map;
  }

  PriceLevelsTableCompanion toCompanion(bool nullToAbsent) {
    return PriceLevelsTableCompanion(
      id: Value(id),
      priceLevel: priceLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(priceLevel),
      rateInclusive: Value(rateInclusive),
      isDefault: Value(isDefault),
      active: Value(active),
    );
  }

  factory PriceLevelsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PriceLevelsTableData(
      id: serializer.fromJson<int>(json['id']),
      priceLevel: serializer.fromJson<String?>(json['priceLevel']),
      rateInclusive: serializer.fromJson<bool>(json['rateInclusive']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'priceLevel': serializer.toJson<String?>(priceLevel),
      'rateInclusive': serializer.toJson<bool>(rateInclusive),
      'isDefault': serializer.toJson<bool>(isDefault),
      'active': serializer.toJson<bool>(active),
    };
  }

  PriceLevelsTableData copyWith({
    int? id,
    Value<String?> priceLevel = const Value.absent(),
    bool? rateInclusive,
    bool? isDefault,
    bool? active,
  }) => PriceLevelsTableData(
    id: id ?? this.id,
    priceLevel: priceLevel.present ? priceLevel.value : this.priceLevel,
    rateInclusive: rateInclusive ?? this.rateInclusive,
    isDefault: isDefault ?? this.isDefault,
    active: active ?? this.active,
  );
  PriceLevelsTableData copyWithCompanion(PriceLevelsTableCompanion data) {
    return PriceLevelsTableData(
      id: data.id.present ? data.id.value : this.id,
      priceLevel: data.priceLevel.present
          ? data.priceLevel.value
          : this.priceLevel,
      rateInclusive: data.rateInclusive.present
          ? data.rateInclusive.value
          : this.rateInclusive,
      isDefault: data.isDefault.present ? data.isDefault.value : this.isDefault,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PriceLevelsTableData(')
          ..write('id: $id, ')
          ..write('priceLevel: $priceLevel, ')
          ..write('rateInclusive: $rateInclusive, ')
          ..write('isDefault: $isDefault, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, priceLevel, rateInclusive, isDefault, active);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PriceLevelsTableData &&
          other.id == this.id &&
          other.priceLevel == this.priceLevel &&
          other.rateInclusive == this.rateInclusive &&
          other.isDefault == this.isDefault &&
          other.active == this.active);
}

class PriceLevelsTableCompanion extends UpdateCompanion<PriceLevelsTableData> {
  final Value<int> id;
  final Value<String?> priceLevel;
  final Value<bool> rateInclusive;
  final Value<bool> isDefault;
  final Value<bool> active;
  const PriceLevelsTableCompanion({
    this.id = const Value.absent(),
    this.priceLevel = const Value.absent(),
    this.rateInclusive = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.active = const Value.absent(),
  });
  PriceLevelsTableCompanion.insert({
    this.id = const Value.absent(),
    this.priceLevel = const Value.absent(),
    this.rateInclusive = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.active = const Value.absent(),
  });
  static Insertable<PriceLevelsTableData> custom({
    Expression<int>? id,
    Expression<String>? priceLevel,
    Expression<bool>? rateInclusive,
    Expression<bool>? isDefault,
    Expression<bool>? active,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (priceLevel != null) 'price_level': priceLevel,
      if (rateInclusive != null) 'rate_inclusive': rateInclusive,
      if (isDefault != null) 'is_default': isDefault,
      if (active != null) 'active': active,
    });
  }

  PriceLevelsTableCompanion copyWith({
    Value<int>? id,
    Value<String?>? priceLevel,
    Value<bool>? rateInclusive,
    Value<bool>? isDefault,
    Value<bool>? active,
  }) {
    return PriceLevelsTableCompanion(
      id: id ?? this.id,
      priceLevel: priceLevel ?? this.priceLevel,
      rateInclusive: rateInclusive ?? this.rateInclusive,
      isDefault: isDefault ?? this.isDefault,
      active: active ?? this.active,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (priceLevel.present) {
      map['price_level'] = Variable<String>(priceLevel.value);
    }
    if (rateInclusive.present) {
      map['rate_inclusive'] = Variable<bool>(rateInclusive.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PriceLevelsTableCompanion(')
          ..write('id: $id, ')
          ..write('priceLevel: $priceLevel, ')
          ..write('rateInclusive: $rateInclusive, ')
          ..write('isDefault: $isDefault, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }
}

class $ItemPriceDetailsTablesTable extends ItemPriceDetailsTables
    with TableInfo<$ItemPriceDetailsTablesTable, ItemPriceDetailsTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemPriceDetailsTablesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _applicableDateMeta = const VerificationMeta(
    'applicableDate',
  );
  @override
  late final GeneratedColumn<DateTime> applicableDate =
      GeneratedColumn<DateTime>(
        'applicable_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
    'item_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _companyIdMeta = const VerificationMeta(
    'companyId',
  );
  @override
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
    'company_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priceListMeta = const VerificationMeta(
    'priceList',
  );
  @override
  late final GeneratedColumn<int> priceList = GeneratedColumn<int>(
    'price_list',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<double> rate = GeneratedColumn<double>(
    'rate',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _discountMeta = const VerificationMeta(
    'discount',
  );
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
    'discount',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _discountTypeMeta = const VerificationMeta(
    'discountType',
  );
  @override
  late final GeneratedColumn<String> discountType = GeneratedColumn<String>(
    'discount_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fromQtyMeta = const VerificationMeta(
    'fromQty',
  );
  @override
  late final GeneratedColumn<double> fromQty = GeneratedColumn<double>(
    'from_qty',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _toQtyMeta = const VerificationMeta('toQty');
  @override
  late final GeneratedColumn<double> toQty = GeneratedColumn<double>(
    'to_qty',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    applicableDate,
    itemId,
    companyId,
    priceList,
    rate,
    discount,
    discountType,
    fromQty,
    toQty,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item_price_details_tables';
  @override
  VerificationContext validateIntegrity(
    Insertable<ItemPriceDetailsTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('applicable_date')) {
      context.handle(
        _applicableDateMeta,
        applicableDate.isAcceptableOrUnknown(
          data['applicable_date']!,
          _applicableDateMeta,
        ),
      );
    }
    if (data.containsKey('item_id')) {
      context.handle(
        _itemIdMeta,
        itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta),
      );
    }
    if (data.containsKey('company_id')) {
      context.handle(
        _companyIdMeta,
        companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta),
      );
    }
    if (data.containsKey('price_list')) {
      context.handle(
        _priceListMeta,
        priceList.isAcceptableOrUnknown(data['price_list']!, _priceListMeta),
      );
    }
    if (data.containsKey('rate')) {
      context.handle(
        _rateMeta,
        rate.isAcceptableOrUnknown(data['rate']!, _rateMeta),
      );
    }
    if (data.containsKey('discount')) {
      context.handle(
        _discountMeta,
        discount.isAcceptableOrUnknown(data['discount']!, _discountMeta),
      );
    }
    if (data.containsKey('discount_type')) {
      context.handle(
        _discountTypeMeta,
        discountType.isAcceptableOrUnknown(
          data['discount_type']!,
          _discountTypeMeta,
        ),
      );
    }
    if (data.containsKey('from_qty')) {
      context.handle(
        _fromQtyMeta,
        fromQty.isAcceptableOrUnknown(data['from_qty']!, _fromQtyMeta),
      );
    }
    if (data.containsKey('to_qty')) {
      context.handle(
        _toQtyMeta,
        toQty.isAcceptableOrUnknown(data['to_qty']!, _toQtyMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemPriceDetailsTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemPriceDetailsTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      applicableDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}applicable_date'],
      ),
      itemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}item_id'],
      ),
      companyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}company_id'],
      ),
      priceList: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price_list'],
      ),
      rate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rate'],
      ),
      discount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount'],
      ),
      discountType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}discount_type'],
      ),
      fromQty: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}from_qty'],
      ),
      toQty: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}to_qty'],
      ),
    );
  }

  @override
  $ItemPriceDetailsTablesTable createAlias(String alias) {
    return $ItemPriceDetailsTablesTable(attachedDatabase, alias);
  }
}

class ItemPriceDetailsTable extends DataClass
    implements Insertable<ItemPriceDetailsTable> {
  final int id;
  final DateTime? applicableDate;
  final int? itemId;
  final int? companyId;
  final int? priceList;
  final double? rate;
  final double? discount;
  final String? discountType;
  final double? fromQty;
  final double? toQty;
  const ItemPriceDetailsTable({
    required this.id,
    this.applicableDate,
    this.itemId,
    this.companyId,
    this.priceList,
    this.rate,
    this.discount,
    this.discountType,
    this.fromQty,
    this.toQty,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || applicableDate != null) {
      map['applicable_date'] = Variable<DateTime>(applicableDate);
    }
    if (!nullToAbsent || itemId != null) {
      map['item_id'] = Variable<int>(itemId);
    }
    if (!nullToAbsent || companyId != null) {
      map['company_id'] = Variable<int>(companyId);
    }
    if (!nullToAbsent || priceList != null) {
      map['price_list'] = Variable<int>(priceList);
    }
    if (!nullToAbsent || rate != null) {
      map['rate'] = Variable<double>(rate);
    }
    if (!nullToAbsent || discount != null) {
      map['discount'] = Variable<double>(discount);
    }
    if (!nullToAbsent || discountType != null) {
      map['discount_type'] = Variable<String>(discountType);
    }
    if (!nullToAbsent || fromQty != null) {
      map['from_qty'] = Variable<double>(fromQty);
    }
    if (!nullToAbsent || toQty != null) {
      map['to_qty'] = Variable<double>(toQty);
    }
    return map;
  }

  ItemPriceDetailsTablesCompanion toCompanion(bool nullToAbsent) {
    return ItemPriceDetailsTablesCompanion(
      id: Value(id),
      applicableDate: applicableDate == null && nullToAbsent
          ? const Value.absent()
          : Value(applicableDate),
      itemId: itemId == null && nullToAbsent
          ? const Value.absent()
          : Value(itemId),
      companyId: companyId == null && nullToAbsent
          ? const Value.absent()
          : Value(companyId),
      priceList: priceList == null && nullToAbsent
          ? const Value.absent()
          : Value(priceList),
      rate: rate == null && nullToAbsent ? const Value.absent() : Value(rate),
      discount: discount == null && nullToAbsent
          ? const Value.absent()
          : Value(discount),
      discountType: discountType == null && nullToAbsent
          ? const Value.absent()
          : Value(discountType),
      fromQty: fromQty == null && nullToAbsent
          ? const Value.absent()
          : Value(fromQty),
      toQty: toQty == null && nullToAbsent
          ? const Value.absent()
          : Value(toQty),
    );
  }

  factory ItemPriceDetailsTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemPriceDetailsTable(
      id: serializer.fromJson<int>(json['id']),
      applicableDate: serializer.fromJson<DateTime?>(json['applicableDate']),
      itemId: serializer.fromJson<int?>(json['itemId']),
      companyId: serializer.fromJson<int?>(json['companyId']),
      priceList: serializer.fromJson<int?>(json['priceList']),
      rate: serializer.fromJson<double?>(json['rate']),
      discount: serializer.fromJson<double?>(json['discount']),
      discountType: serializer.fromJson<String?>(json['discountType']),
      fromQty: serializer.fromJson<double?>(json['fromQty']),
      toQty: serializer.fromJson<double?>(json['toQty']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'applicableDate': serializer.toJson<DateTime?>(applicableDate),
      'itemId': serializer.toJson<int?>(itemId),
      'companyId': serializer.toJson<int?>(companyId),
      'priceList': serializer.toJson<int?>(priceList),
      'rate': serializer.toJson<double?>(rate),
      'discount': serializer.toJson<double?>(discount),
      'discountType': serializer.toJson<String?>(discountType),
      'fromQty': serializer.toJson<double?>(fromQty),
      'toQty': serializer.toJson<double?>(toQty),
    };
  }

  ItemPriceDetailsTable copyWith({
    int? id,
    Value<DateTime?> applicableDate = const Value.absent(),
    Value<int?> itemId = const Value.absent(),
    Value<int?> companyId = const Value.absent(),
    Value<int?> priceList = const Value.absent(),
    Value<double?> rate = const Value.absent(),
    Value<double?> discount = const Value.absent(),
    Value<String?> discountType = const Value.absent(),
    Value<double?> fromQty = const Value.absent(),
    Value<double?> toQty = const Value.absent(),
  }) => ItemPriceDetailsTable(
    id: id ?? this.id,
    applicableDate: applicableDate.present
        ? applicableDate.value
        : this.applicableDate,
    itemId: itemId.present ? itemId.value : this.itemId,
    companyId: companyId.present ? companyId.value : this.companyId,
    priceList: priceList.present ? priceList.value : this.priceList,
    rate: rate.present ? rate.value : this.rate,
    discount: discount.present ? discount.value : this.discount,
    discountType: discountType.present ? discountType.value : this.discountType,
    fromQty: fromQty.present ? fromQty.value : this.fromQty,
    toQty: toQty.present ? toQty.value : this.toQty,
  );
  ItemPriceDetailsTable copyWithCompanion(
    ItemPriceDetailsTablesCompanion data,
  ) {
    return ItemPriceDetailsTable(
      id: data.id.present ? data.id.value : this.id,
      applicableDate: data.applicableDate.present
          ? data.applicableDate.value
          : this.applicableDate,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      priceList: data.priceList.present ? data.priceList.value : this.priceList,
      rate: data.rate.present ? data.rate.value : this.rate,
      discount: data.discount.present ? data.discount.value : this.discount,
      discountType: data.discountType.present
          ? data.discountType.value
          : this.discountType,
      fromQty: data.fromQty.present ? data.fromQty.value : this.fromQty,
      toQty: data.toQty.present ? data.toQty.value : this.toQty,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemPriceDetailsTable(')
          ..write('id: $id, ')
          ..write('applicableDate: $applicableDate, ')
          ..write('itemId: $itemId, ')
          ..write('companyId: $companyId, ')
          ..write('priceList: $priceList, ')
          ..write('rate: $rate, ')
          ..write('discount: $discount, ')
          ..write('discountType: $discountType, ')
          ..write('fromQty: $fromQty, ')
          ..write('toQty: $toQty')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    applicableDate,
    itemId,
    companyId,
    priceList,
    rate,
    discount,
    discountType,
    fromQty,
    toQty,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemPriceDetailsTable &&
          other.id == this.id &&
          other.applicableDate == this.applicableDate &&
          other.itemId == this.itemId &&
          other.companyId == this.companyId &&
          other.priceList == this.priceList &&
          other.rate == this.rate &&
          other.discount == this.discount &&
          other.discountType == this.discountType &&
          other.fromQty == this.fromQty &&
          other.toQty == this.toQty);
}

class ItemPriceDetailsTablesCompanion
    extends UpdateCompanion<ItemPriceDetailsTable> {
  final Value<int> id;
  final Value<DateTime?> applicableDate;
  final Value<int?> itemId;
  final Value<int?> companyId;
  final Value<int?> priceList;
  final Value<double?> rate;
  final Value<double?> discount;
  final Value<String?> discountType;
  final Value<double?> fromQty;
  final Value<double?> toQty;
  const ItemPriceDetailsTablesCompanion({
    this.id = const Value.absent(),
    this.applicableDate = const Value.absent(),
    this.itemId = const Value.absent(),
    this.companyId = const Value.absent(),
    this.priceList = const Value.absent(),
    this.rate = const Value.absent(),
    this.discount = const Value.absent(),
    this.discountType = const Value.absent(),
    this.fromQty = const Value.absent(),
    this.toQty = const Value.absent(),
  });
  ItemPriceDetailsTablesCompanion.insert({
    this.id = const Value.absent(),
    this.applicableDate = const Value.absent(),
    this.itemId = const Value.absent(),
    this.companyId = const Value.absent(),
    this.priceList = const Value.absent(),
    this.rate = const Value.absent(),
    this.discount = const Value.absent(),
    this.discountType = const Value.absent(),
    this.fromQty = const Value.absent(),
    this.toQty = const Value.absent(),
  });
  static Insertable<ItemPriceDetailsTable> custom({
    Expression<int>? id,
    Expression<DateTime>? applicableDate,
    Expression<int>? itemId,
    Expression<int>? companyId,
    Expression<int>? priceList,
    Expression<double>? rate,
    Expression<double>? discount,
    Expression<String>? discountType,
    Expression<double>? fromQty,
    Expression<double>? toQty,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (applicableDate != null) 'applicable_date': applicableDate,
      if (itemId != null) 'item_id': itemId,
      if (companyId != null) 'company_id': companyId,
      if (priceList != null) 'price_list': priceList,
      if (rate != null) 'rate': rate,
      if (discount != null) 'discount': discount,
      if (discountType != null) 'discount_type': discountType,
      if (fromQty != null) 'from_qty': fromQty,
      if (toQty != null) 'to_qty': toQty,
    });
  }

  ItemPriceDetailsTablesCompanion copyWith({
    Value<int>? id,
    Value<DateTime?>? applicableDate,
    Value<int?>? itemId,
    Value<int?>? companyId,
    Value<int?>? priceList,
    Value<double?>? rate,
    Value<double?>? discount,
    Value<String?>? discountType,
    Value<double?>? fromQty,
    Value<double?>? toQty,
  }) {
    return ItemPriceDetailsTablesCompanion(
      id: id ?? this.id,
      applicableDate: applicableDate ?? this.applicableDate,
      itemId: itemId ?? this.itemId,
      companyId: companyId ?? this.companyId,
      priceList: priceList ?? this.priceList,
      rate: rate ?? this.rate,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      fromQty: fromQty ?? this.fromQty,
      toQty: toQty ?? this.toQty,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (applicableDate.present) {
      map['applicable_date'] = Variable<DateTime>(applicableDate.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    if (priceList.present) {
      map['price_list'] = Variable<int>(priceList.value);
    }
    if (rate.present) {
      map['rate'] = Variable<double>(rate.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (discountType.present) {
      map['discount_type'] = Variable<String>(discountType.value);
    }
    if (fromQty.present) {
      map['from_qty'] = Variable<double>(fromQty.value);
    }
    if (toQty.present) {
      map['to_qty'] = Variable<double>(toQty.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemPriceDetailsTablesCompanion(')
          ..write('id: $id, ')
          ..write('applicableDate: $applicableDate, ')
          ..write('itemId: $itemId, ')
          ..write('companyId: $companyId, ')
          ..write('priceList: $priceList, ')
          ..write('rate: $rate, ')
          ..write('discount: $discount, ')
          ..write('discountType: $discountType, ')
          ..write('fromQty: $fromQty, ')
          ..write('toQty: $toQty')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $RegistrationDetailsTable registrationDetails =
      $RegistrationDetailsTable(this);
  late final $CompaniesTable companies = $CompaniesTable(this);
  late final $UserSettingsTableTable userSettingsTable =
      $UserSettingsTableTable(this);
  late final $VoucherTypesTable voucherTypes = $VoucherTypesTable(this);
  late final $GodownVoucherTypesTable godownVoucherTypes =
      $GodownVoucherTypesTable(this);
  late final $RouteVoucherTypesTable routeVoucherTypes =
      $RouteVoucherTypesTable(this);
  late final $CompanySettingsTableTable companySettingsTable =
      $CompanySettingsTableTable(this);
  late final $GodownVehiclesTable godownVehicles = $GodownVehiclesTable(this);
  late final $GodownRoutesTable godownRoutes = $GodownRoutesTable(this);
  late final $PartyMasterTable partyMaster = $PartyMasterTable(this);
  late final $ItemMasterTable itemMaster = $ItemMasterTable(this);
  late final $PriceLevelsTableTable priceLevelsTable = $PriceLevelsTableTable(
    this,
  );
  late final $ItemPriceDetailsTablesTable itemPriceDetailsTables =
      $ItemPriceDetailsTablesTable(this);
  late final CompanyDao companyDao = CompanyDao(this as AppDb);
  late final RegistrationDetailDao registrationDetailDao =
      RegistrationDetailDao(this as AppDb);
  late final UserSettingsDao userSettingsDao = UserSettingsDao(this as AppDb);
  late final VoucherTypesDao voucherTypesDao = VoucherTypesDao(this as AppDb);
  late final GodownVoucherTypesDao godownVoucherTypesDao =
      GodownVoucherTypesDao(this as AppDb);
  late final RouteVoucherTypesDao routeVoucherTypesDao = RouteVoucherTypesDao(
    this as AppDb,
  );
  late final CompanySettingsDao companySettingsDao = CompanySettingsDao(
    this as AppDb,
  );
  late final GodownVehicleDao godownVehicleDao = GodownVehicleDao(
    this as AppDb,
  );
  late final RouteDao routeDao = RouteDao(this as AppDb);
  late final PartyMasterDao partyMasterDao = PartyMasterDao(this as AppDb);
  late final ItemMasterDao itemMasterDao = ItemMasterDao(this as AppDb);
  late final PriceLevelDao priceLevelDao = PriceLevelDao(this as AppDb);
  late final PriceListDetailsDao priceListDetailsDao = PriceListDetailsDao(
    this as AppDb,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    registrationDetails,
    companies,
    userSettingsTable,
    voucherTypes,
    godownVoucherTypes,
    routeVoucherTypes,
    companySettingsTable,
    godownVehicles,
    godownRoutes,
    partyMaster,
    itemMaster,
    priceLevelsTable,
    itemPriceDetailsTables,
  ];
}

typedef $$RegistrationDetailsTableCreateCompanionBuilder =
    RegistrationDetailsCompanion Function({
      Value<int> userId,
      Value<int?> customerId,
      Value<String?> fullName,
      Value<String?> mobile,
      Value<String?> whatsappNo,
      Value<String?> email,
      Value<String?> designation,
      Value<String?> username,
      Value<int?> userActive,
      Value<String?> companyName,
      Value<String?> address,
      Value<int?> countryId,
      Value<int?> stateId,
      Value<String?> activationType,
      Value<DateTime?> expiryDate,
      Value<int?> custActive,
      Value<String?> token,
      Value<String?> dbName,
    });
typedef $$RegistrationDetailsTableUpdateCompanionBuilder =
    RegistrationDetailsCompanion Function({
      Value<int> userId,
      Value<int?> customerId,
      Value<String?> fullName,
      Value<String?> mobile,
      Value<String?> whatsappNo,
      Value<String?> email,
      Value<String?> designation,
      Value<String?> username,
      Value<int?> userActive,
      Value<String?> companyName,
      Value<String?> address,
      Value<int?> countryId,
      Value<int?> stateId,
      Value<String?> activationType,
      Value<DateTime?> expiryDate,
      Value<int?> custActive,
      Value<String?> token,
      Value<String?> dbName,
    });

class $$RegistrationDetailsTableFilterComposer
    extends Composer<_$AppDb, $RegistrationDetailsTable> {
  $$RegistrationDetailsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mobile => $composableBuilder(
    column: $table.mobile,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get whatsappNo => $composableBuilder(
    column: $table.whatsappNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get designation => $composableBuilder(
    column: $table.designation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userActive => $composableBuilder(
    column: $table.userActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get countryId => $composableBuilder(
    column: $table.countryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stateId => $composableBuilder(
    column: $table.stateId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activationType => $composableBuilder(
    column: $table.activationType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiryDate => $composableBuilder(
    column: $table.expiryDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get custActive => $composableBuilder(
    column: $table.custActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dbName => $composableBuilder(
    column: $table.dbName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RegistrationDetailsTableOrderingComposer
    extends Composer<_$AppDb, $RegistrationDetailsTable> {
  $$RegistrationDetailsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mobile => $composableBuilder(
    column: $table.mobile,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get whatsappNo => $composableBuilder(
    column: $table.whatsappNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get designation => $composableBuilder(
    column: $table.designation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userActive => $composableBuilder(
    column: $table.userActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get countryId => $composableBuilder(
    column: $table.countryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stateId => $composableBuilder(
    column: $table.stateId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activationType => $composableBuilder(
    column: $table.activationType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiryDate => $composableBuilder(
    column: $table.expiryDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get custActive => $composableBuilder(
    column: $table.custActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dbName => $composableBuilder(
    column: $table.dbName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RegistrationDetailsTableAnnotationComposer
    extends Composer<_$AppDb, $RegistrationDetailsTable> {
  $$RegistrationDetailsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get mobile =>
      $composableBuilder(column: $table.mobile, builder: (column) => column);

  GeneratedColumn<String> get whatsappNo => $composableBuilder(
    column: $table.whatsappNo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get designation => $composableBuilder(
    column: $table.designation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<int> get userActive => $composableBuilder(
    column: $table.userActive,
    builder: (column) => column,
  );

  GeneratedColumn<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<int> get countryId =>
      $composableBuilder(column: $table.countryId, builder: (column) => column);

  GeneratedColumn<int> get stateId =>
      $composableBuilder(column: $table.stateId, builder: (column) => column);

  GeneratedColumn<String> get activationType => $composableBuilder(
    column: $table.activationType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get expiryDate => $composableBuilder(
    column: $table.expiryDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get custActive => $composableBuilder(
    column: $table.custActive,
    builder: (column) => column,
  );

  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);

  GeneratedColumn<String> get dbName =>
      $composableBuilder(column: $table.dbName, builder: (column) => column);
}

class $$RegistrationDetailsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $RegistrationDetailsTable,
          RegistrationDetail,
          $$RegistrationDetailsTableFilterComposer,
          $$RegistrationDetailsTableOrderingComposer,
          $$RegistrationDetailsTableAnnotationComposer,
          $$RegistrationDetailsTableCreateCompanionBuilder,
          $$RegistrationDetailsTableUpdateCompanionBuilder,
          (
            RegistrationDetail,
            BaseReferences<
              _$AppDb,
              $RegistrationDetailsTable,
              RegistrationDetail
            >,
          ),
          RegistrationDetail,
          PrefetchHooks Function()
        > {
  $$RegistrationDetailsTableTableManager(
    _$AppDb db,
    $RegistrationDetailsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RegistrationDetailsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RegistrationDetailsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RegistrationDetailsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                Value<int?> customerId = const Value.absent(),
                Value<String?> fullName = const Value.absent(),
                Value<String?> mobile = const Value.absent(),
                Value<String?> whatsappNo = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> designation = const Value.absent(),
                Value<String?> username = const Value.absent(),
                Value<int?> userActive = const Value.absent(),
                Value<String?> companyName = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<int?> countryId = const Value.absent(),
                Value<int?> stateId = const Value.absent(),
                Value<String?> activationType = const Value.absent(),
                Value<DateTime?> expiryDate = const Value.absent(),
                Value<int?> custActive = const Value.absent(),
                Value<String?> token = const Value.absent(),
                Value<String?> dbName = const Value.absent(),
              }) => RegistrationDetailsCompanion(
                userId: userId,
                customerId: customerId,
                fullName: fullName,
                mobile: mobile,
                whatsappNo: whatsappNo,
                email: email,
                designation: designation,
                username: username,
                userActive: userActive,
                companyName: companyName,
                address: address,
                countryId: countryId,
                stateId: stateId,
                activationType: activationType,
                expiryDate: expiryDate,
                custActive: custActive,
                token: token,
                dbName: dbName,
              ),
          createCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                Value<int?> customerId = const Value.absent(),
                Value<String?> fullName = const Value.absent(),
                Value<String?> mobile = const Value.absent(),
                Value<String?> whatsappNo = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> designation = const Value.absent(),
                Value<String?> username = const Value.absent(),
                Value<int?> userActive = const Value.absent(),
                Value<String?> companyName = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<int?> countryId = const Value.absent(),
                Value<int?> stateId = const Value.absent(),
                Value<String?> activationType = const Value.absent(),
                Value<DateTime?> expiryDate = const Value.absent(),
                Value<int?> custActive = const Value.absent(),
                Value<String?> token = const Value.absent(),
                Value<String?> dbName = const Value.absent(),
              }) => RegistrationDetailsCompanion.insert(
                userId: userId,
                customerId: customerId,
                fullName: fullName,
                mobile: mobile,
                whatsappNo: whatsappNo,
                email: email,
                designation: designation,
                username: username,
                userActive: userActive,
                companyName: companyName,
                address: address,
                countryId: countryId,
                stateId: stateId,
                activationType: activationType,
                expiryDate: expiryDate,
                custActive: custActive,
                token: token,
                dbName: dbName,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RegistrationDetailsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $RegistrationDetailsTable,
      RegistrationDetail,
      $$RegistrationDetailsTableFilterComposer,
      $$RegistrationDetailsTableOrderingComposer,
      $$RegistrationDetailsTableAnnotationComposer,
      $$RegistrationDetailsTableCreateCompanionBuilder,
      $$RegistrationDetailsTableUpdateCompanionBuilder,
      (
        RegistrationDetail,
        BaseReferences<_$AppDb, $RegistrationDetailsTable, RegistrationDetail>,
      ),
      RegistrationDetail,
      PrefetchHooks Function()
    >;
typedef $$CompaniesTableCreateCompanionBuilder =
    CompaniesCompanion Function({
      Value<int?> id,
      Value<String?> companyName,
      Value<String?> mailingName,
      Value<String?> localName,
      Value<String?> companyCode,
      Value<String?> address1,
      Value<String?> address2,
      Value<String?> address3,
      Value<String?> pinCode,
      Value<String?> country,
      Value<String?> state,
      Value<String?> officeNo,
      Value<String?> mobile,
      Value<String?> email,
      Value<String?> regType,
      Value<String?> fssaiNo,
      Value<DateTime?> finYearStart,
      Value<String?> voucherRepeat,
      Value<DateTime?> lastSyncDate,
      Value<int?> createBy,
      Value<DateTime?> createdOn,
      Value<String?> createdFrom,
      Value<String?> bankName,
      Value<String?> bankBranch,
      Value<String?> accNo,
      Value<String?> ifscCode,
      Value<String?> gPayNumber,
      Value<String?> upiAddress,
      Value<String?> payeeName,
      Value<String?> currency,
      Value<int?> hasIntegrationSettings,
      Value<int?> hasVoucherTypeSettings,
      Value<int?> hasCompanySettings,
      Value<String?> userList,
      Value<String?> integrationType,
      Value<String?> serialNumber,
      Value<String?> stockInCloud,
      Value<String?> registrationNo,
      Value<String?> vchNumberingMode,
      Value<String?> companyLogoUrl,
      Value<bool?> companyProfileUpdated,
      Value<bool?> companyBankUpdated,
      Value<bool?> companyRegUpdated,
    });
typedef $$CompaniesTableUpdateCompanionBuilder =
    CompaniesCompanion Function({
      Value<int?> id,
      Value<String?> companyName,
      Value<String?> mailingName,
      Value<String?> localName,
      Value<String?> companyCode,
      Value<String?> address1,
      Value<String?> address2,
      Value<String?> address3,
      Value<String?> pinCode,
      Value<String?> country,
      Value<String?> state,
      Value<String?> officeNo,
      Value<String?> mobile,
      Value<String?> email,
      Value<String?> regType,
      Value<String?> fssaiNo,
      Value<DateTime?> finYearStart,
      Value<String?> voucherRepeat,
      Value<DateTime?> lastSyncDate,
      Value<int?> createBy,
      Value<DateTime?> createdOn,
      Value<String?> createdFrom,
      Value<String?> bankName,
      Value<String?> bankBranch,
      Value<String?> accNo,
      Value<String?> ifscCode,
      Value<String?> gPayNumber,
      Value<String?> upiAddress,
      Value<String?> payeeName,
      Value<String?> currency,
      Value<int?> hasIntegrationSettings,
      Value<int?> hasVoucherTypeSettings,
      Value<int?> hasCompanySettings,
      Value<String?> userList,
      Value<String?> integrationType,
      Value<String?> serialNumber,
      Value<String?> stockInCloud,
      Value<String?> registrationNo,
      Value<String?> vchNumberingMode,
      Value<String?> companyLogoUrl,
      Value<bool?> companyProfileUpdated,
      Value<bool?> companyBankUpdated,
      Value<bool?> companyRegUpdated,
    });

class $$CompaniesTableFilterComposer
    extends Composer<_$AppDb, $CompaniesTable> {
  $$CompaniesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mailingName => $composableBuilder(
    column: $table.mailingName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localName => $composableBuilder(
    column: $table.localName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyCode => $composableBuilder(
    column: $table.companyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address1 => $composableBuilder(
    column: $table.address1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address2 => $composableBuilder(
    column: $table.address2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address3 => $composableBuilder(
    column: $table.address3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pinCode => $composableBuilder(
    column: $table.pinCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get officeNo => $composableBuilder(
    column: $table.officeNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mobile => $composableBuilder(
    column: $table.mobile,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get regType => $composableBuilder(
    column: $table.regType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fssaiNo => $composableBuilder(
    column: $table.fssaiNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get finYearStart => $composableBuilder(
    column: $table.finYearStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get voucherRepeat => $composableBuilder(
    column: $table.voucherRepeat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncDate => $composableBuilder(
    column: $table.lastSyncDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createBy => $composableBuilder(
    column: $table.createBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdOn => $composableBuilder(
    column: $table.createdOn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdFrom => $composableBuilder(
    column: $table.createdFrom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankBranch => $composableBuilder(
    column: $table.bankBranch,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accNo => $composableBuilder(
    column: $table.accNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ifscCode => $composableBuilder(
    column: $table.ifscCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gPayNumber => $composableBuilder(
    column: $table.gPayNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get upiAddress => $composableBuilder(
    column: $table.upiAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payeeName => $composableBuilder(
    column: $table.payeeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hasIntegrationSettings => $composableBuilder(
    column: $table.hasIntegrationSettings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hasVoucherTypeSettings => $composableBuilder(
    column: $table.hasVoucherTypeSettings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hasCompanySettings => $composableBuilder(
    column: $table.hasCompanySettings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userList => $composableBuilder(
    column: $table.userList,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get integrationType => $composableBuilder(
    column: $table.integrationType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serialNumber => $composableBuilder(
    column: $table.serialNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stockInCloud => $composableBuilder(
    column: $table.stockInCloud,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get registrationNo => $composableBuilder(
    column: $table.registrationNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vchNumberingMode => $composableBuilder(
    column: $table.vchNumberingMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyLogoUrl => $composableBuilder(
    column: $table.companyLogoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get companyProfileUpdated => $composableBuilder(
    column: $table.companyProfileUpdated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get companyBankUpdated => $composableBuilder(
    column: $table.companyBankUpdated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get companyRegUpdated => $composableBuilder(
    column: $table.companyRegUpdated,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CompaniesTableOrderingComposer
    extends Composer<_$AppDb, $CompaniesTable> {
  $$CompaniesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mailingName => $composableBuilder(
    column: $table.mailingName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localName => $composableBuilder(
    column: $table.localName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyCode => $composableBuilder(
    column: $table.companyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address1 => $composableBuilder(
    column: $table.address1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address2 => $composableBuilder(
    column: $table.address2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address3 => $composableBuilder(
    column: $table.address3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pinCode => $composableBuilder(
    column: $table.pinCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get officeNo => $composableBuilder(
    column: $table.officeNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mobile => $composableBuilder(
    column: $table.mobile,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get regType => $composableBuilder(
    column: $table.regType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fssaiNo => $composableBuilder(
    column: $table.fssaiNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get finYearStart => $composableBuilder(
    column: $table.finYearStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get voucherRepeat => $composableBuilder(
    column: $table.voucherRepeat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncDate => $composableBuilder(
    column: $table.lastSyncDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createBy => $composableBuilder(
    column: $table.createBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdOn => $composableBuilder(
    column: $table.createdOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdFrom => $composableBuilder(
    column: $table.createdFrom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankBranch => $composableBuilder(
    column: $table.bankBranch,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accNo => $composableBuilder(
    column: $table.accNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ifscCode => $composableBuilder(
    column: $table.ifscCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gPayNumber => $composableBuilder(
    column: $table.gPayNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get upiAddress => $composableBuilder(
    column: $table.upiAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payeeName => $composableBuilder(
    column: $table.payeeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hasIntegrationSettings => $composableBuilder(
    column: $table.hasIntegrationSettings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hasVoucherTypeSettings => $composableBuilder(
    column: $table.hasVoucherTypeSettings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hasCompanySettings => $composableBuilder(
    column: $table.hasCompanySettings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userList => $composableBuilder(
    column: $table.userList,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get integrationType => $composableBuilder(
    column: $table.integrationType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serialNumber => $composableBuilder(
    column: $table.serialNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stockInCloud => $composableBuilder(
    column: $table.stockInCloud,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get registrationNo => $composableBuilder(
    column: $table.registrationNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vchNumberingMode => $composableBuilder(
    column: $table.vchNumberingMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyLogoUrl => $composableBuilder(
    column: $table.companyLogoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get companyProfileUpdated => $composableBuilder(
    column: $table.companyProfileUpdated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get companyBankUpdated => $composableBuilder(
    column: $table.companyBankUpdated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get companyRegUpdated => $composableBuilder(
    column: $table.companyRegUpdated,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CompaniesTableAnnotationComposer
    extends Composer<_$AppDb, $CompaniesTable> {
  $$CompaniesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mailingName => $composableBuilder(
    column: $table.mailingName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get localName =>
      $composableBuilder(column: $table.localName, builder: (column) => column);

  GeneratedColumn<String> get companyCode => $composableBuilder(
    column: $table.companyCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address1 =>
      $composableBuilder(column: $table.address1, builder: (column) => column);

  GeneratedColumn<String> get address2 =>
      $composableBuilder(column: $table.address2, builder: (column) => column);

  GeneratedColumn<String> get address3 =>
      $composableBuilder(column: $table.address3, builder: (column) => column);

  GeneratedColumn<String> get pinCode =>
      $composableBuilder(column: $table.pinCode, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get officeNo =>
      $composableBuilder(column: $table.officeNo, builder: (column) => column);

  GeneratedColumn<String> get mobile =>
      $composableBuilder(column: $table.mobile, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get regType =>
      $composableBuilder(column: $table.regType, builder: (column) => column);

  GeneratedColumn<String> get fssaiNo =>
      $composableBuilder(column: $table.fssaiNo, builder: (column) => column);

  GeneratedColumn<DateTime> get finYearStart => $composableBuilder(
    column: $table.finYearStart,
    builder: (column) => column,
  );

  GeneratedColumn<String> get voucherRepeat => $composableBuilder(
    column: $table.voucherRepeat,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastSyncDate => $composableBuilder(
    column: $table.lastSyncDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createBy =>
      $composableBuilder(column: $table.createBy, builder: (column) => column);

  GeneratedColumn<DateTime> get createdOn =>
      $composableBuilder(column: $table.createdOn, builder: (column) => column);

  GeneratedColumn<String> get createdFrom => $composableBuilder(
    column: $table.createdFrom,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bankName =>
      $composableBuilder(column: $table.bankName, builder: (column) => column);

  GeneratedColumn<String> get bankBranch => $composableBuilder(
    column: $table.bankBranch,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accNo =>
      $composableBuilder(column: $table.accNo, builder: (column) => column);

  GeneratedColumn<String> get ifscCode =>
      $composableBuilder(column: $table.ifscCode, builder: (column) => column);

  GeneratedColumn<String> get gPayNumber => $composableBuilder(
    column: $table.gPayNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get upiAddress => $composableBuilder(
    column: $table.upiAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payeeName =>
      $composableBuilder(column: $table.payeeName, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<int> get hasIntegrationSettings => $composableBuilder(
    column: $table.hasIntegrationSettings,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hasVoucherTypeSettings => $composableBuilder(
    column: $table.hasVoucherTypeSettings,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hasCompanySettings => $composableBuilder(
    column: $table.hasCompanySettings,
    builder: (column) => column,
  );

  GeneratedColumn<String> get userList =>
      $composableBuilder(column: $table.userList, builder: (column) => column);

  GeneratedColumn<String> get integrationType => $composableBuilder(
    column: $table.integrationType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get serialNumber => $composableBuilder(
    column: $table.serialNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get stockInCloud => $composableBuilder(
    column: $table.stockInCloud,
    builder: (column) => column,
  );

  GeneratedColumn<String> get registrationNo => $composableBuilder(
    column: $table.registrationNo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get vchNumberingMode => $composableBuilder(
    column: $table.vchNumberingMode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get companyLogoUrl => $composableBuilder(
    column: $table.companyLogoUrl,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get companyProfileUpdated => $composableBuilder(
    column: $table.companyProfileUpdated,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get companyBankUpdated => $composableBuilder(
    column: $table.companyBankUpdated,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get companyRegUpdated => $composableBuilder(
    column: $table.companyRegUpdated,
    builder: (column) => column,
  );
}

class $$CompaniesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $CompaniesTable,
          Company,
          $$CompaniesTableFilterComposer,
          $$CompaniesTableOrderingComposer,
          $$CompaniesTableAnnotationComposer,
          $$CompaniesTableCreateCompanionBuilder,
          $$CompaniesTableUpdateCompanionBuilder,
          (Company, BaseReferences<_$AppDb, $CompaniesTable, Company>),
          Company,
          PrefetchHooks Function()
        > {
  $$CompaniesTableTableManager(_$AppDb db, $CompaniesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CompaniesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CompaniesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CompaniesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int?> id = const Value.absent(),
                Value<String?> companyName = const Value.absent(),
                Value<String?> mailingName = const Value.absent(),
                Value<String?> localName = const Value.absent(),
                Value<String?> companyCode = const Value.absent(),
                Value<String?> address1 = const Value.absent(),
                Value<String?> address2 = const Value.absent(),
                Value<String?> address3 = const Value.absent(),
                Value<String?> pinCode = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> officeNo = const Value.absent(),
                Value<String?> mobile = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> regType = const Value.absent(),
                Value<String?> fssaiNo = const Value.absent(),
                Value<DateTime?> finYearStart = const Value.absent(),
                Value<String?> voucherRepeat = const Value.absent(),
                Value<DateTime?> lastSyncDate = const Value.absent(),
                Value<int?> createBy = const Value.absent(),
                Value<DateTime?> createdOn = const Value.absent(),
                Value<String?> createdFrom = const Value.absent(),
                Value<String?> bankName = const Value.absent(),
                Value<String?> bankBranch = const Value.absent(),
                Value<String?> accNo = const Value.absent(),
                Value<String?> ifscCode = const Value.absent(),
                Value<String?> gPayNumber = const Value.absent(),
                Value<String?> upiAddress = const Value.absent(),
                Value<String?> payeeName = const Value.absent(),
                Value<String?> currency = const Value.absent(),
                Value<int?> hasIntegrationSettings = const Value.absent(),
                Value<int?> hasVoucherTypeSettings = const Value.absent(),
                Value<int?> hasCompanySettings = const Value.absent(),
                Value<String?> userList = const Value.absent(),
                Value<String?> integrationType = const Value.absent(),
                Value<String?> serialNumber = const Value.absent(),
                Value<String?> stockInCloud = const Value.absent(),
                Value<String?> registrationNo = const Value.absent(),
                Value<String?> vchNumberingMode = const Value.absent(),
                Value<String?> companyLogoUrl = const Value.absent(),
                Value<bool?> companyProfileUpdated = const Value.absent(),
                Value<bool?> companyBankUpdated = const Value.absent(),
                Value<bool?> companyRegUpdated = const Value.absent(),
              }) => CompaniesCompanion(
                id: id,
                companyName: companyName,
                mailingName: mailingName,
                localName: localName,
                companyCode: companyCode,
                address1: address1,
                address2: address2,
                address3: address3,
                pinCode: pinCode,
                country: country,
                state: state,
                officeNo: officeNo,
                mobile: mobile,
                email: email,
                regType: regType,
                fssaiNo: fssaiNo,
                finYearStart: finYearStart,
                voucherRepeat: voucherRepeat,
                lastSyncDate: lastSyncDate,
                createBy: createBy,
                createdOn: createdOn,
                createdFrom: createdFrom,
                bankName: bankName,
                bankBranch: bankBranch,
                accNo: accNo,
                ifscCode: ifscCode,
                gPayNumber: gPayNumber,
                upiAddress: upiAddress,
                payeeName: payeeName,
                currency: currency,
                hasIntegrationSettings: hasIntegrationSettings,
                hasVoucherTypeSettings: hasVoucherTypeSettings,
                hasCompanySettings: hasCompanySettings,
                userList: userList,
                integrationType: integrationType,
                serialNumber: serialNumber,
                stockInCloud: stockInCloud,
                registrationNo: registrationNo,
                vchNumberingMode: vchNumberingMode,
                companyLogoUrl: companyLogoUrl,
                companyProfileUpdated: companyProfileUpdated,
                companyBankUpdated: companyBankUpdated,
                companyRegUpdated: companyRegUpdated,
              ),
          createCompanionCallback:
              ({
                Value<int?> id = const Value.absent(),
                Value<String?> companyName = const Value.absent(),
                Value<String?> mailingName = const Value.absent(),
                Value<String?> localName = const Value.absent(),
                Value<String?> companyCode = const Value.absent(),
                Value<String?> address1 = const Value.absent(),
                Value<String?> address2 = const Value.absent(),
                Value<String?> address3 = const Value.absent(),
                Value<String?> pinCode = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> officeNo = const Value.absent(),
                Value<String?> mobile = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> regType = const Value.absent(),
                Value<String?> fssaiNo = const Value.absent(),
                Value<DateTime?> finYearStart = const Value.absent(),
                Value<String?> voucherRepeat = const Value.absent(),
                Value<DateTime?> lastSyncDate = const Value.absent(),
                Value<int?> createBy = const Value.absent(),
                Value<DateTime?> createdOn = const Value.absent(),
                Value<String?> createdFrom = const Value.absent(),
                Value<String?> bankName = const Value.absent(),
                Value<String?> bankBranch = const Value.absent(),
                Value<String?> accNo = const Value.absent(),
                Value<String?> ifscCode = const Value.absent(),
                Value<String?> gPayNumber = const Value.absent(),
                Value<String?> upiAddress = const Value.absent(),
                Value<String?> payeeName = const Value.absent(),
                Value<String?> currency = const Value.absent(),
                Value<int?> hasIntegrationSettings = const Value.absent(),
                Value<int?> hasVoucherTypeSettings = const Value.absent(),
                Value<int?> hasCompanySettings = const Value.absent(),
                Value<String?> userList = const Value.absent(),
                Value<String?> integrationType = const Value.absent(),
                Value<String?> serialNumber = const Value.absent(),
                Value<String?> stockInCloud = const Value.absent(),
                Value<String?> registrationNo = const Value.absent(),
                Value<String?> vchNumberingMode = const Value.absent(),
                Value<String?> companyLogoUrl = const Value.absent(),
                Value<bool?> companyProfileUpdated = const Value.absent(),
                Value<bool?> companyBankUpdated = const Value.absent(),
                Value<bool?> companyRegUpdated = const Value.absent(),
              }) => CompaniesCompanion.insert(
                id: id,
                companyName: companyName,
                mailingName: mailingName,
                localName: localName,
                companyCode: companyCode,
                address1: address1,
                address2: address2,
                address3: address3,
                pinCode: pinCode,
                country: country,
                state: state,
                officeNo: officeNo,
                mobile: mobile,
                email: email,
                regType: regType,
                fssaiNo: fssaiNo,
                finYearStart: finYearStart,
                voucherRepeat: voucherRepeat,
                lastSyncDate: lastSyncDate,
                createBy: createBy,
                createdOn: createdOn,
                createdFrom: createdFrom,
                bankName: bankName,
                bankBranch: bankBranch,
                accNo: accNo,
                ifscCode: ifscCode,
                gPayNumber: gPayNumber,
                upiAddress: upiAddress,
                payeeName: payeeName,
                currency: currency,
                hasIntegrationSettings: hasIntegrationSettings,
                hasVoucherTypeSettings: hasVoucherTypeSettings,
                hasCompanySettings: hasCompanySettings,
                userList: userList,
                integrationType: integrationType,
                serialNumber: serialNumber,
                stockInCloud: stockInCloud,
                registrationNo: registrationNo,
                vchNumberingMode: vchNumberingMode,
                companyLogoUrl: companyLogoUrl,
                companyProfileUpdated: companyProfileUpdated,
                companyBankUpdated: companyBankUpdated,
                companyRegUpdated: companyRegUpdated,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CompaniesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $CompaniesTable,
      Company,
      $$CompaniesTableFilterComposer,
      $$CompaniesTableOrderingComposer,
      $$CompaniesTableAnnotationComposer,
      $$CompaniesTableCreateCompanionBuilder,
      $$CompaniesTableUpdateCompanionBuilder,
      (Company, BaseReferences<_$AppDb, $CompaniesTable, Company>),
      Company,
      PrefetchHooks Function()
    >;
typedef $$UserSettingsTableTableCreateCompanionBuilder =
    UserSettingsTableCompanion Function({
      Value<int?> id,
      Value<int?> userId,
      Value<String?> menuName,
      Value<String?> buttonType,
      Value<String?> description,
      Value<int?> orderNo,
      Value<int?> active,
      Value<String?> value,
    });
typedef $$UserSettingsTableTableUpdateCompanionBuilder =
    UserSettingsTableCompanion Function({
      Value<int?> id,
      Value<int?> userId,
      Value<String?> menuName,
      Value<String?> buttonType,
      Value<String?> description,
      Value<int?> orderNo,
      Value<int?> active,
      Value<String?> value,
    });

class $$UserSettingsTableTableFilterComposer
    extends Composer<_$AppDb, $UserSettingsTableTable> {
  $$UserSettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get menuName => $composableBuilder(
    column: $table.menuName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get buttonType => $composableBuilder(
    column: $table.buttonType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderNo => $composableBuilder(
    column: $table.orderNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserSettingsTableTableOrderingComposer
    extends Composer<_$AppDb, $UserSettingsTableTable> {
  $$UserSettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get menuName => $composableBuilder(
    column: $table.menuName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get buttonType => $composableBuilder(
    column: $table.buttonType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderNo => $composableBuilder(
    column: $table.orderNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserSettingsTableTableAnnotationComposer
    extends Composer<_$AppDb, $UserSettingsTableTable> {
  $$UserSettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get menuName =>
      $composableBuilder(column: $table.menuName, builder: (column) => column);

  GeneratedColumn<String> get buttonType => $composableBuilder(
    column: $table.buttonType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderNo =>
      $composableBuilder(column: $table.orderNo, builder: (column) => column);

  GeneratedColumn<int> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$UserSettingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $UserSettingsTableTable,
          UserSettingsTableData,
          $$UserSettingsTableTableFilterComposer,
          $$UserSettingsTableTableOrderingComposer,
          $$UserSettingsTableTableAnnotationComposer,
          $$UserSettingsTableTableCreateCompanionBuilder,
          $$UserSettingsTableTableUpdateCompanionBuilder,
          (
            UserSettingsTableData,
            BaseReferences<
              _$AppDb,
              $UserSettingsTableTable,
              UserSettingsTableData
            >,
          ),
          UserSettingsTableData,
          PrefetchHooks Function()
        > {
  $$UserSettingsTableTableTableManager(
    _$AppDb db,
    $UserSettingsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserSettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserSettingsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserSettingsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int?> id = const Value.absent(),
                Value<int?> userId = const Value.absent(),
                Value<String?> menuName = const Value.absent(),
                Value<String?> buttonType = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int?> orderNo = const Value.absent(),
                Value<int?> active = const Value.absent(),
                Value<String?> value = const Value.absent(),
              }) => UserSettingsTableCompanion(
                id: id,
                userId: userId,
                menuName: menuName,
                buttonType: buttonType,
                description: description,
                orderNo: orderNo,
                active: active,
                value: value,
              ),
          createCompanionCallback:
              ({
                Value<int?> id = const Value.absent(),
                Value<int?> userId = const Value.absent(),
                Value<String?> menuName = const Value.absent(),
                Value<String?> buttonType = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int?> orderNo = const Value.absent(),
                Value<int?> active = const Value.absent(),
                Value<String?> value = const Value.absent(),
              }) => UserSettingsTableCompanion.insert(
                id: id,
                userId: userId,
                menuName: menuName,
                buttonType: buttonType,
                description: description,
                orderNo: orderNo,
                active: active,
                value: value,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserSettingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $UserSettingsTableTable,
      UserSettingsTableData,
      $$UserSettingsTableTableFilterComposer,
      $$UserSettingsTableTableOrderingComposer,
      $$UserSettingsTableTableAnnotationComposer,
      $$UserSettingsTableTableCreateCompanionBuilder,
      $$UserSettingsTableTableUpdateCompanionBuilder,
      (
        UserSettingsTableData,
        BaseReferences<_$AppDb, $UserSettingsTableTable, UserSettingsTableData>,
      ),
      UserSettingsTableData,
      PrefetchHooks Function()
    >;
typedef $$VoucherTypesTableCreateCompanionBuilder =
    VoucherTypesCompanion Function({
      Value<int> id,
      required int companyId,
      required String voucherMenuName,
      required String description,
      required String hasB2BB2C,
      required String requireDeclaration,
      required int orderNo,
      required int hasB2B,
      required String b2BPrefix,
      required String b2BSuffix,
      required int b2BWidth,
      required int b2BStartFrom,
      required String b2CPrefix,
      required String b2CSuffix,
      required int b2CWidth,
      required int b2CStartFrom,
      required String b2BDeclaration,
      required String b2CDeclaration,
      required int isEnabled,
    });
typedef $$VoucherTypesTableUpdateCompanionBuilder =
    VoucherTypesCompanion Function({
      Value<int> id,
      Value<int> companyId,
      Value<String> voucherMenuName,
      Value<String> description,
      Value<String> hasB2BB2C,
      Value<String> requireDeclaration,
      Value<int> orderNo,
      Value<int> hasB2B,
      Value<String> b2BPrefix,
      Value<String> b2BSuffix,
      Value<int> b2BWidth,
      Value<int> b2BStartFrom,
      Value<String> b2CPrefix,
      Value<String> b2CSuffix,
      Value<int> b2CWidth,
      Value<int> b2CStartFrom,
      Value<String> b2BDeclaration,
      Value<String> b2CDeclaration,
      Value<int> isEnabled,
    });

class $$VoucherTypesTableFilterComposer
    extends Composer<_$AppDb, $VoucherTypesTable> {
  $$VoucherTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get voucherMenuName => $composableBuilder(
    column: $table.voucherMenuName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hasB2BB2C => $composableBuilder(
    column: $table.hasB2BB2C,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get requireDeclaration => $composableBuilder(
    column: $table.requireDeclaration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderNo => $composableBuilder(
    column: $table.orderNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hasB2B => $composableBuilder(
    column: $table.hasB2B,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get b2BPrefix => $composableBuilder(
    column: $table.b2BPrefix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get b2BSuffix => $composableBuilder(
    column: $table.b2BSuffix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get b2BWidth => $composableBuilder(
    column: $table.b2BWidth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get b2BStartFrom => $composableBuilder(
    column: $table.b2BStartFrom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get b2CPrefix => $composableBuilder(
    column: $table.b2CPrefix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get b2CSuffix => $composableBuilder(
    column: $table.b2CSuffix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get b2CWidth => $composableBuilder(
    column: $table.b2CWidth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get b2CStartFrom => $composableBuilder(
    column: $table.b2CStartFrom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get b2BDeclaration => $composableBuilder(
    column: $table.b2BDeclaration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get b2CDeclaration => $composableBuilder(
    column: $table.b2CDeclaration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VoucherTypesTableOrderingComposer
    extends Composer<_$AppDb, $VoucherTypesTable> {
  $$VoucherTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get voucherMenuName => $composableBuilder(
    column: $table.voucherMenuName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hasB2BB2C => $composableBuilder(
    column: $table.hasB2BB2C,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requireDeclaration => $composableBuilder(
    column: $table.requireDeclaration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderNo => $composableBuilder(
    column: $table.orderNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hasB2B => $composableBuilder(
    column: $table.hasB2B,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get b2BPrefix => $composableBuilder(
    column: $table.b2BPrefix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get b2BSuffix => $composableBuilder(
    column: $table.b2BSuffix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get b2BWidth => $composableBuilder(
    column: $table.b2BWidth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get b2BStartFrom => $composableBuilder(
    column: $table.b2BStartFrom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get b2CPrefix => $composableBuilder(
    column: $table.b2CPrefix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get b2CSuffix => $composableBuilder(
    column: $table.b2CSuffix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get b2CWidth => $composableBuilder(
    column: $table.b2CWidth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get b2CStartFrom => $composableBuilder(
    column: $table.b2CStartFrom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get b2BDeclaration => $composableBuilder(
    column: $table.b2BDeclaration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get b2CDeclaration => $composableBuilder(
    column: $table.b2CDeclaration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VoucherTypesTableAnnotationComposer
    extends Composer<_$AppDb, $VoucherTypesTable> {
  $$VoucherTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get companyId =>
      $composableBuilder(column: $table.companyId, builder: (column) => column);

  GeneratedColumn<String> get voucherMenuName => $composableBuilder(
    column: $table.voucherMenuName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hasB2BB2C =>
      $composableBuilder(column: $table.hasB2BB2C, builder: (column) => column);

  GeneratedColumn<String> get requireDeclaration => $composableBuilder(
    column: $table.requireDeclaration,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderNo =>
      $composableBuilder(column: $table.orderNo, builder: (column) => column);

  GeneratedColumn<int> get hasB2B =>
      $composableBuilder(column: $table.hasB2B, builder: (column) => column);

  GeneratedColumn<String> get b2BPrefix =>
      $composableBuilder(column: $table.b2BPrefix, builder: (column) => column);

  GeneratedColumn<String> get b2BSuffix =>
      $composableBuilder(column: $table.b2BSuffix, builder: (column) => column);

  GeneratedColumn<int> get b2BWidth =>
      $composableBuilder(column: $table.b2BWidth, builder: (column) => column);

  GeneratedColumn<int> get b2BStartFrom => $composableBuilder(
    column: $table.b2BStartFrom,
    builder: (column) => column,
  );

  GeneratedColumn<String> get b2CPrefix =>
      $composableBuilder(column: $table.b2CPrefix, builder: (column) => column);

  GeneratedColumn<String> get b2CSuffix =>
      $composableBuilder(column: $table.b2CSuffix, builder: (column) => column);

  GeneratedColumn<int> get b2CWidth =>
      $composableBuilder(column: $table.b2CWidth, builder: (column) => column);

  GeneratedColumn<int> get b2CStartFrom => $composableBuilder(
    column: $table.b2CStartFrom,
    builder: (column) => column,
  );

  GeneratedColumn<String> get b2BDeclaration => $composableBuilder(
    column: $table.b2BDeclaration,
    builder: (column) => column,
  );

  GeneratedColumn<String> get b2CDeclaration => $composableBuilder(
    column: $table.b2CDeclaration,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);
}

class $$VoucherTypesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $VoucherTypesTable,
          VoucherType,
          $$VoucherTypesTableFilterComposer,
          $$VoucherTypesTableOrderingComposer,
          $$VoucherTypesTableAnnotationComposer,
          $$VoucherTypesTableCreateCompanionBuilder,
          $$VoucherTypesTableUpdateCompanionBuilder,
          (
            VoucherType,
            BaseReferences<_$AppDb, $VoucherTypesTable, VoucherType>,
          ),
          VoucherType,
          PrefetchHooks Function()
        > {
  $$VoucherTypesTableTableManager(_$AppDb db, $VoucherTypesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VoucherTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VoucherTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VoucherTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> companyId = const Value.absent(),
                Value<String> voucherMenuName = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> hasB2BB2C = const Value.absent(),
                Value<String> requireDeclaration = const Value.absent(),
                Value<int> orderNo = const Value.absent(),
                Value<int> hasB2B = const Value.absent(),
                Value<String> b2BPrefix = const Value.absent(),
                Value<String> b2BSuffix = const Value.absent(),
                Value<int> b2BWidth = const Value.absent(),
                Value<int> b2BStartFrom = const Value.absent(),
                Value<String> b2CPrefix = const Value.absent(),
                Value<String> b2CSuffix = const Value.absent(),
                Value<int> b2CWidth = const Value.absent(),
                Value<int> b2CStartFrom = const Value.absent(),
                Value<String> b2BDeclaration = const Value.absent(),
                Value<String> b2CDeclaration = const Value.absent(),
                Value<int> isEnabled = const Value.absent(),
              }) => VoucherTypesCompanion(
                id: id,
                companyId: companyId,
                voucherMenuName: voucherMenuName,
                description: description,
                hasB2BB2C: hasB2BB2C,
                requireDeclaration: requireDeclaration,
                orderNo: orderNo,
                hasB2B: hasB2B,
                b2BPrefix: b2BPrefix,
                b2BSuffix: b2BSuffix,
                b2BWidth: b2BWidth,
                b2BStartFrom: b2BStartFrom,
                b2CPrefix: b2CPrefix,
                b2CSuffix: b2CSuffix,
                b2CWidth: b2CWidth,
                b2CStartFrom: b2CStartFrom,
                b2BDeclaration: b2BDeclaration,
                b2CDeclaration: b2CDeclaration,
                isEnabled: isEnabled,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int companyId,
                required String voucherMenuName,
                required String description,
                required String hasB2BB2C,
                required String requireDeclaration,
                required int orderNo,
                required int hasB2B,
                required String b2BPrefix,
                required String b2BSuffix,
                required int b2BWidth,
                required int b2BStartFrom,
                required String b2CPrefix,
                required String b2CSuffix,
                required int b2CWidth,
                required int b2CStartFrom,
                required String b2BDeclaration,
                required String b2CDeclaration,
                required int isEnabled,
              }) => VoucherTypesCompanion.insert(
                id: id,
                companyId: companyId,
                voucherMenuName: voucherMenuName,
                description: description,
                hasB2BB2C: hasB2BB2C,
                requireDeclaration: requireDeclaration,
                orderNo: orderNo,
                hasB2B: hasB2B,
                b2BPrefix: b2BPrefix,
                b2BSuffix: b2BSuffix,
                b2BWidth: b2BWidth,
                b2BStartFrom: b2BStartFrom,
                b2CPrefix: b2CPrefix,
                b2CSuffix: b2CSuffix,
                b2CWidth: b2CWidth,
                b2CStartFrom: b2CStartFrom,
                b2BDeclaration: b2BDeclaration,
                b2CDeclaration: b2CDeclaration,
                isEnabled: isEnabled,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VoucherTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $VoucherTypesTable,
      VoucherType,
      $$VoucherTypesTableFilterComposer,
      $$VoucherTypesTableOrderingComposer,
      $$VoucherTypesTableAnnotationComposer,
      $$VoucherTypesTableCreateCompanionBuilder,
      $$VoucherTypesTableUpdateCompanionBuilder,
      (VoucherType, BaseReferences<_$AppDb, $VoucherTypesTable, VoucherType>),
      VoucherType,
      PrefetchHooks Function()
    >;
typedef $$GodownVoucherTypesTableCreateCompanionBuilder =
    GodownVoucherTypesCompanion Function({
      Value<int> id,
      Value<int?> companyId,
      Value<int?> voucherTypeId,
      Value<String?> voucherMenuName,
      Value<String?> voucherMode,
      Value<int?> voucherModeId,
      Value<String?> voucherModeName,
      Value<DateTime?> applicableFrom,
      Value<int?> hasB2B,
      Value<String?> b2BPrefix,
      Value<String?> b2BSuffix,
      Value<int?> b2BWidth,
      Value<int?> b2BStartFrom,
      Value<String?> b2CPrefix,
      Value<String?> b2CSuffix,
      Value<int?> b2CWidth,
      Value<int?> b2CStartFrom,
      Value<String?> b2BDeclaration,
      Value<String?> b2CDeclaration,
    });
typedef $$GodownVoucherTypesTableUpdateCompanionBuilder =
    GodownVoucherTypesCompanion Function({
      Value<int> id,
      Value<int?> companyId,
      Value<int?> voucherTypeId,
      Value<String?> voucherMenuName,
      Value<String?> voucherMode,
      Value<int?> voucherModeId,
      Value<String?> voucherModeName,
      Value<DateTime?> applicableFrom,
      Value<int?> hasB2B,
      Value<String?> b2BPrefix,
      Value<String?> b2BSuffix,
      Value<int?> b2BWidth,
      Value<int?> b2BStartFrom,
      Value<String?> b2CPrefix,
      Value<String?> b2CSuffix,
      Value<int?> b2CWidth,
      Value<int?> b2CStartFrom,
      Value<String?> b2BDeclaration,
      Value<String?> b2CDeclaration,
    });

class $$GodownVoucherTypesTableFilterComposer
    extends Composer<_$AppDb, $GodownVoucherTypesTable> {
  $$GodownVoucherTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get voucherTypeId => $composableBuilder(
    column: $table.voucherTypeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get voucherMenuName => $composableBuilder(
    column: $table.voucherMenuName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get voucherMode => $composableBuilder(
    column: $table.voucherMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get voucherModeId => $composableBuilder(
    column: $table.voucherModeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get voucherModeName => $composableBuilder(
    column: $table.voucherModeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get applicableFrom => $composableBuilder(
    column: $table.applicableFrom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hasB2B => $composableBuilder(
    column: $table.hasB2B,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get b2BPrefix => $composableBuilder(
    column: $table.b2BPrefix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get b2BSuffix => $composableBuilder(
    column: $table.b2BSuffix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get b2BWidth => $composableBuilder(
    column: $table.b2BWidth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get b2BStartFrom => $composableBuilder(
    column: $table.b2BStartFrom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get b2CPrefix => $composableBuilder(
    column: $table.b2CPrefix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get b2CSuffix => $composableBuilder(
    column: $table.b2CSuffix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get b2CWidth => $composableBuilder(
    column: $table.b2CWidth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get b2CStartFrom => $composableBuilder(
    column: $table.b2CStartFrom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get b2BDeclaration => $composableBuilder(
    column: $table.b2BDeclaration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get b2CDeclaration => $composableBuilder(
    column: $table.b2CDeclaration,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GodownVoucherTypesTableOrderingComposer
    extends Composer<_$AppDb, $GodownVoucherTypesTable> {
  $$GodownVoucherTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get voucherTypeId => $composableBuilder(
    column: $table.voucherTypeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get voucherMenuName => $composableBuilder(
    column: $table.voucherMenuName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get voucherMode => $composableBuilder(
    column: $table.voucherMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get voucherModeId => $composableBuilder(
    column: $table.voucherModeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get voucherModeName => $composableBuilder(
    column: $table.voucherModeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get applicableFrom => $composableBuilder(
    column: $table.applicableFrom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hasB2B => $composableBuilder(
    column: $table.hasB2B,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get b2BPrefix => $composableBuilder(
    column: $table.b2BPrefix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get b2BSuffix => $composableBuilder(
    column: $table.b2BSuffix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get b2BWidth => $composableBuilder(
    column: $table.b2BWidth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get b2BStartFrom => $composableBuilder(
    column: $table.b2BStartFrom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get b2CPrefix => $composableBuilder(
    column: $table.b2CPrefix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get b2CSuffix => $composableBuilder(
    column: $table.b2CSuffix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get b2CWidth => $composableBuilder(
    column: $table.b2CWidth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get b2CStartFrom => $composableBuilder(
    column: $table.b2CStartFrom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get b2BDeclaration => $composableBuilder(
    column: $table.b2BDeclaration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get b2CDeclaration => $composableBuilder(
    column: $table.b2CDeclaration,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GodownVoucherTypesTableAnnotationComposer
    extends Composer<_$AppDb, $GodownVoucherTypesTable> {
  $$GodownVoucherTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get companyId =>
      $composableBuilder(column: $table.companyId, builder: (column) => column);

  GeneratedColumn<int> get voucherTypeId => $composableBuilder(
    column: $table.voucherTypeId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get voucherMenuName => $composableBuilder(
    column: $table.voucherMenuName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get voucherMode => $composableBuilder(
    column: $table.voucherMode,
    builder: (column) => column,
  );

  GeneratedColumn<int> get voucherModeId => $composableBuilder(
    column: $table.voucherModeId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get voucherModeName => $composableBuilder(
    column: $table.voucherModeName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get applicableFrom => $composableBuilder(
    column: $table.applicableFrom,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hasB2B =>
      $composableBuilder(column: $table.hasB2B, builder: (column) => column);

  GeneratedColumn<String> get b2BPrefix =>
      $composableBuilder(column: $table.b2BPrefix, builder: (column) => column);

  GeneratedColumn<String> get b2BSuffix =>
      $composableBuilder(column: $table.b2BSuffix, builder: (column) => column);

  GeneratedColumn<int> get b2BWidth =>
      $composableBuilder(column: $table.b2BWidth, builder: (column) => column);

  GeneratedColumn<int> get b2BStartFrom => $composableBuilder(
    column: $table.b2BStartFrom,
    builder: (column) => column,
  );

  GeneratedColumn<String> get b2CPrefix =>
      $composableBuilder(column: $table.b2CPrefix, builder: (column) => column);

  GeneratedColumn<String> get b2CSuffix =>
      $composableBuilder(column: $table.b2CSuffix, builder: (column) => column);

  GeneratedColumn<int> get b2CWidth =>
      $composableBuilder(column: $table.b2CWidth, builder: (column) => column);

  GeneratedColumn<int> get b2CStartFrom => $composableBuilder(
    column: $table.b2CStartFrom,
    builder: (column) => column,
  );

  GeneratedColumn<String> get b2BDeclaration => $composableBuilder(
    column: $table.b2BDeclaration,
    builder: (column) => column,
  );

  GeneratedColumn<String> get b2CDeclaration => $composableBuilder(
    column: $table.b2CDeclaration,
    builder: (column) => column,
  );
}

class $$GodownVoucherTypesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $GodownVoucherTypesTable,
          GodownVoucherType,
          $$GodownVoucherTypesTableFilterComposer,
          $$GodownVoucherTypesTableOrderingComposer,
          $$GodownVoucherTypesTableAnnotationComposer,
          $$GodownVoucherTypesTableCreateCompanionBuilder,
          $$GodownVoucherTypesTableUpdateCompanionBuilder,
          (
            GodownVoucherType,
            BaseReferences<
              _$AppDb,
              $GodownVoucherTypesTable,
              GodownVoucherType
            >,
          ),
          GodownVoucherType,
          PrefetchHooks Function()
        > {
  $$GodownVoucherTypesTableTableManager(
    _$AppDb db,
    $GodownVoucherTypesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GodownVoucherTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GodownVoucherTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GodownVoucherTypesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> companyId = const Value.absent(),
                Value<int?> voucherTypeId = const Value.absent(),
                Value<String?> voucherMenuName = const Value.absent(),
                Value<String?> voucherMode = const Value.absent(),
                Value<int?> voucherModeId = const Value.absent(),
                Value<String?> voucherModeName = const Value.absent(),
                Value<DateTime?> applicableFrom = const Value.absent(),
                Value<int?> hasB2B = const Value.absent(),
                Value<String?> b2BPrefix = const Value.absent(),
                Value<String?> b2BSuffix = const Value.absent(),
                Value<int?> b2BWidth = const Value.absent(),
                Value<int?> b2BStartFrom = const Value.absent(),
                Value<String?> b2CPrefix = const Value.absent(),
                Value<String?> b2CSuffix = const Value.absent(),
                Value<int?> b2CWidth = const Value.absent(),
                Value<int?> b2CStartFrom = const Value.absent(),
                Value<String?> b2BDeclaration = const Value.absent(),
                Value<String?> b2CDeclaration = const Value.absent(),
              }) => GodownVoucherTypesCompanion(
                id: id,
                companyId: companyId,
                voucherTypeId: voucherTypeId,
                voucherMenuName: voucherMenuName,
                voucherMode: voucherMode,
                voucherModeId: voucherModeId,
                voucherModeName: voucherModeName,
                applicableFrom: applicableFrom,
                hasB2B: hasB2B,
                b2BPrefix: b2BPrefix,
                b2BSuffix: b2BSuffix,
                b2BWidth: b2BWidth,
                b2BStartFrom: b2BStartFrom,
                b2CPrefix: b2CPrefix,
                b2CSuffix: b2CSuffix,
                b2CWidth: b2CWidth,
                b2CStartFrom: b2CStartFrom,
                b2BDeclaration: b2BDeclaration,
                b2CDeclaration: b2CDeclaration,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> companyId = const Value.absent(),
                Value<int?> voucherTypeId = const Value.absent(),
                Value<String?> voucherMenuName = const Value.absent(),
                Value<String?> voucherMode = const Value.absent(),
                Value<int?> voucherModeId = const Value.absent(),
                Value<String?> voucherModeName = const Value.absent(),
                Value<DateTime?> applicableFrom = const Value.absent(),
                Value<int?> hasB2B = const Value.absent(),
                Value<String?> b2BPrefix = const Value.absent(),
                Value<String?> b2BSuffix = const Value.absent(),
                Value<int?> b2BWidth = const Value.absent(),
                Value<int?> b2BStartFrom = const Value.absent(),
                Value<String?> b2CPrefix = const Value.absent(),
                Value<String?> b2CSuffix = const Value.absent(),
                Value<int?> b2CWidth = const Value.absent(),
                Value<int?> b2CStartFrom = const Value.absent(),
                Value<String?> b2BDeclaration = const Value.absent(),
                Value<String?> b2CDeclaration = const Value.absent(),
              }) => GodownVoucherTypesCompanion.insert(
                id: id,
                companyId: companyId,
                voucherTypeId: voucherTypeId,
                voucherMenuName: voucherMenuName,
                voucherMode: voucherMode,
                voucherModeId: voucherModeId,
                voucherModeName: voucherModeName,
                applicableFrom: applicableFrom,
                hasB2B: hasB2B,
                b2BPrefix: b2BPrefix,
                b2BSuffix: b2BSuffix,
                b2BWidth: b2BWidth,
                b2BStartFrom: b2BStartFrom,
                b2CPrefix: b2CPrefix,
                b2CSuffix: b2CSuffix,
                b2CWidth: b2CWidth,
                b2CStartFrom: b2CStartFrom,
                b2BDeclaration: b2BDeclaration,
                b2CDeclaration: b2CDeclaration,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GodownVoucherTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $GodownVoucherTypesTable,
      GodownVoucherType,
      $$GodownVoucherTypesTableFilterComposer,
      $$GodownVoucherTypesTableOrderingComposer,
      $$GodownVoucherTypesTableAnnotationComposer,
      $$GodownVoucherTypesTableCreateCompanionBuilder,
      $$GodownVoucherTypesTableUpdateCompanionBuilder,
      (
        GodownVoucherType,
        BaseReferences<_$AppDb, $GodownVoucherTypesTable, GodownVoucherType>,
      ),
      GodownVoucherType,
      PrefetchHooks Function()
    >;
typedef $$RouteVoucherTypesTableCreateCompanionBuilder =
    RouteVoucherTypesCompanion Function({
      Value<int> id,
      Value<int?> companyId,
      Value<int?> voucherTypeId,
      Value<String?> voucherMenuName,
      Value<String?> voucherMode,
      Value<int?> voucherModeId,
      Value<String?> voucherModeName,
      Value<DateTime?> applicableFrom,
      Value<int?> hasB2B,
      Value<String?> b2BPrefix,
      Value<String?> b2BSuffix,
      Value<int?> b2BWidth,
      Value<int?> b2BStartFrom,
      Value<String?> b2CPrefix,
      Value<String?> b2CSuffix,
      Value<int?> b2CWidth,
      Value<int?> b2CStartFrom,
      Value<String?> b2BDeclaration,
      Value<String?> b2CDeclaration,
    });
typedef $$RouteVoucherTypesTableUpdateCompanionBuilder =
    RouteVoucherTypesCompanion Function({
      Value<int> id,
      Value<int?> companyId,
      Value<int?> voucherTypeId,
      Value<String?> voucherMenuName,
      Value<String?> voucherMode,
      Value<int?> voucherModeId,
      Value<String?> voucherModeName,
      Value<DateTime?> applicableFrom,
      Value<int?> hasB2B,
      Value<String?> b2BPrefix,
      Value<String?> b2BSuffix,
      Value<int?> b2BWidth,
      Value<int?> b2BStartFrom,
      Value<String?> b2CPrefix,
      Value<String?> b2CSuffix,
      Value<int?> b2CWidth,
      Value<int?> b2CStartFrom,
      Value<String?> b2BDeclaration,
      Value<String?> b2CDeclaration,
    });

class $$RouteVoucherTypesTableFilterComposer
    extends Composer<_$AppDb, $RouteVoucherTypesTable> {
  $$RouteVoucherTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get voucherTypeId => $composableBuilder(
    column: $table.voucherTypeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get voucherMenuName => $composableBuilder(
    column: $table.voucherMenuName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get voucherMode => $composableBuilder(
    column: $table.voucherMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get voucherModeId => $composableBuilder(
    column: $table.voucherModeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get voucherModeName => $composableBuilder(
    column: $table.voucherModeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get applicableFrom => $composableBuilder(
    column: $table.applicableFrom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hasB2B => $composableBuilder(
    column: $table.hasB2B,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get b2BPrefix => $composableBuilder(
    column: $table.b2BPrefix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get b2BSuffix => $composableBuilder(
    column: $table.b2BSuffix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get b2BWidth => $composableBuilder(
    column: $table.b2BWidth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get b2BStartFrom => $composableBuilder(
    column: $table.b2BStartFrom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get b2CPrefix => $composableBuilder(
    column: $table.b2CPrefix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get b2CSuffix => $composableBuilder(
    column: $table.b2CSuffix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get b2CWidth => $composableBuilder(
    column: $table.b2CWidth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get b2CStartFrom => $composableBuilder(
    column: $table.b2CStartFrom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get b2BDeclaration => $composableBuilder(
    column: $table.b2BDeclaration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get b2CDeclaration => $composableBuilder(
    column: $table.b2CDeclaration,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RouteVoucherTypesTableOrderingComposer
    extends Composer<_$AppDb, $RouteVoucherTypesTable> {
  $$RouteVoucherTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get voucherTypeId => $composableBuilder(
    column: $table.voucherTypeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get voucherMenuName => $composableBuilder(
    column: $table.voucherMenuName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get voucherMode => $composableBuilder(
    column: $table.voucherMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get voucherModeId => $composableBuilder(
    column: $table.voucherModeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get voucherModeName => $composableBuilder(
    column: $table.voucherModeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get applicableFrom => $composableBuilder(
    column: $table.applicableFrom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hasB2B => $composableBuilder(
    column: $table.hasB2B,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get b2BPrefix => $composableBuilder(
    column: $table.b2BPrefix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get b2BSuffix => $composableBuilder(
    column: $table.b2BSuffix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get b2BWidth => $composableBuilder(
    column: $table.b2BWidth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get b2BStartFrom => $composableBuilder(
    column: $table.b2BStartFrom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get b2CPrefix => $composableBuilder(
    column: $table.b2CPrefix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get b2CSuffix => $composableBuilder(
    column: $table.b2CSuffix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get b2CWidth => $composableBuilder(
    column: $table.b2CWidth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get b2CStartFrom => $composableBuilder(
    column: $table.b2CStartFrom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get b2BDeclaration => $composableBuilder(
    column: $table.b2BDeclaration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get b2CDeclaration => $composableBuilder(
    column: $table.b2CDeclaration,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RouteVoucherTypesTableAnnotationComposer
    extends Composer<_$AppDb, $RouteVoucherTypesTable> {
  $$RouteVoucherTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get companyId =>
      $composableBuilder(column: $table.companyId, builder: (column) => column);

  GeneratedColumn<int> get voucherTypeId => $composableBuilder(
    column: $table.voucherTypeId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get voucherMenuName => $composableBuilder(
    column: $table.voucherMenuName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get voucherMode => $composableBuilder(
    column: $table.voucherMode,
    builder: (column) => column,
  );

  GeneratedColumn<int> get voucherModeId => $composableBuilder(
    column: $table.voucherModeId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get voucherModeName => $composableBuilder(
    column: $table.voucherModeName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get applicableFrom => $composableBuilder(
    column: $table.applicableFrom,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hasB2B =>
      $composableBuilder(column: $table.hasB2B, builder: (column) => column);

  GeneratedColumn<String> get b2BPrefix =>
      $composableBuilder(column: $table.b2BPrefix, builder: (column) => column);

  GeneratedColumn<String> get b2BSuffix =>
      $composableBuilder(column: $table.b2BSuffix, builder: (column) => column);

  GeneratedColumn<int> get b2BWidth =>
      $composableBuilder(column: $table.b2BWidth, builder: (column) => column);

  GeneratedColumn<int> get b2BStartFrom => $composableBuilder(
    column: $table.b2BStartFrom,
    builder: (column) => column,
  );

  GeneratedColumn<String> get b2CPrefix =>
      $composableBuilder(column: $table.b2CPrefix, builder: (column) => column);

  GeneratedColumn<String> get b2CSuffix =>
      $composableBuilder(column: $table.b2CSuffix, builder: (column) => column);

  GeneratedColumn<int> get b2CWidth =>
      $composableBuilder(column: $table.b2CWidth, builder: (column) => column);

  GeneratedColumn<int> get b2CStartFrom => $composableBuilder(
    column: $table.b2CStartFrom,
    builder: (column) => column,
  );

  GeneratedColumn<String> get b2BDeclaration => $composableBuilder(
    column: $table.b2BDeclaration,
    builder: (column) => column,
  );

  GeneratedColumn<String> get b2CDeclaration => $composableBuilder(
    column: $table.b2CDeclaration,
    builder: (column) => column,
  );
}

class $$RouteVoucherTypesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $RouteVoucherTypesTable,
          RouteVoucherType,
          $$RouteVoucherTypesTableFilterComposer,
          $$RouteVoucherTypesTableOrderingComposer,
          $$RouteVoucherTypesTableAnnotationComposer,
          $$RouteVoucherTypesTableCreateCompanionBuilder,
          $$RouteVoucherTypesTableUpdateCompanionBuilder,
          (
            RouteVoucherType,
            BaseReferences<_$AppDb, $RouteVoucherTypesTable, RouteVoucherType>,
          ),
          RouteVoucherType,
          PrefetchHooks Function()
        > {
  $$RouteVoucherTypesTableTableManager(
    _$AppDb db,
    $RouteVoucherTypesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RouteVoucherTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RouteVoucherTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RouteVoucherTypesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> companyId = const Value.absent(),
                Value<int?> voucherTypeId = const Value.absent(),
                Value<String?> voucherMenuName = const Value.absent(),
                Value<String?> voucherMode = const Value.absent(),
                Value<int?> voucherModeId = const Value.absent(),
                Value<String?> voucherModeName = const Value.absent(),
                Value<DateTime?> applicableFrom = const Value.absent(),
                Value<int?> hasB2B = const Value.absent(),
                Value<String?> b2BPrefix = const Value.absent(),
                Value<String?> b2BSuffix = const Value.absent(),
                Value<int?> b2BWidth = const Value.absent(),
                Value<int?> b2BStartFrom = const Value.absent(),
                Value<String?> b2CPrefix = const Value.absent(),
                Value<String?> b2CSuffix = const Value.absent(),
                Value<int?> b2CWidth = const Value.absent(),
                Value<int?> b2CStartFrom = const Value.absent(),
                Value<String?> b2BDeclaration = const Value.absent(),
                Value<String?> b2CDeclaration = const Value.absent(),
              }) => RouteVoucherTypesCompanion(
                id: id,
                companyId: companyId,
                voucherTypeId: voucherTypeId,
                voucherMenuName: voucherMenuName,
                voucherMode: voucherMode,
                voucherModeId: voucherModeId,
                voucherModeName: voucherModeName,
                applicableFrom: applicableFrom,
                hasB2B: hasB2B,
                b2BPrefix: b2BPrefix,
                b2BSuffix: b2BSuffix,
                b2BWidth: b2BWidth,
                b2BStartFrom: b2BStartFrom,
                b2CPrefix: b2CPrefix,
                b2CSuffix: b2CSuffix,
                b2CWidth: b2CWidth,
                b2CStartFrom: b2CStartFrom,
                b2BDeclaration: b2BDeclaration,
                b2CDeclaration: b2CDeclaration,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> companyId = const Value.absent(),
                Value<int?> voucherTypeId = const Value.absent(),
                Value<String?> voucherMenuName = const Value.absent(),
                Value<String?> voucherMode = const Value.absent(),
                Value<int?> voucherModeId = const Value.absent(),
                Value<String?> voucherModeName = const Value.absent(),
                Value<DateTime?> applicableFrom = const Value.absent(),
                Value<int?> hasB2B = const Value.absent(),
                Value<String?> b2BPrefix = const Value.absent(),
                Value<String?> b2BSuffix = const Value.absent(),
                Value<int?> b2BWidth = const Value.absent(),
                Value<int?> b2BStartFrom = const Value.absent(),
                Value<String?> b2CPrefix = const Value.absent(),
                Value<String?> b2CSuffix = const Value.absent(),
                Value<int?> b2CWidth = const Value.absent(),
                Value<int?> b2CStartFrom = const Value.absent(),
                Value<String?> b2BDeclaration = const Value.absent(),
                Value<String?> b2CDeclaration = const Value.absent(),
              }) => RouteVoucherTypesCompanion.insert(
                id: id,
                companyId: companyId,
                voucherTypeId: voucherTypeId,
                voucherMenuName: voucherMenuName,
                voucherMode: voucherMode,
                voucherModeId: voucherModeId,
                voucherModeName: voucherModeName,
                applicableFrom: applicableFrom,
                hasB2B: hasB2B,
                b2BPrefix: b2BPrefix,
                b2BSuffix: b2BSuffix,
                b2BWidth: b2BWidth,
                b2BStartFrom: b2BStartFrom,
                b2CPrefix: b2CPrefix,
                b2CSuffix: b2CSuffix,
                b2CWidth: b2CWidth,
                b2CStartFrom: b2CStartFrom,
                b2BDeclaration: b2BDeclaration,
                b2CDeclaration: b2CDeclaration,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RouteVoucherTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $RouteVoucherTypesTable,
      RouteVoucherType,
      $$RouteVoucherTypesTableFilterComposer,
      $$RouteVoucherTypesTableOrderingComposer,
      $$RouteVoucherTypesTableAnnotationComposer,
      $$RouteVoucherTypesTableCreateCompanionBuilder,
      $$RouteVoucherTypesTableUpdateCompanionBuilder,
      (
        RouteVoucherType,
        BaseReferences<_$AppDb, $RouteVoucherTypesTable, RouteVoucherType>,
      ),
      RouteVoucherType,
      PrefetchHooks Function()
    >;
typedef $$CompanySettingsTableTableCreateCompanionBuilder =
    CompanySettingsTableCompanion Function({
      required int id,
      required int companyId,
      required String settingsMenuName,
      required String buttonType,
      required String description,
      required int parentId,
      required int orderNo,
      required String menuType,
      required String settingsValue,
      Value<int> rowid,
    });
typedef $$CompanySettingsTableTableUpdateCompanionBuilder =
    CompanySettingsTableCompanion Function({
      Value<int> id,
      Value<int> companyId,
      Value<String> settingsMenuName,
      Value<String> buttonType,
      Value<String> description,
      Value<int> parentId,
      Value<int> orderNo,
      Value<String> menuType,
      Value<String> settingsValue,
      Value<int> rowid,
    });

class $$CompanySettingsTableTableFilterComposer
    extends Composer<_$AppDb, $CompanySettingsTableTable> {
  $$CompanySettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get settingsMenuName => $composableBuilder(
    column: $table.settingsMenuName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get buttonType => $composableBuilder(
    column: $table.buttonType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderNo => $composableBuilder(
    column: $table.orderNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get menuType => $composableBuilder(
    column: $table.menuType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get settingsValue => $composableBuilder(
    column: $table.settingsValue,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CompanySettingsTableTableOrderingComposer
    extends Composer<_$AppDb, $CompanySettingsTableTable> {
  $$CompanySettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get settingsMenuName => $composableBuilder(
    column: $table.settingsMenuName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get buttonType => $composableBuilder(
    column: $table.buttonType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderNo => $composableBuilder(
    column: $table.orderNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get menuType => $composableBuilder(
    column: $table.menuType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get settingsValue => $composableBuilder(
    column: $table.settingsValue,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CompanySettingsTableTableAnnotationComposer
    extends Composer<_$AppDb, $CompanySettingsTableTable> {
  $$CompanySettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get companyId =>
      $composableBuilder(column: $table.companyId, builder: (column) => column);

  GeneratedColumn<String> get settingsMenuName => $composableBuilder(
    column: $table.settingsMenuName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get buttonType => $composableBuilder(
    column: $table.buttonType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<int> get orderNo =>
      $composableBuilder(column: $table.orderNo, builder: (column) => column);

  GeneratedColumn<String> get menuType =>
      $composableBuilder(column: $table.menuType, builder: (column) => column);

  GeneratedColumn<String> get settingsValue => $composableBuilder(
    column: $table.settingsValue,
    builder: (column) => column,
  );
}

class $$CompanySettingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $CompanySettingsTableTable,
          CompanySettingsTableData,
          $$CompanySettingsTableTableFilterComposer,
          $$CompanySettingsTableTableOrderingComposer,
          $$CompanySettingsTableTableAnnotationComposer,
          $$CompanySettingsTableTableCreateCompanionBuilder,
          $$CompanySettingsTableTableUpdateCompanionBuilder,
          (
            CompanySettingsTableData,
            BaseReferences<
              _$AppDb,
              $CompanySettingsTableTable,
              CompanySettingsTableData
            >,
          ),
          CompanySettingsTableData,
          PrefetchHooks Function()
        > {
  $$CompanySettingsTableTableTableManager(
    _$AppDb db,
    $CompanySettingsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CompanySettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CompanySettingsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CompanySettingsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> companyId = const Value.absent(),
                Value<String> settingsMenuName = const Value.absent(),
                Value<String> buttonType = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> parentId = const Value.absent(),
                Value<int> orderNo = const Value.absent(),
                Value<String> menuType = const Value.absent(),
                Value<String> settingsValue = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CompanySettingsTableCompanion(
                id: id,
                companyId: companyId,
                settingsMenuName: settingsMenuName,
                buttonType: buttonType,
                description: description,
                parentId: parentId,
                orderNo: orderNo,
                menuType: menuType,
                settingsValue: settingsValue,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required int companyId,
                required String settingsMenuName,
                required String buttonType,
                required String description,
                required int parentId,
                required int orderNo,
                required String menuType,
                required String settingsValue,
                Value<int> rowid = const Value.absent(),
              }) => CompanySettingsTableCompanion.insert(
                id: id,
                companyId: companyId,
                settingsMenuName: settingsMenuName,
                buttonType: buttonType,
                description: description,
                parentId: parentId,
                orderNo: orderNo,
                menuType: menuType,
                settingsValue: settingsValue,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CompanySettingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $CompanySettingsTableTable,
      CompanySettingsTableData,
      $$CompanySettingsTableTableFilterComposer,
      $$CompanySettingsTableTableOrderingComposer,
      $$CompanySettingsTableTableAnnotationComposer,
      $$CompanySettingsTableTableCreateCompanionBuilder,
      $$CompanySettingsTableTableUpdateCompanionBuilder,
      (
        CompanySettingsTableData,
        BaseReferences<
          _$AppDb,
          $CompanySettingsTableTable,
          CompanySettingsTableData
        >,
      ),
      CompanySettingsTableData,
      PrefetchHooks Function()
    >;
typedef $$GodownVehiclesTableCreateCompanionBuilder =
    GodownVehiclesCompanion Function({
      Value<int> id,
      Value<int?> companyId,
      Value<String?> code,
      Value<String?> name,
      Value<int?> active,
    });
typedef $$GodownVehiclesTableUpdateCompanionBuilder =
    GodownVehiclesCompanion Function({
      Value<int> id,
      Value<int?> companyId,
      Value<String?> code,
      Value<String?> name,
      Value<int?> active,
    });

class $$GodownVehiclesTableFilterComposer
    extends Composer<_$AppDb, $GodownVehiclesTable> {
  $$GodownVehiclesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GodownVehiclesTableOrderingComposer
    extends Composer<_$AppDb, $GodownVehiclesTable> {
  $$GodownVehiclesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GodownVehiclesTableAnnotationComposer
    extends Composer<_$AppDb, $GodownVehiclesTable> {
  $$GodownVehiclesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get companyId =>
      $composableBuilder(column: $table.companyId, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);
}

class $$GodownVehiclesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $GodownVehiclesTable,
          GodownVehicle,
          $$GodownVehiclesTableFilterComposer,
          $$GodownVehiclesTableOrderingComposer,
          $$GodownVehiclesTableAnnotationComposer,
          $$GodownVehiclesTableCreateCompanionBuilder,
          $$GodownVehiclesTableUpdateCompanionBuilder,
          (
            GodownVehicle,
            BaseReferences<_$AppDb, $GodownVehiclesTable, GodownVehicle>,
          ),
          GodownVehicle,
          PrefetchHooks Function()
        > {
  $$GodownVehiclesTableTableManager(_$AppDb db, $GodownVehiclesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GodownVehiclesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GodownVehiclesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GodownVehiclesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> companyId = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<int?> active = const Value.absent(),
              }) => GodownVehiclesCompanion(
                id: id,
                companyId: companyId,
                code: code,
                name: name,
                active: active,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> companyId = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<int?> active = const Value.absent(),
              }) => GodownVehiclesCompanion.insert(
                id: id,
                companyId: companyId,
                code: code,
                name: name,
                active: active,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GodownVehiclesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $GodownVehiclesTable,
      GodownVehicle,
      $$GodownVehiclesTableFilterComposer,
      $$GodownVehiclesTableOrderingComposer,
      $$GodownVehiclesTableAnnotationComposer,
      $$GodownVehiclesTableCreateCompanionBuilder,
      $$GodownVehiclesTableUpdateCompanionBuilder,
      (
        GodownVehicle,
        BaseReferences<_$AppDb, $GodownVehiclesTable, GodownVehicle>,
      ),
      GodownVehicle,
      PrefetchHooks Function()
    >;
typedef $$GodownRoutesTableCreateCompanionBuilder =
    GodownRoutesCompanion Function({
      Value<int?> id,
      Value<int?> companyId,
      Value<String?> routeCode,
      Value<String?> routeName,
      Value<int?> active,
    });
typedef $$GodownRoutesTableUpdateCompanionBuilder =
    GodownRoutesCompanion Function({
      Value<int?> id,
      Value<int?> companyId,
      Value<String?> routeCode,
      Value<String?> routeName,
      Value<int?> active,
    });

class $$GodownRoutesTableFilterComposer
    extends Composer<_$AppDb, $GodownRoutesTable> {
  $$GodownRoutesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get routeCode => $composableBuilder(
    column: $table.routeCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get routeName => $composableBuilder(
    column: $table.routeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GodownRoutesTableOrderingComposer
    extends Composer<_$AppDb, $GodownRoutesTable> {
  $$GodownRoutesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get routeCode => $composableBuilder(
    column: $table.routeCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get routeName => $composableBuilder(
    column: $table.routeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GodownRoutesTableAnnotationComposer
    extends Composer<_$AppDb, $GodownRoutesTable> {
  $$GodownRoutesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get companyId =>
      $composableBuilder(column: $table.companyId, builder: (column) => column);

  GeneratedColumn<String> get routeCode =>
      $composableBuilder(column: $table.routeCode, builder: (column) => column);

  GeneratedColumn<String> get routeName =>
      $composableBuilder(column: $table.routeName, builder: (column) => column);

  GeneratedColumn<int> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);
}

class $$GodownRoutesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $GodownRoutesTable,
          GodownRoute,
          $$GodownRoutesTableFilterComposer,
          $$GodownRoutesTableOrderingComposer,
          $$GodownRoutesTableAnnotationComposer,
          $$GodownRoutesTableCreateCompanionBuilder,
          $$GodownRoutesTableUpdateCompanionBuilder,
          (
            GodownRoute,
            BaseReferences<_$AppDb, $GodownRoutesTable, GodownRoute>,
          ),
          GodownRoute,
          PrefetchHooks Function()
        > {
  $$GodownRoutesTableTableManager(_$AppDb db, $GodownRoutesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GodownRoutesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GodownRoutesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GodownRoutesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int?> id = const Value.absent(),
                Value<int?> companyId = const Value.absent(),
                Value<String?> routeCode = const Value.absent(),
                Value<String?> routeName = const Value.absent(),
                Value<int?> active = const Value.absent(),
              }) => GodownRoutesCompanion(
                id: id,
                companyId: companyId,
                routeCode: routeCode,
                routeName: routeName,
                active: active,
              ),
          createCompanionCallback:
              ({
                Value<int?> id = const Value.absent(),
                Value<int?> companyId = const Value.absent(),
                Value<String?> routeCode = const Value.absent(),
                Value<String?> routeName = const Value.absent(),
                Value<int?> active = const Value.absent(),
              }) => GodownRoutesCompanion.insert(
                id: id,
                companyId: companyId,
                routeCode: routeCode,
                routeName: routeName,
                active: active,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GodownRoutesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $GodownRoutesTable,
      GodownRoute,
      $$GodownRoutesTableFilterComposer,
      $$GodownRoutesTableOrderingComposer,
      $$GodownRoutesTableAnnotationComposer,
      $$GodownRoutesTableCreateCompanionBuilder,
      $$GodownRoutesTableUpdateCompanionBuilder,
      (GodownRoute, BaseReferences<_$AppDb, $GodownRoutesTable, GodownRoute>),
      GodownRoute,
      PrefetchHooks Function()
    >;
typedef $$PartyMasterTableCreateCompanionBuilder =
    PartyMasterCompanion Function({
      Value<int> ledgerId,
      Value<String?> ledgerName,
      Value<String?> ledgerNameLocal,
      Value<String?> aliasName,
      Value<String?> ledDesc,
      Value<int?> groupId,
      Value<String?> groupName,
      Value<bool> isActive,
      Value<bool> isDeleted,
      Value<double?> creditLimit,
      Value<int?> dueDays,
      Value<String?> address1,
      Value<String?> address2,
      Value<String?> address3,
      Value<String?> city,
      Value<int?> stateId,
      Value<String?> stateName,
      Value<int?> countryId,
      Value<String?> countryName,
      Value<String?> pinCode,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<double?> distanceFromCompanyKM,
      Value<String?> mailingName,
      Value<String?> contactPerson,
      Value<String?> mobile,
      Value<String?> whatsappNo,
      Value<String?> email,
      Value<String?> taxType,
      Value<String?> taxNumber,
      Value<String?> stateCode,
      Value<double?> closingBalance,
      Value<double?> onAccountValue,
      Value<int?> routeId,
      Value<String?> routeName,
      Value<int?> priceList,
      Value<DateTime?> lastSyncOn,
      Value<String?> syncAction,
    });
typedef $$PartyMasterTableUpdateCompanionBuilder =
    PartyMasterCompanion Function({
      Value<int> ledgerId,
      Value<String?> ledgerName,
      Value<String?> ledgerNameLocal,
      Value<String?> aliasName,
      Value<String?> ledDesc,
      Value<int?> groupId,
      Value<String?> groupName,
      Value<bool> isActive,
      Value<bool> isDeleted,
      Value<double?> creditLimit,
      Value<int?> dueDays,
      Value<String?> address1,
      Value<String?> address2,
      Value<String?> address3,
      Value<String?> city,
      Value<int?> stateId,
      Value<String?> stateName,
      Value<int?> countryId,
      Value<String?> countryName,
      Value<String?> pinCode,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<double?> distanceFromCompanyKM,
      Value<String?> mailingName,
      Value<String?> contactPerson,
      Value<String?> mobile,
      Value<String?> whatsappNo,
      Value<String?> email,
      Value<String?> taxType,
      Value<String?> taxNumber,
      Value<String?> stateCode,
      Value<double?> closingBalance,
      Value<double?> onAccountValue,
      Value<int?> routeId,
      Value<String?> routeName,
      Value<int?> priceList,
      Value<DateTime?> lastSyncOn,
      Value<String?> syncAction,
    });

class $$PartyMasterTableFilterComposer
    extends Composer<_$AppDb, $PartyMasterTable> {
  $$PartyMasterTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get ledgerId => $composableBuilder(
    column: $table.ledgerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ledgerName => $composableBuilder(
    column: $table.ledgerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ledgerNameLocal => $composableBuilder(
    column: $table.ledgerNameLocal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aliasName => $composableBuilder(
    column: $table.aliasName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ledDesc => $composableBuilder(
    column: $table.ledDesc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get groupId => $composableBuilder(
    column: $table.groupId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get groupName => $composableBuilder(
    column: $table.groupName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dueDays => $composableBuilder(
    column: $table.dueDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address1 => $composableBuilder(
    column: $table.address1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address2 => $composableBuilder(
    column: $table.address2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address3 => $composableBuilder(
    column: $table.address3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stateId => $composableBuilder(
    column: $table.stateId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stateName => $composableBuilder(
    column: $table.stateName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get countryId => $composableBuilder(
    column: $table.countryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get countryName => $composableBuilder(
    column: $table.countryName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pinCode => $composableBuilder(
    column: $table.pinCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distanceFromCompanyKM => $composableBuilder(
    column: $table.distanceFromCompanyKM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mailingName => $composableBuilder(
    column: $table.mailingName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contactPerson => $composableBuilder(
    column: $table.contactPerson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mobile => $composableBuilder(
    column: $table.mobile,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get whatsappNo => $composableBuilder(
    column: $table.whatsappNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taxType => $composableBuilder(
    column: $table.taxType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taxNumber => $composableBuilder(
    column: $table.taxNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stateCode => $composableBuilder(
    column: $table.stateCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get closingBalance => $composableBuilder(
    column: $table.closingBalance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get onAccountValue => $composableBuilder(
    column: $table.onAccountValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get routeId => $composableBuilder(
    column: $table.routeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get routeName => $composableBuilder(
    column: $table.routeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priceList => $composableBuilder(
    column: $table.priceList,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncOn => $composableBuilder(
    column: $table.lastSyncOn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncAction => $composableBuilder(
    column: $table.syncAction,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PartyMasterTableOrderingComposer
    extends Composer<_$AppDb, $PartyMasterTable> {
  $$PartyMasterTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get ledgerId => $composableBuilder(
    column: $table.ledgerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ledgerName => $composableBuilder(
    column: $table.ledgerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ledgerNameLocal => $composableBuilder(
    column: $table.ledgerNameLocal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aliasName => $composableBuilder(
    column: $table.aliasName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ledDesc => $composableBuilder(
    column: $table.ledDesc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get groupId => $composableBuilder(
    column: $table.groupId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get groupName => $composableBuilder(
    column: $table.groupName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dueDays => $composableBuilder(
    column: $table.dueDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address1 => $composableBuilder(
    column: $table.address1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address2 => $composableBuilder(
    column: $table.address2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address3 => $composableBuilder(
    column: $table.address3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stateId => $composableBuilder(
    column: $table.stateId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stateName => $composableBuilder(
    column: $table.stateName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get countryId => $composableBuilder(
    column: $table.countryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get countryName => $composableBuilder(
    column: $table.countryName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pinCode => $composableBuilder(
    column: $table.pinCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distanceFromCompanyKM => $composableBuilder(
    column: $table.distanceFromCompanyKM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mailingName => $composableBuilder(
    column: $table.mailingName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactPerson => $composableBuilder(
    column: $table.contactPerson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mobile => $composableBuilder(
    column: $table.mobile,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get whatsappNo => $composableBuilder(
    column: $table.whatsappNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taxType => $composableBuilder(
    column: $table.taxType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taxNumber => $composableBuilder(
    column: $table.taxNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stateCode => $composableBuilder(
    column: $table.stateCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get closingBalance => $composableBuilder(
    column: $table.closingBalance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get onAccountValue => $composableBuilder(
    column: $table.onAccountValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get routeId => $composableBuilder(
    column: $table.routeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get routeName => $composableBuilder(
    column: $table.routeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priceList => $composableBuilder(
    column: $table.priceList,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncOn => $composableBuilder(
    column: $table.lastSyncOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncAction => $composableBuilder(
    column: $table.syncAction,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PartyMasterTableAnnotationComposer
    extends Composer<_$AppDb, $PartyMasterTable> {
  $$PartyMasterTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get ledgerId =>
      $composableBuilder(column: $table.ledgerId, builder: (column) => column);

  GeneratedColumn<String> get ledgerName => $composableBuilder(
    column: $table.ledgerName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ledgerNameLocal => $composableBuilder(
    column: $table.ledgerNameLocal,
    builder: (column) => column,
  );

  GeneratedColumn<String> get aliasName =>
      $composableBuilder(column: $table.aliasName, builder: (column) => column);

  GeneratedColumn<String> get ledDesc =>
      $composableBuilder(column: $table.ledDesc, builder: (column) => column);

  GeneratedColumn<int> get groupId =>
      $composableBuilder(column: $table.groupId, builder: (column) => column);

  GeneratedColumn<String> get groupName =>
      $composableBuilder(column: $table.groupName, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<double> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dueDays =>
      $composableBuilder(column: $table.dueDays, builder: (column) => column);

  GeneratedColumn<String> get address1 =>
      $composableBuilder(column: $table.address1, builder: (column) => column);

  GeneratedColumn<String> get address2 =>
      $composableBuilder(column: $table.address2, builder: (column) => column);

  GeneratedColumn<String> get address3 =>
      $composableBuilder(column: $table.address3, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<int> get stateId =>
      $composableBuilder(column: $table.stateId, builder: (column) => column);

  GeneratedColumn<String> get stateName =>
      $composableBuilder(column: $table.stateName, builder: (column) => column);

  GeneratedColumn<int> get countryId =>
      $composableBuilder(column: $table.countryId, builder: (column) => column);

  GeneratedColumn<String> get countryName => $composableBuilder(
    column: $table.countryName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pinCode =>
      $composableBuilder(column: $table.pinCode, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<double> get distanceFromCompanyKM => $composableBuilder(
    column: $table.distanceFromCompanyKM,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mailingName => $composableBuilder(
    column: $table.mailingName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contactPerson => $composableBuilder(
    column: $table.contactPerson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mobile =>
      $composableBuilder(column: $table.mobile, builder: (column) => column);

  GeneratedColumn<String> get whatsappNo => $composableBuilder(
    column: $table.whatsappNo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get taxType =>
      $composableBuilder(column: $table.taxType, builder: (column) => column);

  GeneratedColumn<String> get taxNumber =>
      $composableBuilder(column: $table.taxNumber, builder: (column) => column);

  GeneratedColumn<String> get stateCode =>
      $composableBuilder(column: $table.stateCode, builder: (column) => column);

  GeneratedColumn<double> get closingBalance => $composableBuilder(
    column: $table.closingBalance,
    builder: (column) => column,
  );

  GeneratedColumn<double> get onAccountValue => $composableBuilder(
    column: $table.onAccountValue,
    builder: (column) => column,
  );

  GeneratedColumn<int> get routeId =>
      $composableBuilder(column: $table.routeId, builder: (column) => column);

  GeneratedColumn<String> get routeName =>
      $composableBuilder(column: $table.routeName, builder: (column) => column);

  GeneratedColumn<int> get priceList =>
      $composableBuilder(column: $table.priceList, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncOn => $composableBuilder(
    column: $table.lastSyncOn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncAction => $composableBuilder(
    column: $table.syncAction,
    builder: (column) => column,
  );
}

class $$PartyMasterTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $PartyMasterTable,
          PartyMasterData,
          $$PartyMasterTableFilterComposer,
          $$PartyMasterTableOrderingComposer,
          $$PartyMasterTableAnnotationComposer,
          $$PartyMasterTableCreateCompanionBuilder,
          $$PartyMasterTableUpdateCompanionBuilder,
          (
            PartyMasterData,
            BaseReferences<_$AppDb, $PartyMasterTable, PartyMasterData>,
          ),
          PartyMasterData,
          PrefetchHooks Function()
        > {
  $$PartyMasterTableTableManager(_$AppDb db, $PartyMasterTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PartyMasterTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PartyMasterTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PartyMasterTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> ledgerId = const Value.absent(),
                Value<String?> ledgerName = const Value.absent(),
                Value<String?> ledgerNameLocal = const Value.absent(),
                Value<String?> aliasName = const Value.absent(),
                Value<String?> ledDesc = const Value.absent(),
                Value<int?> groupId = const Value.absent(),
                Value<String?> groupName = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<double?> creditLimit = const Value.absent(),
                Value<int?> dueDays = const Value.absent(),
                Value<String?> address1 = const Value.absent(),
                Value<String?> address2 = const Value.absent(),
                Value<String?> address3 = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<int?> stateId = const Value.absent(),
                Value<String?> stateName = const Value.absent(),
                Value<int?> countryId = const Value.absent(),
                Value<String?> countryName = const Value.absent(),
                Value<String?> pinCode = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<double?> distanceFromCompanyKM = const Value.absent(),
                Value<String?> mailingName = const Value.absent(),
                Value<String?> contactPerson = const Value.absent(),
                Value<String?> mobile = const Value.absent(),
                Value<String?> whatsappNo = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> taxType = const Value.absent(),
                Value<String?> taxNumber = const Value.absent(),
                Value<String?> stateCode = const Value.absent(),
                Value<double?> closingBalance = const Value.absent(),
                Value<double?> onAccountValue = const Value.absent(),
                Value<int?> routeId = const Value.absent(),
                Value<String?> routeName = const Value.absent(),
                Value<int?> priceList = const Value.absent(),
                Value<DateTime?> lastSyncOn = const Value.absent(),
                Value<String?> syncAction = const Value.absent(),
              }) => PartyMasterCompanion(
                ledgerId: ledgerId,
                ledgerName: ledgerName,
                ledgerNameLocal: ledgerNameLocal,
                aliasName: aliasName,
                ledDesc: ledDesc,
                groupId: groupId,
                groupName: groupName,
                isActive: isActive,
                isDeleted: isDeleted,
                creditLimit: creditLimit,
                dueDays: dueDays,
                address1: address1,
                address2: address2,
                address3: address3,
                city: city,
                stateId: stateId,
                stateName: stateName,
                countryId: countryId,
                countryName: countryName,
                pinCode: pinCode,
                latitude: latitude,
                longitude: longitude,
                distanceFromCompanyKM: distanceFromCompanyKM,
                mailingName: mailingName,
                contactPerson: contactPerson,
                mobile: mobile,
                whatsappNo: whatsappNo,
                email: email,
                taxType: taxType,
                taxNumber: taxNumber,
                stateCode: stateCode,
                closingBalance: closingBalance,
                onAccountValue: onAccountValue,
                routeId: routeId,
                routeName: routeName,
                priceList: priceList,
                lastSyncOn: lastSyncOn,
                syncAction: syncAction,
              ),
          createCompanionCallback:
              ({
                Value<int> ledgerId = const Value.absent(),
                Value<String?> ledgerName = const Value.absent(),
                Value<String?> ledgerNameLocal = const Value.absent(),
                Value<String?> aliasName = const Value.absent(),
                Value<String?> ledDesc = const Value.absent(),
                Value<int?> groupId = const Value.absent(),
                Value<String?> groupName = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<double?> creditLimit = const Value.absent(),
                Value<int?> dueDays = const Value.absent(),
                Value<String?> address1 = const Value.absent(),
                Value<String?> address2 = const Value.absent(),
                Value<String?> address3 = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<int?> stateId = const Value.absent(),
                Value<String?> stateName = const Value.absent(),
                Value<int?> countryId = const Value.absent(),
                Value<String?> countryName = const Value.absent(),
                Value<String?> pinCode = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<double?> distanceFromCompanyKM = const Value.absent(),
                Value<String?> mailingName = const Value.absent(),
                Value<String?> contactPerson = const Value.absent(),
                Value<String?> mobile = const Value.absent(),
                Value<String?> whatsappNo = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> taxType = const Value.absent(),
                Value<String?> taxNumber = const Value.absent(),
                Value<String?> stateCode = const Value.absent(),
                Value<double?> closingBalance = const Value.absent(),
                Value<double?> onAccountValue = const Value.absent(),
                Value<int?> routeId = const Value.absent(),
                Value<String?> routeName = const Value.absent(),
                Value<int?> priceList = const Value.absent(),
                Value<DateTime?> lastSyncOn = const Value.absent(),
                Value<String?> syncAction = const Value.absent(),
              }) => PartyMasterCompanion.insert(
                ledgerId: ledgerId,
                ledgerName: ledgerName,
                ledgerNameLocal: ledgerNameLocal,
                aliasName: aliasName,
                ledDesc: ledDesc,
                groupId: groupId,
                groupName: groupName,
                isActive: isActive,
                isDeleted: isDeleted,
                creditLimit: creditLimit,
                dueDays: dueDays,
                address1: address1,
                address2: address2,
                address3: address3,
                city: city,
                stateId: stateId,
                stateName: stateName,
                countryId: countryId,
                countryName: countryName,
                pinCode: pinCode,
                latitude: latitude,
                longitude: longitude,
                distanceFromCompanyKM: distanceFromCompanyKM,
                mailingName: mailingName,
                contactPerson: contactPerson,
                mobile: mobile,
                whatsappNo: whatsappNo,
                email: email,
                taxType: taxType,
                taxNumber: taxNumber,
                stateCode: stateCode,
                closingBalance: closingBalance,
                onAccountValue: onAccountValue,
                routeId: routeId,
                routeName: routeName,
                priceList: priceList,
                lastSyncOn: lastSyncOn,
                syncAction: syncAction,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PartyMasterTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $PartyMasterTable,
      PartyMasterData,
      $$PartyMasterTableFilterComposer,
      $$PartyMasterTableOrderingComposer,
      $$PartyMasterTableAnnotationComposer,
      $$PartyMasterTableCreateCompanionBuilder,
      $$PartyMasterTableUpdateCompanionBuilder,
      (
        PartyMasterData,
        BaseReferences<_$AppDb, $PartyMasterTable, PartyMasterData>,
      ),
      PartyMasterData,
      PrefetchHooks Function()
    >;
typedef $$ItemMasterTableCreateCompanionBuilder =
    ItemMasterCompanion Function({
      Value<int> id,
      required int stockItemId,
      required String itemName,
      Value<String> aliasName,
      Value<String> partNumber,
      Value<String?> itemNameLcl,
      Value<String?> groupName,
      Value<String?> categoryName,
      required String unitName,
      required int decimalPlaces,
      Value<String?> altUnit,
      Value<int?> altDecimalPlaces,
      Value<double> unitConversion,
      Value<double> unitDenominator,
      Value<bool> isActive,
      Value<bool> isDeleted,
      Value<String?> hsnCode,
      Value<double?> taxPercent,
    });
typedef $$ItemMasterTableUpdateCompanionBuilder =
    ItemMasterCompanion Function({
      Value<int> id,
      Value<int> stockItemId,
      Value<String> itemName,
      Value<String> aliasName,
      Value<String> partNumber,
      Value<String?> itemNameLcl,
      Value<String?> groupName,
      Value<String?> categoryName,
      Value<String> unitName,
      Value<int> decimalPlaces,
      Value<String?> altUnit,
      Value<int?> altDecimalPlaces,
      Value<double> unitConversion,
      Value<double> unitDenominator,
      Value<bool> isActive,
      Value<bool> isDeleted,
      Value<String?> hsnCode,
      Value<double?> taxPercent,
    });

class $$ItemMasterTableFilterComposer
    extends Composer<_$AppDb, $ItemMasterTable> {
  $$ItemMasterTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stockItemId => $composableBuilder(
    column: $table.stockItemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemName => $composableBuilder(
    column: $table.itemName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aliasName => $composableBuilder(
    column: $table.aliasName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get partNumber => $composableBuilder(
    column: $table.partNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemNameLcl => $composableBuilder(
    column: $table.itemNameLcl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get groupName => $composableBuilder(
    column: $table.groupName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitName => $composableBuilder(
    column: $table.unitName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get decimalPlaces => $composableBuilder(
    column: $table.decimalPlaces,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get altUnit => $composableBuilder(
    column: $table.altUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get altDecimalPlaces => $composableBuilder(
    column: $table.altDecimalPlaces,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get unitConversion => $composableBuilder(
    column: $table.unitConversion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get unitDenominator => $composableBuilder(
    column: $table.unitDenominator,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hsnCode => $composableBuilder(
    column: $table.hsnCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get taxPercent => $composableBuilder(
    column: $table.taxPercent,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ItemMasterTableOrderingComposer
    extends Composer<_$AppDb, $ItemMasterTable> {
  $$ItemMasterTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stockItemId => $composableBuilder(
    column: $table.stockItemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemName => $composableBuilder(
    column: $table.itemName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aliasName => $composableBuilder(
    column: $table.aliasName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get partNumber => $composableBuilder(
    column: $table.partNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemNameLcl => $composableBuilder(
    column: $table.itemNameLcl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get groupName => $composableBuilder(
    column: $table.groupName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitName => $composableBuilder(
    column: $table.unitName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get decimalPlaces => $composableBuilder(
    column: $table.decimalPlaces,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get altUnit => $composableBuilder(
    column: $table.altUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get altDecimalPlaces => $composableBuilder(
    column: $table.altDecimalPlaces,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get unitConversion => $composableBuilder(
    column: $table.unitConversion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get unitDenominator => $composableBuilder(
    column: $table.unitDenominator,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hsnCode => $composableBuilder(
    column: $table.hsnCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get taxPercent => $composableBuilder(
    column: $table.taxPercent,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ItemMasterTableAnnotationComposer
    extends Composer<_$AppDb, $ItemMasterTable> {
  $$ItemMasterTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get stockItemId => $composableBuilder(
    column: $table.stockItemId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get itemName =>
      $composableBuilder(column: $table.itemName, builder: (column) => column);

  GeneratedColumn<String> get aliasName =>
      $composableBuilder(column: $table.aliasName, builder: (column) => column);

  GeneratedColumn<String> get partNumber => $composableBuilder(
    column: $table.partNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get itemNameLcl => $composableBuilder(
    column: $table.itemNameLcl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get groupName =>
      $composableBuilder(column: $table.groupName, builder: (column) => column);

  GeneratedColumn<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unitName =>
      $composableBuilder(column: $table.unitName, builder: (column) => column);

  GeneratedColumn<int> get decimalPlaces => $composableBuilder(
    column: $table.decimalPlaces,
    builder: (column) => column,
  );

  GeneratedColumn<String> get altUnit =>
      $composableBuilder(column: $table.altUnit, builder: (column) => column);

  GeneratedColumn<int> get altDecimalPlaces => $composableBuilder(
    column: $table.altDecimalPlaces,
    builder: (column) => column,
  );

  GeneratedColumn<double> get unitConversion => $composableBuilder(
    column: $table.unitConversion,
    builder: (column) => column,
  );

  GeneratedColumn<double> get unitDenominator => $composableBuilder(
    column: $table.unitDenominator,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get hsnCode =>
      $composableBuilder(column: $table.hsnCode, builder: (column) => column);

  GeneratedColumn<double> get taxPercent => $composableBuilder(
    column: $table.taxPercent,
    builder: (column) => column,
  );
}

class $$ItemMasterTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $ItemMasterTable,
          ItemMasterData,
          $$ItemMasterTableFilterComposer,
          $$ItemMasterTableOrderingComposer,
          $$ItemMasterTableAnnotationComposer,
          $$ItemMasterTableCreateCompanionBuilder,
          $$ItemMasterTableUpdateCompanionBuilder,
          (
            ItemMasterData,
            BaseReferences<_$AppDb, $ItemMasterTable, ItemMasterData>,
          ),
          ItemMasterData,
          PrefetchHooks Function()
        > {
  $$ItemMasterTableTableManager(_$AppDb db, $ItemMasterTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemMasterTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemMasterTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemMasterTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> stockItemId = const Value.absent(),
                Value<String> itemName = const Value.absent(),
                Value<String> aliasName = const Value.absent(),
                Value<String> partNumber = const Value.absent(),
                Value<String?> itemNameLcl = const Value.absent(),
                Value<String?> groupName = const Value.absent(),
                Value<String?> categoryName = const Value.absent(),
                Value<String> unitName = const Value.absent(),
                Value<int> decimalPlaces = const Value.absent(),
                Value<String?> altUnit = const Value.absent(),
                Value<int?> altDecimalPlaces = const Value.absent(),
                Value<double> unitConversion = const Value.absent(),
                Value<double> unitDenominator = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String?> hsnCode = const Value.absent(),
                Value<double?> taxPercent = const Value.absent(),
              }) => ItemMasterCompanion(
                id: id,
                stockItemId: stockItemId,
                itemName: itemName,
                aliasName: aliasName,
                partNumber: partNumber,
                itemNameLcl: itemNameLcl,
                groupName: groupName,
                categoryName: categoryName,
                unitName: unitName,
                decimalPlaces: decimalPlaces,
                altUnit: altUnit,
                altDecimalPlaces: altDecimalPlaces,
                unitConversion: unitConversion,
                unitDenominator: unitDenominator,
                isActive: isActive,
                isDeleted: isDeleted,
                hsnCode: hsnCode,
                taxPercent: taxPercent,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int stockItemId,
                required String itemName,
                Value<String> aliasName = const Value.absent(),
                Value<String> partNumber = const Value.absent(),
                Value<String?> itemNameLcl = const Value.absent(),
                Value<String?> groupName = const Value.absent(),
                Value<String?> categoryName = const Value.absent(),
                required String unitName,
                required int decimalPlaces,
                Value<String?> altUnit = const Value.absent(),
                Value<int?> altDecimalPlaces = const Value.absent(),
                Value<double> unitConversion = const Value.absent(),
                Value<double> unitDenominator = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String?> hsnCode = const Value.absent(),
                Value<double?> taxPercent = const Value.absent(),
              }) => ItemMasterCompanion.insert(
                id: id,
                stockItemId: stockItemId,
                itemName: itemName,
                aliasName: aliasName,
                partNumber: partNumber,
                itemNameLcl: itemNameLcl,
                groupName: groupName,
                categoryName: categoryName,
                unitName: unitName,
                decimalPlaces: decimalPlaces,
                altUnit: altUnit,
                altDecimalPlaces: altDecimalPlaces,
                unitConversion: unitConversion,
                unitDenominator: unitDenominator,
                isActive: isActive,
                isDeleted: isDeleted,
                hsnCode: hsnCode,
                taxPercent: taxPercent,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ItemMasterTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $ItemMasterTable,
      ItemMasterData,
      $$ItemMasterTableFilterComposer,
      $$ItemMasterTableOrderingComposer,
      $$ItemMasterTableAnnotationComposer,
      $$ItemMasterTableCreateCompanionBuilder,
      $$ItemMasterTableUpdateCompanionBuilder,
      (
        ItemMasterData,
        BaseReferences<_$AppDb, $ItemMasterTable, ItemMasterData>,
      ),
      ItemMasterData,
      PrefetchHooks Function()
    >;
typedef $$PriceLevelsTableTableCreateCompanionBuilder =
    PriceLevelsTableCompanion Function({
      Value<int> id,
      Value<String?> priceLevel,
      Value<bool> rateInclusive,
      Value<bool> isDefault,
      Value<bool> active,
    });
typedef $$PriceLevelsTableTableUpdateCompanionBuilder =
    PriceLevelsTableCompanion Function({
      Value<int> id,
      Value<String?> priceLevel,
      Value<bool> rateInclusive,
      Value<bool> isDefault,
      Value<bool> active,
    });

class $$PriceLevelsTableTableFilterComposer
    extends Composer<_$AppDb, $PriceLevelsTableTable> {
  $$PriceLevelsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get priceLevel => $composableBuilder(
    column: $table.priceLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rateInclusive => $composableBuilder(
    column: $table.rateInclusive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDefault => $composableBuilder(
    column: $table.isDefault,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PriceLevelsTableTableOrderingComposer
    extends Composer<_$AppDb, $PriceLevelsTableTable> {
  $$PriceLevelsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get priceLevel => $composableBuilder(
    column: $table.priceLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rateInclusive => $composableBuilder(
    column: $table.rateInclusive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDefault => $composableBuilder(
    column: $table.isDefault,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PriceLevelsTableTableAnnotationComposer
    extends Composer<_$AppDb, $PriceLevelsTableTable> {
  $$PriceLevelsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get priceLevel => $composableBuilder(
    column: $table.priceLevel,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get rateInclusive => $composableBuilder(
    column: $table.rateInclusive,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDefault =>
      $composableBuilder(column: $table.isDefault, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);
}

class $$PriceLevelsTableTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $PriceLevelsTableTable,
          PriceLevelsTableData,
          $$PriceLevelsTableTableFilterComposer,
          $$PriceLevelsTableTableOrderingComposer,
          $$PriceLevelsTableTableAnnotationComposer,
          $$PriceLevelsTableTableCreateCompanionBuilder,
          $$PriceLevelsTableTableUpdateCompanionBuilder,
          (
            PriceLevelsTableData,
            BaseReferences<
              _$AppDb,
              $PriceLevelsTableTable,
              PriceLevelsTableData
            >,
          ),
          PriceLevelsTableData,
          PrefetchHooks Function()
        > {
  $$PriceLevelsTableTableTableManager(_$AppDb db, $PriceLevelsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PriceLevelsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PriceLevelsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PriceLevelsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> priceLevel = const Value.absent(),
                Value<bool> rateInclusive = const Value.absent(),
                Value<bool> isDefault = const Value.absent(),
                Value<bool> active = const Value.absent(),
              }) => PriceLevelsTableCompanion(
                id: id,
                priceLevel: priceLevel,
                rateInclusive: rateInclusive,
                isDefault: isDefault,
                active: active,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> priceLevel = const Value.absent(),
                Value<bool> rateInclusive = const Value.absent(),
                Value<bool> isDefault = const Value.absent(),
                Value<bool> active = const Value.absent(),
              }) => PriceLevelsTableCompanion.insert(
                id: id,
                priceLevel: priceLevel,
                rateInclusive: rateInclusive,
                isDefault: isDefault,
                active: active,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PriceLevelsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $PriceLevelsTableTable,
      PriceLevelsTableData,
      $$PriceLevelsTableTableFilterComposer,
      $$PriceLevelsTableTableOrderingComposer,
      $$PriceLevelsTableTableAnnotationComposer,
      $$PriceLevelsTableTableCreateCompanionBuilder,
      $$PriceLevelsTableTableUpdateCompanionBuilder,
      (
        PriceLevelsTableData,
        BaseReferences<_$AppDb, $PriceLevelsTableTable, PriceLevelsTableData>,
      ),
      PriceLevelsTableData,
      PrefetchHooks Function()
    >;
typedef $$ItemPriceDetailsTablesTableCreateCompanionBuilder =
    ItemPriceDetailsTablesCompanion Function({
      Value<int> id,
      Value<DateTime?> applicableDate,
      Value<int?> itemId,
      Value<int?> companyId,
      Value<int?> priceList,
      Value<double?> rate,
      Value<double?> discount,
      Value<String?> discountType,
      Value<double?> fromQty,
      Value<double?> toQty,
    });
typedef $$ItemPriceDetailsTablesTableUpdateCompanionBuilder =
    ItemPriceDetailsTablesCompanion Function({
      Value<int> id,
      Value<DateTime?> applicableDate,
      Value<int?> itemId,
      Value<int?> companyId,
      Value<int?> priceList,
      Value<double?> rate,
      Value<double?> discount,
      Value<String?> discountType,
      Value<double?> fromQty,
      Value<double?> toQty,
    });

class $$ItemPriceDetailsTablesTableFilterComposer
    extends Composer<_$AppDb, $ItemPriceDetailsTablesTable> {
  $$ItemPriceDetailsTablesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get applicableDate => $composableBuilder(
    column: $table.applicableDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priceList => $composableBuilder(
    column: $table.priceList,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rate => $composableBuilder(
    column: $table.rate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get discountType => $composableBuilder(
    column: $table.discountType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fromQty => $composableBuilder(
    column: $table.fromQty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get toQty => $composableBuilder(
    column: $table.toQty,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ItemPriceDetailsTablesTableOrderingComposer
    extends Composer<_$AppDb, $ItemPriceDetailsTablesTable> {
  $$ItemPriceDetailsTablesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get applicableDate => $composableBuilder(
    column: $table.applicableDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priceList => $composableBuilder(
    column: $table.priceList,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rate => $composableBuilder(
    column: $table.rate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get discountType => $composableBuilder(
    column: $table.discountType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fromQty => $composableBuilder(
    column: $table.fromQty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get toQty => $composableBuilder(
    column: $table.toQty,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ItemPriceDetailsTablesTableAnnotationComposer
    extends Composer<_$AppDb, $ItemPriceDetailsTablesTable> {
  $$ItemPriceDetailsTablesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get applicableDate => $composableBuilder(
    column: $table.applicableDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<int> get companyId =>
      $composableBuilder(column: $table.companyId, builder: (column) => column);

  GeneratedColumn<int> get priceList =>
      $composableBuilder(column: $table.priceList, builder: (column) => column);

  GeneratedColumn<double> get rate =>
      $composableBuilder(column: $table.rate, builder: (column) => column);

  GeneratedColumn<double> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<String> get discountType => $composableBuilder(
    column: $table.discountType,
    builder: (column) => column,
  );

  GeneratedColumn<double> get fromQty =>
      $composableBuilder(column: $table.fromQty, builder: (column) => column);

  GeneratedColumn<double> get toQty =>
      $composableBuilder(column: $table.toQty, builder: (column) => column);
}

class $$ItemPriceDetailsTablesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $ItemPriceDetailsTablesTable,
          ItemPriceDetailsTable,
          $$ItemPriceDetailsTablesTableFilterComposer,
          $$ItemPriceDetailsTablesTableOrderingComposer,
          $$ItemPriceDetailsTablesTableAnnotationComposer,
          $$ItemPriceDetailsTablesTableCreateCompanionBuilder,
          $$ItemPriceDetailsTablesTableUpdateCompanionBuilder,
          (
            ItemPriceDetailsTable,
            BaseReferences<
              _$AppDb,
              $ItemPriceDetailsTablesTable,
              ItemPriceDetailsTable
            >,
          ),
          ItemPriceDetailsTable,
          PrefetchHooks Function()
        > {
  $$ItemPriceDetailsTablesTableTableManager(
    _$AppDb db,
    $ItemPriceDetailsTablesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemPriceDetailsTablesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ItemPriceDetailsTablesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ItemPriceDetailsTablesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime?> applicableDate = const Value.absent(),
                Value<int?> itemId = const Value.absent(),
                Value<int?> companyId = const Value.absent(),
                Value<int?> priceList = const Value.absent(),
                Value<double?> rate = const Value.absent(),
                Value<double?> discount = const Value.absent(),
                Value<String?> discountType = const Value.absent(),
                Value<double?> fromQty = const Value.absent(),
                Value<double?> toQty = const Value.absent(),
              }) => ItemPriceDetailsTablesCompanion(
                id: id,
                applicableDate: applicableDate,
                itemId: itemId,
                companyId: companyId,
                priceList: priceList,
                rate: rate,
                discount: discount,
                discountType: discountType,
                fromQty: fromQty,
                toQty: toQty,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime?> applicableDate = const Value.absent(),
                Value<int?> itemId = const Value.absent(),
                Value<int?> companyId = const Value.absent(),
                Value<int?> priceList = const Value.absent(),
                Value<double?> rate = const Value.absent(),
                Value<double?> discount = const Value.absent(),
                Value<String?> discountType = const Value.absent(),
                Value<double?> fromQty = const Value.absent(),
                Value<double?> toQty = const Value.absent(),
              }) => ItemPriceDetailsTablesCompanion.insert(
                id: id,
                applicableDate: applicableDate,
                itemId: itemId,
                companyId: companyId,
                priceList: priceList,
                rate: rate,
                discount: discount,
                discountType: discountType,
                fromQty: fromQty,
                toQty: toQty,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ItemPriceDetailsTablesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $ItemPriceDetailsTablesTable,
      ItemPriceDetailsTable,
      $$ItemPriceDetailsTablesTableFilterComposer,
      $$ItemPriceDetailsTablesTableOrderingComposer,
      $$ItemPriceDetailsTablesTableAnnotationComposer,
      $$ItemPriceDetailsTablesTableCreateCompanionBuilder,
      $$ItemPriceDetailsTablesTableUpdateCompanionBuilder,
      (
        ItemPriceDetailsTable,
        BaseReferences<
          _$AppDb,
          $ItemPriceDetailsTablesTable,
          ItemPriceDetailsTable
        >,
      ),
      ItemPriceDetailsTable,
      PrefetchHooks Function()
    >;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$RegistrationDetailsTableTableManager get registrationDetails =>
      $$RegistrationDetailsTableTableManager(_db, _db.registrationDetails);
  $$CompaniesTableTableManager get companies =>
      $$CompaniesTableTableManager(_db, _db.companies);
  $$UserSettingsTableTableTableManager get userSettingsTable =>
      $$UserSettingsTableTableTableManager(_db, _db.userSettingsTable);
  $$VoucherTypesTableTableManager get voucherTypes =>
      $$VoucherTypesTableTableManager(_db, _db.voucherTypes);
  $$GodownVoucherTypesTableTableManager get godownVoucherTypes =>
      $$GodownVoucherTypesTableTableManager(_db, _db.godownVoucherTypes);
  $$RouteVoucherTypesTableTableManager get routeVoucherTypes =>
      $$RouteVoucherTypesTableTableManager(_db, _db.routeVoucherTypes);
  $$CompanySettingsTableTableTableManager get companySettingsTable =>
      $$CompanySettingsTableTableTableManager(_db, _db.companySettingsTable);
  $$GodownVehiclesTableTableManager get godownVehicles =>
      $$GodownVehiclesTableTableManager(_db, _db.godownVehicles);
  $$GodownRoutesTableTableManager get godownRoutes =>
      $$GodownRoutesTableTableManager(_db, _db.godownRoutes);
  $$PartyMasterTableTableManager get partyMaster =>
      $$PartyMasterTableTableManager(_db, _db.partyMaster);
  $$ItemMasterTableTableManager get itemMaster =>
      $$ItemMasterTableTableManager(_db, _db.itemMaster);
  $$PriceLevelsTableTableTableManager get priceLevelsTable =>
      $$PriceLevelsTableTableTableManager(_db, _db.priceLevelsTable);
  $$ItemPriceDetailsTablesTableTableManager get itemPriceDetailsTables =>
      $$ItemPriceDetailsTablesTableTableManager(
        _db,
        _db.itemPriceDetailsTables,
      );
}
