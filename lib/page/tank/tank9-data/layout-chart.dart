import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:newmaster/components/chart2.dart';
import 'package:newmaster/page/tank/tank1-data/data_page01.dart';
import 'package:newmaster/components/recent_files.dart';
import 'package:newmaster/constants.dart';
import 'package:newmaster/presentation/samples/line/line_chart_sample2.dart';
import 'package:newmaster/presentation/samples/line/line_chart_sample3.dart';
import 'package:newmaster/presentation/samples/line/line_chart_sample4.dart';
import 'package:newmaster/responsive.dart';
import 'package:newmaster/widget/appbar/AppBar.dart';
import 'package:newmaster/widget/common/Radiobutton.dart';
import 'package:newmaster/widget/menu/side_menu.dart';

import '../../../presentation/samples/line/line_chart_sample9-2.dart';

List<HistoryChartModel> output = [];
String test = "";

class Chart11 extends StatelessWidget {
  Chart11({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "F.AI. Chart (Point)",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        // SizedBox(height: defaultPadding),
        Responsive(
          mobile: LineChartSample2(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
          ),
          tablet: LineChartSample2(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
          ),
          desktop: LineChartSample2(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
            crossAxisCount: _size.width < 800 ? 2 : 4,
          ),
        ),
      ],
    );
  }
}

class Chart12 extends StatelessWidget {
  Chart12({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "F.Al Chart",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: LineChartSample2(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
          ),
          tablet: LineChartSample2(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
          ),
          desktop: LineChartSample2(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
            crossAxisCount: _size.width < 800 ? 2 : 4,
          ),
        ),
      ],
    );
  }
}

class Chart133 extends StatefulWidget {
  Chart133({
    Key? key,
  }) : super(key: key);

  @override
  _Chart133State createState() => _Chart133State();
}

