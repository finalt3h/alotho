import 'dart:math' as math;

import 'package:alo_tho/core/constants/app_spacing.dart';
import 'package:alo_tho/core/l10n/app_localizations.dart';
import 'package:alo_tho/core/preview/app_preview.dart';
import 'package:alo_tho/core/widgets/app_error_view.dart';
import 'package:alo_tho/core/widgets/app_loading_state.dart';
import 'package:alo_tho/core/widgets/app_page_body.dart';
import 'package:alo_tho/features/worker_search/domain/entities/worker.dart';
import 'package:alo_tho/features/worker_search/presentation/viewmodels/worker_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widget_previews.dart';

const _pageBackground = Color(0xFFFCF9F8);
const _cardBackground = Colors.white;
const _softCardBackground = Color(0xFFF6F3F2);
const _primaryText = Color(0xFF1B1C1C);
const _secondaryText = Color(0xFF5A4136);
const _accent = Color(0xFFA04100);
const _accentSoft = Color(0x33FE9A69);
const _accentBorder = Color(0x4DFE9A69);
const _mapOverlay = Color(0xE6FCF9F8);
const _starColor = Color(0xFFF3B400);

@Preview(
  group: 'Screens',
  name: 'Worker Detail Pag',
  size: phonePreviewSize,
  wrapper: appPreviewWrapper,
)
Widget previewWorkerDetailPage() =>
    const WorkerDetailPage(workerId: 'worker-003');

class WorkerDetailPage extends ConsumerWidget {
  const WorkerDetailPage({required this.workerId, super.key});

  final String workerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final state = ref.watch(workerDetailControllerProvider(workerId));
    final controller = ref.read(
      workerDetailControllerProvider(workerId).notifier,
    );

    return Scaffold(
      backgroundColor: _pageBackground,
      appBar: AppBar(
        backgroundColor: _pageBackground,
        foregroundColor: _primaryText,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: const SizedBox.shrink(),
      ),
      body: AppPageBody(
        child: switch ((state.isLoading, state.errorMessage, state.worker)) {
          (true, _, _) => _StateScrollView(
            child: AppLoadingState(
              title: l10n.workerDetailTitle,
              description: l10n.workerSearchSubtitle,
            ),
          ),
          (false, final error?, _) => _StateScrollView(
            child: AppErrorView(
              message: error,
              onRetry: controller.load,
              title: l10n.workerDetailTitle,
            ),
          ),
          (false, _, final worker?) => RefreshIndicator(
            color: _accent,
            onRefresh: controller.load,
            child: _WorkerDetailContent(worker: worker),
          ),
          _ => _StateScrollView(
            child: AppErrorView(
              message: l10n.workerDetailUnavailableMessage,
              onRetry: controller.load,
              title: l10n.workerDetailTitle,
            ),
          ),
        },
      ),
    );
  }
}

class _WorkerDetailContent extends StatelessWidget {
  const _WorkerDetailContent({required this.worker});

  final Worker worker;

  @override
  Widget build(BuildContext context) {
    final fixture = _WorkerDetailFixture.fromWorker(context.l10n, worker);

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
      children: [
        _HeroHeader(worker: worker, fixture: fixture),
        const SizedBox(height: 28),
        _PricingSection(fixture: fixture),
        const SizedBox(height: 24),
        _LocationSection(locationLabel: fixture.locationLabel),
        const SizedBox(height: 24),
        _PortfolioSection(fixture: fixture),
        const SizedBox(height: 24),
        _ReviewSection(fixture: fixture),
      ],
    );
  }
}

class _HeroHeader extends StatelessWidget {
  const _HeroHeader({required this.worker, required this.fixture});

