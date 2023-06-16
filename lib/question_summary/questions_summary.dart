import 'package:flutter/material.dart';
import 'package:quiz_app/question_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>>
      summaryData; // Map<type1, type2> is a data structure

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 96, 5, 232),
      ),
      height: 500,
      child: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          // make the child widget scrollable
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: summaryData.map((data) {
                // .map() map a value to a new value, return a iterable object
                return SummaryItem(data);
              }).toList(), // Column accepts a list of widgets, so we need to convert iterable object to list
            ),
          ),
        ),
      ),
    );
  }
}
