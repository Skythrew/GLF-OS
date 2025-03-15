---
title: Installer un paquet provenant de Nix sans flatpak
layout: default
parent: Documentation
---

# Comment installer un paquet nix sans flatpak 

GLFOS ne supporte pas les modifications de configurations réalisées par vos propre soins, mais nous vous indiquons ci dessous comment inclure de nouveaux package à votre base GLF OS provenant de Nix OS plutôt que par flatpak. Vous pouvez connaitre le catalogue du nix-store et le nom des paquets à inclure à votre fichier de conf.nix ici : https://search.nixos.org/packages

Cette étape n'est qu'à faire une seule fois. 

- Créez un nouveau fichier:

```bash
sudo touch /etc/nixos/packages.nix
```

Ouvez-le avec `sudo nano /etc/nixos/packages.nix` et ajoutez : 

```nix
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
  # Ajoutez ici vos logiciels 
  ];
}
```

Enregistrez le fichier avec `CTRL+O`, `ENTER` puis `CTRL+X`, `ENTER`.

Ouvrez maintenant `configuration.nix` avec : 

```bash
sudo nano /etc/nixos/configuration.nix
```

Dans la section `imports`, ajoutez à la suite de `./hardware-configuration.nix` : 

```nix
imports = [
  ./hardware-configuration.nix
  ./glf
  ./packages.nix
];
```

Enfin, appliquez la configuration avec : 

```bash
glf-switch
```
