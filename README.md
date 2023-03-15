# Leafarium
### Leafarium (Symfony, VueJs)

Voici mon site Leafarium ! Celui-ci est une encyclopedie sur le thème de la flore.


### Langage / Framework :

  - HTML
  - CSS
  - Symfony
  - VueJs


## Mode d'emploie :

### Symfony
Ce site est composé de deux parties. Une qui est le "back-end" (projetSymfony) et l'autre le "front-end"(projetVueJs).

Dans une première fenêtre de votre IDE, lancer "projetSymfony". Par la suite, vous devez utiliser une BD pour importer celle du site. Il vous faut créer un fichier env.local (Important pour lier la BD). Son nom doit être la même que celle utilisé.
Ensuite, il faut installer les dépendances via une commande dans un terminal :

  - composer install

Enfin dans cette même fenêtre, lancer le serveur PHP via un terminal en écrivant la commande suivante (mais ne cliquer par sur le lien car il ne correspond pas au site "front-end") :

  - php -S 127.0.0.1:8000 -t public -d display_errors=1

### VueJs
Dans une seconde fenêtre de votre IDE, il vous fait également les dépendances mais du côté de VueJs (Front-end) :

  - npm install
  
Puis lancer le serveur :

  - npm run dev
  
Cela vous donne un lien, il vous suffit de cliquer et d'attendre un peu pour que le site charge.  Enjoy :D

## Si il y a un problème, veuillez me contacter au plus vite.
