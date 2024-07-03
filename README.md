# Des amis, du vin
![CI](https://github.com/tegbessou/skeleton/workflows/CI/badge.svg)
## Distillation document (in French)
Une bouteille est constituée d'un nom, d'un nom de domaine, un type (blanc, rouge, rosé, champagne, pétillant rouge, pétillant blanc), une année, un cépage, un pays, un prix, une note, une remarque, d'une photo et la date d'ajout.

Il faut pouvoir créer une bouteille avec toutes les informations.
Il faut pouvoir modifier une bouteille.
Il faut pouvoir supprimer une bouteille.
On doit pouvoir rechercher les bouteilles par : nom du vin, nom du domaine, type, date d'ajout/de dégustation, année du vin, par note.
Une fois qu'on a ajouté une bouteille il faut pouvoir inviter à déguster la bouteille et le faire soit même.
Quand on créé une dégustation on ajoute automatiquement le créateur en tant que participant, on doit renseigner pour la dégustation une bouteille.
Pour ajouter un participant à une dégustation il faut pouvoir le chercher par son email:
    Si l'utilisateur est déjà inscrit alors on lui envoie une notification sur son téléphone via firebase en plus d'un mail
    Sinon on doit générer un lien pour pouvoir télécharger l'application, l'envoyer à la personne et à la fin il a quand même sa notification
Un participant à un email, un nom et prénom
Rajouter une gestion de notification d'invitation à une dégustations.
Il faut pouvoir les lister par participant, les lires, les accepter et les refuser.

Il faut pouvoir déguster du vin la dégustation se déroule en 3 étapes :
- L'oeil : dans laquelle on doit renseigner, la limpidité (limpide, opalescente, voilée, floue, trouble), la brillance (étincelante, éclatante, brillante, lumineuse, terne), intensité des couleurs (pâle, claire, satane, intense), couleur (si rouge: pourpre, cerise, grenat, tuilé, ambré, si rosé: pivoine, framboise, saumon, vieux rose, pelure d'oignon, si blanc: vert, blanc, doré, paille, roux), larmes (visqueuse, grasses, épaisses, roulantes, fluides), observations
- Le nez : impression (complexe, franc, simple, douteux, défauts), intensité (intime, ouvert, aromatique, discret fermé), arôme (fruité, florale, végétal boisée, épicée, empyreumatique, animale, balsamique, minérales), des observations.
- La bouche : le sucre noté sur une échelle (sirupeux, liquoreux, moelleux, doux, sec) si c'est un vin sucré, alcool noté sur une échelle (alcooleux, capiteux, gras, généreux, faible), acide (nerveuse, peintre, vite, fraîche, molle), tanin (âpre, chargé, charpenté, fader, lisse) si vin rouge, matière (massive, corpulace, étoffée, légère, fluette), finale (rémanente, persistance, langue, développée, courte)

Il faut pouvoir supprimé une dégustation.
Il faut pouvoir partager une dégustation.

### Functionnal Test
We use Behat. To run behat use:
<pre>
  make behat
</pre>

### Unit Test
We use PHPUnit. To run unit test use:
<pre>
  make unit-test
</pre>

### Makefile
To see all usefull command run:
<pre>
  make help
</pre>

## Database management
We used a dump to reload faster our database. To load your database use:
<pre>
  make db-load-fixtures
</pre>
### Update dump
If you add some migration or some fixtures, you have to update your dump with:
<pre>
   make db-reload-fixtures
</pre>
### PhpMyAdmin
To access PhpMyAdmin use: https://pma.your-host.docker

- Login: root
- Password: root

## Quality of our code
We have some quality tools and to run all this tools, you can use:
<pre>
  make code-quality
</pre>
In our quality tools you can find:
### Security checker of symfony
This tools check, if you have vulnerability in your dependencies
<pre>
  make security-checker
</pre>
### PHPmd
<pre>
  make phpmd
</pre>
### Composer unused
This tools allows you to check if you have unused dependencies
<pre>
  make composer-unused
</pre>
### Yaml Linter
<pre>
  make yaml-linter
</pre>
### Xliff Linter
<pre>
  make xliff-linter
</pre>
### Twig Linter
<pre>
  make twig-linter
</pre>
### Container Linter
<pre>
  make container-linter
</pre>
### PHPStan
<pre>
  make phpstan
</pre>
### CS Fixer
This tools check if you have error in your coding styles.

To show this error use:
<pre>
  make cs
</pre>

To fix this errors use:
<pre>
  make cs-fix
</pre>
### Validate database schema
This Symfony command check if your database schema is coherent with your entities annotation
<pre>
  make db-validate
</pre>

## Mailcatcher
If your local app send mail, your mail will be catched by the mailcatcher.
To see this mail go to: https://mailcatcher.du-vin-des-amis.docker

## Refactoring DDD
Challenge identity from each entity
Challenge the entity structure
=> reflect if I can group some value object in other value object more global

Challenge for user the usage of id to store it in database, maybe use email everywhere because it's the identity of the user
Reflect if I can use value object in command and query

Update all event to add timestamps, use value object (because domain event)

Create module in inventory context to separate grape varieties and bottle.

## Refactoring tech
Update unit test to add check value of property after entity modification and creation
Add in all id value object representation assert from max and min length

Explain architecture choices in the README
Add an elastic search to search wine

Separate each bounded context in microservice

Replace HttpRepository
    => HttpRepository should only be used to get data (replace HttpClient)
    => Adapter should be used to call the repository + translate data with Translator
    => Country/BottleInventory/Security to replace

Create a participant when we invite a participant that doesn't exist
    => If not exist
    => If a participant already exist when we create the user

Add log on exception + create a channel by bounded context

Start transaction in command handler

Rework repository remove read and write repository, use only repository

Instead of checking if an owner exist before saving data, we can try to get an owner and throw an exception if it doesn't exist and then catch it

## In progress
Invite participant to tasting
- [ ] Invite a participant to the tasting
  - [ ] For a participant already sign up
    - [ ] Create Invitation as an Entity
      - [ ] Add a participant to the invitation
      - [ ] Add a tasting to the invitation
      - [ ] Add a link to the invitation
      - [ ] Add a created at/updated at to the invitation
      - [ ] Add a status to the invitation (pending, read, accepted, refused)
        - [ ] Remove all invitation as accepted or refused from one week, and read from one month
    - [ ] Add it to the participant array of the tasting
    - [ ] Dispatch an event
    - [ ] Send a notification to firebase
      - [ ] Configure firebase to send notification
      - [ ] Send a notification to firebase via Notification Symfony Component
    - [ ] Send an email with a link to the app
      - [ ] Configure mailcatcher for local
      - [ ] Find a service to send mail for free
      - [ ] Install mailer for symfony
      - [ ] In email send a link to the app
          - [ ] Create a link to the app
  - [ ] For a participant that doesn't already sign up
    - [ ] Create a participant
      - [ ] Check if when the user is created there is no problem 
    - [ ] Create Invitation as an Entity
      - [ ] Add a participant to the invitation
      - [ ] Add a tasting to the invitation
      - [ ] Add a link to the invitation
      - [ ] Add a created at/updated at to the invitation
      - [ ] Add a status to the invitation (pending, read, accepted, refused)
        - [ ] Remove all invitation as accepted or refused from one week, and read from one month
    - [ ] Add it to the participant array of the tasting
    - [ ] Dispatch an event
    - [ ] Send an email with a link to the app
      - [ ] Configure mailcatcher for local
      - [ ] Find a service to send mail for free
      - [ ] Install mailer for symfony
      - [ ] In email send a link to the app
        - [ ] Create a link to the app