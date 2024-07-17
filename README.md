# horloge_mobile

## Description
Ce projet est une application Flutter qui affiche l'heure en temps réel et permet de consulter l'heure dans différents fuseaux horaires. L'utilisateur peut personnaliser l'apparence de l'application et le format de l'heure.

## Fonctionnalités
- **Affichage de l'heure actuelle en temps réel** : Montre l'heure de l'utilisateur selon le fuseau horaire de son système.
- **Liste des fuseaux horaires** : Affiche une liste des fuseaux horaires chargée à partir d'un fichier JSON.
- **Heure dans d'autres fuseaux horaires** : Permet de voir l'heure actuelle dans d'autres fuseaux horaires.
- **Personnalisation des modes de couleurs** : L'utilisateur peut choisir entre un mode clair et un mode sombre.
- **Format de l'heure** : L'utilisateur peut choisir entre le format 24 heures et le format AM/PM.
- **Navigation interne** : Utilise une `BottomNavigationBar` avec les onglets suivants :
  - Onglet pour l'affichage de l'heure actuelle.
  - Onglet pour afficher la liste des fuseaux horaires et en choisir un.
  - Onglet de personnalisation permettant de changer de mode de couleurs et de format d'heure.
- **Sauvegarde des préférences** : Utilisation de `SharedPreferences` pour sauvegarder les préférences de mode sombre et de format d'heure, afin que ces paramètres soient restaurés lorsque l'utilisateur rouvre l'application.
## Installation

### Prérequis
- Flutter doit être installé sur votre machine. Suivez les instructions [ici](https://flutter.dev/docs/get-started/install) pour installer Flutter.

### Étapes pour lancer le projet

1. **Cloner le repository** :
   ```sh
   git clone https://github.com/votre-utilisateur/world_clock_app.git
2. **Installer les dependances** :
   ```sh
   flutter pub get
3. **Lancer l'application** :
   ```sh
   flutter run --build

   
