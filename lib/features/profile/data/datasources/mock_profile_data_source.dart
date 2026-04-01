import 'package:alo_tho/features/auth/data/models/user_model.dart';
import 'package:alo_tho/features/profile/data/models/profile_summary_model.dart';
import 'package:alo_tho/features/worker_search/data/models/worker_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileDataSourceProvider = Provider<MockProfileDataSource>(
  (ref) => const MockProfileDataSource(),
);

class MockProfileDataSource {
  const MockProfileDataSource();

  Future<ProfileSummaryModel> getProfileSummary() async {
    await Future<void>.delayed(const Duration(milliseconds: 380));

    return ProfileSummaryModel(
      user: UserModel(
        id: 'user-001',
        fullName: 'Nguyen Minh Anh',
        phoneNumber: '0912345678',
        city: 'Quan 7, TP. Ho Chi Minh',
        isWorker: true,
        avatarUrl: 'https://i.pravatar.cc/160?img=32',
        joinedAt: DateTime(2024, 5, 18),
      ),
      workerProfile: const WorkerModel(
        id: 'worker-profile-001',
        fullName: 'Nguyen Minh Anh',
        age: 30,
        professionTitle: 'Tho da nang',
        serviceCategoryId: 'appliance',
        area: 'Quan 7',
        yearsOfExperience: 6,
        rating: 4.9,
        completedJobs: 143,
        distanceInKm: 2.1,
        priceDescription: 'Bao gia theo dich vu',
        shortBio:
            'Nhan cac cong viec sua do gia dung va ho tro lap dat co ban.',
        avatarUrl: 'https://i.pravatar.cc/160?img=32',
      ),
      isKycSubmitted: true,
      isKycApproved: true,
    );
  }
}
