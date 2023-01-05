import 'package:equatable/equatable.dart';
import 'package:github_repository/github_repository.dart';

enum GithubTrendingStatus { initial, loading, success, failure }

class GithubTrendingState extends Equatable {
  const GithubTrendingState.__({
    this.githubTrendingStatus = GithubTrendingStatus.initial,
    this.githubRepoEntity,
    this.value = 0,
  });

  const GithubTrendingState.initial() : this.__();

  const GithubTrendingState.loading()
      : this.__(githubTrendingStatus: GithubTrendingStatus.loading);

  const GithubTrendingState.success({
    required List<GithubRepoEntity> githubRepoEntity,
  }) : this.__(
          githubTrendingStatus: GithubTrendingStatus.success,
          githubRepoEntity: githubRepoEntity,
        );

  const GithubTrendingState.failure()
      : this.__(githubTrendingStatus: GithubTrendingStatus.failure);

  final GithubTrendingStatus githubTrendingStatus;
  final List<GithubRepoEntity>? githubRepoEntity;
  final int value;

  GithubTrendingState copyWith({
    GithubTrendingStatus? githubTrendingStatus,
    List<GithubRepoEntity>? githubRepoEntity,
    int? value,
  }) {
    return GithubTrendingState.__(
      githubTrendingStatus: githubTrendingStatus ?? this.githubTrendingStatus,
      githubRepoEntity: githubRepoEntity ?? this.githubRepoEntity,
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [githubTrendingStatus, githubRepoEntity, value];
}
