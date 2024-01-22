with Orientation ; use Orientation;
with Pont ; use Pont;

package body Ile is

   -- construit une ile ayant la valeur v
   -- nécessite 1 <= v <= 8
   -- lève l'exception VALEUR_NOEUD_INVALIDE si v < 1 ou v > 8
   function ConstruireIle (v : in Integer) return Type_Ile is
      i:Type_Ile;
   begin
      if v <=0 or v > 8 then
         raise VALEUR_ILE_INVALIDE;
      else
         i.v := v;
      return i;
      end if;
   end ConstruireIle;

   -- retourne la valence de l'île i
   function ObtenirValeur (i : in Type_Ile) return Integer is
   begin
      return i.v;
   end ObtenirValeur;

   -- retourne VRAI si tous les ponts de l'île i sont trouvés
   -- et FAUX sinon
   function EstIleComplete (i : in Type_Ile) return Boolean is
   begin
      if i.v = 0 then
         return True ;
         else
            return false;
         end if;

   end EstIleComplete;

   -- modifie l'île i en lui soustrayant la valeur v
   -- nécessite 1 <= p <= 2
   -- nécessite obtenirvaleur(i)-p >= 0
   -- lève l'exception VALEUR_PONT_INVALIDE si 1<= p et 2<= p
   -- lève l'exception PONT_IMPOSSIBLE si valeur de l'île - valeur du pont < 0
   function ModifierIle (i : in Type_Ile; p : in Integer) return Type_Ile is
   begin
      if not (1 <= p and p <= 2 ) then
         raise VALEUR_PONT_INVALIDE;
      elsif not (i.v - p >= 0) then
         raise PONT_IMPOSSIBLE;
      else
         --i.v := i.v-p;
         return (v => i.v - p);
      end if;
   end ModifierIle;

end Ile;
