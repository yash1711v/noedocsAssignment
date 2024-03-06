import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neodocs/Presentations/Range/range_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../Model/model.dart';
import '../RangePainter/range_painter.dart';

class RangeScreen extends StatelessWidget {
  final TestMetadata testMetadata;

  RangeScreen({super.key,required this.testMetadata});
  final TextEditingController rangeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 150),
            child: Center(child: Text("This App is Created By Yash verma With ❤️",style: TextStyle(fontWeight: FontWeight.bold),),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: BlocBuilder<RangeBloc, RangeState>(
                  builder: (context, state) {
                    double pointer = 90;
                    if (state is RangeChangeState) {
                      pointer = state.range;
                    }
                    return Column(
                      children: [
                        SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              CustomPaint(
                                painter: CustomRanger(value: pointer, testMetadata: testMetadata, axisWidth: 20, pointerWidth: 20),
                                child: Container(
                                  height: 20,
                                ),
                              ),

                              const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text("Above one is customlyCreated without External Package"),
                              )
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Column(
                            children: [
                              SfLinearGauge(
                                tickPosition: LinearElementPosition.inside,
                                markerPointers: [
                                  LinearShapePointer(
                                    height: 25,
                                    width: 25,
                                    value: pointer,
                                  ),
                                ],
                                useRangeColorForAxis: true,
                                showAxisTrack: false,
                                minimum: 0,
                                maximum: 120,
                                ranges: const [
                                  LinearGaugeRange(
                                    rangeShapeType: LinearRangeShapeType.curve,
                                    edgeStyle: LinearEdgeStyle.startCurve,
                                    startWidth: 20,
                                    endWidth: 20,
                                    startValue: 0,
                                    endValue: 30,
                                    color: Colors.red,
                                  ),
                                  LinearGaugeRange(
                                    rangeShapeType: LinearRangeShapeType.curve,
                                    edgeStyle: LinearEdgeStyle.bothFlat,
                                    startWidth: 20,
                                    endWidth: 20,
                                    startValue: 30,
                                    endValue: 40,
                                    color: Colors.orange,
                                  ),
                                  LinearGaugeRange(
                                    rangeShapeType: LinearRangeShapeType.curve,
                                    edgeStyle: LinearEdgeStyle.bothFlat,
                                    startWidth: 20,
                                    endWidth: 20,
                                    startValue: 40,
                                    endValue: 60,
                                    color: Colors.green,
                                  ),
                                  LinearGaugeRange(
                                    rangeShapeType: LinearRangeShapeType.curve,
                                    edgeStyle: LinearEdgeStyle.bothFlat,
                                    startWidth: 20,
                                    endWidth: 20,
                                    startValue: 60,
                                    endValue: 70,
                                    color: Colors.orange,
                                  ),
                                  LinearGaugeRange(
                                    rangeShapeType: LinearRangeShapeType.curve,
                                    edgeStyle: LinearEdgeStyle.endCurve,
                                    startWidth: 20,
                                    endWidth: 20,
                                    startValue: 70,
                                    endValue: 120,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Text("And this one is using with External Package"),
                                ),
                              )

                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Center(
              child: SizedBox(
                width: 200,
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  controller: rangeController,
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                    hintText: "Enter your value",
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.grey),
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.grey),
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  onChanged: (value) {
                    BlocProvider.of<RangeBloc>(context).add(RangeChange(
                        value: double.parse(value.isNotEmpty ? value : "0")));
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
