import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_final/provider/register_provider.dart';
import 'package:quiz_final/widgets/list_card.dart';
import 'package:quiz_final/utility/card_details.dart';

class PreBuilt extends StatelessWidget {
  const PreBuilt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          margin:
          const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey)),
                    child: const Icon(
                      Icons.favorite_sharp,
                      color: Colors.lightBlueAccent,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey)),
                    child: const Icon(
                      Icons.person,
                      color: Colors.lightBlueAccent,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Let\'s play',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Color(0xfff85e7d),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Be the fisrt!',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xffa9a4a5),
                  fontWeight: FontWeight.w700,
                ),
              ),
              ListView.builder(
                itemCount: cardDetailList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListCard(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomQuiz extends StatefulWidget {
  const CustomQuiz({Key? key}) : super(key: key);

  @override
  State<CustomQuiz> createState() => _CustomQuizState();
}

class _CustomQuizState extends State<CustomQuiz> {
  static var _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      Provider.of<RegisterProvider>(context, listen: false).getAllQuizes();

      setState(() {
        _isInit = false;
      });
    }
  }

  @override
  void dispose() {
    setState(() {
      _isInit = true;
    });

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var data = Provider.of<RegisterProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          margin:
          const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 10),
              const Text(
                'Create Quiz And Share ',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Color(0xfff85e7d),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'With Your Friends!',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xffa9a4a5),
                  fontWeight: FontWeight.w700,
                ),
              ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: data.quizItems.length,
            itemBuilder: (context, index) {
              final item = data.quizItems[index];
              return ListTile(
                title: Text(item.question),
                subtitle: Text(item.category),
                trailing: Text(item.difficulty),
              );
            },
          )
            ],
          ),
        ),
      ),
    );
  }
}