  final Worker worker;
  final _WorkerDetailFixture fixture;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: _cardBackground,
        borderRadius: BorderRadius.circular(AppRadius.xxxl),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -64,
            right: -64,
            child: Container(
              width: 128,
              height: 128,
              decoration: const BoxDecoration(
                color: Color(0x0DA04100),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Column(
            children: [
              _ProfileAvatar(worker: worker),
              const SizedBox(height: 16),
              Text(
                fixture.displayName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: _primaryText,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.6,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star_rounded, color: _starColor, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    worker.rating.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: _primaryText,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    fixture.reviewCountLabel,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: _secondaryText),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      value: context.l10n.workerDetailExperienceValue(
                        worker.yearsOfExperience,
                      ),
                      label: context.l10n.workerDetailExperienceLabel,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      value: '${worker.completedJobs}+',
                      label: context.l10n.workerDetailJobsLabel,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({required this.worker});

  final Worker worker;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112,
      height: 112,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFF1D2C1)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33A04100),
                  blurRadius: 0,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipOval(
              child: worker.avatarUrl != null && worker.avatarUrl!.isNotEmpty
                  ? Image.network(
                      worker.avatarUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _AvatarFallback(name: worker.fullName),
                    )
                  : _AvatarFallback(name: worker.fullName),
            ),
          ),
          Positioned(
            right: 4,
            bottom: 4,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: const Color(0xFF0062A1),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.verified_rounded,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AvatarFallback extends StatelessWidget {
  const _AvatarFallback({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final initials = name
        .trim()
        .split(' ')
        .where((part) => part.isNotEmpty)
        .take(2)
        .map((part) => part.characters.first.toUpperCase())
        .join();

    return Container(
      color: const Color(0xFFF5E9E2),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: _accent,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 84),
      decoration: BoxDecoration(
        color: _softCardBackground,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: _accent,
              fontWeight: FontWeight.w900,
              fontSize: AppTextSize.headline,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: _secondaryText,
              fontWeight: FontWeight.w800,
              fontSize: AppTextSize.eyebrow,
              height: 1.1,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _PricingSection extends StatelessWidget {
  const _PricingSection({required this.fixture});

  final _WorkerDetailFixture fixture;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: _SectionHeading(
                title: context.l10n.workerDetailServicesAndPricing,
              ),
            ),
            Text(
              fixture.priceLabel,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: _accent,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final label in fixture.serviceLabels)
              _ServiceChip(label: label),
          ],
        ),
      ],
    );
  }
}

class _ServiceChip extends StatelessWidget {
  const _ServiceChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: _accentSoft,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: _accentBorder),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: const Color(0xFF763006),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _LocationSection extends StatelessWidget {
  const _LocationSection({required this.locationLabel});

  final String locationLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeading(title: context.l10n.workerDetailActivityArea),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.xxxl),
          child: SizedBox(
            height: 128,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/worker_detail/map_location.png',
                  fit: BoxFit.cover,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: _mapOverlay,
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                      border: Border.all(color: const Color(0x33E2BFB0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: Color(0xFFAD5C33),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          locationLabel,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: _primaryText,
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PortfolioSection extends StatelessWidget {
  const _PortfolioSection({required this.fixture});

  final _WorkerDetailFixture fixture;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _SectionHeading(title: context.l10n.workerDetailPortfolio),
            ),
            Text(
              context.l10n.workerDetailSeeAll,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: _accent,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            for (
              var index = 0;
              index < fixture.portfolioAssets.length;
              index++
            ) ...[
              Expanded(
                child: _PortfolioTile(
                  assetPath: fixture.portfolioAssets[index],
                  overlayLabel: index == fixture.portfolioAssets.length - 1
                      ? fixture.extraPortfolioCountLabel
                      : null,
                ),
              ),
              if (index < fixture.portfolioAssets.length - 1)
                const SizedBox(width: 8),
            ],
          ],
        ),
      ],
    );
  }
}

class _PortfolioTile extends StatelessWidget {
  const _PortfolioTile({required this.assetPath, this.overlayLabel});

