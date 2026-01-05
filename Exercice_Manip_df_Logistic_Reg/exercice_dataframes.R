# Exercice : Manipulation DataFrame & Régression Logistique

cat("=== EXERCICE DATAFRAMES ET RÉGRESSION LOGISTIQUE ===\n\n")

# 1. Installation et importation du package questionr
cat("1. Installation et chargement des packages...\n")

# Packages déjà installés
# install.packages("questionr")
# install.packages("dataMaid")
# install.packages("jsonlite")
# install.packages("shiny")

# Chargement des librairies
library(questionr)
library(jsonlite)

cat("   Packages chargés avec succès !\n\n")

# Chargement du jeu de données depuis le fichier JSON
cat("2. Chargement des données depuis questionr.json...\n")
df <- fromJSON("../docs/questionr.json")

cat("   Dimensions du dataset:", nrow(df), "lignes,", ncol(df), "colonnes\n\n")

# Describe du dataset
cat("3. Description du dataset avec describe() :\n")
describe(df)
cat("\n")

# Vérifier les variables disponibles
cat("Variables disponibles dans le dataset :\n")
print(names(df))
cat("\n")

# 2. Découpage de la variable age
cat("4. Découpage de la variable age avec icut() :\n")
if ("age" %in% names(df)) {
  # Créer les intervalles d'âge
  df$age_cat <- icut(df$age, breaks = c(16, 25, 45, 65, 99), right = FALSE)
  
  cat("   Intervalles d'âge créés :\n")
  print(table(df$age_cat, useNA = "always"))
  cat("\n")
} else {
  cat("   Variable 'age' non trouvée dans le dataset\n\n")
}

# 3. Manipulation avec irec() et iorder()
cat("5. Manipulation des variables avec irec() et iorder() :\n")

# irec() pour renommer/regrouper des modalités (si variable qualif existe)
if ("qualif" %in% names(df)) {
  cat("   Avant irec() - modalités de qualif :\n")
  print(table(df$qualif, useNA = "always"))
  
  cat("\n   Lancement de irec() pour la variable qualif...\n")
  cat("   (Fonction interactive - suivre les instructions à l'écran)\n\n")
  
  # irec() est interactif - décommentez pour utiliser
  df$qualif_rec <- irec(df, qualif)
} else {
  cat("   Variable 'qualif' non trouvée\n")
}

# iorder() pour ordonner les niveaux (si variable nivetud existe)
if ("nivetud" %in% names(df)) {
  cat("   Modalités de nivetud avant iorder() :\n")
  print(table(df$nivetud, useNA = "always"))
  
  cat("\n   Lancement de iorder() pour la variable nivetud...\n")
  cat("   (Fonction interactive - suivre les instructions à l'écran)\n\n")
  
  # iorder() est interactif - décommentez pour utiliser  
  df$nivetud_ord <- iorder(df, nivetud)
} else {
  cat("   Variable 'nivetud' non trouvée\n")
}

# 4. Génération du codebook avec dataMaid
cat("6. Génération du codebook avec dataMaid :\n")

library(dataMaid)

# Générer un codebook en HTML
cat("   Génération du codebook HTML...\n")
makeCodebook(df, 
             file = "codebook_df.html",
             replace = TRUE,
             openResult = TRUE)

# Générer un codebook en PDF (nécessite LaTeX)
cat("   Génération du codebook PDF...\n")
makeCodebook(df, 
             file = "codebook_df.pdf", 
             replace = TRUE,
             output = "pdf")

# Générer un codebook en Word
cat("   Génération du codebook Word...\n")
makeCodebook(df, 
             file = "codebook_df.docx",
             replace = TRUE, 
             output = "word")

cat("   Codebooks générés : codebook_df.html, codebook_df.pdf, codebook_df.docx\n\n")

# 5. Application Shiny dataMaid
cat("7. Lancement de l'application Shiny dataMaid :\n")
cat("   (Décommentez pour lancer l'application web)\n")

# library(shiny)
# runUrl("https://github.com/ekstroem/dataMaid/raw/master/app/app.zip")

cat("   Application Shiny disponible (décommentez pour lancer)\n\n")

# Analyse exploratoire basique
cat("8. Analyse exploratoire du dataset :\n")
cat("   Structure du dataset :\n")
str(df)
cat("\n")

cat("   Résumé statistique :\n")
summary(df)
cat("\n")

# 4. Analyse de la variable quantitative heures.tv
cat("9. Analyse de la variable quantitative 'heures.tv' :\n")

