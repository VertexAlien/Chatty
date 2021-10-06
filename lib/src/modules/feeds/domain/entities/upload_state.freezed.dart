// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'upload_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UploadStateTearOff {
  const _$UploadStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _ImgPicked imgPicked(String path) {
    return _ImgPicked(
      path,
    );
  }

// ignore: unused_element
  _Success success(String url) {
    return _Success(
      url,
    );
  }

// ignore: unused_element
  _Failed failed() {
    return const _Failed();
  }
}

/// @nodoc
// ignore: unused_element
const $UploadState = _$UploadStateTearOff();

/// @nodoc
mixin _$UploadState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult imgPicked(String path),
    @required TResult success(String url),
    @required TResult failed(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult imgPicked(String path),
    TResult success(String url),
    TResult failed(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult imgPicked(_ImgPicked value),
    @required TResult success(_Success value),
    @required TResult failed(_Failed value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult imgPicked(_ImgPicked value),
    TResult success(_Success value),
    TResult failed(_Failed value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $UploadStateCopyWith<$Res> {
  factory $UploadStateCopyWith(
          UploadState value, $Res Function(UploadState) then) =
      _$UploadStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UploadStateCopyWithImpl<$Res> implements $UploadStateCopyWith<$Res> {
  _$UploadStateCopyWithImpl(this._value, this._then);

  final UploadState _value;
  // ignore: unused_field
  final $Res Function(UploadState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$UploadStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'UploadState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult imgPicked(String path),
    @required TResult success(String url),
    @required TResult failed(),
  }) {
    assert(initial != null);
    assert(imgPicked != null);
    assert(success != null);
    assert(failed != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult imgPicked(String path),
    TResult success(String url),
    TResult failed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult imgPicked(_ImgPicked value),
    @required TResult success(_Success value),
    @required TResult failed(_Failed value),
  }) {
    assert(initial != null);
    assert(imgPicked != null);
    assert(success != null);
    assert(failed != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult imgPicked(_ImgPicked value),
    TResult success(_Success value),
    TResult failed(_Failed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UploadState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$ImgPickedCopyWith<$Res> {
  factory _$ImgPickedCopyWith(
          _ImgPicked value, $Res Function(_ImgPicked) then) =
      __$ImgPickedCopyWithImpl<$Res>;
  $Res call({String path});
}

/// @nodoc
class __$ImgPickedCopyWithImpl<$Res> extends _$UploadStateCopyWithImpl<$Res>
    implements _$ImgPickedCopyWith<$Res> {
  __$ImgPickedCopyWithImpl(_ImgPicked _value, $Res Function(_ImgPicked) _then)
      : super(_value, (v) => _then(v as _ImgPicked));

  @override
  _ImgPicked get _value => super._value as _ImgPicked;

  @override
  $Res call({
    Object path = freezed,
  }) {
    return _then(_ImgPicked(
      path == freezed ? _value.path : path as String,
    ));
  }
}

/// @nodoc
class _$_ImgPicked implements _ImgPicked {
  const _$_ImgPicked(this.path) : assert(path != null);

  @override
  final String path;

  @override
  String toString() {
    return 'UploadState.imgPicked(path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ImgPicked &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(path);

  @override
  _$ImgPickedCopyWith<_ImgPicked> get copyWith =>
      __$ImgPickedCopyWithImpl<_ImgPicked>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult imgPicked(String path),
    @required TResult success(String url),
    @required TResult failed(),
  }) {
    assert(initial != null);
    assert(imgPicked != null);
    assert(success != null);
    assert(failed != null);
    return imgPicked(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult imgPicked(String path),
    TResult success(String url),
    TResult failed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (imgPicked != null) {
      return imgPicked(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult imgPicked(_ImgPicked value),
    @required TResult success(_Success value),
    @required TResult failed(_Failed value),
  }) {
    assert(initial != null);
    assert(imgPicked != null);
    assert(success != null);
    assert(failed != null);
    return imgPicked(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult imgPicked(_ImgPicked value),
    TResult success(_Success value),
    TResult failed(_Failed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (imgPicked != null) {
      return imgPicked(this);
    }
    return orElse();
  }
}

abstract class _ImgPicked implements UploadState {
  const factory _ImgPicked(String path) = _$_ImgPicked;

  String get path;
  _$ImgPickedCopyWith<_ImgPicked> get copyWith;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  $Res call({String url});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> extends _$UploadStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object url = freezed,
  }) {
    return _then(_Success(
      url == freezed ? _value.url : url as String,
    ));
  }
}

/// @nodoc
class _$_Success implements _Success {
  const _$_Success(this.url) : assert(url != null);

  @override
  final String url;

  @override
  String toString() {
    return 'UploadState.success(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Success &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(url);

  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult imgPicked(String path),
    @required TResult success(String url),
    @required TResult failed(),
  }) {
    assert(initial != null);
    assert(imgPicked != null);
    assert(success != null);
    assert(failed != null);
    return success(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult imgPicked(String path),
    TResult success(String url),
    TResult failed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult imgPicked(_ImgPicked value),
    @required TResult success(_Success value),
    @required TResult failed(_Failed value),
  }) {
    assert(initial != null);
    assert(imgPicked != null);
    assert(success != null);
    assert(failed != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult imgPicked(_ImgPicked value),
    TResult success(_Success value),
    TResult failed(_Failed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements UploadState {
  const factory _Success(String url) = _$_Success;

  String get url;
  _$SuccessCopyWith<_Success> get copyWith;
}

/// @nodoc
abstract class _$FailedCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) then) =
      __$FailedCopyWithImpl<$Res>;
}

/// @nodoc
class __$FailedCopyWithImpl<$Res> extends _$UploadStateCopyWithImpl<$Res>
    implements _$FailedCopyWith<$Res> {
  __$FailedCopyWithImpl(_Failed _value, $Res Function(_Failed) _then)
      : super(_value, (v) => _then(v as _Failed));

  @override
  _Failed get _value => super._value as _Failed;
}

/// @nodoc
class _$_Failed implements _Failed {
  const _$_Failed();

  @override
  String toString() {
    return 'UploadState.failed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Failed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult imgPicked(String path),
    @required TResult success(String url),
    @required TResult failed(),
  }) {
    assert(initial != null);
    assert(imgPicked != null);
    assert(success != null);
    assert(failed != null);
    return failed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult imgPicked(String path),
    TResult success(String url),
    TResult failed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failed != null) {
      return failed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult imgPicked(_ImgPicked value),
    @required TResult success(_Success value),
    @required TResult failed(_Failed value),
  }) {
    assert(initial != null);
    assert(imgPicked != null);
    assert(success != null);
    assert(failed != null);
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult imgPicked(_ImgPicked value),
    TResult success(_Success value),
    TResult failed(_Failed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements UploadState {
  const factory _Failed() = _$_Failed;
}
