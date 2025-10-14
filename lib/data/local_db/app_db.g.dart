// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    true,
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
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
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
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      ),
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
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int? userId;
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
  const User({
    this.userId,
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
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
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

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
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

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      userId: serializer.fromJson<int?>(json['userId']),
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
      'userId': serializer.toJson<int?>(userId),
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

  User copyWith({
    Value<int?> userId = const Value.absent(),
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
  }) => User(
    userId: userId.present ? userId.value : this.userId,
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
  User copyWithCompanion(UsersCompanion data) {
    return User(
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
    return (StringBuffer('User(')
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
      (other is User &&
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

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int?> userId;
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
  final Value<int> rowid;
  const UsersCompanion({
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
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
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
    this.rowid = const Value.absent(),
  });
  static Insertable<User> custom({
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
    Expression<int>? rowid,
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
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<int?>? userId,
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
    Value<int>? rowid,
  }) {
    return UsersCompanion(
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
      rowid: rowid ?? this.rowid,
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
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
          ..write('dbName: $dbName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $UsersTable users = $UsersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int?> userId,
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
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int?> userId,
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
      Value<int> rowid,
    });

class $$UsersTableFilterComposer extends Composer<_$AppDb, $UsersTable> {
  $$UsersTableFilterComposer({
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

class $$UsersTableOrderingComposer extends Composer<_$AppDb, $UsersTable> {
  $$UsersTableOrderingComposer({
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

class $$UsersTableAnnotationComposer extends Composer<_$AppDb, $UsersTable> {
  $$UsersTableAnnotationComposer({
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

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, BaseReferences<_$AppDb, $UsersTable, User>),
          User,
          PrefetchHooks Function()
        > {
  $$UsersTableTableManager(_$AppDb db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int?> userId = const Value.absent(),
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
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
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
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<int?> userId = const Value.absent(),
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
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
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
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, BaseReferences<_$AppDb, $UsersTable, User>),
      User,
      PrefetchHooks Function()
    >;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
}
