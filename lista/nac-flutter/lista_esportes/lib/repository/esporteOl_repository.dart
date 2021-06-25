
import 'package:lista_esportes/presentation/esportes_icons.dart';

import 'db.dart';
import 'package:lista_esportes/model/esporteOl_model.dart';

class EsportesRepository {

  Future<List<EsporteModel>> findAllAsync() async{
    var db = Database();
    await db.createDatabase();

    List<EsporteModel> esportes = new List<EsporteModel>();
    if(db.created){
      esportes = new List<EsporteModel>();
      esportes.add(
        new EsporteModel(
          id: 1,
          nome: 'Futebol',
          historia: 'O futebol, esporte que é considerado a paixão nacional e, sem dúvidas, o mais popular do mundo, começou a ser praticado na Inglaterra, no século XVII. À época, o esporte não tinha o formato que tem hoje e tampouco era chamado de “futebol”. Isso só aconteceu décadas depois, com a criação das regras.',
          dtCriacao: '1863',
          img: 'futebol.jpg',
          pais: 'Inglatera',
          esporte: Esportes.soccer_ball,
        )
      );
      esportes.add(
        new EsporteModel(
          id: 2,
          nome: 'Tiro com arco',
          historia: 'A história do tiro com arcos vem de muito tempo atrás. Desde a Antiguidade, os homens utilizam o arco e flecha como instrumento de caça ou armamento de guerra. ... Foi a partir de meados do século XVI, que o tiro com arcos começou a ser tratado como um esporte, e foram criados os primeiros torneios.',
          dtCriacao: '1828',
          img: 'arco-flecha.jpg',
          pais: 'Estados Unidos',
          esporte: Esportes.alvo,
        )
      );
      esportes.add(
        new EsporteModel(
          id: 3,
          nome: 'Basquetebol',
          historia: 'O basquetebol, ou simplesmente basquete, é um esporte coletivo praticado entre duas equipes. Ele é jogado com uma bola, onde o objetivo é inseri-la no cesto fixo que está localizado nas extremidades da quadra.',
          dtCriacao: '1891',
          img: 'basquete.jpg',
          pais: 'Estados Unidos',
          esporte: Esportes.basquetebol,
        )
      );
      esportes.add(
        new EsporteModel(
          id: 3,
          nome: 'Corrida',
          historia: 'A corrida é uma prática que vem ganhando muitos adeptos no Brasil e no mundo. Isso porque, teoricamente, para correr bastam dois elementos: um tênis e força de vontade. No entanto, veremos que não se trata apenas disso, e que são necessários outros fundamentos para praticar esse esporte',
          dtCriacao: '1896',
          img: 'Corrida.jpg',
          pais: 'Grécia',
          esporte: Esportes.corre,
        )
      );
    }

    return new Future.value(esportes);
  }

}