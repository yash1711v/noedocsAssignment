part of 'range_bloc.dart';

@immutable
abstract class RangeEvent {}

class RangeChange extends RangeEvent{
  final double value;

  RangeChange({required this.value});
}
