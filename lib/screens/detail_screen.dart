import 'package:flutter/material.dart';

import '../models/bike.dart';

class DetailScreen extends StatefulWidget {
  final Bike bike;
  final bool esFavoritoInicial;

  const DetailScreen({
    super.key,
    required this.bike,
    this.esFavoritoInicial = false,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late bool _esFavorito;

  @override
  void initState() {
    super.initState();
    _esFavorito = widget.esFavoritoInicial;
  }

  void _alternarFavorito() {
    setState(() => _esFavorito = !_esFavorito);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _esFavorito
              ? 'Agregada a favoritos'
              : 'Eliminada de favoritos',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bike = widget.bike;
    final colors = Theme.of(context).colorScheme;

    // PopScope devuelve el estado de favorito al cerrar la pantalla,
    // también cuando se usa el gesto o botón "atrás" del sistema.
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        Navigator.pop(context, _esFavorito);
      },
      child: Scaffold(
        appBar: AppBar(title: Text(bike.name)),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen destacada con transición Hero
              Hero(
                tag: 'bike-image-${bike.id}',
                child: Image.asset(
                  bike.image,
                  width: double.infinity,
                  height: 260,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            bike.name,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '\$${bike.price.toStringAsFixed(0)}',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: colors.secondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${bike.brand}  •  ${bike.category}',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Iconos informativos
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _InfoItem(
                          icon: Icons.star,
                          color: Colors.amber,
                          label: 'Calificación',
                          value: bike.rating.toString(),
                        ),
                        _InfoItem(
                          icon: Icons.monitor_weight_outlined,
                          color: colors.primary,
                          label: 'Peso',
                          value: '${bike.weightKg} kg',
                        ),
                        _InfoItem(
                          icon: Icons.settings,
                          color: colors.primary,
                          label: 'Velocidades',
                          value: '${bike.speeds}',
                        ),
                        _InfoItem(
                          icon: Icons.circle_outlined,
                          color: colors.primary,
                          label: 'Rodada',
                          value: bike.wheelSize,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    const Text(
                      'Descripción',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      bike.description,
                      style: const TextStyle(fontSize: 16, height: 1.5),
                    ),
                    const SizedBox(height: 24),

                    const Text(
                      'Características',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...bike.features.map(
                      (f) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: colors.primary,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(child: Text(f)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Botón de acción
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: _alternarFavorito,
                        icon: Icon(
                          _esFavorito
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                        label: Text(
                          _esFavorito
                              ? 'Quitar de favoritos'
                              : 'Agregar a favoritos',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.secondary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
