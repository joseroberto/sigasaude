import 'package:covid_data_app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(237, 240, 246, 1),
                            borderRadius: BorderRadius.circular(14)),
                        child: const Center(
                          child: Text(
                            'K',
                            style: TextStyle(color: Colors.white, fontSize: 36),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Klivisson Campelo', style: TextStyle(fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.bold),),
                          Text('Editar meu perfil', style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w600, color: Colors.black26),)
                        ],
                      ),
                    ),
                    AppColors.closeButton
                  ],
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: _ListItem(function: (() {}), icon: Icons.person, title: 'Meu cadastro'),
                ),
                _ListItem(function: (() {Navigator.pushNamed(context, 'notifications');}), icon: Icons.notifications_none_rounded, title: 'Minhas notificações'),
                _ListItem(function: (() {Navigator.pushNamed(context, 'appointments');}), icon: MaterialCommunityIcons.calendar_heart, title: 'Minhas consultas'),
                _ListItem(function: (() {Navigator.pushNamed(context, 'vaccines');}), icon: MaterialCommunityIcons.needle, title: 'Minhas vacinas'),
                _ListItem(function: (() {Navigator.pushNamed(context, 'prescriptions');}), icon: MaterialCommunityIcons.notebook_check, title: 'Minhas prescrições médicas'),
                _ListItem(function: (() {Navigator.pushNamed(context, 'locations');}), icon: MaterialCommunityIcons.hospital_building, title: 'Unidade básicas próximas'),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: _ListItem(function: (() {Navigator.pushNamed(context, 'faq');}), icon: Icons.question_mark, title: 'Dúvidas frequentes'),
                ),
                _ListItem(function: (() {}), icon: MaterialCommunityIcons.text_box_outline, title: 'Termos e condições'),
                _ListItem(function: (() {}), icon: MaterialCommunityIcons.comment_question_outline , title: 'Fale conosco'),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: InkWell(
                    onTap: (() {}),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 24.0),
                            child: Icon(MaterialCommunityIcons.star_outline, color: Colors.black,),
                          ),
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Avalie nosso app', style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700)),
                              Text('Indique e ganhe', style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w600, color: Colors.black26),)
                            ],
                          )),
                          Icon(Icons.arrow_forward_ios_rounded, size: 18, color: Color.fromRGBO(185, 185, 185, 1),)
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: _ListItem(function: (() {Navigator.pushReplacementNamed(context, 'auth');}), icon: Icons.logout_outlined, title: 'Sair'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final Function() function;
  final IconData icon;
  final String title;
  const _ListItem({Key? key, required this.function, required this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(icon, color: Colors.black,),
            ),
            Expanded(child: Text(title, style: const TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700))),
            const Icon(Icons.arrow_forward_ios_rounded, size: 18, color: Color.fromRGBO(185, 185, 185, 1),)
          ],
        ),
      ),
    );
  }
}

