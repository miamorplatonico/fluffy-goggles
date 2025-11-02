Guía rápida para habilitar Google/Facebook Sign-in en TechnoStar

Resumen
-------
He integrado `social-auth-app-django` y añadido los endpoints y plantillas necesarios para que:
- Los botones "Google" y "Facebook" en la página de login apunten a los endpoints de inicio de sesión social.
- El backend social esté habilitado (requiere credenciales de OAuth de cada proveedor).
- El restablecimiento de contraseña funciona en desarrollo con el EMAIL_BACKEND de consola (los emails se imprimen en la terminal).

Pasos para habilitar Social Login (Google)
-----------------------------------------
1) Crear credenciales en Google Cloud Console:
   - Ve a https://console.developers.google.com/
   - Crea un nuevo proyecto (o usa uno existente).
   - Ve a "APIs & Services" → "Credentials" → "Create Credentials" → "OAuth client ID".
   - Tipo de aplicación: "Web application".
   - Añade Authorized redirect URIs (ejemplo para desarrollo local):
     - http://127.0.0.1:8000/oauth/complete/google-oauth2/
   - Guarda el Client ID y Client Secret.

2) Configura las variables de entorno en tu máquina (o en el entorno virtual). Ejemplo en PowerShell:
   ```powershell
   $env:SOCIAL_AUTH_GOOGLE_OAUTH2_KEY = 'tu-google-client-id'
   $env:SOCIAL_AUTH_GOOGLE_OAUTH2_SECRET = 'tu-google-client-secret'
   ```
   O añade a tu archivo `.env` y carga esas variables en tu entorno.

3) Reinicia el servidor Django. Ahora el enlace:
   `{% url 'social:begin' 'google-oauth2' %}`
   debería iniciar el flujo de OAuth con Google.

Pasos para habilitar Facebook
-----------------------------
1) Ve a https://developers.facebook.com/ y crea una nueva App → Producto "Facebook Login".
2) En la configuración de OAuth añade la URL de redirección de desarrollo:
   - http://127.0.0.1:8000/oauth/complete/facebook/
3) Copia App ID y App Secret.
4) En PowerShell exporta:
   ```powershell
   $env:SOCIAL_AUTH_FACEBOOK_KEY = 'tu-facebook-app-id'
   $env:SOCIAL_AUTH_FACEBOOK_SECRET = 'tu-facebook-app-secret'
   ```
5) Reinicia el servidor.

Notas y consejos
----------------
- En desarrollo usamos `EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'` para ver los correos de recuperación de contraseña en la terminal. En producción debes configurar un backend real (SMTP, SendGrid, Amazon SES, etc.).

- Los endpoints que añadí en `login.html` son:
  - Google: `{% url 'social:begin' 'google-oauth2' %}`
  - Facebook: `{% url 'social:begin' 'facebook' %}`

- Si deseas automatizar la carga de variables de entorno, considera agregar `python-dotenv` y un archivo `.env` en la raíz.

Verificación rápida (desarrollo)
-------------------------------
1) Ejecuta `python manage.py runserver`.
2) Abre `/login`.
3) Clic en Google o Facebook; si no configuraste credenciales verás un error del proveedor. Con credenciales válidas, terminarás autenticado en la app y redirigido a `LOGIN_REDIRECT_URL`.

Si quieres, implemento ahora:
- Mensajes/feedback mejorados en login cuando un proveedor responde con error.
- Verificar y mapear campos (email, nombre) devueltos por el proveedor al perfil de usuario.
- Detectar si el correo ya existe y enlazar cuentas (account linking) en el pipeline.

¿Quieres que proceda a cualquiera de esas mejoras ahora?