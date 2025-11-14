// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(themeRepo)
const themeRepoProvider = ThemeRepoProvider._();

final class ThemeRepoProvider
    extends
        $FunctionalProvider<
          AsyncValue<ThemeRepository>,
          ThemeRepository,
          FutureOr<ThemeRepository>
        >
    with $FutureModifier<ThemeRepository>, $FutureProvider<ThemeRepository> {
  const ThemeRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeRepoHash();

  @$internal
  @override
  $FutureProviderElement<ThemeRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ThemeRepository> create(Ref ref) {
    return themeRepo(ref);
  }
}

String _$themeRepoHash() => r'3566f3b86a1d497892b286516437f55eb886e9ea';
