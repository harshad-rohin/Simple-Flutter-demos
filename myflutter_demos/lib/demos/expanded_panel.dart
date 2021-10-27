import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';

void main() => const ExpandedPanel();

class ExpandedPanel extends StatefulWidget {
  const ExpandedPanel({Key? key}) : super(key: key);

  @override
  _ExpandedPanelState createState() => _ExpandedPanelState();
}

class _ExpandedPanelState extends State<ExpandedPanel> {
  bool sale = false;
  bool pur = false;
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demos'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text('VOUCHERS'),
                  ),
                ],
              ),

              // Package used is: accordion https://pub.dev/packages/accordion
              Accordion(
                maxOpenSections: 2,
                children: [
                  AccordionSection(
                    isOpen: false,
                    contentBorderRadius: 5.0,
                    headerBorderRadius: 5.0,
                    header: const Text('SALE', style: TextStyle(color: Colors.white, fontSize: 15)),
                    content: ListView(
                      shrinkWrap: true,
                      children: const [
                        ListTile(
                          title: Text('Sale', style: TextStyle(fontSize: 15)),
                        ),
                        ListTile(
                          title: Text('Delivery', style: TextStyle(fontSize: 15)),
                        ),
                        ListTile(
                          title: Text('Estimate Quotation', style: TextStyle(fontSize: 15)),
                        ),
                      ],
                    ),
                  ),

                  AccordionSection(
                    isOpen: false,
                    contentBorderRadius: 5.0,
                    headerBorderRadius: 5.0,
                    header: const Text('PURCHASE', style: TextStyle(color: Colors.white, fontSize: 15)),
                    content: ListView(
                      shrinkWrap: true,
                      children: const [
                        ListTile(
                          title: Text('Purchase', style: TextStyle(fontSize: 15)),
                        ),
                        ListTile(
                          title: Text('Purchase Order', style: TextStyle(fontSize: 15)),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
