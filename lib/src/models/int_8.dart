part of '../../uni_color_name.dart';

/// Color with int 8 bits per channels.
/// This is what is known as "true color".
/// See https://en.wikipedia.org/wiki/Color_depth#True_color_(24-bit)
class Int8Color extends C<int> {
  const Int8Color({
    required super.model,
    super.channelPresentation,
    super.channel0,
    required super.channel1,
    required super.channel2,
    required super.channel3,
    super.index,
    super.name,
  }) : super(
          channelDepths: const [8, 8, 8, 8],
          channelRanges: const [
            (0, 255),
            (0, 255),
            (0, 255),
            (0, 255),
          ],
        );
}