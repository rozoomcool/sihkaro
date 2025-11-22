// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notebook.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUserNotebooks)
const getUserNotebooksProvider = GetUserNotebooksProvider._();

final class GetUserNotebooksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Notebook>>,
          List<Notebook>,
          FutureOr<List<Notebook>>
        >
    with $FutureModifier<List<Notebook>>, $FutureProvider<List<Notebook>> {
  const GetUserNotebooksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUserNotebooksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUserNotebooksHash();

  @$internal
  @override
  $FutureProviderElement<List<Notebook>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Notebook>> create(Ref ref) {
    return getUserNotebooks(ref);
  }
}

String _$getUserNotebooksHash() => r'b3931c28628cd1471c097b41b28857f41795b274';
