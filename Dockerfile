# Utiliza la imagen oficial de Node.js 14 como base. La versión "slim" es una versión reducida que incluye lo mínimo necesario.
FROM node:14-slim

# Crea un directorio para la aplicación dentro del contenedor y establece el PATH para que los comandos npm se ejecuten localmente.
WORKDIR /usr/src/app

# Copia el archivo de definiciones de paquetes de Node.js. Esto incluye tanto package.json como package-lock.json si está disponible.
COPY package*.json ./

# Instala las dependencias del proyecto. Se hace antes de copiar la aplicación para aprovechar la caché de capas de Docker.
RUN npm install

# Si estás construyendo su código para producción, ejecuta npm ci con solo el argumento --only=production
# RUN npm ci --only=production

# Copia los archivos fuente del proyecto al directorio de trabajo del contenedor.
COPY . .

# Expone el puerto que tu aplicación usará. El puerto 3000 es comúnmente usado con aplicaciones Node.js.
EXPOSE 3000

# Define el comando para ejecutar la aplicación. En este caso, usamos node server.js para iniciar el servidor.
CMD ["node", "server.js"]
