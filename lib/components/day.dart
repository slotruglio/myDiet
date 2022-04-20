import 'package:flutter/material.dart';

class DayDiet extends StatefulWidget {
  const DayDiet({Key? key, required this.isSport}) : super(key: key);

  final bool isSport;
  @override
  State<DayDiet> createState() => _DayDietState();
}

class _DayDietState extends State<DayDiet> {
  final List<Meal> _meals = generateMeals(false);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(_meals)
        ));
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
          body: Container(
            child: Column(
              children: meal.options.map((e) => ListTile(
                title: Text(e.entries.first.key),
                subtitle: Text(e.entries.first.value.toString()+'g'),
              )).toList(),
            ),
          ),
          isExpanded: meal.isExpanded,
        );
      }).toList(),
    );
  }
}

class Meal{
  Meal({
    required this.name,
    required this.options,
    this.notes = '',
    this.isExpanded = false,
  });

  final String name;
  final List<Map<String, String>> options;
  final String notes;
  bool isExpanded;
}

List<Meal> generateMeals(bool isSport) {
  return [
    Meal(
      name: 'Breakfast',
      options: [
        {
          'Skyr Magro Bianco': '170',
          'Yogurt Total 0% - Fage': '170',
          'Prosciutto Crudo di Parma': '50',
          'Uova di gallina - albume': '150',
          'Tonno in salamoia - sgocciolato':'50',
          'Salmone affumicato': '50',
          'Proteine isolate': '50'
        },
        {
          'Fiocchi d\'avena': isSport?'40':'30',
          'Pane di grano duro': isSport?'60':'45',
          'Farina d\'avena': isSport?'40':'30',
          'Gallette di riso': isSport?'40':'30',
          'Fette Wasa integrali': isSport?'40':'30'
        },
      ],
    ),
    Meal(
      name: 'Morning Snack',
      notes: isSport? 'Se ci si allena nella prima parte della mattina allora questo è un pasto post allenamento\nSe ci si allena nella seconda parte della mattina allora questo è un pasto pre allenamento (circa 90 minuti prima)':'',
      options: isSport?
      [
        {
          'Skyr Magro Bianco': '170',
          'Yogurt Total 0% - Fage': '170',
          'Prosciutto Crudo di Parma': '50',
          'Uova di gallina - albume': '150',
          'Tonno in salamoia - sgocciolato':'50',
          'Salmone affumicato': '50',
          'Proteine isolate': '50'
        },
        {
          'Fiocchi d\'avena': '40',
          'Pane di grano duro': '60',
          'Farina d\'avena': '40',
          'Gallette di riso': '40',
          'Fette Wasa integrali': '40'
        },
      ]
      :
      [
        {
          'Cioccolato fondente':'10',
          'Mandorle secche':'10',
          'Nocciole secche':'10',
          'Anacardi':'10',
        },
        {
          'Mela':'100',
          'Banane':'100',
          'Pera':'150',
          'Cocomero':'350',
          'Fichi':'110',
          'Fichi d\'india':'100',
          'Melone':'150',
          'Pesca':'200',
          'Uva':'90',
          'Kaki':'100',
          'Arance':'150',
          'Kiwi':'100',
        }
      ]
    ),
    Meal(
      name: 'Lunch',
      notes: isSport?
      'Uova come secondo: 2 uova intere + 150 gr di albume oppure 300 gr solo albume\nQuando si sceglie il primo coi legumi: 50 gr di pasta/riso + 30 gr di legumi secchi o 120 gr di legumi in salamoia/surgelati + SECONDO'
      :
      'Uova come secondo: 2 uova intere + 150 gr di albume oppure 300 gr solo albume\nQuando si sceglie il primo coi legumi: 40 gr di pasta/riso + 30 gr di legumi secchi o 120 gr di legumi in salamoia/surgelati + SECONDO',
      options: [
        {
          'Pasta di Semola': isSport?'70':'60',
          'Pasta di Semola Integrale': isSport?'75':'65',
          'Riso': isSport?'75':'65',
          'Riso integrale': isSport?'75':'65',
          'Riso basmati': isSport?'70':'60',
          'Riso basmati integrale': isSport?'40':'60',
          'Patate': isSport?'290':'250',
          'Farro': isSport?'75':'65',
          'Orzo pelato': isSport?'80':'70',
          'Pasta con legumi': isSport?'50':'40',
        },
        {
          'Pollo - petto':'150',
          'Vitello - filetto':'150',
          'Tonno in salamoia - sgocciolato':'150',
          'Albumi': '300',
          'Pesce fresco':'200',
          'Salmone affumicato': '100',
          'Prosciutto Crudo di Parma': '100',
          'Uova': '2 intere + 150g albumi',
        },
        {
          'Carote':'100',
          'Verdura':'200',
          'Legumi cotti':'120',
          'Legumi secchi':'30',
        },
        {
          'Olio di oliva extra vergine':'10',
          'Pesto di basilico':'20',
        }
      ],
    ),
    Meal(
      name: 'Afternoon Snack',
      options: isSport?
      [
        {
          'Cioccolato fondente':'10',
          'Mandorle secche':'10',
          'Nocciole secche':'10',
          'Anacardi':'10',
        },
        {
          'Mela':'100',
          'Banane':'100',
          'Pera':'150',
          'Cocomero':'350',
          'Fichi':'110',
          'Fichi d\'india':'100',
          'Melone':'150',
          'Pesca':'200',
          'Uva':'90',
          'Kaki':'100',
          'Arance':'150',
          'Kiwi':'100',
        }
      ]
      :
      [
        {
          'Skyr Magro Bianco': '170',
          'Yogurt Total 0% - Fage': '170',
          'Prosciutto Crudo di Parma': '50',
          'Uova di gallina - albume': '150',
          'Tonno in salamoia - sgocciolato':'50',
          'Salmone affumicato': '50',
          'Proteine isolate': '50'
        },
        {
          'Mela':'100',
          'Banane':'100',
          'Pera':'150',
          'Cocomero':'350',
          'Fichi':'110',
          'Fichi d\'india':'100',
          'Melone':'150',
          'Pesca':'200',
          'Uva':'90',
          'Kaki':'100',
          'Arance':'150',
          'Kiwi':'100',
        }
      ]
    ),
    Meal(
      name: 'Dinner', 
      notes: 'Uova come secondo: 2 uova intere + 300 gr di albume oppure 450 gr solo albume',
      options: [
        {
          'Pasta di Semola': isSport?'70':'60',
          'Pasta di Semola Integrale': isSport?'75':'65',
          'Riso': isSport?'75':'65',
          'Riso integrale': isSport?'75':'65',
          'Riso basmati': isSport?'70':'60',
          'Riso basmati integrale': isSport?'40':'60',
          'Patate': isSport?'290':'250',
          'Farro': isSport?'75':'65',
          'Orzo pelato': isSport?'80':'70',
          'Pasta con legumi': isSport?'50':'40',
        },
        {
          'Pollo - petto':'200',
          'Vitello - filetto':'200',
          'Tonno in salamoia - sgocciolato':'200',
          'Albumi': '450',
          'Pesce fresco':'250',
          'Salmone affumicato': '150',
          'Prosciutto Crudo di Parma': '150',
          'Uova': '2 intere + 300g albumi',
        },
        {
          'Carote':'100',
          'Verdura':'200',
          'Legumi cotti':'120',
          'Legumi secchi':'30',
        },
        {
          'Olio di oliva extra vergine':'10',
          'Pesto di basilico':'20',
        }
      ]
    ),
  ];
}

