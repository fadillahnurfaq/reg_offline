// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemberModelAdapter extends TypeAdapter<MemberModel> {
  @override
  final typeId = 0;

  @override
  MemberModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemberModel(
      id: fields[0] == null ? 0 : (fields[0] as num).toInt(),
      userId: fields[1] == null ? '' : fields[1] as String,
      fullName: fields[2] == null ? '' : fields[2] as String,
      nik: fields[3] == null ? '' : fields[3] as String,
      phoneNumber: fields[4] == null ? '' : fields[4] as String,
      primaryIdentityPhotoUrl: fields[5] == null ? '' : fields[5] as String,
      secondaryIdentityPhotoUrl: fields[6] == null ? '' : fields[6] as String,
      birthPlace: fields[7] as String?,
      birthDate: fields[8] as DateTime?,
      gender: fields[9] as String?,
      status: fields[10] as String?,
      occupation: fields[11] as String?,
      province: fields[12] as String?,
      city: fields[13] as String?,
      district: fields[14] as String?,
      subDistrict: fields[15] as String?,
      postalCode: fields[16] as String?,
      address: fields[17] as String?,
      primaryIndentityPhotoPath: fields[18] as String?,
      secondaryIndentityPhotoPath: fields[19] as String?,
      syncType: fields[20] == null
          ? MemberSyncType.draft
          : fields[20] as MemberSyncType,
    );
  }

  @override
  void write(BinaryWriter writer, MemberModel obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.nik)
      ..writeByte(4)
      ..write(obj.phoneNumber)
      ..writeByte(5)
      ..write(obj.primaryIdentityPhotoUrl)
      ..writeByte(6)
      ..write(obj.secondaryIdentityPhotoUrl)
      ..writeByte(7)
      ..write(obj.birthPlace)
      ..writeByte(8)
      ..write(obj.birthDate)
      ..writeByte(9)
      ..write(obj.gender)
      ..writeByte(10)
      ..write(obj.status)
      ..writeByte(11)
      ..write(obj.occupation)
      ..writeByte(12)
      ..write(obj.province)
      ..writeByte(13)
      ..write(obj.city)
      ..writeByte(14)
      ..write(obj.district)
      ..writeByte(15)
      ..write(obj.subDistrict)
      ..writeByte(16)
      ..write(obj.postalCode)
      ..writeByte(17)
      ..write(obj.address)
      ..writeByte(18)
      ..write(obj.primaryIndentityPhotoPath)
      ..writeByte(19)
      ..write(obj.secondaryIndentityPhotoPath)
      ..writeByte(20)
      ..write(obj.syncType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MemberSyncTypeAdapter extends TypeAdapter<MemberSyncType> {
  @override
  final typeId = 1;

  @override
  MemberSyncType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MemberSyncType.draft;
      case 1:
        return MemberSyncType.uploaded;
      default:
        return MemberSyncType.draft;
    }
  }

  @override
  void write(BinaryWriter writer, MemberSyncType obj) {
    switch (obj) {
      case MemberSyncType.draft:
        writer.writeByte(0);
      case MemberSyncType.uploaded:
        writer.writeByte(1);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberSyncTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
