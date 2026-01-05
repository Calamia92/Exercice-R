# Question 1: Installation package questionr et describe()
library(questionr)
library(jsonlite)
library(dataMaid)
library(dplyr)

df <- fromJSON("../docs/questionr.json")
describe(df)

# Question 2: Découpage variable age avec icut()
if ("age" %in% names(df)) {
  df$age_cat <- icut(df$age, breaks = c(16, 25, 45, 65, 99), right = FALSE)
  print(table(df$age_cat, useNA = "always"))
}

# Question 2: irec() et iorder()
if ("qualif" %in% names(df)) {
  df$qualif_rec <- irec(df, qualif)
}

if ("nivetud" %in% names(df)) {
  df$nivetud_ord <- iorder(df, nivetud)
}

# Question 3: Génération codebooks avec dataMaid
makeCodebook(df, file = "codebook_df.html", replace = TRUE, openResult = TRUE)
makeCodebook(df, file = "codebook_df.pdf", replace = TRUE, output = "pdf")
makeCodebook(df, file = "codebook_df.docx", replace = TRUE, output = "word")

# Question 4: Analyse variable quantitative heures.tv
if ("heures.tv" %in% names(df)) {
  # 4.1 Indicateurs statistiques
  mean(df$heures.tv, na.rm = TRUE)
  sd(df$heures.tv, na.rm = TRUE)
  min(df$heures.tv, na.rm = TRUE)
  max(df$heures.tv, na.rm = TRUE)
  range(df$heures.tv, na.rm = TRUE)
  median(df$heures.tv, na.rm = TRUE)
  quantile(df$heures.tv, na.rm = TRUE)
  summary(df$heures.tv)
  
  # 4.2 Graphiques boxplot et histogramme
  png("boxplot_heures_tv.png", width = 800, height = 600)
  boxplot(df$heures.tv, main = "Boîte à moustaches - Heures de télévision", 
          ylab = "Heures de télévision", col = "lightblue")
  dev.off()
  
  png("histogramme_heures_tv.png", width = 800, height = 600)
  hist(df$heures.tv, breaks = c(0, 1, 4, 9, 12),
       main = "Histogramme - Heures de télévision", 
       xlab = "Heures de télévision", ylab = "Fréquence",
       col = "lightgreen", border = "black")
  dev.off()
}

# Question 5: Analyse variables qualitatives
variables_qualitatives <- c("sexe", "occup", "freres.soeurs", "qualif", "trav.satisf")

for (var in variables_qualitatives) {
  if (var %in% names(df)) {
    # 5.1 Effectifs avec table()
    table(df[[var]], useNA = "always")
    # 5.2 Effectifs détaillés avec questionr::freq()
    freq(df[[var]])
    
    # 5.3 Graphiques plot() et pie()
    png(paste0("barplot_", var, ".png"), width = 800, height = 600)
    plot(table(df[[var]]), main = paste("Diagramme en bâtons -", var),
         xlab = var, ylab = "Effectifs", col = "lightcoral")
    dev.off()
    
    png(paste0("pie_", var, ".png"), width = 800, height = 600)
    pie(table(df[[var]]), main = paste("Diagramme circulaire -", var),
        col = rainbow(length(table(df[[var]]))))
    dev.off()
  }
}

# Question 6: Vérification variable target sport
if ("sport" %in% names(df)) {
  sum(is.na(df$sport))  # Données manquantes
  table(df$sport, useNA = "always")  # Effectifs
  sum(df$sport == "Non", na.rm = TRUE)  # Non-pratiquants
}

# Question 7: Analyse nivetud et création variable etud
if ("nivetud" %in% names(df)) {
  sum(is.na(df$nivetud))  # Vérifier 112 NA
  table(df$nivetud, useNA = "always")  # 8 modalités
  freq(df$nivetud)  # Pourcentages
  
  # Création variable etud avec 4 modalités
  df$etud <- case_when(
    df$nivetud %in% c("Technique ou professionnel court", "Technique ou professionnel long") ~ "Technique/Professionnel",
    df$nivetud %in% c("N'a jamais fait d'etudes", "Primaire") ~ "Primaire", 
    df$nivetud %in% c("Superieur") ~ "Supérieur",
    df$nivetud %in% c("Secondaire") ~ "Secondaire",
    TRUE ~ as.character(df$nivetud)
  )
  
  table(df$etud, useNA = "always")
}

# Question 8: Modèle de régression logistique avec glm()
if ("sport" %in% names(df) && all(c("age", "sexe", "relig", "heures.tv") %in% names(df))) {
  var_education <- if ("etud" %in% names(df)) "etud" else "nivetud"
  formule <- paste("sport ~", paste(c("age", "sexe", var_education, "relig", "heures.tv"), collapse = " + "))
  
  model_logit <- glm(as.formula(formule), data = df, family = binomial(link = "logit"))
  summary(model_logit)  # Résultats du modèle
  exp(coef(model_logit))  # Odds ratios
}