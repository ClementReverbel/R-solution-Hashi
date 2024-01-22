package body Pont is

   -------------------
   -- obtenirValeur --
   -------------------

   function obtenirValeur (p : in Type_Pont) return Integer is
   begin
      -- Convertit la valeur du type Type_Pont en Integer
      return Integer(p);
   end obtenirValeur;

   ------------------
   -- estPotentiel --
   ------------------

   function estPotentiel (p : in Type_Pont) return Boolean is
   begin
      case p is
         -- Vérifie si p est égal à POTENTIEL ou UN
      when POTENTIEL | UN =>
         return True; -- Si c'est le cas retourner True
      when others =>
         return False; -- Si ce n'est pas le cas, retourner False
   end case;
   end estPotentiel;

   ------------------
   -- EstInstancie --
   ------------------

   function EstInstancie (p : in Type_Pont) return Boolean is
   begin
      -- Vérifie si p est égal à UN ou DEUX
   if p = UN or p = DEUX then
      return True; -- Si c'est le cas, retourner True
      end if;
      -- Pour tous les autres cas, retourner False
      return False;
   end EstInstancie;

   ---------
   -- "=" --
   ---------

   function "=" (p1 : in Type_Pont; p2 : in Type_Pont) return Boolean is
   begin
      -- Compare les valeurs de deux objets de type Type_Pont
      return obtenirValeur(p1) = obtenirValeur(p2); -- Retourner l'egalite
   end "=";

end Pont;
