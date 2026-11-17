# Supabase — Le Gambleur Fou

Le projet Supabase utilisé est `pwvjybylbobqibvtpkiw` (région Europe).

## Configuration déjà réalisée
La table `public.gambleur_state` a été créée. RLS est activé. Les droits `anon` sont révoqués ; le rôle `authenticated` a accès aux opérations SQL, mais une politique RLS limite toutes les lignes à `owner_id = auth.uid()`. Le schéma est séparé de celui de La Moula (`moula_state`).

## Configuration de l'authentification
Dans Supabase Dashboard > Authentication > URL Configuration :
- Site URL : l'URL GitHub Pages de l'application.
- Redirect URLs : ajoute également cette même URL.
Dans Authentication > Providers > Email, règle la confirmation d'adresse selon ton choix. Si la confirmation est activée, l'utilisateur doit cliquer sur le lien reçu avant de pouvoir se connecter.

## Configuration de l'application
`src/config.js` contient l'URL du projet et la clé publishable. Cette clé est publique et peut être présente dans le navigateur. Ne jamais utiliser une clé `service_role` ou `secret`.

## Vérification
Dans Table Editor, `gambleur_state` doit apparaître dans le schéma `public`. Un utilisateur connecté crée une seule ligne dont `owner_id` est son UUID. RLS interdit l'accès aux données des autres utilisateurs.
