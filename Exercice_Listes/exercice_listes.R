# Exercice : Listes en R

# Création de la liste avec les données
title <- "Ma première liste en R"
id_client <- c("Id1", "Id2", "Id3", "Id4", "Id5")
product <- c("aa", "bb", "cc", "dd", "ee")
price <- c(101, 102, 103, 104, 105)
paiement_status <- c(TRUE, FALSE, TRUE, FALSE, TRUE)

# Création de la liste
l <- list(title, id_client, product, price, paiement_status)

cat("=== EXERCICE : LISTES EN R ===\n\n")

cat("Structure de la liste créée :\n")
cat("Position 1: title\n")
cat("Position 2: id_client\n") 
cat("Position 3: product\n")
cat("Position 4: price\n")
cat("Position 5: paiement_status\n\n")

# 1. Afficher le statut des paiements (dernier item)
cat("1. Statut des paiements (dernier item) :\n")
cat("   l[[5]] ou l[[length(l)]] =", l[[5]], "\n\n")

# 2. Afficher les id_client (item particulier)
cat("2. ID clients (accès à un item particulier) :\n")
cat("   l[[2]] =", l[[2]], "\n\n")

# 3. Afficher id_client et statut paiement (range non ordonné)
cat("3. ID clients et statut paiements (range non ordonné) :\n")
cat("   Méthode 1 - avec indices : l[c(2, 5)]\n")
print(l[c(2, 5)])
cat("   Méthode 2 - accès direct :\n")
cat("   ID clients:", l[[2]], "\n")
cat("   Statuts paiement:", l[[5]], "\n\n")

# 4. Afficher produits, prix et statut (range ordonné)
cat("4. Produits, prix et statut paiements (range ordonné 3:5) :\n")
cat("   l[3:5] :\n")
print(l[3:5])
cat("\n")

# 5. Afficher tout sauf id_client (privation sur un item)
cat("5. Tout sauf les ID clients (privation item 2) :\n")
cat("   l[-2] :\n")
print(l[-2])
cat("\n")

# 6. Afficher tout sauf title et id_client (privation sur plusieurs items)
cat("6. Tout sauf title et ID clients (privation items 1 et 2) :\n")
cat("   l[-c(1, 2)] :\n")
print(l[-c(1, 2)])
cat("\n")

# Bonus : Version avec noms pour plus de clarté
cat("=== BONUS : Liste nommée ===\n")
l_nommee <- list(
  title = title,
  id_client = id_client,
  product = product,
  price = price,
  paiement_status = paiement_status
)

cat("Avec une liste nommée, on peut accéder par nom :\n")
cat("l_nommee$paiement_status =", l_nommee$paiement_status, "\n")
cat("l_nommee[['id_client']] =", l_nommee[['id_client']], "\n")