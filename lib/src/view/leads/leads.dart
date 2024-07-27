import 'package:crm/src/constant/constant.dart';
import 'package:crm/src/controller/leads.dart';
import 'package:crm/src/model/leads.dart';
import 'package:crm/src/utils/utils.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Leads extends StatefulWidget {
  const Leads({super.key});

  @override
  State<Leads> createState() => _LeadsState();
}

class _LeadsState extends State<Leads> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: FutureBuilder<List<Lead>>(
          future: LeadsController.leads(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data == null) {
              return const SizedBox.shrink();
            }
            List<Lead> leads = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Leads (${leads.length})',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24.0.r),
                SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: WidgetStatePropertyAll(
                      Palette.textGray.withOpacity(0.25),
                    ),
                    columnSpacing: 36.0.r,
                    horizontalMargin: 18.0.r,
                    columns: const [
                      DataColumn(
                        label: Text('Title'),
                      ),
                      DataColumn(
                        label: Text('Contact'),
                      ),
                      DataColumn(
                        label: Text('Date'),
                      ),
                      DataColumn(
                        label: Text('Due Date'),
                      ),
                      DataColumn(
                        label: Text('Status'),
                      ),
                      DataColumn(
                        label: Text('Assinee'),
                      ),
                      DataColumn(
                        label: Text('Action'),
                      ),
                    ],
                    rows: List.generate(
                      leads.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(
                            Text(leads[index].title),
                          ),
                          DataCell(
                            Text(leads[index].contactName),
                          ),
                          DataCell(
                            Text(
                              leads[index].date.dMY,
                            ),
                          ),
                          DataCell(
                            Text(
                              leads[index].dueDate.dMY,
                            ),
                          ),
                          DataCell(
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Palette.orange.withOpacity(0.1),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6.0, vertical: 3.0),
                              child: Text(
                                switch (leads[index].status) {
                                  1 => 'Pending',
                                  2 => 'In Progress',
                                  3 => 'Closed',
                                  4 => 'Cancelled',
                                  _ => 'Pending',
                                },
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.0,
                                  color: switch (leads[index].status) {
                                    1 => Palette.orange,
                                    2 => Colors.deepPurple,
                                    3 => Palette.green,
                                    4 => Palette.red,
                                    _ => Palette.orange,
                                  },
                                ),
                              ),
                            ),
                          ),
                          DataCell(Text(leads[index].assignedName)),
                          DataCell(Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                color: Palette.textBlue,
                                padding: EdgeInsets.zero,
                                icon: Icon(
                                  Icons.edit_rounded,
                                  color: Palette.textBlue,
                                  size: 20.0.r,
                                ),
                              ),
                              IconButton(
                                onPressed: () async => await _onDelete(),
                                color: Palette.red,
                                padding: EdgeInsets.zero,
                                icon: Icon(
                                  Icons.delete_forever_rounded,
                                  color: Palette.red,
                                  size: 20.0.r,
                                ),
                              )
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  Future<void> _onDelete() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Deletion'),
        content: const Text('Are you sure you want to delete this lead?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Palette.textBlue,
            ),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Palette.red,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
