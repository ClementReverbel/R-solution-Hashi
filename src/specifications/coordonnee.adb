pragma Ada_2012;
package body Coordonnee is

   ---------------------------
   -- ConstruireCoordonnees --
   ---------------------------

   function ConstruireCoordonnees
     (Ligne, Colonne : in Integer) return Type_Coordonnee
   is
      begin
      -- Crée une instance de Type_Coordonnee avec les valeurs de ligne et colonne fournies.
      return (Ligne => Ligne, Colonne => Colonne);
   end ConstruireCoordonnees;

   ------------------
   -- ObtenirLigne --
   ------------------

   function ObtenirLigne (C : in Type_Coordonnee) return Integer is
   begin
      -- Renvoie la valeur de la ligne de la coordonnée.
      return C.Ligne;
   end ObtenirLigne;

   --------------------
   -- ObtenirColonne --
   --------------------

   function ObtenirColonne (C : in Type_Coordonnee) return Integer is
   begin
      -- Renvoie la valeur de la colonne de la coordonnée.
      return C.Colonne;
   end ObtenirColonne;

end Coordonnee;
