import 'package:covid_data_app/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../helpers/Body.dart';

class SintomasScreen extends StatelessWidget {
  const SintomasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenMode = MediaQuery.of(context).orientation;
    List<Widget> sintomas = [
      const _CardItem(text: 'Dificuldade para\nrespirar'),
      const _CardItem(text: 'Perda do Paladar e\nOlfato'),
      const _CardItem(text: 'Dores de cabeça\nfrequentes'),
      const _CardItem(text: 'Tosse persistente'),
      const _CardItem(text: 'Transtornos mentais'),
      const _CardItem(text: 'Insônia'),
      const _CardItem(text: 'Ansiedade'),
      const _CardItem(text: 'Tonturas'),
      const _CardItem(text: 'Trombose'),
      const _CardItem(text: 'Taquicardia'),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leading: AppColors.backButton,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            pinned: (screenMode == Orientation.portrait) ? true : false,
            collapsedHeight: 350,
            expandedHeight: 300,
            flexibleSpace: const FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Quais sintomas pesistem?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 19,
                      color: Color(0xff000000),
                      letterSpacing: 0.17099999999999999,
                      height: 1.5263157894736843,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                  SizedBox(
                    width: 220,
                    height: 300,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Body(),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 5 / 2),
            itemCount: 10,
            itemBuilder: ((BuildContext context, int index) {
              return sintomas[index];
            }),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 32,),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          color: Colors.transparent,
          width: 340,
          height: 60,
          child: OutlinedButton(
            onPressed: () {Navigator.pushNamed(context, 'agendar_consulta');},
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xff00509f),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
              side: const BorderSide(
                width: 1.0,
                color: Color(0x8f95989a),
              ),
            ),
            child: const Text(
              'Agendar Consulta',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                color: Color(0xffffffff),
                letterSpacing: 0.162,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
              textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }
}

class _CardItem extends StatefulWidget {
  final String text;
  const _CardItem({Key? key, required this.text}) : super(key: key);

  @override
  State<_CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<_CardItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14.0, 21.0, 16.0, 0),
      child: InkWell(
        onTap: (() {
          setState(() {
            isSelected = !isSelected;
          });
        }),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.0),
            border: Border.all(width: 1.0, color: const Color(0x3b707070)),
            color: (isSelected) ? const Color(0xff00509f) : const Color(0xffffffff)
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: (isSelected) ? const Color(0xffffffff) : const Color(0x99000000),
                letterSpacing: 0.09,
                height: 1.3,
              ),
              textHeightBehavior:
                  const TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
              textAlign: TextAlign.center
            ),
          ),
        ),
      ),
    );
  }
}
