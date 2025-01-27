---
title: Construire une iso 
layout: default
parent: Développement
---

# Pré-requis

- Le gestionnaire de paquets `nix`
- [`just`](https://github.com/casey/just)

```bash
nix-shell -p nix just
```

# Construire

1. Clonez le projet 

```bash
git clone https://github.com/GLF-OS/Nixos-by-GLF.git
```

2. Déplacez-vous dans l'arborescence

```bash
cd Nixos-by-GLF
```

3. Construire

```bash
just iso 
```
