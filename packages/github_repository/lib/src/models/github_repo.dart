import 'package:equatable/equatable.dart';

class GithubRepoEntity extends Equatable {
  const GithubRepoEntity({
    required this.ownerName,
    required this.repoName,
    required this.description,
    required this.language,
    required this.countStar,
    required this.countFork,
    required this.id,
    required this.avatarUrl,
    this.isOpen = false,
  });

  final int id;
  final String ownerName;
  final String repoName;
  final String description;
  final String language;
  final int countStar;
  final int countFork;
  final String avatarUrl;
  final bool isOpen;

  GithubRepoEntity copyWith({
    int? id,
    String? ownerName,
    String? repoName,
    String? description,
    String? language,
    int? countStar,
    int? countFork,
    String? avatarUrl,
    bool? isOpen,
  }) {
    return GithubRepoEntity(
      id: id ?? this.id,
      ownerName: ownerName ?? this.ownerName,
      repoName: repoName ?? this.repoName,
      description: description ?? this.description,
      language: language ?? this.language,
      countStar: countStar ?? this.countStar,
      countFork: countFork ?? this.countFork,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      isOpen: isOpen ?? this.isOpen,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      ownerName,
      repoName,
      description,
      language,
      countStar,
      countFork,
      avatarUrl,
      isOpen,
    ];
  }
}
