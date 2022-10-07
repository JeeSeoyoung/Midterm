import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

bool _isChecked1 = false;
bool _isChecked2 = false;
bool _isChecked3 = false;

class _SearchPageState extends State<SearchPage> {
  bool _expanded = false;
  // DateTime now = DateTime.now();
  DateTime selectedDate = DateTime.now();
  get date => DateFormat('yyy.MM.dd (E)').format(selectedDate);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ExpansionPanelList(
            children: [
              ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return const ListTile(
                    leading: Text(
                      'Filter',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      ),
                    ),
                    title: Center(
                      child: Text(
                        'Select Filters',
                      ),
                    ),
                  );
                },
                body: Container(
                    padding: EdgeInsets.fromLTRB(130.0, 0.0, 0.0, 30.0),
                    child: Column(
                      children: [
                        CheckboxListTile(
                            title: Text('No Kids Zone'),
                            value: _isChecked1,
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked1 = value!;
                              });
                            }),
                        CheckboxListTile(
                            title: Text('Pet-Friendly'),
                            value: _isChecked2,
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked2 = value!;
                              });
                            }),
                        CheckboxListTile(
                            title: Text('Free breakfast'),
                            value: _isChecked3,
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked3 = value!;
                              });
                            }),
                      ],
                    )),
                isExpanded: _expanded,
              ),
            ],
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                _expanded = !_expanded;
              });
            },
          ),
          const SizedBox(
            height: 50.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0, 0, 20.0),
                child: Text(
                  'Date',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16.0),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_month),
                          Text(
                            'check-in',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        date,
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Text('9.30am'),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2050),
                      );
                      if (newDate == null) return;
                      setState(() {
                        selectedDate = newDate;
                      });
                    },
                    child: Text('select date'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 45.0,
                        )),
                  ),
                ],
              ),
              SizedBox(),
              Container(
                padding: EdgeInsets.only(top: 250.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                insetPadding: EdgeInsets.zero,
                                title: Container(
                                  child: SafeArea(
                                    child: Center(
                                      child: Text(
                                        'Please check\nyour choice :)',
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                    ),
                                  ),
                                ),
                                content: Container(
                                  // padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.filter,
                                              color: Colors.blue,
                                            ),
                                            Container(
                                                width: 150,
                                                padding:
                                                    EdgeInsets.only(left: 10.0),
                                                child: filterText())
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_month,
                                            color: Colors.blue,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Text(
                                              'IN',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.0),
                                            ),
                                          ),
                                          Text(
                                            date,
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 14.0),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Search')),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.black12,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Cancel')),
                                    ],
                                  ),
                                ],
                              ));
                    },
                    child: Text(
                      'Search',
                      style: TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.w400),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      padding: EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Text filterText() {
    String filter1 = '';
    String filter2 = '';
    String filter3 = '';
    filter1 = (_isChecked1 == true) ? 'No Kids Zone / ' : '';
    filter2 = (_isChecked2 == true) ? 'Pet-Friendly / ' : '';
    filter3 = (_isChecked3 == true) ? 'Free breakfast /' : '';
    return Text(
      '$filter1$filter2$filter3',
      style: TextStyle(color: Colors.black54, fontSize: 12.0),
    );
  }

  CheckboxListTile checklist(String label, bool ischecked) {
    return CheckboxListTile(
      title: Text(label),
      value: ischecked,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool? value) {
        setState(() {
          ischecked = value!;
        });
      },
    );
  }
}