  final String assetPath;
  final String? overlayLabel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(assetPath, fit: BoxFit.cover),
            if (overlayLabel != null)
              Container(
                color: Colors.black.withValues(alpha: 0.28),
                alignment: Alignment.center,
                child: Text(
                  overlayLabel!,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ReviewSection extends StatelessWidget {
  const _ReviewSection({required this.fixture});

  final _WorkerDetailFixture fixture;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeading(title: context.l10n.workerDetailReviewsTitle),
        const SizedBox(height: 16),
        for (final review in fixture.reviews) ...[
          _ReviewCard(review: review),
          if (review != fixture.reviews.last) const SizedBox(height: 12),
        ],
      ],
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.review});

  final _ReviewData review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _softCardBackground,
        borderRadius: BorderRadius.circular(AppRadius.xxxl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.asset(
                  review.avatarAsset,
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.reviewerName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: _primaryText,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: List.generate(
                        5,
                        (_) => const Padding(
                          padding: EdgeInsets.only(right: 2),
                          child: Icon(
                            Icons.star_rounded,
                            size: 12,
                            color: _starColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Text(
                review.timeAgo,
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(color: _secondaryText),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            review.content,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: _primaryText.withValues(alpha: 0.82),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: _secondaryText,
        fontWeight: FontWeight.w900,
        letterSpacing: 1.8,
      ),
    );
  }
}

class _StateScrollView extends StatelessWidget {
  const _StateScrollView({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      children: [child],
    );
  }
}

class _WorkerDetailFixture {
  const _WorkerDetailFixture({
    required this.displayName,
    required this.reviewCount,
    required this.reviewCountLabel,
    required this.priceLabel,
    required this.locationLabel,
    required this.serviceLabels,
    required this.portfolioAssets,
    required this.extraPortfolioCount,
    required this.extraPortfolioCountLabel,
    required this.reviews,
  });

  factory _WorkerDetailFixture.fromWorker(
    AppLocalizations l10n,
    Worker worker,
  ) {
    final reviewCount = math.max(32, (worker.completedJobs * 0.56).round());
    return _WorkerDetailFixture(
      displayName: l10n.workerShortName(worker.fullName),
      reviewCount: reviewCount,
      reviewCountLabel: l10n.workerDetailReviewCount(reviewCount),
      priceLabel: l10n.priceDescription(worker.priceDescription),
      locationLabel: l10n.workerDetailLocationForArea(worker.area),
      serviceLabels: l10n.workerDetailServiceLabels(worker.serviceCategoryId),
      portfolioAssets: const [
        'assets/worker_detail/portfolio_1.png',
        'assets/worker_detail/portfolio_2.png',
        'assets/worker_detail/portfolio_3.png',
        'assets/worker_detail/portfolio_4.png',
      ],
      extraPortfolioCount: 12,
      extraPortfolioCountLabel: l10n.workerDetailExtraPortfolio(12),
      reviews: [
        _ReviewData(
          reviewerName: l10n.reviewAuthorMinhHoang,
          timeAgo: l10n.reviewTimeTwoDaysAgo,
          content: l10n.reviewContentOne,
          avatarAsset: 'assets/worker_detail/reviewer_1.png',
        ),
        _ReviewData(
          reviewerName: l10n.reviewAuthorThanhHuong,
          timeAgo: l10n.reviewTimeOneWeekAgo,
          content: l10n.reviewContentTwo,
          avatarAsset: 'assets/worker_detail/reviewer_2.png',
        ),
      ],
    );
  }

  final String displayName;
  final int reviewCount;
  final String reviewCountLabel;
  final String priceLabel;
  final String locationLabel;
  final List<String> serviceLabels;
  final List<String> portfolioAssets;
  final int extraPortfolioCount;
  final String extraPortfolioCountLabel;
  final List<_ReviewData> reviews;
}

class _ReviewData {
  const _ReviewData({
    required this.reviewerName,
    required this.timeAgo,
    required this.content,
    required this.avatarAsset,
  });

  final String reviewerName;
  final String timeAgo;
  final String content;
  final String avatarAsset;
}
