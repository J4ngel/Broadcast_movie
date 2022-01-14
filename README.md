# broadcast_movie
Proyecto final de desarrollo para el ciclo 4B de Misión TIC 2021


La red social Broadcast Movie servirá a los usuarios para publicar sus actividades y publicar 
contenido relacionado.

La pantalla principal tendrá un bottonNav, un tab para feed de actividades, otro para feed 
de posts de otros usuarios y otro para hacer post
Requerimientos:
- Login (con correo-clave)
- Registro (nombre, correo, clave) se envían datos a firebase 
- Feed de estados (firestore)
  - Publicaciones de estado de los otros usuarios - solo es texto
  - Capacidad de hacer publicaciones propias
- Feed con contenidos de usuarios:
  - Publicadas por los otros usuarios (Vista Social)
  - Poder publicar contenido propias (Vista social) solo es un texto
  - Visualizar lista de películas/series de un servicio web.
- Poder chat con otro usuario (firebase en tiempo real) sobre una pelicula o serie
- Consumo de servicio web con informacion de peliculas y series
- Se debe permitir almacenar los datos localmente:
  - Shared prefs: modo oscuro, un botón para cambiar de tema oscuro a claro y 
    guardar esto localmente.
- Ubicación:
  - Hacer post de la ubicación
  - Recibir notificaciones sobre otros creadores de contenido(ejemplo: ‘Hay x 
    usuarios alrededor tuyo’)
- Trabajos en segundo plano:
  - Post Actualización de Ubicación cada 15 min.
