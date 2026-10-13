# BiciTienda

App móvil en Flutter: catálogo informativo de bicicletas.

## Flujo
Splash (3 s) → Home (búsqueda, chips de categoría, lista de tarjetas) → Detalle (Hero, iconos, botón Favorito).

## Estructura
- `lib/models/` modelo `Bike`
- `lib/data/` datos ficticios
- `lib/screens/` Splash, Home y Detalle
- `lib/widgets/` `BikeCard`
- `assets/images/` ilustraciones locales (declaradas en `pubspec.yaml`)

## Ejecutar
```
flutter create .   # genera android/, ios/, etc. si no existen
flutter pub get
flutter run
```
