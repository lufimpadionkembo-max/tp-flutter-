/*import 'package:course/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// pour interagir avec firestore
class HomeController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
//_db permet d'accéder à la base de données firestore: c'est l'instance de connexion


  Stream<List<ProductModel>> getProducts() {
    //stream permet de récpérer les données en temps réel
    return _db.collection('Produits').snapshots().map((snapshot){
      // map convertit les documents en liste de ProductModel
      return snapshot.docs.map((doc) {
        return ProductModel.fromFirestore(doc.data(), doc.id);
              }); .toList();
    });
}
}

// le cache comme les cookies et les sessions
// pour stocker des données localement*/