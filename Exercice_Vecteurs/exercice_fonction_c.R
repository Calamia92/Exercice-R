# Exercice 1 : La fonction "c" comme combine !

# Création des vecteurs de base
vect_sans_c <- 0:10 
vect_num <- c(5, 55, 555) 
vect_chr <- c("a", "b", "c", "d", "e") 
vect_logic <- c(TRUE, FALSE, TRUE) 
vect_NA <- c(NA, NA, NA)

# Remarque sur la coercition de type
vect <- c("a", 1, "z")
print(vect)  # devient tout alpha : [1] "a" "1" "z"

cat("\n=== RÉPONSES AUX QUESTIONS ===\n\n")

# 1. Équivalent de c() en Python
cat("1. Équivalents de c() en Python :\n")
cat("   - Pour numpy array : np.append() ou np.concatenate()\n")
cat("   - Pour liste : list.append() ou list.extend()\n\n")

# 2. Créer un vecteur v de 1 à 100
v <- 1:100
cat("2. Vecteur v créé (1 à 100)\n")
cat("   R: v <- 1:100\n")
cat("   Python tuple: tuple(range(1, 101))\n")
cat("   Python liste: list(range(1, 101))\n\n")

# 3. Affichages divers
cat("3. Affichages de v :\n")
cat("   1ère valeur: ", v[1], "\n")
cat("   Dernière valeur: ", v[length(v)], "\n")
cat("   5 premières: ", v[1:5], "\n")
cat("   5 dernières: ", v[(length(v)-4):length(v)], "\n")
cat("   Tout sauf 5 dernières: ", v[1:(length(v)-5)], "\n")
cat("   Tout sauf 5 premières et 5 dernières: ", v[6:(length(v)-5)], "\n\n")

# 4. Extractions spécifiques
cat("4. Extractions spécifiques :\n")
indices_a_extraire <- c(1, 4, 98, 99, 100)  # 1ère, 4ème et 3 dernières
cat("   1ère, 4ème et 3 dernières: ", v[indices_a_extraire], "\n")

indices_a_exclure <- c(1, 4, 98, 99, 100)
cat("   Tout sauf 1ère, 4ème et 3 dernières: ", v[-indices_a_exclure], "\n")

indices_sans_4eme <- c(1, 98, 99, 100)  # 1ère et 3 dernières sans la 4ème
cat("   1ère et 3 dernières sans 4ème: ", v[indices_sans_4eme], "\n\n")

# 5. Vecteurs pairs et impairs
cat("5. Décomposition pairs/impairs :\n")
v_pair <- v[v %% 2 == 0]
v_impair <- v[v %% 2 == 1]
cat("   v_pair (premières valeurs): ", head(v_pair, 10), "...\n")
cat("   v_impair (premières valeurs): ", head(v_impair, 10), "...\n\n")

# 6. Répéter "R" 20 fois
cat("6. Vecteur R répété 20 fois :\n")
R_vect <- rep("R", 20)
cat("   ", R_vect, "\n\n")

# 7. Créer un vecteur mixte avec "R" répété et séquence numérique
cat("7. Vecteur mixte :\n")
vect_7 <- c(rep("R", 5), as.character(seq(0, 1, by = 0.125)))
cat("   ", vect_7, "\n\n")

# 8. Créer un vecteur avec répétition de couleurs
cat("8. Vecteur couleurs répétées :\n")
vect_8 <- rep(c("Rouge", "Bleu", "Vert"), 3)  # Répète le pattern 3 fois
cat("   ", vect_8, "\n")