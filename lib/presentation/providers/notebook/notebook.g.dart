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

String _$getUserNotebooksHash() => r'b57ebdbbfd761650c24313f4fcacd87e364426c3';

@ProviderFor(getNotebookByIdProvider)
const getNotebookByIdProviderProvider = GetNotebookByIdProviderFamily._();

final class GetNotebookByIdProviderProvider
    extends
        $FunctionalProvider<
          AsyncValue<NotebookById>,
          NotebookById,
          FutureOr<NotebookById>
        >
    with $FutureModifier<NotebookById>, $FutureProvider<NotebookById> {
  const GetNotebookByIdProviderProvider._({
    required GetNotebookByIdProviderFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getNotebookByIdProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getNotebookByIdProviderHash();

  @override
  String toString() {
    return r'getNotebookByIdProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<NotebookById> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<NotebookById> create(Ref ref) {
    final argument = this.argument as String;
    return getNotebookByIdProvider(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetNotebookByIdProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getNotebookByIdProviderHash() =>
    r'fc17f179cba2d33a86499b9dec5459e8bc1cb985';

final class GetNotebookByIdProviderFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<NotebookById>, String> {
  const GetNotebookByIdProviderFamily._()
    : super(
        retry: null,
        name: r'getNotebookByIdProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetNotebookByIdProviderProvider call(String id) =>
      GetNotebookByIdProviderProvider._(argument: id, from: this);

  @override
  String toString() => r'getNotebookByIdProviderProvider';
}
