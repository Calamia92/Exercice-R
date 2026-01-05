library(questionr)
library(jsonlite)
library(dataMaid)
library(dplyr)

df <- fromJSON("../docs/questionr.json")
describe(df)

if ("age" %in% names(df)) {
  df$age_cat <- icut(df$age, breaks = c(16, 25, 45, 65, 99), right = FALSE)
  print(table(df$age_cat, useNA = "always"))
}

if ("qualif" %in% names(df)) {
  df$qualif_rec <- irec(df, qualif)
}

if ("nivetud" %in% names(df)) {
  df$nivetud_ord <- iorder(df, nivetud)
}

makeCodebook(df, file = "codebook_df.html", replace = TRUE, openResult = TRUE)
makeCodebook(df, file = "codebook_df.pdf", replace = TRUE, output = "pdf")
makeCodebook(df, file = "codebook_df.docx", replace = TRUE, output = "word")

if ("heures.tv" %in% names(df)) {
  mean(df$heures.tv, na.rm = TRUE)
  sd(df$heures.tv, na.rm = TRUE)
  min(df$heures.tv, na.rm = TRUE)
  max(df$heures.tv, na.rm = TRUE)
  range(df$heures.tv, na.rm = TRUE)
  median(df$heures.tv, na.rm = TRUE)
  quantile(df$heures.tv, na.rm = TRUE)
  summary(df$heures.tv)
  
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

variables_qualitatives <- c("sexe", "occup", "freres.soeurs", "qualif", "trav.satisf")

for (var in variables_qualitatives) {
  if (var %in% names(df)) {
    table(df[[var]], useNA = "always")
    freq(df[[var]])
    
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

if ("sport" %in% names(df)) {
  sum(is.na(df$sport))
  table(df$sport, useNA = "always")
  sum(df$sport == "Non", na.rm = TRUE)
}

if ("nivetud" %in% names(df)) {
  sum(is.na(df$nivetud))
  table(df$nivetud, useNA = "always")
  freq(df$nivetud)
  
  df$etud <- case_when(
    df$nivetud %in% c("Technique ou professionnel court", "Technique ou professionnel long") ~ "Technique/Professionnel",
    df$nivetud %in% c("N'a jamais fait d'etudes", "Primaire") ~ "Primaire", 
    df$nivetud %in% c("Superieur") ~ "Supérieur",
    df$nivetud %in% c("Secondaire") ~ "Secondaire",
    TRUE ~ as.character(df$nivetud)
  )
  
  table(df$etud, useNA = "always")
}

if ("sport" %in% names(df) && all(c("age", "sexe", "relig", "heures.tv") %in% names(df))) {
  var_education <- if ("etud" %in% names(df)) "etud" else "nivetud"
  formule <- paste("sport ~", paste(c("age", "sexe", var_education, "relig", "heures.tv"), collapse = " + "))
  
  model_logit <- glm(as.formula(formule), data = df, family = binomial(link = "logit"))
  summary(model_logit)
  exp(coef(model_logit))
}