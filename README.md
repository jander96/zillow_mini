# zillow_mini

App demo about properties sales
Features:
- List properties
- Filter and search properties
- Favorites and saved properties
- Property details page

## Inicio

1- run `flutter pub get`

2- run `dart run build_runner build`

3- add key.properties file to android root
```
storePassword=<password>
keyPassword=<password>
keyAlias=<keysotre alias>
storeFile=<keystore-file-location>

```

2- run `flutter run`


## Pricipales packages

- Flutter bloc (manejo de estado)
- Injectable (inyeccion de dependencias)
- RxDart y Fpdart (programacion funcional y reactiva)
- Retrofit para el manejo de peticiones REST
- SharedPreferences y SecureStorage para la persistencia de datos


## Decisiones tecnicas

- Uso de clean arch y el patron MVVM
- Modularizacion features first
- Mock de api y de autorizacion de usuarios


## Limitaciones

- El filtrado por rango de precio no es preciso debido a limitaciones por parte de mockapi



## Credenciales para probar la app
- Usar cualquiera de los usuarios en [Mock Users Json](assets/raw/user_table.json)

Por ejemplo: 
```json
[  {
    "id": "1",
    "email": "john.doe@example.com",
    "name": "John Doe",
    "password": "123456",
    "role": "admin",
    "image": "https://api.dicebear.com/8.x/avataaars/png?seed=John%20Doe"
  },
  {
    "id": "11",
    "email": "jander@test.com",
    "name": "Jander Laffita",
    "password": "123456",
    "role": "admin",
    "image": "https://api.dicebear.com/8.x/avataaars/png?seed=Jander%20Laffita"
  },
  {
    "id": "2",
    "email": "jane.smith@example.com",
    "name": "Jane Smith",
    "password": "password123",
    "role": "user",
    "image": "https://api.dicebear.com/8.x/avataaars/png?seed=Jane%20Smith"
  }
]

```
