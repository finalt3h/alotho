import 'package:alo_tho/features/worker_search/data/models/service_category_model.dart';
import 'package:alo_tho/features/worker_search/data/models/worker_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workerDataSourceProvider = Provider<MockWorkerDataSource>(
  (ref) => const MockWorkerDataSource(),
);

class MockWorkerDataSource {
  const MockWorkerDataSource();

  Future<List<ServiceCategoryModel>> getServiceCategories() async {
    await Future<void>.delayed(const Duration(milliseconds: 450));

    return const [
      ServiceCategoryModel(
        id: 'electric',
        name: 'Dien',
        iconName: 'bolt',
        description: 'Sua dien gia dung, cham chich, aptomat.',
      ),
      ServiceCategoryModel(
        id: 'water',
        name: 'Nuoc',
        iconName: 'water_drop',
        description: 'Ong nuoc, ro ri, thiet bi ve sinh.',
      ),
      ServiceCategoryModel(
        id: 'aircon',
        name: 'Dien lanh',
        iconName: 'ac_unit',
        description: 'May lanh, tu lanh, may giat.',
      ),
      ServiceCategoryModel(
        id: 'appliance',
        name: 'Do gia dung',
        iconName: 'kitchen',
        description: 'Bep, may hut mui, lo vi song.',
      ),
      ServiceCategoryModel(
        id: 'painting',
        name: 'Son sua',
        iconName: 'format_paint',
        description: 'Son lai, tram tuong, xu ly tham.',
      ),
    ];
  }

  Future<List<WorkerModel>> getWorkers() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    return const [
      WorkerModel(
        id: 'worker-001',
        fullName: 'Le Van Khoa',
        age: 34,
        professionTitle: 'Tho dien dan dung',
        serviceCategoryId: 'electric',
        area: 'Quan 7',
        yearsOfExperience: 9,
        rating: 4.9,
        completedJobs: 312,
        distanceInKm: 1.8,
        priceDescription: 'Tu 150.000d',
        shortBio:
            'Chuyen cham chich, aptomat, day nguon va thiet bi dien trong nha.',
        avatarUrl: 'https://i.pravatar.cc/160?img=12',
      ),
      WorkerModel(
        id: 'worker-002',
        fullName: 'Pham Quoc Bao',
        age: 29,
        professionTitle: 'Tho nuoc nhanh gon',
        serviceCategoryId: 'water',
        area: 'Nha Be',
        yearsOfExperience: 6,
        rating: 4.7,
        completedJobs: 196,
        distanceInKm: 3.4,
        priceDescription: 'Tu 180.000d',
        shortBio: 'Xu ly ro ri, thong bon rua, lap dat thiet bi ve sinh.',
        avatarUrl: 'https://i.pravatar.cc/160?img=15',
      ),
      WorkerModel(
        id: 'worker-003',
        fullName: 'Do Duc Hai',
        age: 37,
        professionTitle: 'Tho dien lanh',
        serviceCategoryId: 'aircon',
        area: 'Thu Duc',
        yearsOfExperience: 11,
        rating: 4.9,
        completedJobs: 428,
        distanceInKm: 4.6,
        priceDescription: 'Tu 250.000d',
        shortBio: 'Ve sinh may lanh, bom ga, sua tu lanh va may giat inverter.',
        avatarUrl: 'https://i.pravatar.cc/160?img=53',
      ),
      WorkerModel(
        id: 'worker-004',
        fullName: 'Nguyen Anh Tuan',
        age: 31,
        professionTitle: 'Tho do gia dung',
        serviceCategoryId: 'appliance',
        area: 'Binh Thanh',
        yearsOfExperience: 7,
        rating: 4.8,
        completedJobs: 214,
        distanceInKm: 3.8,
        priceDescription: 'Tu 200.000d',
        shortBio: 'Sua bep tu, may nuoc nong, lo vi song va may hut mui.',
        avatarUrl: 'https://i.pravatar.cc/160?img=28',
      ),
      WorkerModel(
        id: 'worker-005',
        fullName: 'Vo Minh Tri',
        age: 41,
        professionTitle: 'Tho son hoan thien',
        serviceCategoryId: 'painting',
        area: 'Quan 4',
        yearsOfExperience: 13,
        rating: 4.8,
        completedJobs: 289,
        distanceInKm: 2.7,
        priceDescription: 'Bao gia theo hien trang',
        shortBio: 'Son tuong noi that, xu ly bong troc va tham am nhanh sach.',
        avatarUrl: 'https://i.pravatar.cc/160?img=8',
      ),
      WorkerModel(
        id: 'worker-006',
        fullName: 'Tran Huu Dat',
        age: 33,
        professionTitle: 'Tho ong nuoc am tuong',
        serviceCategoryId: 'water',
        area: 'Go Vap',
        yearsOfExperience: 8,
        rating: 4.8,
        completedJobs: 243,
        distanceInKm: 5.7,
        priceDescription: 'Tu 220.000d',
        shortBio:
            'Chuyen tim diem ro ngam, thay ong am tuong va chong tham wc.',
        avatarUrl: 'https://i.pravatar.cc/160?img=60',
      ),
      WorkerModel(
        id: 'worker-007',
        fullName: 'Nguyen Quoc Viet',
        age: 36,
        professionTitle: 'Tho ve sinh may lanh inverter',
        serviceCategoryId: 'aircon',
        area: 'Tan Binh',
        yearsOfExperience: 10,
        rating: 4.9,
        completedJobs: 351,
        distanceInKm: 6.2,
        priceDescription: 'Tu 280.000d',
        shortBio:
            'Ve sinh dinh ky, kiem tra yeu lanh va can chinh bo nong lanh.',
        avatarUrl: 'https://i.pravatar.cc/160?img=65',
      ),
    ];
  }
}
