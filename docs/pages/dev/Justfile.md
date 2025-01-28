---
title: A propos du justfile 
layout: default
parent: Développement
---

Le just expose les commandes suivantes : 

| Nom               | Fonction                                                             |
|-------------------|----------------------------------------------------------------------|
| **just**          | *Afficher les options de la commande just*                           |
| **just check**    | *Lancer l'évaluation et les tests sans compiler*                     |
| **just build**    | *Evaluer et compiler le projet*                                      |
| **just build-vm** | *Construire le projet et exécuter une VM du résultat*                |
| **just update**   | *Mettre à jour le flocon vers la dernière mise à jour disponible*    |
| **just clean**    | *Nettoyer le dépôt*                                                  |
| **just iso**      | *Construire l'image iso*                                             |
| **just install**  | *Copier l'image iso dans un répertoire `iso` et générer un checksum* |
| **just fix**      | *Vérifier la syntaxe et le style du code nix et formatter*           |

{: .note }
> Dans la majorité des cas, vous aurez besoin de `just check` ou `just build` et `just all`. `just fix` fonctionne avec `deadnix`, `statix` et `nixfmt-rfc-style` (ne pas prendre la version `classic`).
