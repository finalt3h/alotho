import 'package:alo_tho/core/utils/copy_with.dart';
import 'package:alo_tho/features/home/domain/entities/work_listing.dart';

class MyWorkState {
  const MyWorkState({
    this.isLoading = true,
    this.errorMessage,
    this.listings = const [],
  });

  final bool isLoading;
  final String? errorMessage;
  final List<WorkListing> listings;

  MyWorkState copyWith({
    bool? isLoading,
    Object? errorMessage = copyWithUnchanged,
    List<WorkListing>? listings,
  }) {
    return MyWorkState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: copyWithNullable<String>(errorMessage, this.errorMessage),
      listings: listings ?? this.listings,
    );
  }
}
