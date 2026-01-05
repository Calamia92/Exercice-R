# Exercice FizzBuzz - Entretien technique
# Afficher les nombres de 1 à 100 avec les règles :
# - Multiples de 3 : "Fizz"
# - Multiples de 5 : "Buzz" 
# - Multiples de 3 ET 5 : "FizzBuzz"

for (i in 1:100) {
  if (i %% 15 == 0) {
    cat("FizzBuzz")
  } else if (i %% 3 == 0) {
    cat("Fizz")
  } else if (i %% 5 == 0) {
    cat("Buzz")
  } else {
    cat(i)
  }
  
  # Ajouter une virgule et un espace sauf pour le dernier élément
  if (i < 100) {
    cat(", ")
  }
}

cat("\n")