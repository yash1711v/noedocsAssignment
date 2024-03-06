part of 'range_bloc.dart';

@immutable
abstract class RangeState {}

class RangeInitial extends RangeState {}

class RangeChangeState extends RangeState{
 final double range;

  RangeChangeState({required this.range});
}
