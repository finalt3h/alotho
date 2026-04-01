import 'package:alo_tho/features/home/data/models/work_listing_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myWorkDataSourceProvider = Provider<MockMyWorkDataSource>(
  (ref) => const MockMyWorkDataSource(),
);

class MockMyWorkDataSource {
  const MockMyWorkDataSource();

  Future<List<WorkListingModel>> getMyWorkListings() async {
    await Future<void>.delayed(const Duration(milliseconds: 420));

    return [
      WorkListingModel(
        id: 'listing-001',
        title: 'Tho dien lanh co mat nhanh tai Quan 7',
        categoryName: 'Dien lanh',
        area: 'Quan 7',
        visibleInCategory: 'Top goi y theo khu vuc',
        viewCount: 184,
        contactCount: 27,
        postedAt: DateTime.now().subtract(const Duration(hours: 5)),
        statusLabel: 'Dang hien thi tot',
      ),
      WorkListingModel(
        id: 'listing-002',
        title: 'Nhan sua ro ri nuoc, thong bon rua trong ngay',
        categoryName: 'Nuoc',
        area: 'Nha Be',
        visibleInCategory: 'Danh muc Nuoc',
        viewCount: 97,
        contactCount: 14,
        postedAt: DateTime.now().subtract(const Duration(hours: 19)),
        statusLabel: 'On dinh',
      ),
      WorkListingModel(
        id: 'listing-003',
        title: 'Sua bep tu, may nuoc nong tan noi',
        categoryName: 'Do gia dung',
        area: 'Binh Thanh',
        visibleInCategory: 'Danh muc Gia dung',
        viewCount: 72,
        contactCount: 9,
        postedAt: DateTime.now().subtract(const Duration(days: 2, hours: 2)),
        statusLabel: 'Can tang tuong tac',
      ),
      WorkListingModel(
        id: 'listing-004',
        title: 'Nhan son lai can ho, xu ly tuong am moc',
        categoryName: 'Son sua',
        area: 'Thu Duc',
        visibleInCategory: 'Top goi y theo khu vuc',
        viewCount: 58,
        contactCount: 6,
        postedAt: DateTime.now().subtract(const Duration(days: 3, hours: 6)),
        statusLabel: 'On dinh',
      ),
    ];
  }
}