if ("heures.tv" %in% names(df)) {
  cat("   4.1 Indicateurs statistiques de base :\n")
  
  # Moyenne
  cat("   Moyenne :", mean(df$heures.tv, na.rm = TRUE), "\n")
  
  # Écart-type
  cat("   Écart-type :", sd(df$heures.tv, na.rm = TRUE), "\n")
  
  # Minimum et Maximum
  cat("   Minimum :", min(df$heures.tv, na.rm = TRUE), "\n")
  cat("   Maximum :", max(df$heures.tv, na.rm = TRUE), "\n")
  
  # Étendue
  cat("   Étendue :", range(df$heures.tv, na.rm = TRUE), "\n")
  
  # Médiane
  cat("   Médiane :", median(df$heures.tv, na.rm = TRUE), "\n")
  
  # Quartiles
  cat("   Quartiles :\n")
  print(quantile(df$heures.tv, na.rm = TRUE))
  
  # Résumé complet
  cat("\n   Résumé complet avec summary() :\n")
  print(summary(df$heures.tv))
  
  cat("\n   4.2 Graphiques pour heures.tv :\n")
  
  # Boîte à moustaches
  cat("   Création de la boîte à moustaches...\n")
  png("boxplot_heures_tv.png", width = 800, height = 600)
  boxplot(df$heures.tv, 
          main = "Boîte à moustaches - Heures de télévision", 
          ylab = "Heures de télévision",
          col = "lightblue")
  dev.off()
  cat("   → Boxplot exporté : boxplot_heures_tv.png\n")
  
  # Histogramme avec breaks spécifiés
  cat("   Création de l'histogramme avec breaks (0, 1, 4, 9, 12)...\n")
  png("histogramme_heures_tv.png", width = 800, height = 600)
  hist(df$heures.tv, 
       breaks = c(0, 1, 4, 9, 12),
       main = "Histogramme - Heures de télévision", 
       xlab = "Heures de télévision",
       ylab = "Fréquence",
       col = "lightgreen",
       border = "black")
  dev.off()
  cat("   → Histogramme exporté : histogramme_heures_tv.png\n\n")
  
} else {
  cat("   Variable 'heures.tv' non trouvée dans le dataset\n\n")
}

# 5. Analyse des variables qualitatives
cat("10. Analyse des variables qualitatives :\n")

# Variables qualitatives à analyser
variables_qualitatives <- c("sexe", "occup", "freres.soeurs", "qualif", "trav.satisf")

cat("   5.1 Effectifs avec table() :\n")
for (var in variables_qualitatives) {
  if (var %in% names(df)) {
    cat("\n   Variable", var, ":\n")
    print(table(df[[var]], useNA = "always"))
  } else {
    cat("   Variable", var, "non trouvée\n")
  }
}

cat("\n   5.2 Effectifs détaillés avec questionr::freq() :\n")
for (var in variables_qualitatives) {
  if (var %in% names(df)) {
    cat("\n   Variable", var, ":\n")
    print(freq(df[[var]]))
  }
}

cat("\n   5.3 Graphiques pour variables qualitatives :\n")

# Graphiques pour chaque variable qualitative
for (var in variables_qualitatives) {
  if (var %in% names(df)) {
    # Diagramme en bâtons avec plot()
    png(paste0("barplot_", var, ".png"), width = 800, height = 600)
    plot(table(df[[var]]), 
         main = paste("Diagramme en bâtons -", var),
         xlab = var,
         ylab = "Effectifs",
         col = "lightcoral")
    dev.off()
    
    # Diagramme circulaire avec pie()
    png(paste0("pie_", var, ".png"), width = 800, height = 600)
    pie(table(df[[var]]), 
        main = paste("Diagramme circulaire -", var),
        col = rainbow(length(table(df[[var]]))))
    dev.off()
    
    cat("   →", var, "- Graphiques exportés :", paste0("barplot_", var, ".png"), "et", paste0("pie_", var, ".png\n"))
  }
}

cat("\n   Conclusion :\n")
cat("   Les diagrammes en bâtons sont généralement plus pertinents que les camemberts\n")
cat("   car ils permettent une meilleure comparaison des effectifs entre modalités.\n")
cat("   Les camemberts conviennent mieux pour montrer des proportions d'un tout.\n\n")

# === RÉGRESSION LOGISTIQUE ===
cat("=== PARTIE RÉGRESSION LOGISTIQUE ===\n\n")

# 6. Vérification de la variable target 'sport'
cat("11. Vérification de la variable target 'sport' :\n")

