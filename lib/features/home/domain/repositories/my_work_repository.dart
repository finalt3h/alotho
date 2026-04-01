import 'package:alo_tho/core/result/result.dart';
import 'package:alo_tho/features/home/domain/entities/work_listing.dart';

abstract interface class MyWorkRepository {
  Future<Result<List<WorkListing>>> getMyWorkListings();
}
