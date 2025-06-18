# blind_test

TuneBoom ! 

## Getting Started

**fonctionnalités**
- choix de thème
- choix de difficulté de jeu "Facile,Difficile"
- Ajout de timer de 15 secondes dans mode Difficile
- Ajout d'option de relécture de l'audio dans mode Facile
- Affichage de l'album correspondant à la chanson en cours de lecture
- Option de rejouer ou retourner à l'accueil
- Calcul de meilleur score avec stockage

**Structure de projet**
-> Models : Songs (contenant le tableau de chansons)
-> 3 pages : 
- home : page d'accueil permettant de choisir directement la catégorie.
- game : page de validation du thème + choix du niveau de la partie. Avec option de retour
- game_started : Page de jeu avec la musique et les choix de réponses

-> 3 services : 
audioService :  contient les fonctionnalité de lecture de musique
gameService : contient la logique de calcule de score + vérification réponses
scoreService : vérifie et stock le meilleur score ( ici sur 5 points pour la démo)

- **dépendances utilisées**

- audioplayers
- shared_preferences ( pour le stockage du meilleur score )
- flutter_svg ( pour l'icone de relecture de musique )

**Maquettes*

Nous avons commencé par créer des maquettes Figma afin d'avoir une idée visuelle concernant les pages de l'application
les maquettes sont jointes au projet pour montrer la version initial de l'application

**Amélioration dans le future :**

- ajout d'option 50/50
- utiliser une API de musique pour jouer plusieurs chansons en une seule partie.
- 


**idées non terminées**

- bouton indice dans le mode 'Facile' : donner des indices sur la chanson/artiste
- améliorer la modale jeu terminé

**Ajout de nouveaux mode :**

- Devinez le Genre/Catégory de la chanson !
- Jouer contre un adversaire
- Ajout de thèmes de blindtest, exemple : 'chansons disney'  'bandes originals de films'




