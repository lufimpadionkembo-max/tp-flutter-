/*class ProductModel {
  const ProductModel({
    required this.id,
    required this.nom_produit,
    required this.desc_produit,
    required this.prix_produit,}),


  final String? id;
  final String? nom_produit;
  final String? desc_produit;
  final int prix_produit;
  

  factory ProductModel.fromFirestore(Map<String, dynamic> data, String id) {
    return ProductModel(
      id: id,
      nom_produit: data['nom_produit'] as String,
      desc_produit: data['desc_produit'] as String,
      prix_produit: data['prix_produit'] as int,
    );
  }
}*/