# Exercice 2 : Opérations vectorielles

# Création des vecteurs v et w
v <- c(-1, 2, 4, 2, 0)
w <- c(0, 3, -1, 0, 2)

cat("=== EXERCICE 2 : OPÉRATIONS VECTORIELLES ===\n\n")

# 1. Opérations entre v et w
cat("1. Vecteurs créés :\n")
cat("   v =", v, "\n")
cat("   w =", w, "\n\n")

cat("   Opérations vectorielles :\n")
cat("   v + w =", v + w, "\n")
cat("   v - w =", v - w, "\n")
cat("   v * w =", v * w, "\n")
cat("   v / w =", v / w, "\n\n")

cat("   Opérations avec v :\n")
cat("   v + 3 =", v + 3, "\n")
cat("   sum(v) =", sum(v), "\n")
cat("   prod(v) =", prod(v), "\n\n")

# 2. Comparaisons logiques
cat("2. Comparaisons v > w :\n")
comparaison <- v > w
cat("   v > w =", comparaison, "\n\n")

# 3. Warnings avec log
cat("3. Test des warnings :\n")
cat("   log(v) provoque un warning car log(-1) n'existe pas :\n")
log_v <- log(v)
cat("   log(v) =", log_v, "\n\n")

cat("   Test 0/0 :\n")
resultat_0_0 <- 0/0
cat("   0/0 =", resultat_0_0, " (NaN = Not a Number)\n\n")

# 4. Combinaison de vecteurs
cat("4. Combinaison de vecteurs :\n")
z <- c(v, w)
cat("   z = c(v, w) =", z, "\n")
cat("   Équivalent Python : np.concatenate([v, w]) ou v + w pour les listes\n\n")

# 5. Comportement bizarre - recyclage
cat("5. Comportement de recyclage (v a 5 éléments, z a 10 éléments) :\n")
cat("   z + v =", z + v, "\n")
cat("   z - v =", z - v, "\n") 
cat("   z * v =", z * v, "\n")
cat("   z / v =", z / v, "\n")
cat("   Note : R recycle automatiquement v pour égaler la longueur de z\n\n")

# 6. Correction avec if statement
cat("6. Correction avec vérification de longueur :\n")

operation_securisee <- function(vect1, vect2, operation) {
  if (length(vect1) != length(vect2)) {
    cat("   ERREUR : Les vecteurs n'ont pas la même longueur !\n")
    cat("   Longueur de vect1 :", length(vect1), "\n")
    cat("   Longueur de vect2 :", length(vect2), "\n")
    return(NULL)
  } else {
    switch(operation,
           "+" = return(vect1 + vect2),
           "-" = return(vect1 - vect2),
           "*" = return(vect1 * vect2),
           "/" = return(vect1 / vect2)
    )
  }
}

cat("   Test z + v avec vérification :\n")
resultat <- operation_securisee(z, v, "+")
if (!is.null(resultat)) {
  cat("   Résultat :", resultat, "\n")
}

cat("\n   Test v + w avec vérification :\n")
resultat <- operation_securisee(v, w, "+")
if (!is.null(resultat)) {
  cat("   Résultat :", resultat, "\n")
}