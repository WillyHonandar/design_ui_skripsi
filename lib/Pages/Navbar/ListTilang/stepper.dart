import 'package:flutter/material.dart';
import 'package:status_change/status_change.dart';

const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

class HorizontalExample extends StatefulWidget {
  final int idPelanggaran;
  final String status;
  HorizontalExample(this.status, this.idPelanggaran);
  @override
  State<StatefulWidget> createState() {
    return _HorizontalExampleState(this.status, this.idPelanggaran);
  }
}

class _HorizontalExampleState extends State<HorizontalExample> {
  int _processIndex = 0;
  //from database
  int idPelanggaran;
  String status;
  _HorizontalExampleState(this.status, this.idPelanggaran);

  final _processes = [
    'Pemberitahuan Informasi',
    'Segera Lakukan Sidang',
    'Segera Lakukan Pembayaran',
    'Menunggu Konfirmasi Pembayaran',
    'Selesai',
    'Pembayaran di tolak',
    'Tunggu Email',
  ];
  final _content = [
    '1',
    '2',
    '3',
    '1',
    '2',
    '3',
    '1',
  ];

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    void _status(String status) {
      if (status == "Pemberitahuan Informasi") {
        _processIndex = 0;
      } else if (status == "Segera Lakukan Sidang") {
        _processIndex = 1;
      } else if (status == "Segera Lakukan Pembayaran") {
        _processIndex = 2;
      } else if (status == "Menunggu Konfirmasi Pembayaran") {
        _processIndex = 3;
      } else if (status == "Selesai") {
        _processIndex = 4;
      } else if (status == "Pembayaran di tolak") {
        _processIndex = 5;
      } else if (status == "Tunggu Email") {
        _processIndex = 6;
      }
    }

    _status(status);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Detail Status", style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: StatusChange.tileBuilder(
                theme: StatusChangeThemeData(
                  direction: Axis.horizontal,
                  connectorTheme:
                      ConnectorThemeData(space: 1.0, thickness: 1.0),
                ),
                builder: StatusChangeTileBuilder.connected(
                  itemWidth: (_) =>
                      MediaQuery.of(context).size.width / _processes.length,
                  contentWidgetBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        _content[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: getColor(index),
                        ),
                      ),
                    );
                  },
                  nameWidgetBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        _processes[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: getColor(index),
                        ),
                      ),
                    );
                  },
                  indicatorWidgetBuilder: (_, index) {
                    if (index <= _processIndex) {
                      return DotIndicator(
                        size: 35.0,
                        border: Border.all(color: Colors.green, width: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return OutlinedDotIndicator(
                        size: 30,
                        borderWidth: 1.0,
                        color: todoColor,
                      );
                    }
                  },
                  lineWidgetBuilder: (index) {
                    if (index > 0) {
                      if (index == _processIndex) {
                        final prevColor = getColor(index - 1);
                        final color = getColor(index);
                        var gradientColors;
                        gradientColors = [
                          prevColor,
                          Color.lerp(prevColor, color, 0.5)
                        ];
                        return DecoratedLineConnector(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColors,
                            ),
                          ),
                        );
                      } else {
                        return SolidLineConnector(
                          color: getColor(index),
                        );
                      }
                    } else {
                      return null;
                    }
                  },
                  itemCount: _processes.length,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            height: 420,
            child: Card(
              child: ListTile(
                title: Text("Halooo"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
