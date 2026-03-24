import 'package:flutter/material.dart';

void main() => runApp(const DivineBeautyApp());

class DivineBeautyApp extends StatelessWidget {
  const DivineBeautyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Divine Beauty',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFDEFF4), // Fondo rosa muy pálido
      ),
      home: const FirebaseStoreGridPage(),
    );
  }
}

class ProductoMaquillaje {
  final String nombre;
  final String descripcion;
  final String imageUrl;
  final double rating;

  ProductoMaquillaje({
    required this.nombre,
    required this.descripcion,
    required this.imageUrl,
    required this.rating,
  });
}

class FirebaseStoreGridPage extends StatefulWidget {
  const FirebaseStoreGridPage({super.key});

  @override
  State<FirebaseStoreGridPage> createState() => _FirebaseStoreGridPageState();
}

class _FirebaseStoreGridPageState extends State<FirebaseStoreGridPage> {
  // LISTA ACTUALIZADA CON 14 PRODUCTOS DIFERENTES
  final List<ProductoMaquillaje> _productos = [
    // 1-6 (Basados en tu imagen de referencia)
    ProductoMaquillaje(nombre: "Charlotte Tilbury", descripcion: 'Base de maquillaje', imageUrl: 'https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/refs/heads/main/gloss.jpg', rating: 4),
    ProductoMaquillaje(nombre: "Guerlain Terracotta", descripcion: 'labial duradero', imageUrl: 'https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/refs/heads/main/fen.jpg', rating: 5),
    ProductoMaquillaje(nombre: "Dior", descripcion: 'Base de maquillaje fluida', imageUrl: 'https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/refs/heads/main/corr.jpg', rating: 5),
    ProductoMaquillaje(nombre: "Forever", descripcion: 'Base de maquillaje fluida', imageUrl: 'https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/refs/heads/main/core.jpg', rating: 4),
    ProductoMaquillaje(nombre: "Tom Ford Eye", descripcion: 'Base de maquillaje fluida', imageUrl: 'https://raw.githubusercontent.com/KeylaPalacios/Act11_2dapantalla_divinebeauty/refs/heads/main/base.jpg', rating: 3),
    ProductoMaquillaje(nombre: "Skin Glow", descripcion: 'Base de maquillaje fluida', imageUrl: 'https://raw.githubusercontent.com/KeylaPalacios/Imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/del.jpg', rating: 5),
    
    // 7-14 (Nuevos productos únicos)
    ProductoMaquillaje(nombre: "NARS Radiant", descripcion: 'Corrector cremoso', imageUrl: 'https://raw.githubusercontent.com/KeylaPalacios/Imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/glo.jpg', rating: 4.8),
    ProductoMaquillaje(nombre: "MAC Studio Fix", descripcion: 'Polvo compacto mate', imageUrl: 'https://raw.githubusercontent.com/KeylaPalacios/Imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/ilu.jpg', rating: 4.5),
    ProductoMaquillaje(nombre: "Urban Decay Naked", descripcion: 'Paleta de sombras nude', imageUrl: 'https://raw.githubusercontent.com/KeylaPalacios/Imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/labb.jpg', rating: 5.0),
    ProductoMaquillaje(nombre: "Too Faced Better", descripcion: 'Máscara de pestañas volumen', imageUrl: 'https://raw.githubusercontent.com/KeylaPalacios/Imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/labc.jpg', rating: 4.2),
    ProductoMaquillaje(nombre: "Fenty Beauty Match", descripcion: 'Stick iluminador contour', imageUrl: 'https://raw.githubusercontent.com/KeylaPalacios/Imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/labial1.jpg', rating: 4.7),
    ProductoMaquillaje(nombre: "Laura Mercier", descripcion: 'Polvo translúcido fijador', imageUrl: 'https://raw.githubusercontent.com/KeylaPalacios/Imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/labiales.jpg', rating: 4.9),
    ProductoMaquillaje(nombre: "Anastasia Beverly", descripcion: 'Gel de cejas definidor', imageUrl: 'https://raw.githubusercontent.com/KeylaPalacios/Imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/rubc.jpg', rating: 4.6),
    ProductoMaquillaje(nombre: "Benefit Hoola", descripcion: 'Bronceador mate natural', imageUrl: 'https://raw.githubusercontent.com/KeylaPalacios/Imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/bas.jpg', rating: 4.8),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120, // Encabezado alto como la imagen
        backgroundColor: const Color(0xFFE91E63), // Rosa vibrante
        title: const Text(
          'Divine Beauty',
          style: TextStyle(
            color: Colors.white,
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columnas
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.80, // Ajuste ligero para las nuevas descripciones
        ),
        itemCount: _productos.length, // Usará los 14 productos
        itemBuilder: (context, index) {
          return ProductCard(producto: _productos[index]);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductoMaquillaje producto;
  const ProductCard({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10), // Bordes redondeados suaves
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.network(
                producto.imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 50, color: Colors.grey),
              ),
            ),
          ),
          Text(
            producto.nombre,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            producto.descripcion,
            style: const TextStyle(color: Colors.black87, fontSize: 13),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (i) {
                // Cálculo simple para mostrar medias estrellas si es necesario
                if (i < producto.rating.floor()) {
                  return const Icon(Icons.star, size: 18, color: Colors.amber);
                } else if (i < producto.rating && producto.rating % 1 != 0) {
                  return const Icon(Icons.star_half, size: 18, color: Colors.amber);
                } else {
                  return Icon(Icons.star_border, size: 18, color: Colors.grey[300]);
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}