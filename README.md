# MiniGames

Bienvenue dans **MiniGames** ! Ce projet est une application mobile qui permet de jouer à divers mini-jeux tels que Shifumi, Morpion, Puissance 4, etc. Vous pouvez également consulter les résultats de vos amis. L'application est développée avec Flutter et utilise MySQL et SQLite pour la gestion des données.

## Introduction

**MiniGames** est une application mobile divertissante qui propose une collection de mini-jeux classiques. En plus de jouer, vous pouvez suivre les performances de vos amis et comparer vos résultats. L'application offre une expérience de jeu agréable et compétitive.

## Fonctionnalités

- **Collection de mini-jeux** : Jouez à des jeux comme Shifumi, Morpion, Puissance 4, et plus encore.
- **Classement des amis** : Consultez et comparez les résultats de vos amis.
- **Profil utilisateur** : Créez et personnalisez votre profil de joueur.
- **Base de données** : Sauvegarde des données en local avec SQLite et en ligne avec MySQL.
- **Interface intuitive** : Une interface utilisateur fluide et facile à utiliser.

## Installation

Pour installer et exécuter ce projet localement, veuillez suivre les étapes ci-dessous :

1. Clonez le dépôt GitHub :
    ```bash
    git clone https://github.com/votreutilisateur/MiniGames.git
    cd MiniGames
    ```

2. Assurez-vous d'avoir Flutter installé. Si ce n'est pas le cas, suivez les instructions sur le site officiel de [Flutter](https://flutter.dev/docs/get-started/install).

3. Installez les dépendances requises :
    ```bash
    flutter pub get
    ```

4. Configurez votre base de données MySQL :
    - Créez une base de données MySQL et importez le fichier `schema.sql` pour créer les tables nécessaires.
    - Mettez à jour les informations de connexion à la base de données dans le fichier de configuration.

5. Configurez SQLite :
    - SQLite sera configuré automatiquement lors de la première exécution de l'application.

6. Démarrez l'application :
    ```bash
    flutter run
    ```

## Utilisation

1. Lancez l'application sur votre appareil mobile ou émulateur.
2. Inscrivez-vous ou connectez-vous à votre compte.
3. Sélectionnez un mini-jeu pour commencer à jouer.
4. Consultez le tableau de classement pour voir les scores de vos amis.

## Technologies

- **Flutter** : Framework pour le développement d'applications mobiles multiplateformes.
- **MySQL** : Base de données pour le stockage des données en ligne.
- **SQLite** : Base de données embarquée pour le stockage local des données.