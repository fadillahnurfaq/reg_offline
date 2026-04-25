import 'package:dartz/dartz.dart';
import 'package:register_offline/models/member/member_model.dart';

import '../utils/hive/hive_boxes.dart';
import '../utils/hive/hive_service.dart';

class MemberLocalService {
  Future<Either<String, List<MemberModel>>> getList() async {
    try {
      final box = await HiveService.getBox<MemberModel>(HiveBoxes.member);
      final datas = box.values.toList();
      return Right(datas);
    } catch (e) {
      return const Left("Terjadi kesalahan saat mengambil data, silahkan hubungi system admin.");
    }
  }
  
  Future<Either<String, void>> createOrEdit(MemberModel data) async {
    try {
      final box = await HiveService.getBox<MemberModel>(HiveBoxes.member);
      await box.put(data.userId, data.asNewObject());
      return const Right(null);
    } catch (e) {
      return const Left("Terjadi kesalahan saat menyimpan data, silahkan hubungi system admin.");
    }
  }

  Future<Either<String, void>> createBulkdOrEdit(List<MemberModel> datas) async {
    try {
      final box = await HiveService.getBox<MemberModel>(HiveBoxes.member);
      await box.putAll({for (var data in datas) data.userId: data.asNewObject()});
      return const Right(null);
    } catch (e) {
      return const Left("Terjadi kesalahan saat menyimpan data, silahkan hubungi system admin.");
    }
  }

  Future<Either<String, void>> remove(MemberModel data) async {
    try {
      final box = await HiveService.getBox<MemberModel>(HiveBoxes.member);
      await box.delete(data.userId);
      return const Right(null);
    } catch (e) {
      return const Left("Terjadi kesalahan saat menyimpan data, silahkan hubungi system admin.");
    }
  }
}