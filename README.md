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

## Naming rules
- Entity class shouldn't have suffix
- Value object class shouldn't have suffix
- Enum class shouldn't have suffix
- Event class shouldn't have suffix
- Event listener class shouldn't have suffix
- Exception class should have suffix
- Service class shouldn't have suffix
- Repository class should have suffix
- Command/Query class should have suffix
- Command/Query handler class should have suffix

## Value object rule
- Id method should be named value

## Architecture rules
- Each Domain should have its own folder
- Domain never should have a dependency with another domain except Shared, to avoid to have dependency between domain
- Transaction for CommandHandler are started in the MessengerCommandBus
- Each Exception in Adapter should be logged
- An Adapter should always dispatch a command or a query
- An Aggregate should only be modified by the Aggregate himself children Entity should be modified by the Aggregate
- An Aggregate should only have one repository
- An Aggregate and Entity should always be created by a factory (method or class)
- An Aggregate or Entity action (domain method) should always dispatch an event
- All Aggregate attributes except boolean should be a ValueObject
- EventListener should always be in the Application or Infrastructure layer
- All Aggregate and Entity should have a created at, created by, updated at and updated by
- All Aggregate and Entity method should be Unit tested
- All Adapter (Contract or Driving) method should be Contract or Driving tested
- If we need to read information from Aggregate without Aggregate we should use a read model
- To request an external api we should use a Repository, then an adapter is created to use this repository and use a translator
to transform this data to our domain

![img.png](resources/v1-domain.png)
![img.png](resources/v2-domain.png)

## Refactoring DDD
/!\ Important change to do
One repository for an aggregate root
Challenge Invitation entity to follow aggregate rules

Challenge the presence of an entity Owner in tasting to use with participant entity

Put doctrine entity in infrastructure and seperate domain entity from doctrine entity
Remove Assert from Webmozart and create my own domain service to assert this
Enforce rules that domains must be independent of each other

Challenge Domain Event to have all information to write projection, instead of using repository to read data

### Refactoring bottle

Owner should not be referenced, we only need to store uuid of the user from security context
=> When we create a bottle we create a read model to store the owner with information from security context

### Refactoring tasting

Participant should exist only in tasting context so have to remove creation when friend is invited because a participant
should be created only when a tasting is created
=> We do not duplicate the participant, we only store uuid of the user from security context => Wrong we must create a participant
when we invite a friend
=> So we have to duplicate the participant in tasting context and security context, the participant is create when user is invited

I need to create an owner entity in tasting context this entity should be created when a tasting is created

All entity should be handled by aggregate root

When we want to invite a friend to taste a bottle, we get a list of friend and we pass id to the tasting service to invite
them, the tasting service should check if the friend is already a participant and if not create a participant entity

Remove all repository and keep only the tasting repository

Add a read model to handle invitation by user

If I create data in another domain, i don't have to check if data exist in the main domain

When you accept to taste a bottle this bottle should be duplicate in your bottle list flaggued has invited to degust

### Refactoring user

Add friend system + invitation....

User context is responsible to send notification when invitation is sent

Extract it in a microservice and a new project

## Refactoring tech
Add an elastic search to search wine

Setup phparkitect

Separate each bounded context in microservice

Create an api resource for each representation

Reflect to add test on command handler and query handler

Renommer les tests d'adapter en test d'intégration

## TODO

### Bottle only

Owner should not be referenced, we only need to store uuid of the user from security context => OK
=> When we create a bottle we create a read model to store the owner with information from security context

Where we store read model (database) ?

The read model is a proper model that is used to read data from the domain model

Projection should be placed in the Application layer to transform data from the domain to the read model
Projections are not part of the domain, they are part of the application layer because they update the read model

Read model should be placed in the Application layer
To read and store read model we will use Adapters

Domain event dispatch should have all data to write projection

Create an api resource for each representation (except get and get collection group it)
Change read source

### Remaining

- [ ] Add all information in event
  - [ ] Upgrade bottle event test
- [X] Bottle creation
  - [X] Create a bottle list read model
  - [X] Create a bottle read model
- [X] Bottle change picture
  - [X] Update a bottle list read model to replace the picture
  - [X] Update a bottle read model to replace the picture
- [ ] Bottle update
  - [ ] Update a bottle list read model to replace all information
  - [ ] Update a bottle read model to replace all information
- [ ] Bottle tasted
  - [ ] Update a bottle list read model to add the tasted at
  - [ ] Update a bottle read model to replace the tasted at
- [ ] Bottle removed
  - [ ] Update a bottle list read model to add the tasted at
  - [ ] Update a bottle read model to replace the tasted at
- [ ] Change read source
  - [ ] Bottle list
  - [ ] Bottle
- [ ] Separate each operation in different resource
  - [ ] Bottle list
  - [ ] Bottle
  - [ ] Bottle picture
  - [ ] Bottle tasted
  - [ ] Bottle removed
  - [ ] Bottle post
  - [ ] Bottle put
- [ ] Clean read method from write model in the repository
- [ ] Clean the code