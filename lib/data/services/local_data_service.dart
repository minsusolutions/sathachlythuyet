import 'package:sathach/domain/models/home/home_item.dart';
import 'package:sathach/domain/models/liciense.dart';

import '../../routing/router.dart';

class LocalDataService {
  List<HomeItem> getHomeItems() {
    return [
      HomeItem(
        order: 0,
        homeItemType: HomeItemType.random,
        route: Routes.exam,
        imgUrl: 'assets/icons/ic_random.svg',
      ),
      HomeItem(
        order: 1,
        homeItemType: HomeItemType.examSets,
        route: Routes.examSets,
        imgUrl: 'assets/icons/ic_sets.svg',
      ),
      HomeItem(
        order: 2,
        homeItemType: HomeItemType.wrongAnswers,
        route: Routes.wrongAnswers,
        imgUrl: 'assets/icons/ic_wrong.svg',
      ),
      HomeItem(
        order: 3,
        homeItemType: HomeItemType.revise,
        route: Routes.revise,
        imgUrl: 'assets/icons/ic_revise.svg',
      ),
      HomeItem(
        order: 4,
        homeItemType: HomeItemType.signs,
        route: Routes.signs,
        imgUrl: 'assets/icons/ic_signs.svg',
      ),
      HomeItem(
        order: 5,
        homeItemType: HomeItemType.tips,
        route: Routes.tips,
        imgUrl: 'assets/icons/ic_tips.svg',
      ),
      HomeItem(
        order: 6,
        homeItemType: HomeItemType.deadQuestions,
        route: Routes.deadQuestions,
        imgUrl: 'assets/icons/ic_dead.svg',
      ),
      HomeItem(
        order: 7,
        homeItemType: HomeItemType.top50Wrong,
        route: Routes.top50WrongAnswers,
        imgUrl: 'assets/icons/ic_top50.svg',
      ),
      HomeItem(
        order: 8,
        homeItemType: HomeItemType.top50Wrong,
        route: Routes.deadQuestions,
        imgUrl: 'assets/icons/ic_top50.svg',
      ),
      HomeItem(
        order: 9,
        homeItemType: HomeItemType.top50Wrong,
        route: Routes.top50WrongAnswers,
        imgUrl: 'assets/icons/ic_top50.svg',
      ),
    ];
  }

  List<Liciense> getLicenseList() {
    return [
      Liciense(
        licienseType: LicienseType.a1,
        vehicleType: VehicleType.motor,
        examCode: 1,
        examSetCode: ExamSetCode.s200,
      ),
      Liciense(
        licienseType: LicienseType.a,
        vehicleType: VehicleType.motor,
        examCode: 10,
        examSetCode: ExamSetCode.s450,
      ),
      Liciense(
        licienseType: LicienseType.b1,
        vehicleType: VehicleType.sideCar,
        examCode: 11,
        examSetCode: ExamSetCode.s500,
      ),
      Liciense(
        licienseType: LicienseType.b,
        vehicleType: VehicleType.car,
        examCode: 6,
        examSetCode: ExamSetCode.s600,
      ),
      Liciense(
        licienseType: LicienseType.c1,
        vehicleType: VehicleType.car,
        examCode: 12,
        examSetCode: ExamSetCode.s600,
      ),
      Liciense(
        licienseType: LicienseType.c,
        vehicleType: VehicleType.car,
        examCode: 7,
        examSetCode: ExamSetCode.s600,
      ),
      Liciense(
        licienseType: LicienseType.d1,
        vehicleType: VehicleType.car,
        examCode: 8,
        examSetCode: ExamSetCode.s600,
      ),
      Liciense(
        licienseType: LicienseType.d2,
        vehicleType: VehicleType.car,
        examCode: 8,
        examSetCode: ExamSetCode.s600,
      ),
      Liciense(
        licienseType: LicienseType.d,
        vehicleType: VehicleType.car,
        examCode: 8,
        examSetCode: ExamSetCode.s600,
      ),
      Liciense(
        licienseType: LicienseType.be,
        vehicleType: VehicleType.car,
        examCode: 8,
        examSetCode: ExamSetCode.s600,
      ),
      Liciense(
        licienseType: LicienseType.c1e,
        vehicleType: VehicleType.car,
        examCode: 8,
        examSetCode: ExamSetCode.s600,
      ),
      Liciense(
        licienseType: LicienseType.ce,
        vehicleType: VehicleType.car,
        examCode: 8,
        examSetCode: ExamSetCode.s600,
      ),
      Liciense(
        licienseType: LicienseType.d1e,
        vehicleType: VehicleType.car,
        examCode: 8,
        examSetCode: ExamSetCode.s600,
      ),
      Liciense(
        licienseType: LicienseType.d2e,
        vehicleType: VehicleType.car,
        examCode: 8,
        examSetCode: ExamSetCode.s600,
      ),
      Liciense(
        licienseType: LicienseType.de,
        vehicleType: VehicleType.car,
        examCode: 8,
        examSetCode: ExamSetCode.s600,
      ),
    ];
  }
}
