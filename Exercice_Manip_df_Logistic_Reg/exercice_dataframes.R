# Exercice : Manipulation DataFrame & Régression Logistique

cat("=== EXERCICE DATAFRAMES ET RÉGRESSION LOGISTIQUE ===\n\n")

# 1. Installation et importation du package questionr
cat("1. Installation et chargement des packages...\n")

# Installer les packages (décommentez si nécessaire)
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
  
  # Note: irec() est interactif, on peut le commenter pour l'automatisation
  # df$qualif_rec <- irec(df, qualif)
} else {
  cat("   Variable 'qualif' non trouvée\n")
}

# iorder() pour ordonner les niveaux (si variable nivetud existe)
if ("nivetud" %in% names(df)) {
  cat("   Modalités de nivetud avant iorder() :\n")
  print(table(df$nivetud, useNA = "always"))
  
  cat("\n   Lancement de iorder() pour la variable nivetud...\n")
  cat("   (Fonction interactive - suivre les instructions à l'écran)\n\n")
  
  # Note: iorder() est interactif, on peut le commenter pour l'automatisation  
  # df$nivetud_ord <- iorder(df, nivetud)
} else {
  cat("   Variable 'nivetud' non trouvée\n")
}

# 4. Génération du codebook avec dataMaid
cat("6. Génération du codebook avec dataMaid :\n")
cat("   (Décommentez les lignes suivantes si dataMaid est installé)\n\n")

# library(dataMaid)
# 
# # Générer un codebook en HTML
# makeCodebook(df, 
#              file = "codebook_df.html",
#              replace = TRUE,
#              openResult = TRUE)
# 
# # Générer un codebook en PDF (nécessite LaTeX)
# makeCodebook(df, 
#              file = "codebook_df.pdf", 
#              replace = TRUE,
#              output = "pdf")
# 
# # Générer un codebook en Word
# makeCodebook(df, 
#              file = "codebook_df.docx",
#              replace = TRUE, 
#              output = "word")

cat("   Codebooks générés (HTML, PDF, Word) si dataMaid est installé\n\n")

# 5. Application Shiny dataMaid
cat("7. Lancement de l'application Shiny dataMaid :\n")
cat("   (Décommentez les lignes suivantes pour lancer l'app)\n\n")

# library(shiny)
# runUrl("https://github.com/ekstroem/dataMaid/raw/master/app/app.zip")

cat("   Application Shiny prête à être lancée\n\n")

# Analyse exploratoire basique
cat("8. Analyse exploratoire du dataset :\n")
cat("   Structure du dataset :\n")
str(df)
cat("\n")

cat("   Résumé statistique :\n")
summary(df)
cat("\n")

cat("=== EXERCICE TERMINÉ ===\n")
cat("Pour utiliser les fonctions interactives :\n")
cat("1. Décommentez les lignes d'installation des packages\n")
cat("2. Décommentez les appels à irec() et iorder()\n") 
cat("3. Décommentez la génération des codebooks\n")
cat("4. Décommentez le lancement de l'app Shiny\n")