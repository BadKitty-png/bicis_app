import '../models/bike.dart';

/// Datos ficticios (mock data) que alimentan la app.
const List<String> categorias = [
  'Todas',
  'Montaña',
  'Ruta',
  'Urbana',
  'Eléctrica',
  'BMX',
  'Plegable',
];

const List<Bike> bikesMock = [
  Bike(
    id: 1,
    name: 'Commencal Clash 2025',
    brand: 'Montaña - Free Ride',
    category: 'Montaña',
    shortDescription: 'Suspensión delantera(180mm), trasera(170mm) y llantas anchas para senderos.',
    description:
        'Bicicleta de montaña pensada para terrenos irregulares y descenso por montañas.'
        'Su cuadro de alumino ligero pero robusto '
        'su horquilla con suspensión absorben los golpes del '
        'camino, mientras que los frenos de disco hidráulicos te dan control '
        'total en bajadas técnicas.',
    image: 'assets/images/montana.png',
    price: 85000,
    rating: 4.7,
    weightKg: 16.8,
    speeds: 11,
    wheelSize: '27.5"',
    features: ['Frenos de disco', 'Suspensión delantera', 'Suspension trasera' ,'Cuadro de aluminio'],
  ),
  Bike(
    id: 2,
    name: 'Velocity Pro',
    brand: 'AeroCycle',
    category: 'Ruta',
    shortDescription: 'Ligera y aerodinámica para asfalto y largas distancias.',
    description:
        'Diseñada para ir rápido en carretera. Manubrio tipo cabra, llantas '
        'delgadas y cuadro aerodinámico que reducen la resistencia al viento. '
        'Ideal para entrenar o participar en rodadas de largo aliento.',
    image: 'assets/images/ruta.png',
    price: 18990,
    rating: 4.8,
    weightKg: 8.9,
    speeds: 22,
    wheelSize: '700c',
    features: ['Manubrio de ruta', 'Cuadro aerodinámico', 'Grupo Shimano 105'],
  ),
  Bike(
    id: 3,
    name: 'Citylife Classic',
    brand: 'Urban Roots',
    category: 'Urbana',
    shortDescription: 'Cómoda y práctica para moverte por la ciudad.',
    description:
        'Posición erguida, asiento cómodo y portaequipaje incluido. Perfecta '
        'para ir al trabajo, a la escuela o a pasear los fines de semana sin '
        'complicaciones y con mantenimiento mínimo.',
    image: 'assets/images/urbana.png',
    price: 5290,
    rating: 4.4,
    weightKg: 14.5,
    speeds: 7,
    wheelSize: '26"',
    features: ['Portaequipaje', 'Salpicaderas', 'Luz delantera y trasera'],
  ),
  Bike(
    id: 4,
    name: 'EcoVolt E-500',
    brand: 'Volta',
    category: 'Eléctrica',
    shortDescription: 'Asistencia eléctrica con hasta 70 km de autonomía.',
    description:
        'Motor de asistencia al pedaleo y batería de litio extraíble. Sube '
        'pendientes sin esfuerzo y te permite recorrer hasta 70 km con una '
        'sola carga. Incluye pantalla con niveles de asistencia.',
    image: 'assets/images/electrica.png',
    price: 29900,
    rating: 4.6,
    weightKg: 22.0,
    speeds: 9,
    wheelSize: '27.5"',
    features: ['Motor 250 W', 'Batería extraíble', 'Autonomía de 70 km'],
  ),
  Bike(
    id: 5,
    name: 'Street Jumper',
    brand: 'Freestyle Co.',
    category: 'BMX',
    shortDescription: 'Resistente y ágil para trucos y rampas.',
    description:
        'Cuadro reforzado de acero cromoly y llantas pequeñas para máxima '
        'maniobrabilidad. Pensada para skateparks, rampas y trucos de '
        'estilo libre.',
    image: 'assets/images/bmx.png',
    price: 4890,
    rating: 4.3,
    weightKg: 11.2,
    speeds: 1,
    wheelSize: '20"',
    features: ['Acero cromoly', 'Pedales de plataforma', 'Pegs incluidos'],
  ),
  Bike(
    id: 6,
    name: 'FoldGo Mini',
    brand: 'Compacta',
    category: 'Plegable',
    shortDescription: 'Se pliega en segundos y cabe en cualquier lugar.',
    description:
        'Su sistema de plegado rápido te permite guardarla en el cajuela, '
        'la oficina o el transporte público. Ligera, práctica y lista para '
        'quienes combinan bici con otros medios de transporte.',
    image: 'assets/images/plegable.png',
    price: 6750,
    rating: 4.2,
    weightKg: 12.0,
    speeds: 6,
    wheelSize: '20"',
    features: ['Plegado en 10 s', 'Bolsa de transporte', 'Cuadro de aluminio'],
  ),
];