if ("sport" %in% names(df)) {
  # Vérifier les données manquantes
  na_count <- sum(is.na(df$sport))
  cat("   Nombre de données manquantes dans 'sport' :", na_count, "\n")
  
  # Effectifs de la variable sport
  cat("   Effectifs de la variable 'sport' :\n")
  print(table(df$sport, useNA = "always"))
  
  # Compter les non-pratiquants (en supposant que "Non" = ne pratique pas)
  if (any(!is.na(df$sport))) {
    non_pratiquants <- sum(df$sport == "Non", na.rm = TRUE)
    cat("   Nombre d'individus ne pratiquant pas de sport :", non_pratiquants, "\n\n")
  }
} else {
  cat("   Variable 'sport' non trouvée dans le dataset\n\n")
}

# 7. Analyse et recodage de la variable 'nivetud'
cat("12. Analyse et recodage de la variable 'nivetud' :\n")

if ("nivetud" %in% names(df)) {
  # Vérifier les NA
  na_count_nivetud <- sum(is.na(df$nivetud))
  cat("   Nombre de NA dans 'nivetud' :", na_count_nivetud, "\n")
  
  # Effectifs détaillés
  cat("   Effectifs détaillés de 'nivetud' :\n")
  print(table(df$nivetud, useNA = "always"))
  cat("\n")
  
  # Pourcentages
  cat("   Pourcentages de 'nivetud' :\n")
  print(freq(df$nivetud))
  cat("\n")
  
  # Création de la nouvelle variable 'etud' avec 4 modalités
  cat("   Création de la variable 'etud' avec 4 modalités :\n")
  df$etud <- df$nivetud
  
  # Recodage selon les modalités existantes
  # Chargement de dplyr pour case_when
  library(dplyr)
  
  df$etud <- case_when(
    df$nivetud %in% c("Technique ou professionnel court", "Technique ou professionnel long") ~ "Technique/Professionnel",
    df$nivetud %in% c("N'a jamais fait d'etudes", "Primaire") ~ "Primaire", 
    df$nivetud %in% c("Superieur") ~ "Supérieur",
    df$nivetud %in% c("Secondaire") ~ "Secondaire",
    TRUE ~ as.character(df$nivetud)
  )
  
  # Vérification du recodage
  cat("   Effectifs de la nouvelle variable 'etud' :\n")
  print(table(df$etud, useNA = "always"))
  cat("\n")
  
} else {
  cat("   Variable 'nivetud' non trouvée dans le dataset\n\n")
}

# 8. Modèle de régression logistique
cat("13. Modèle de régression logistique :\n")

if ("sport" %in% names(df)) {
  cat("   Variables explicatives : age, sexe, etud, relig, heures.tv\n")
  cat("   Variable à expliquer : sport\n\n")
  
  # Vérifier que toutes les variables sont disponibles
  variables_model <- c("age", "sexe", "etud", "relig", "heures.tv", "sport")
  variables_disponibles <- variables_model[variables_model %in% names(df)]
  variables_manquantes <- variables_model[!variables_model %in% names(df)]
  
  cat("   Variables disponibles :", paste(variables_disponibles, collapse = ", "), "\n")
  if (length(variables_manquantes) > 0) {
    cat("   Variables manquantes :", paste(variables_manquantes, collapse = ", "), "\n")
  }
  
  # Si toutes les variables sont disponibles, ajuster le modèle
  if (all(c("sport", "age", "sexe", "relig", "heures.tv") %in% names(df))) {
    cat("\n   Ajustement du modèle logistique...\n")
    
    # Utiliser 'etud' si elle existe, sinon 'nivetud'
    var_education <- if ("etud" %in% names(df)) "etud" else "nivetud"
    
    # Créer la formule
    formule <- paste("sport ~", paste(c("age", "sexe", var_education, "relig", "heures.tv"), collapse = " + "))
    cat("   Formule :", formule, "\n")
    
    # Ajuster le modèle
    model_logit <- glm(as.formula(formule), 
                       data = df, 
                       family = binomial(link = "logit"))
    
    # Afficher les résultats
    cat("\n   Résumé du modèle :\n")
    print(summary(model_logit))
    cat("\n")
    
    # Odds ratios
    cat("   Odds ratios (exp(coefficients)) :\n")
    print(exp(coef(model_logit)))
    cat("\n")
    
  } else {
    cat("\n   Impossible d'ajuster le modèle : variables manquantes\n\n")
  }
} else {
  cat("   Variable 'sport' non trouvée - impossible d'ajuster le modèle\n\n")
}

cat("=== EXERCICE TERMINÉ ===\n")
cat("Analyses complètes :\n")
cat("1. Variables quantitatives et qualitatives analysées\n")
cat("2. Graphiques exportés\n")
cat("3. Variable 'etud' créée avec recodage\n")
cat("4. Modèle de régression logistique ajusté\n")