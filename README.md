# Bataille-navale
Projet réalisé en ISN en Terminal S comme projet final, en collaboration avec Rodolphe Limousin, codé en Free Pascal. 

## Installation
Pour essayer ce projet, vous n'avez qu'à télécharger le code et à lancer "Bataille navale.exe". Vous n'avez besoin de rien d'autres.
Cependant, afin d'éviter un problème d'affichage, vous allez devoir réaliser une petite manipulation.
- Lancez "Bataille navale.exe"
- Une fois la fenêtre ouverte, faites un clic droit sur le bord supérieur de la fenêtre, puis "Propriétés"
- Dans l'onglet "Configuration", augmentez la taille de la fenêtre afin que la fenêtre soit en grand écran (ajustez également la position si nécessaire)
- Cliquez sur "OK" et fermez la fenêtre
- Relancez "Bataille navale.exe"

Le jeu est maintenant complètement prêt.

## Principe de jeu
Le jeu est une bataille navale dans lequel vous affrontez une Intelligence Artificielle (IA). Lorsque vous commencez, vous avez le choix entre 2 pays à affronter :
- La Roumanie : L'IA se contentera d'attaquer aléatoirement, quelque soit le résultat.
- Les USA : L'IA attaquera aléatoirement tant qu'elle ne trouve pas un bateau. Une fois un bateau découvert, l'IA attaquera ce bateau jusqu'à le couler.

Entrez le numéro du correspondant à l'IA que vous désirez affronter.

Il y a 2 grilles dans la bataille navale :
- Plan de chasse : Cette zone est la zone où se situe les bateaux ennemis. C'est dans cette grille que vous allez attaquer.
- Plan de jeu : C'est la zone où sont placés vos bateaux. L'ennemi va attaquer dans cette zone là.

Le but du jeu est de couler tous les bateaux adverses avant que vos bateaux ne soient au fond de l'eau.

Le jeu se déroule en 2 phases :
### Phase 1 - Placement de bateau
Vous avez 5 bateaux à placer. À chaque fois, le nom du bateau, ainsi que sa taille vous ait indiqué. Pour placer un bateau, indiqué la case correspondant à une extrémité du bateau à placer (faites attention à bien mettre la lettre en majuscule et à coller le nombre à la lettre (Exemple : B8)). Une fois une case entrée, vous devez entrer l'autre extrémitée du bateau. Les cases disponibles sont indiqués. Une fois la deuxième case entré, votre bateau est placé. Vous pouvez le voir dans le **plan de jeu**, caractérisé par des 'O' bleus. Il ne vous reste plus qu'à effectuer cette méthode pour tous les bateaux.

Mais si vous n'avez pas envie de perdre trop de temps à placer les bateaux, vous pouvez entrer 'R' pour que le bateau soit placer de manière aléatoire dans la grille de jeu.

L'IA se contentera de placer ces bateaux automatiquement.

Une fois tous les bateaux placés, le jeu entre en phase 2.

### Phase 2 - Attaque des bateaux adverses
C'est la phase la plus importante. Vous allez entrer une case, qui spécifie que vous attaquer cette case là dans le **plan de chasse**. Si vous touchez un bateau, vous verrez un 'T' rouge à l'emplacement indiqué. Sinon, vous verrez une croix blanche. Par la suite, l'IA attaquera à son tour, et la case qu'il attaquera sera visible dans le **plan de jeu**. Vous pouvez également voir les bateaux qu'il reste à chacun à côtés des grilles. Une fois qu'un bateau est coulé, son nom disparait à côté de la grille. Si vous arrivez à couler tous les bateaux adverses en premier, vous gagnez la partie. En revanche, si l'IA coule tous vos bateaux, vous perdez.

## Fabriqué avec
- Free Pascal - Langage
- Lazarus - EDI multiplateforme

## Auteurs
- Matthieu Chartrain
- Rodolphe Limousin
