import 'package:flutter/material.dart';

import '../data/bikes_data.dart';
import '../models/bike.dart';
import '../widgets/bike_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _categoriaSeleccionada = 'Todas';
  String _busqueda = '';
  final Set<int> _favoritos = {};

  List<Bike> get _bikesFiltradas {
    return bikesMock.where((bike) {
      final coincideCategoria = _categoriaSeleccionada == 'Todas' ||
          bike.category == _categoriaSeleccionada;
      final texto = _busqueda.toLowerCase();
      final coincideBusqueda = bike.name.toLowerCase().contains(texto) ||
          bike.brand.toLowerCase().contains(texto);
      return coincideCategoria && coincideBusqueda;
    }).toList();
  }

  Future<void> _abrirDetalle(Bike bike) async {
    // Se envía el objeto por el constructor y se espera el resultado
    // que la pantalla de detalle devuelve con Navigator.pop.
    final resultado = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => DetailScreen(
          bike: bike,
          esFavoritoInicial: _favoritos.contains(bike.id),
        ),
      ),
    );

    if (resultado == null) return;
    setState(() {
      if (resultado) {
        _favoritos.add(bike.id);
      } else {
        _favoritos.remove(bike.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bikes = _bikesFiltradas;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BiciTienda',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            tooltip: 'Perfil',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Perfil: próximamente')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de búsqueda funcional
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              onChanged: (valor) => setState(() => _busqueda = valor),
              decoration: InputDecoration(
                hintText: 'Buscar por nombre o marca...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Categorías con chips
          SizedBox(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categorias.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final categoria = categorias[index];
                return ChoiceChip(
                  label: Text(categoria),
                  selected: _categoriaSeleccionada == categoria,
                  onSelected: (_) {
                    setState(() => _categoriaSeleccionada = categoria);
                  },
                );
              },
            ),
          ),

          // Lista dinámica de tarjetas
          Expanded(
            child: bikes.isEmpty
                ? const Center(
                    child: Text('No se encontraron bicicletas'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: bikes.length,
                    itemBuilder: (context, index) {
                      final bike = bikes[index];
                      return BikeCard(
                        bike: bike,
                        isFavorite: _favoritos.contains(bike.id),
                        onTap: () => _abrirDetalle(bike),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
