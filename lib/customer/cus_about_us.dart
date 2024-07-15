import 'package:flutter/material.dart';

class CusAboutUs extends StatefulWidget {
  const CusAboutUs({super.key});

  @override
  State<CusAboutUs> createState() => _CusAboutUsState();
}

class _CusAboutUsState extends State<CusAboutUs> {
  @override
  Widget build(BuildContext context) {
    const text = const Text(
      'About Us',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
    return Scaffold(
      appBar: AppBar(
        title: text,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey[350],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/E1.png',
                      height: 100,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: const Text(
                  'Exen Limited is a company that was founded in 2011. The company specializes in design, supplying and installation of wardrobes, kitchen cabinets, custom made cabinets, wardrobes, interior doors and inbuilt kitchen appliances. They also offer services like cabinet refacing and cabinet repair.'),
            ),
            Container(
              child: const Text(
                  'Apart from wardrobes and kitchen cabinets they also supply inbuilt kitchen appliances like microwaves, ovens, burner tops, refrigerators  and chimney hoods. The company main office is situated in Karen Nairobi county. The company has done multiple projects mostly in areas like Kisumu, Nairobi and Mombasa.'),
            ),
            Container(
              child: const Text(
                  'Since its formation Exen limited has grown rapidly because of their remarkable skills. When it was founded in 2011 the company had only 15 employees now it has 50 employees. In order to complete a project they have a team of interior designers who work hand in hand with a group of installers. Their great workmanship has elevated them to become a household name in greater parts of the country. They have greatly helped all their clients who are in the verge of completing their construction projects get their absolute value for their money. By providing employment Exen limited continues to contribute to the country’s economy.'),
            ),
            Container(
              child: const Text(
                  'Like any other business Exen limited faces challenges as well. The major challenge is competition from other companies eg, Oppein Kenya Limited. However the above challenge is met with a proactive approach and Exen Limited is always looking for growth opportunities. The team of designers also ensure that they are always updated on latest technology and latest trends on designs hat clients might be interested in, thus this ensures that they stay ahead of the competition. Exen limited envisions on continued growth and expansion. It is strategically located in Nairobi Karen which is a strategic position that will help the company capitalize on emerging opportunities in the cabinet manufacturing and home finish industry. The aim of the company is to maintain its status in the current market.'),
            )
          ],
        ),
      ),
    );
  }
}
