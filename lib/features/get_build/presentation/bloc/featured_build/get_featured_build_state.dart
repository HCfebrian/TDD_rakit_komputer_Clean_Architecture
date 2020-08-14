part of 'get_featured_build_bloc.dart';

@immutable
abstract class FeaturedBuildState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class EmptyFeatured extends FeaturedBuildState {}

class LoadingFeatured extends FeaturedBuildState {}

class LoadedFeatured extends FeaturedBuildState {
  final BuildEntity featuredBuild;

  LoadedFeatured({@required this.featuredBuild});

  @override
  List<Object> get props => [featuredBuild];
}

class ErrorFeatured extends FeaturedBuildState {
  final String message;

  ErrorFeatured({@required this.message});
}
