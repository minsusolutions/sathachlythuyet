import 'package:hive/hive.dart';
import 'package:sathachlaixe/screens/setting/domain/model/setting_liciense.dart';
import 'package:sathachlaixe/screens/setting/domain/repository/setting_repository.dart';
import 'package:sathachlaixe/screens/setting/service/hive_service.dart';

class LocalSettingRepository implements SettingRepository {
  LocalSettingRepository({required this.settingBox});

  final Box<dynamic> settingBox;
  // @override
  // Future<SettingLiciense> get currentLiciense =>
  //     Future.value(allLicienses.first);

  @override
  Future<SettingLiciense> get currentLiciense async {
    return SettingLiciense(
      title: 'title',
      description: 'description',
      image: 'image',
    );
  }

  @override
  Future<List<SettingLiciense>> get listLicienses => Future.value(allLicienses);

  var allLicienses = [
    const SettingLiciense(
      title: 'A1',
      description:
          "Lái xe mô tô hai bánh có dung tích xi-lanh đến 125cm3 hoặc có công suất động cơ điện đến 11kW.",
      image: 'assets/drawables/ic_motor.svg',
    ),
    const SettingLiciense(
      title: 'A',
      description:
          "Lái xe mô tô hai bánh có dung tích xi-lanh trên 125cm3 hoặc có công suất động cơ điện trên 11kw và lái xe hạng A1.",
      image: 'assets/drawables/ic_motor.svg',
    ),
    const SettingLiciense(
      title: 'B1',
      description: "Lái xe mô tô ba bánh và lái xe hạng A1.",
      image: 'assets/drawables/ic_sidecar.svg',
    ),
    const SettingLiciense(
      title: 'B',
      description:
          "Lái xe ô tô chở người đến 8 chỗ ngồi (không kể chỗ lái xe); xe ô tô tải và chuyên dùng đến 3.500km; xe có kéo rơ moóc đến 750kg.",
      image: 'assets/drawables/ic_car.svg',
    ),
    const SettingLiciense(
      title: 'C1',
      description:
          "Lái xe ô tô tải và chuyên dùng trên 3.500kg đến 7.500kg; xe có kéo rơ moóc đến 750kg; và lái xe hạng B.",
      image: 'assets/drawables/ic_car.svg',
    ),
    const SettingLiciense(
      title: 'C',
      description:
          "Lái xe ô tô tải và chuyên dùng trên 7.500kg; xe có kéo rơ moóc đến 750kg; và lái xe hạng B và C1.",
      image: 'assets/drawables/ic_car.svg',
    ),
    const SettingLiciense(
      title: 'D1',
      description:
          "Lái xe ô tô chở người trên 08 chỗ đến 16 chỗ (không kể chỗ lãi xe), xe kéo rơ moóc đến 750kg; và lái xe các hạng B, C1, C.",
      image: 'assets/drawables/ic_car.svg',
    ),
    const SettingLiciense(
      title: 'D2',
      description:
          "Lái xe ô tô chở người (kể cả xe buýt) trên 16 chỗ đến 29 chỗ (không kể chỗ lái xe), xe kéo rơ moóc đến 750kg; và lái xe các hạng B, C1, C, D1.",
      image: 'assets/drawables/ic_car.svg',
    ),
    const SettingLiciense(
      title: 'D',
      description:
          "Lái xe ô tô chở người (kể cả xe buýt) trên 29 chỗ (không kể chỗ lái xe); xe giường nằm; xe kéo rơ moóc đến 750kg; và lái xe các hạng B, C1, C, D1, D2.",
      image: 'assets/drawables/ic_car.svg',
    ),
    const SettingLiciense(
      title: 'BE',
      description: "Lái xe hạng B kéo rơ moóc trên 750kg.",
      image: 'assets/drawables/ic_car.svg',
    ),
    const SettingLiciense(
      title: 'C1E',
      description: "Lái xe hạng C1 kéo rơ moóc trên 750kg.",
      image: 'assets/drawables/ic_car.svg',
    ),
    const SettingLiciense(
      title: 'CE',
      description:
          "Lái xe hạng C kéo rơ moóc trên 750kg, xe ô tô đầu kéo kéo sơ mi rơ moóc.",
      image: 'assets/drawables/ic_car.svg',
    ),
    const SettingLiciense(
      title: 'D1E',
      description: "Lái xe hạng D1 kéo rơ moóc trên 750kg.",
      image: 'assets/drawables/ic_car.svg',
    ),
    const SettingLiciense(
      title: 'D2E',
      description: "Lái xe hạng D2 kéo rơ moóc trên 750kg.",
      image: 'assets/drawables/ic_car.svg',
    ),
    const SettingLiciense(
      title: 'DE',
      description:
          "Lái xe hạng D kéo rơ moóc trên 750kg; xe ô tô chở khách nối toa.",
      image: 'assets/drawables/ic_car.svg',
    ),
  ];
}
