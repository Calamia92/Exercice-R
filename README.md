# Exercices R - Collection d'Exercices de Programmation

Ce projet contient une série d'exercices R couvrant les fondamentaux du langage et l'analyse de données.

## Structure du Projet

```
Exercice R/
├── Exercice_Declaration_Amour/
│   └── declaration_amour.R        # Exercice déclaration d'amour
├── Exercice_FizzBuzz/
│   └── fizzbuzz.R                 # Exercice FizzBuzz classique
├── Exercice_Listes/
│   └── exercice_listes.R          # Manipulation de listes R
├── Exercice_Manip_df_Logistic_Reg/
│   └── exercice_dataframes.R      # Analyse de données et régression
├── Exercice_Vecteurs/
│   ├── exercice_fonction_c.R      # Fonction c() et création de vecteurs
│   └── exercice_operations_vectorielles.R  # Opérations sur les vecteurs
├── docs/
│   ├── questionr.json             # Jeu de données pour l'analyse
│   └── codebook_df.pdf            # Documentation des données
└── README.md
```

## Description des Exercices

### Exercices de Base
- **Declaration_Amour** : Exercice créatif avec manipulation de chaînes
- **FizzBuzz** : Algorithme classique de programmation
- **Listes** : Manipulation et opérations sur les listes R
- **Vecteurs** : Création de vecteurs avec `c()` et opérations vectorielles

### Exercice Principal : Manipulation de DataFrames et Régression

#### Questions 1-3 : Préparation des Données
- **Question 1** : Installation du package `questionr` et description du dataset
- **Question 2** : Découpage de la variable `age` avec `icut()`, manipulation avec `irec()` et `iorder()`
- **Question 3** : Génération de codebooks (HTML, PDF, Word) avec `dataMaid`

#### Questions 4-5 : Analyse Exploratoire
- **Question 4** : Analyse de la variable quantitative `heures.tv`
  - Indicateurs statistiques : moyenne, écart-type, médiane, quartiles
  - Visualisations : boxplot et histogramme avec breaks personnalisés
- **Question 5** : Analyse des variables qualitatives (`sexe`, `occup`, `freres.soeurs`, `qualif`, `trav.satisf`)
  - Tableaux de fréquences avec `table()` et `freq()`
  - Graphiques : diagrammes en bâtons et camemberts

#### Questions 6-8 : Régression Logistique
- **Question 6** : Vérification de la variable cible `sport` (données manquantes, non-pratiquants)
- **Question 7** : Recodage de `nivetud` en 4 modalités (`etud`)
- **Question 8** : Modèle de régression logistique avec `glm()`
  - Variables explicatives : `age`, `sexe`, `etud`, `relig`, `heures.tv`
  - Variable à expliquer : `sport`

## Prérequis

### Packages R requis
```r
install.packages(c("questionr", "dataMaid", "jsonlite", "dplyr"))
```

### Données
Le fichier `questionr.json` contient les données d'enquête à analyser.

## Utilisation

1. **Installer les packages** :
   ```r
   install.packages(c("questionr", "dataMaid", "jsonlite", "dplyr"))
   ```

2. **Exécuter le script** :
   ```r
   source("Exercice_Manip_df_Logistic_Reg/exercice_dataframes.R")
   ```

3. **Résultats générés** :
   - Codebooks : `codebook_df.html`, `codebook_df.pdf`, `codebook_df.docx`
   - Graphiques : `boxplot_heures_tv.png`, `histogramme_heures_tv.png`
   - Graphiques variables qualitatives : `barplot_*.png`, `pie_*.png`

## Fonctionnalités Interactives

Le script inclut des fonctions interactives (décommentez si nécessaire) :
- `irec()` : Recodage interactif des modalités
- `iorder()` : Réorganisation des niveaux de facteurs
- Application Shiny dataMaid

## Objectifs Pédagogiques

- Manipulation et exploration de données avec R
- Visualisation de données quantitatives et qualitatives
- Préparation de données pour la modélisation
- Régression logistique et interprétation des résultats