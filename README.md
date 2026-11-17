# Le Gambleur Fou — v1.0.0

Application indépendante de suivi personnel des mises, retours encaissés et résultats nets.

## Plateformes
- Web et iPhone : PWA publiée avec GitHub Pages, installable depuis Safari.
- macOS et Windows : applications Electron compilées par GitHub Actions.

## Démarrage local
```bash
npm install
npm start
```

## Publication GitHub
1. Crée un dépôt GitHub `le-gambleur-fou`.
2. Envoie le contenu de cette archive sur la branche `main`.
3. Dans Settings > Pages, choisis **GitHub Actions**.
4. Le workflow `Publier Le Gambleur Fou (web et iPhone)` publie automatiquement la PWA.
5. Dans Actions, lance `Compiler Le Gambleur Fou (Mac et Windows)` pour produire les installateurs.

## Comptes et synchronisation
Le projet Supabase configuré est `pwvjybylbobqibvtpkiw`. La table `public.gambleur_state` est indépendante de La Moula, avec RLS activé et chaque compte ne peut lire/écrire que sa propre ligne.
La clé `sb_publishable_...` est une clé publique destinée au client. Ne jamais mettre une clé `service_role` ou `secret` dans cette application.

Dans Supabase > Authentication > URL Configuration, ajoute l'URL GitHub Pages de ton dépôt dans Site URL et Redirect URLs. Pour tester rapidement, tu peux désactiver temporairement la confirmation d'e-mail dans Authentication > Providers > Email, ou laisser la confirmation active et vérifier l'adresse lors de l'inscription.

## Données
Chaque opération contient date, catégorie, site/jeu, mise, retour encaissé et note. Résultat net = retour encaissé - mise. L'historique peut être exporté en CSV ou imprimé en PDF.

## Important
Ce logiciel est un outil de suivi personnel, pas un service de jeu ou de conseil financier. Les données saisies sont à vérifier par l'utilisateur. Le mode sans compte conserve les données uniquement dans le navigateur/appareil.
