pragma Ada_2012;
package body TAD_Pile is

   --------------------
   -- construirePile --
   --------------------

   -- Construit une pile vide
   function construirePile return Type_Pile is
      p : Type_Pile;
   begin
      return p;
   end construirePile;

   -------------
   -- estVide --
   -------------

   -- Retourne VRAI si une pile est vide
   function estVide(pile : in Type_Pile) return Boolean is
   begin
      return pile.nb_elements = 0;
   end estVide;

   -------------
   -- dernier --
   -------------

   -- Retourne l'élément le plus récent de la pile
   function dernier(pile : in Type_Pile) return T is
   begin
      if estVide(pile) then
         raise PILE_VIDE;
      end if;
      return pile.elements(pile.nb_elements);
   end dernier;

   -------------
   -- empiler --
   -------------

   -- Ajoute un élément à la pile
   function empiler(pile : in Type_Pile; g : in Type_Grille) return Type_Pile is
      nouvelle_pile : Type_Pile := pile;
   begin
      if pile.nb_elements = TAILLE_MAX then
         raise PILE_PLEINE;
      else
         nouvelle_pile.elements(pile.nb_elements + 1) := e;
         nouvelle_pile.nb_elements := pile.nb_elements + 1;
         return nouvelle_pile;
      end if;
   end empiler;

   -------------
   -- depiler --
   -------------

   -- Supprime l'élément le plus récent de la pile
   function depiler(pile : in Type_Pile) return Type_Pile is
      nouvelle_pile : Type_Pile := pile;
   begin
      if estVide(pile) then
         raise PILE_VIDE;
      else
         nouvelle_pile.nb_elements := pile.nb_elements - 1;
         return nouvelle_pile;
      end if;
   end depiler;

end TAD_Pile;
