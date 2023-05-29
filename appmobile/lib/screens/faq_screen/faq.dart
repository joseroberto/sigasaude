import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> cardTexts = [
      'Como funciona o agendamento de uma consulta?',
      'Quais documentos eu preciso levar para consulta?',
      'Quem pode se vacinar nesse momento?',
      'Só poderei me vacinar se agendar?'
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 80,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leading: AppColors.backButton,
        title: Text(
          'Dúvidas Frequentes',
          style: AppColors.titleTextStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              style: IconButton.styleFrom(
                fixedSize: const Size(25, 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
                side: const BorderSide(
                    width: 1, color: Color.fromRGBO(196, 197, 198, 1)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset('assets/images/icon_list.png'),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(itemCount: 4, itemBuilder: (context, index) {
          return InkWell(
            onTap: (() {
              if(index == 0 ) {
                showModalBottomSheet(showDragHandle: true, isScrollControlled: true, context: context, builder: (context) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    height: MediaQuery.of(context).size.height * .9,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Como funciona o agendamento de uma consulta?\n', textAlign: TextAlign.center, style: AppColors.titleTextStyle,),
                            const Text('Agendar uma consulta em um aplicativo pode variar dependendo do aplicativo específico que você está usando. No entanto, geralmente existem algumas etapas comuns que você pode seguir:\n\n', style: TextStyle(color: Colors.black54),),
                            const Text('1 - Baixe e instale o aplicativo: Visite a loja de aplicativos do seu dispositivo móvel (como Google Play Store para dispositivos Android ou App Store para dispositivos iOS) e procure pelo aplicativo do provedor de saúde ou clínica com a qual você deseja agendar uma consulta. Baixe e instale o aplicativo em seu dispositivo.\n\n', style: TextStyle(color: Colors.black54)),
                            const Text('2 - Crie uma conta: Abra o aplicativo e siga as instruções para criar uma conta. Normalmente, você precisará fornecer informações pessoais, como nome, data de nascimento, endereço de e-mail e número de telefone.\n\n', style: TextStyle(color: Colors.black54)),
                            const Text('3 - Faça login na sua conta: Após criar sua conta, faça login usando as informações de login que você criou.\n\n', style: TextStyle(color: Colors.black54)),
                            const Text('4 - Encontre o serviço de agendamento de consultas: Dentro do aplicativo, procure por opções relacionadas a agendamento de consultas, como "Agendar consulta" ou "Marcar compromisso". Isso pode estar em um menu de navegação ou em uma seção dedicada.\n\n', style: TextStyle(color: Colors.black54)),
                            const Text('5 - Selecione o tipo de consulta: Dependendo do aplicativo, você pode ter a opção de escolher o tipo de consulta que deseja agendar, como consulta médica, consulta odontológica, exame de laboratório, etc. Selecione o tipo de consulta adequado para suas necessidades.\n\n', style: TextStyle(color: Colors.black54)),
                            const Text('6 - Escolha um médico ou provedor: O aplicativo pode listar os médicos ou provedores disponíveis para o tipo de consulta selecionado. Navegue pela lista e selecione o médico ou provedor de sua escolha.\n\n', style: TextStyle(color: Colors.black54)),
                            const Text('7 - Escolha uma data e horário: Veja as datas e horários disponíveis para agendamento e selecione aqueles que se adequem à sua agenda. Alguns aplicativos também podem permitir que você veja os horários disponíveis para um médico específico.\n\n', style: TextStyle(color: Colors.black54)),
                            const Text('8 - Confirme sua consulta: Após selecionar a data e horário desejados, confirme sua consulta no aplicativo. Revise todas as informações fornecidas, como data, horário, médico e localização, para garantir que estejam corretas.\n\n', style: TextStyle(color: Colors.black54)),
                            const Text('9 - Receba uma confirmação: Após confirmar sua consulta, o aplicativo geralmente enviará uma confirmação para o seu endereço de e-mail ou número de telefone cadastrado. Certifique-se de verificar se recebeu a confirmação.\n\n', style: TextStyle(color: Colors.black54)),
                            const Text('É importante lembrar que cada aplicativo pode ter sua própria interface e fluxo de agendamento, portanto, as etapas exatas podem variar. Siga as instruções fornecidas pelo aplicativo em questão para concluir o processo de agendamento de consulta com sucesso.\n\n', style: TextStyle(color: Colors.black54)),

                          ],
                        ),
                      ),
                    ),
                  );
                });
              }
            }),
            child: Container(
              width: 340,
              height: 80,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: kElevationToShadow[3],
              ),
              child: Center(child: Text(cardTexts[index], textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold),)),
            ),
          );
        })
      ),
    );
  }
}
