# Utiliser une image Node.js officielle comme image de base
FROM node:18-alpine

# Définir le répertoire de travail à l'intérieur du conteneur
WORKDIR /app

# Copier les fichiers package.json et package-lock.json dans le répertoire de travail
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier le reste des fichiers de l'application
COPY . .

# Builder l'application Svelte
RUN npm run build

# Installer un serveur HTTP simple pour servir les fichiers
RUN npm install -g serve

# Exposer le port que l'application va utiliser
EXPOSE 5000

# Commande pour démarrer l'application
CMD ["serve", "-s", "public"]