class _Chart133State extends State<Chart133> {
  Future<List<Map<String, dynamic>>> fetchDataFromAPI() async {
    final response =
        await http.post(Uri.parse('http://127.0.0.1:1111/tank9-FA'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<Map<String, dynamic>> data =
          responseData.cast<Map<String, dynamic>>();

      return data;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchDataFromAPI(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final List<Map<String, dynamic>> input = snapshot.data!;
          List<HistoryChartModel> output = [];
          for (var i = 0; i < input.length; i++) {
            output.add(HistoryChartModel(
              id: input[i]["id"] ?? "",
              custFull: input[i]["CustFull"] ?? "",
              sampleName: input[i]["SampleName"] ?? "",
              samplingDate:
                  "${input[i]["date"] ?? ""} ${input[i]["time"] ?? ""}",
              stdMax: input[i]["StdMax"] ?? "0",
              stdMin: input[i]["StdMin"] ?? "0",
              resultApprove: input[i]["value"] ?? "",
              resultApproveUnit: input[i]["ResultApproveUnit"] ?? "",
              position: input[i]["Position"] ?? "",
            ));
          }
          final Size _size = MediaQuery.of(context).size;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "F.A.(Point) Chart",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 14, // Set your desired font size here
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Responsive(
                mobile: LineChartSample22(
                  crossAxisCount: _size.width < 650 ? 2 : 4,
                  childAspectRatio:
                      _size.width < 650 && _size.width > 350 ? 1.3 : 1,
                  historyChartData: output,
                ),
                tablet: LineChartSample22(
                  crossAxisCount: _size.width < 650 ? 2 : 4,
                  childAspectRatio:
                      _size.width < 650 && _size.width > 350 ? 1.3 : 1,
                  historyChartData: output,
                ),
                desktop: LineChartSample22(
                  childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
                  crossAxisCount: _size.width < 800 ? 2 : 4,
                  historyChartData: output,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class Chart13 extends StatefulWidget {
  Chart13({
    Key? key,
  }) : super(key: key);

  @override
  _Chart13State createState() => _Chart13State();
}

class _Chart13State extends State<Chart13> {
  Future<List<Map<String, dynamic>>> fetchDataFromAPI() async {
    final response =
        await http.post(Uri.parse('http://127.0.0.1:1111/tank9-TA'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<Map<String, dynamic>> data =
          responseData.cast<Map<String, dynamic>>();

      return data;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchDataFromAPI(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final List<Map<String, dynamic>> input = snapshot.data!;
          List<HistoryChartModel2> output = [];
          for (var i = 0; i < input.length; i++) {
            output.add(HistoryChartModel2(
              id: input[i]["id"] ?? "",
              custFull: input[i]["CustFull"] ?? "",
              sampleName: input[i]["SampleName"] ?? "",
              samplingDate:
                  "${input[i]["date"] ?? ""} ${input[i]["time"] ?? ""}",
              stdMax: input[i]["StdMax"] ?? "0",
              stdMin: input[i]["StdMin"] ?? "0",
              resultApprove: input[i]["value"] ?? "",
              resultApproveUnit: input[i]["ResultApproveUnit"] ?? "",
              position: input[i]["Position"] ?? "",
            ));
          }
          final Size _size = MediaQuery.of(context).size;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "T.A.(Point) Chart",
                     style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 14,)
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Responsive(
                mobile: LineChartSample92(
                  crossAxisCount: _size.width < 650 ? 2 : 4,
                  childAspectRatio:
                      _size.width < 650 && _size.width > 350 ? 1.3 : 1,
                  historyChartData: output,
                ),
                tablet: LineChartSample92(
                  crossAxisCount: _size.width < 650 ? 2 : 4,
                  childAspectRatio:
                      _size.width < 650 && _size.width > 350 ? 1.3 : 1,
                  historyChartData: output,
                ),
                desktop: LineChartSample92(
                  childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
                  crossAxisCount: _size.width < 800 ? 2 : 4,
                  historyChartData: output,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}


class Chart21 extends StatelessWidget {
  Chart21({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Feed Chart",
               style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 14,)
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height *
              0.6, // Specify the height here
          child: Expanded(
            // Wrap with Expanded to provide constraints
            child: Responsive(
              mobile: BarChartBody(
                crossAxisCount: _size.width < 650 ? 2 : 4,
                childAspectRatio:
                    _size.width < 650 && _size.width > 350 ? 1.3 : 1,
              ),
              tablet: BarChartBody(
                crossAxisCount: _size.width < 650 ? 2 : 4,
                childAspectRatio:
                    _size.width < 650 && _size.width > 350 ? 1.3 : 1,
              ),
              desktop: BarChartBody(
                childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
                crossAxisCount: _size.width < 800 ? 2 : 4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BarChartBody extends StatefulWidget {
  const BarChartBody(
      {Key? key, required int crossAxisCount, required num childAspectRatio})
      : super(key: key);

  @override
  _BarChartBodyState createState() => _BarChartBodyState();
}

class _BarChartBodyState extends State<BarChartBody> {
  List<ChartData> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:1111/chem-feed'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{}),
    );

    if (response.statusCode == 200) {
      setState(() {
        Iterable list = json.decode(response.body);
        data = list.map((model) => ChartData.fromJson(model)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: data.isEmpty ? CircularProgressIndicator() : SimpleBarChart(data),
    );
  }
}

class SimpleBarChart extends StatelessWidget {
  final List<ChartData> data;

  SimpleBarChart(this.data);

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      [
        charts.Series<ChartData, String>(
          id: 'Value',
          domainFn: (ChartData sales, _) => sales.date,
          measureFn: (ChartData sales, _) => sales.value,
          data: data,
          displayName: 'FC-4360(kg/day)',
          // Customizing the color of the bars based on the value
          colorFn: (ChartData sales, _) {
            if (sales.value <= 20) {
              return charts.ColorUtil.fromDartColor(Colors.blue);
            // } else if (sales.value <= 25) {
            //   return charts.ColorUtil.fromDartColor(Colors.orange);
            } else {
              return charts.ColorUtil.fromDartColor(Colors.red);
            }
          },
        )
      ],
      animate: true,
      behaviors: [
        charts.SeriesLegend(),
        charts.LinePointHighlighter(
          showHorizontalFollowLine:
              charts.LinePointHighlighterFollowLineType.none,
          showVerticalFollowLine:
              charts.LinePointHighlighterFollowLineType.nearest,
        ),
        // Create a dashed line
        charts.RangeAnnotation([
          // Create multiple line segments with small spaces between them
          for (var i = 0; i < 100; i += 4)
            charts.LineAnnotationSegment(
              // Y-value of the line
              20,
              // Color and thickness of the line
              charts.RangeAnnotationAxisType.measure,
              color: charts.ColorUtil.fromDartColor(Colors.green),
              strokeWidthPx: 2.0,
              dashPattern: [
                2,
                2
              ], // Define the dash pattern [dash length, space length]
            )
        ]),
      ],
      primaryMeasureAxis: charts.NumericAxisSpec(
        renderSpec: charts.GridlineRendererSpec(
          labelStyle: charts.TextStyleSpec(
            color: charts.ColorUtil.fromDartColor(Colors.white),
          ),
        ),
      ),
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          labelStyle: charts.TextStyleSpec(
            color: charts.ColorUtil.fromDartColor(Colors.white),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String date;
  final double value;
  final String lot;

  ChartData({required this.date, required this.value, required this.lot});

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(
      date: json['date'],
      value: double.parse(json['value']),
      lot: json['lot'],
    );
  }
}
