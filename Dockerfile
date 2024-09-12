# Utiliser une image Node.js plus récente comme base
FROM node:latest

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers package.json et package-lock.json dans le conteneur
COPY package*.json ./

# Installer les dépendances de l'application
RUN npm install

# Copier le reste du code de l'application dans le conteneur
COPY . .

# Exposer le port que l'application utilisera
EXPOSE 3000

# Démarrer l'application
CMD ["npm", "start"]
