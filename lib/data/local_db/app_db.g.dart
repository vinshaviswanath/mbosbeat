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

class $RegistrationDetailsTable extends RegistrationDetails
    with TableInfo<$RegistrationDetailsTable, RegistrationDetail> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RegistrationDetailsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Variable(0),
  );
  static const VerificationMeta _productNameMeta = const VerificationMeta(
    'productName',
  );
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
    'product_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Variable("mPosBeat"),
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
  static const VerificationMeta _adminUsernameMeta = const VerificationMeta(
    'adminUsername',
  );
  @override
  late final GeneratedColumn<String> adminUsername = GeneratedColumn<String>(
    'admin_username',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    productName,
    companyName,
    mobile,
    email,
    adminUsername,
    password,
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
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_name')) {
      context.handle(
        _productNameMeta,
        productName.isAcceptableOrUnknown(
          data['product_name']!,
          _productNameMeta,
        ),
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
    if (data.containsKey('admin_username')) {
      context.handle(
        _adminUsernameMeta,
        adminUsername.isAcceptableOrUnknown(
          data['admin_username']!,
          _adminUsernameMeta,
        ),
      );
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  RegistrationDetail map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RegistrationDetail(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      productName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_name'],
      )!,
      companyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_name'],
      ),
      mobile: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mobile'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      adminUsername: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}admin_username'],
      ),
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
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
  final int id;
  final String productName;
  final String? companyName;
  final String? mobile;
  final String? email;
  final String? adminUsername;
  final String? password;
  const RegistrationDetail({
    required this.id,
    required this.productName,
    this.companyName,
    this.mobile,
    this.email,
    this.adminUsername,
    this.password,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_name'] = Variable<String>(productName);
    if (!nullToAbsent || companyName != null) {
      map['company_name'] = Variable<String>(companyName);
    }
    if (!nullToAbsent || mobile != null) {
      map['mobile'] = Variable<String>(mobile);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || adminUsername != null) {
      map['admin_username'] = Variable<String>(adminUsername);
    }
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String>(password);
    }
    return map;
  }

  RegistrationDetailsCompanion toCompanion(bool nullToAbsent) {
    return RegistrationDetailsCompanion(
      id: Value(id),
      productName: Value(productName),
      companyName: companyName == null && nullToAbsent
          ? const Value.absent()
          : Value(companyName),
      mobile: mobile == null && nullToAbsent
          ? const Value.absent()
          : Value(mobile),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      adminUsername: adminUsername == null && nullToAbsent
          ? const Value.absent()
          : Value(adminUsername),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
    );
  }

  factory RegistrationDetail.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RegistrationDetail(
      id: serializer.fromJson<int>(json['id']),
      productName: serializer.fromJson<String>(json['productName']),
      companyName: serializer.fromJson<String?>(json['companyName']),
      mobile: serializer.fromJson<String?>(json['mobile']),
      email: serializer.fromJson<String?>(json['email']),
      adminUsername: serializer.fromJson<String?>(json['adminUsername']),
      password: serializer.fromJson<String?>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productName': serializer.toJson<String>(productName),
      'companyName': serializer.toJson<String?>(companyName),
      'mobile': serializer.toJson<String?>(mobile),
      'email': serializer.toJson<String?>(email),
      'adminUsername': serializer.toJson<String?>(adminUsername),
      'password': serializer.toJson<String?>(password),
    };
  }

  RegistrationDetail copyWith({
    int? id,
    String? productName,
    Value<String?> companyName = const Value.absent(),
    Value<String?> mobile = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> adminUsername = const Value.absent(),
    Value<String?> password = const Value.absent(),
  }) => RegistrationDetail(
    id: id ?? this.id,
    productName: productName ?? this.productName,
    companyName: companyName.present ? companyName.value : this.companyName,
    mobile: mobile.present ? mobile.value : this.mobile,
    email: email.present ? email.value : this.email,
    adminUsername: adminUsername.present
        ? adminUsername.value
        : this.adminUsername,
    password: password.present ? password.value : this.password,
  );
  RegistrationDetail copyWithCompanion(RegistrationDetailsCompanion data) {
    return RegistrationDetail(
      id: data.id.present ? data.id.value : this.id,
      productName: data.productName.present
          ? data.productName.value
          : this.productName,
      companyName: data.companyName.present
          ? data.companyName.value
          : this.companyName,
      mobile: data.mobile.present ? data.mobile.value : this.mobile,
      email: data.email.present ? data.email.value : this.email,
      adminUsername: data.adminUsername.present
          ? data.adminUsername.value
          : this.adminUsername,
      password: data.password.present ? data.password.value : this.password,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RegistrationDetail(')
          ..write('id: $id, ')
          ..write('productName: $productName, ')
          ..write('companyName: $companyName, ')
          ..write('mobile: $mobile, ')
          ..write('email: $email, ')
          ..write('adminUsername: $adminUsername, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    productName,
    companyName,
    mobile,
    email,
    adminUsername,
    password,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegistrationDetail &&
          other.id == this.id &&
          other.productName == this.productName &&
          other.companyName == this.companyName &&
          other.mobile == this.mobile &&
          other.email == this.email &&
          other.adminUsername == this.adminUsername &&
          other.password == this.password);
}

class RegistrationDetailsCompanion extends UpdateCompanion<RegistrationDetail> {
  final Value<int> id;
  final Value<String> productName;
  final Value<String?> companyName;
  final Value<String?> mobile;
  final Value<String?> email;
  final Value<String?> adminUsername;
  final Value<String?> password;
  final Value<int> rowid;
  const RegistrationDetailsCompanion({
    this.id = const Value.absent(),
    this.productName = const Value.absent(),
    this.companyName = const Value.absent(),
    this.mobile = const Value.absent(),
    this.email = const Value.absent(),
    this.adminUsername = const Value.absent(),
    this.password = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RegistrationDetailsCompanion.insert({
    this.id = const Value.absent(),
    this.productName = const Value.absent(),
    this.companyName = const Value.absent(),
    this.mobile = const Value.absent(),
    this.email = const Value.absent(),
    this.adminUsername = const Value.absent(),
    this.password = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<RegistrationDetail> custom({
    Expression<int>? id,
    Expression<String>? productName,
    Expression<String>? companyName,
    Expression<String>? mobile,
    Expression<String>? email,
    Expression<String>? adminUsername,
    Expression<String>? password,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productName != null) 'product_name': productName,
      if (companyName != null) 'company_name': companyName,
      if (mobile != null) 'mobile': mobile,
      if (email != null) 'email': email,
      if (adminUsername != null) 'admin_username': adminUsername,
      if (password != null) 'password': password,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RegistrationDetailsCompanion copyWith({
    Value<int>? id,
    Value<String>? productName,
    Value<String?>? companyName,
    Value<String?>? mobile,
    Value<String?>? email,
    Value<String?>? adminUsername,
    Value<String?>? password,
    Value<int>? rowid,
  }) {
    return RegistrationDetailsCompanion(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      companyName: companyName ?? this.companyName,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      adminUsername: adminUsername ?? this.adminUsername,
      password: password ?? this.password,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (mobile.present) {
      map['mobile'] = Variable<String>(mobile.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (adminUsername.present) {
      map['admin_username'] = Variable<String>(adminUsername.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegistrationDetailsCompanion(')
          ..write('id: $id, ')
          ..write('productName: $productName, ')
          ..write('companyName: $companyName, ')
          ..write('mobile: $mobile, ')
          ..write('email: $email, ')
          ..write('adminUsername: $adminUsername, ')
          ..write('password: $password, ')
          ..write('rowid: $rowid')
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
          ..write('vchNumberingMode: $vchNumberingMode')
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
          other.vchNumberingMode == this.vchNumberingMode);
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
          ..write('vchNumberingMode: $vchNumberingMode')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $RegistrationDetailsTable registrationDetails =
      $RegistrationDetailsTable(this);
  late final $CompaniesTable companies = $CompaniesTable(this);
  late final CompanyDao companyDao = CompanyDao(this as AppDb);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    registrationDetails,
    companies,
  ];
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
typedef $$RegistrationDetailsTableCreateCompanionBuilder =
    RegistrationDetailsCompanion Function({
      Value<int> id,
      Value<String> productName,
      Value<String?> companyName,
      Value<String?> mobile,
      Value<String?> email,
      Value<String?> adminUsername,
      Value<String?> password,
      Value<int> rowid,
    });
typedef $$RegistrationDetailsTableUpdateCompanionBuilder =
    RegistrationDetailsCompanion Function({
      Value<int> id,
      Value<String> productName,
      Value<String?> companyName,
      Value<String?> mobile,
      Value<String?> email,
      Value<String?> adminUsername,
      Value<String?> password,
      Value<int> rowid,
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
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyName => $composableBuilder(
    column: $table.companyName,
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

  ColumnFilters<String> get adminUsername => $composableBuilder(
    column: $table.adminUsername,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
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
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyName => $composableBuilder(
    column: $table.companyName,
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

  ColumnOrderings<String> get adminUsername => $composableBuilder(
    column: $table.adminUsername,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mobile =>
      $composableBuilder(column: $table.mobile, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get adminUsername => $composableBuilder(
    column: $table.adminUsername,
    builder: (column) => column,
  );

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);
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
                Value<int> id = const Value.absent(),
                Value<String> productName = const Value.absent(),
                Value<String?> companyName = const Value.absent(),
                Value<String?> mobile = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> adminUsername = const Value.absent(),
                Value<String?> password = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RegistrationDetailsCompanion(
                id: id,
                productName: productName,
                companyName: companyName,
                mobile: mobile,
                email: email,
                adminUsername: adminUsername,
                password: password,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> productName = const Value.absent(),
                Value<String?> companyName = const Value.absent(),
                Value<String?> mobile = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> adminUsername = const Value.absent(),
                Value<String?> password = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RegistrationDetailsCompanion.insert(
                id: id,
                productName: productName,
                companyName: companyName,
                mobile: mobile,
                email: email,
                adminUsername: adminUsername,
                password: password,
                rowid: rowid,
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

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$RegistrationDetailsTableTableManager get registrationDetails =>
      $$RegistrationDetailsTableTableManager(_db, _db.registrationDetails);
  $$CompaniesTableTableManager get companies =>
      $$CompaniesTableTableManager(_db, _db.companies);
}
