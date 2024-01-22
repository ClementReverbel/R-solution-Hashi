pragma Ada_2012;
package body Grille is

   ----------------------
   -- ConstruireGrille --
   ----------------------

   function ConstruireGrille
     (nbl : in integer; nbc : in integer) return Type_Grille
   is
      g:Type_Grille;
   begin
      if nbl>TAILLE_MAX or nbc>TAILLE_MAX or nbl<1 or nbc<1 then
         raise TAILLE_INVALIDE;
      end if;
      g.nbc:=nbc;
      g.nbl:=nbl;
      for i in 1..g.nbl loop
         for j in 1..g.nbc loop
            g.g(i,j):=ConstruireCase(ConstruireCoordonnees(i,j));
         end loop;
      end loop;
      return g;
   end ConstruireGrille;

   --------------
   -- nbLignes --
   --------------

   function nbLignes (g : type_Grille) return Integer is
   begin
      return g.nbl;
   end nbLignes;

   ----------------
   -- nbColonnes --
   ----------------

   function nbColonnes (g : type_Grille) return Integer is
   begin
      return g.nbc;
   end nbColonnes;

   -------------------
   -- estGrilleVide --
   -------------------

   function estGrilleVide (G : in Type_Grille) return Boolean is
   begin
      for i in 1..G.nbl loop
         for j in 1..G.nbc loop
            if not estMer(ObtenirTypeCase(G.g(i,j))) then
               return false;
            end if;
         end loop;
      end loop;
      return true;
   end estGrilleVide;

   -----------------
   -- estComplete --
   -----------------

   function estComplete (G : in Type_Grille) return Boolean is
   begin
      if estGrilleVide(G) then
         return false;
      end if;
      for i in 1..G.nbl loop
         for j in 1..G.nbc loop
            if estIle(ObtenirTypeCase(G.g(i,j))) then
               if ObtenirValeur(ObtenirIle(G.g(i,j)))/=0 then
                  return false;
               end if;
            end if;
         end loop;
      end loop;
      return true;
   end estComplete;

   -----------
   -- nbIle --
   -----------

   function nbIle (G : in Type_Grille) return Integer is
      nb_ile:Integer;
   begin
      nb_ile:=0;
      for i in 1..G.nbl loop
         for j in 1..G.nbc loop
            if estIle(ObtenirTypeCase(G.g(i,j))) then
               nb_ile:=nb_ile+1;
            end if;
         end loop;
      end loop;
      return nb_ile;
   end nbIle;

   --------------------
   -- nbIleCompletes --
   --------------------

   function nbIleCompletes (G : in Type_Grille) return Integer is
      nb_ile_ok:Integer;
   begin
      nb_ile_ok:=0;
      for i in 1..G.nbl loop
         for j in 1..G.nbc loop
            if estIle(ObtenirTypeCase(G.g(i,j))) then
               if ObtenirValeur(ObtenirIle(G.g(i,j)))=0 then
                  nb_ile_ok:=nb_ile_ok+1;
               end if;
            end if;
         end loop;
      end loop;
      return nb_ile_ok;
   end nbIleCompletes;

   -----------------
   -- ObtenirCase --
   -----------------

   function ObtenirCase
     (G : in Type_Grille; Co : in Type_Coordonnee) return Type_CaseHashi
   is
   begin
      return G.g(ObtenirLigne(co),ObtenirColonne(co));
   end ObtenirCase;

   ----------------
   -- aUnSuivant --
   ----------------

   function aUnSuivant
     (G : in Type_Grille; c : in Type_CaseHashi; o : Type_Orientation)
      return Boolean
   is
      c2:Type_Coordonnee;
   begin
      c2:=ObtenirCoordonnee(c);
      if o = NORD then
         return ObtenirLigne(c2)>1;
      elsif o = SUD then
         return obtenirLigne(c2)< G.nbl;
      elsif o = EST then
         return ObtenirColonne(c2)<G.nbc;
      else -- OUEST then
         return ObtenirColonne(c2)>1;
      end if;
   end aUnSuivant;

   --------------------
   -- obtenirSuivant --
   --------------------

   function obtenirSuivant
     (G : in Type_Grille; c : in Type_CaseHashi; o : Type_Orientation)
      return Type_CaseHashi
   is
      Co      : Type_Coordonnee;
      Ligne   : Integer;
      Colonne : Integer;
   begin
      if not aUnSuivant (G, c, o) then
         raise PAS_DE_SUIVANT;
      end if;
      -- calcul
      Ligne   := ObtenirLigne (ObtenirCoordonnee (c));
      Colonne := ObtenirColonne (ObtenirCoordonnee (c));
      if o = NORD then
         Ligne := Ligne - 1;
      elsif o = SUD then
         Ligne := Ligne + 1;
      elsif o = EST then
         Colonne := Colonne + 1;
      else -- OUEST then
         Colonne := Colonne - 1;
      end if;
      Co := ConstruireCoordonnees (Ligne, Colonne);
      return ObtenirCase (G, Co);
   end obtenirSuivant;
   ------------------
   -- modifierCase --
   ------------------

   function modifierCase (G : in Type_Grille; c : in Type_CaseHashi) return Type_Grille is
      G2:Type_Grille;
      begin
         G2:=G;
         G2.g(ObtenirLigne(ObtenirCoordonnee(c)),ObtenirColonne(ObtenirCoordonnee(c))):=c;
         return G2;
   end modifierCase;
   ------------------
   --     Egal     --
   ------------------

   function egal (G1:in Type_Grille; G2:in Type_Grille) return Boolean is
   begin
      if G1.nbc /= G2.nbc or G1.nbl /= G2.nbl then
         return False;
      end if;
      for i in 1..G1.nbl loop
         for j in 1..G2.nbc loop
            if G1.g(i,j)/=G2.g(i,j) then
               return False;
            end if;
         end loop;
      end loop;
      return True;
   end egal;

end Grille;
