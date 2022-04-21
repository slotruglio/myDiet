import 'meal.dart';
import 'package:flutter/material.dart';

class DayDiet extends StatefulWidget {
  const DayDiet({Key? key, required this.isSport}) : super(key: key);
  final bool isSport;
  @override
  State<DayDiet> createState() => _DayDietState();
}

class _DayDietState extends State<DayDiet> {
  // TODO: improve this
  final List<Meal> _mealsSport = generateMeals(true);
  final List<Meal> _mealsNormal = generateMeals(false);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: _buildPanel(widget.isSport?_mealsSport:_mealsNormal),
        );
  }

  Widget _buildPanel(List<Meal> _meals) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _meals[index].isExpanded = !isExpanded;
        });
      },
      children: _meals.map<ExpansionPanel>((Meal meal){
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(meal.name),
              subtitle: meal.isExpanded ? Text(meal.notes) :Text(
                meal.options.length > 2 ? 
                  meal.options.map((e) => e.entries.first.key+' '+e.entries.first.value.toString()+'g').join(', ')
                : 
                meal.options.map((e) => e.entries.first.key+' '+e.entries.first.value.toString()+'g').join('\n')
                ),
              isThreeLine: true,
            );
          },
          body: Column(
            children: meal.macros.map((e) => Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top:5, bottom:10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(e),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: 
                        meal.options[meal.macros.indexOf(e)].entries.map((e) => 
                          Text(e.key+' '+e.value.toString()+'g')
                        ).toList(),
                    ),
                  )
                  ,
                  meal.macros.indexOf(e) == meal.macros.length-1 ? Container() : const Divider(),
              ]),
            )).toList(),
          ),
          isExpanded: meal.isExpanded,
        );
      }).toList(),
    );
  }
}
