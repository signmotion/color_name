part of '../../uni_color_name.dart';

/// Color.
class C<N extends num> {
  const C({
    required this.channelDepths,
    required this.channelRanges,
    required this.model,
    this.channelPresentation = ColorChannelPresentation.hex,
    this.channel0,
    required this.channel1,
    required this.channel2,
    required this.channel3,
    this.index,
    this.name = '',
  });

  /// All converters has a suffix `Color`.
  RgbInt8Color get rgbInt8Color => RgbInt8Color(
        channelPresentation: channelPresentation,
        channel1: channel1.round(),
        channel2: channel2.round(),
        channel3: channel3.round(),
        index: index,
        name: name,
      );

  /// Bits per channels including [channel0].
  /// [channel0] goes first.
  final List<int> channelDepths;

  /// Min and max values for channels.
  final List<(N, N)> channelRanges;

  final ColorModel model;

  final ColorChannelPresentation channelPresentation;

  /// An alpha channel for most models.
  final N? channel0;

  bool get hasAlpha => channel0 != null;

  final N channel1;
  final N channel2;
  final N channel3;

  /// Some colors have an index.
  final int? index;

  bool get hasIndex => index != null;

  final String name;

  bool get hasName => name.trim().isNotEmpty;

  @override
  bool operator ==(Object other) =>
      other is C<N> &&
      channelDepths == other.channelDepths &&
      channelRanges == other.channelRanges &&
      model == other.model &&
      channelPresentation == other.channelPresentation &&
      channel0 == other.channel0 &&
      channel1 == other.channel1 &&
      channel2 == other.channel2 &&
      channel3 == other.channel3 &&
      index == other.index &&
      name == other.name;

  /// Subtract channels.
  C operator -(C b) {
    assertSameModel(b);
    assertArgbModel();
    return C(
      channelDepths: channelDepths,
      channelRanges: channelRanges,
      model: model,
      channelPresentation: channelPresentation,
      channel0: ((channel0 ?? 0) - (b.channel0 ?? 0)) as N,
      channel1: (channel1 - b.channel1) as N,
      channel2: (channel2 - b.channel2) as N,
      channel3: (channel3 - b.channel3) as N,
      index: index,
      name: name,
    );
  }

  /// this ^ 2
  C get square => C(
        channelDepths: channelDepths,
        channelRanges: channelRanges,
        model: model,
        channelPresentation: channelPresentation,
        channel0: ((channel0 ?? 0) * (channel0 ?? 0)) as N,
        channel1: (channel1 * channel1) as N,
        channel2: (channel2 * channel2) as N,
        channel3: (channel3 * channel3) as N,
        index: index,
        name: name,
      );

  N get summarize => ((channel0 ?? 0) + channel1 + channel2 + channel3) as N;

  /// `true` when [channel0]s are equal.
  bool equalChannel0(C b, {int decimals = -1}) => (channel0 ?? 0)
      .toDouble()
      .equalWithDecimals((b.channel0 ?? 0).toDouble(), decimals: decimals);

  /// `true` when [channel1]s are equal.
  bool equalChannel1(C b, {int decimals = -1}) => channel1
      .toDouble()
      .equalWithDecimals(b.channel1.toDouble(), decimals: decimals);

  /// `true` when [channel2]s are equal.
  bool equalChannel2(C b, {int decimals = -1}) => channel2
      .toDouble()
      .equalWithDecimals(b.channel2.toDouble(), decimals: decimals);

  /// `true` when [channel2]s are equal.
  bool equalChannel3(C b, {int decimals = -1}) => channel3
      .toDouble()
      .equalWithDecimals(b.channel3.toDouble(), decimals: decimals);

  /// `true` when all channels are equal.
  bool equalChannels(C b, {int decimals = -1}) =>
      equalChannel0(b, decimals: decimals) &&
      equalChannel1(b, decimals: decimals) &&
      equalChannel2(b, decimals: decimals) &&
      equalChannel3(b, decimals: decimals);

  bool sameModel(C b) => model == b.model;

  void assertSameModel(C b) {
    if (model != b.model) {
      throw ArgumentError('The color models should be same.'
          ' $model != ${b.model}');
    }
  }

  void assertArgbModel() {
    if (model == ColorModel.rgb) {
    } else {
      throw ArgumentError('The color models should be ARGB. `$model`');
    }
  }

  @override
  String toString() => ' $channelDepths'
      ' $channelRanges'
      ' $model'
      ' $channelPresentation'
      ' $channel0:$channel1:$channel2:$channel3'
      ' $index'
      ' `$name`';

  @override
  int get hashCode => [
        channelDepths,
        channelRanges,
        model,
        channelPresentation,
        channel0,
        channel1,
        channel2,
        channel3,
        index,
        name,
      ].hashCode;
}

/// The universal value for color as a record of [T] values.
/// The values can represent any [ColorModel] with opacity.
typedef UniColor<T> = (ColorModel, T, T, T, T);

/// Same [UniColor] but without a [ColorModel].
typedef UniColorShort<T> = (T, T, T, T);

/// Same [UniColor] but without a first (alpha) value.
typedef UniColorNoAlpha<T> = (ColorModel, T, T, T);

/// Same [UniColorShort] but without a first (alpha) value.
typedef UniColorShortNoAlpha<T> = (T, T, T);

/// Represents a color as double value.
//typedef UniColorDouble = UniColor<double>;

/// Represents a color as int value.
//typedef UniColorInt = UniColor<int>;

/// Represents a color as hexadecimal string value.
//typedef UniColorString = UniColor<String>;
