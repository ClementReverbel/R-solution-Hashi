pragma Ada_2012;
package body TypeCase is

   --------------------
   -- ValeurTypeCase --
   --------------------

   function ValeurTypeCase (t : in Type_TypeCase) return Integer is
   begin
      if t = MER then  -- Si la case est une case de type MER, retourner -1
         return -1;
      elsif t = NOEUD then --Si la case est une case de type NOEUD(ile), retourner 0
         return 0;
      else --Il ne reste que arrete, si la case est une case de type ARETE(pont), retourner 1
         return 1;
      end if;

   end ValeurTypeCase;

   ------------
   -- estIle --
   ------------

   function estIle (t : in Type_TypeCase) return Boolean is
   begin
      return ValeurTypeCase(t)=0;   --retourner vrai si la case est une case NOEUD(ile), retourne faux sinon
   end estIle;

   -------------
   -- estPont --
   -------------

   function estPont (t : in Type_TypeCase) return Boolean is
   begin
      return ValeurTypeCase(t)=1;   --retourner vrai si la case est une case ARETE(pont), retourne faux sinon
   end estPont;

   ------------
   -- estMer --
   ------------

   function estMer (t : in Type_TypeCase) return Boolean is
   begin
      return ValeurTypeCase(t)=-1;  --retourner vrai si la case est une case MER, retourne faux sinon
   end estMer;

end TypeCase;
