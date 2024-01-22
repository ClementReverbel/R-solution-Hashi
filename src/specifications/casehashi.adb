pragma Ada_2012;
package body CaseHashi is

   --------------------
   -- ConstruireCase --
   --------------------

   function ConstruireCase (C : in Type_Coordonnee) return Type_CaseHashi is
      ca: Type_CaseHashi; -- Je créer une dépendance de type Type_CaseHashi
   begin
      --Je mets les coordonnées dans ma case
      ca.C := C;
      --J'initialise le type de la case à MER
      ca.T := MER;
      --Je renvoie la case nouvellement créee
      return ca;
   end ConstruireCase;

   ---------------------
   -- ObtenirTypeCase --
   ---------------------

   function ObtenirTypeCase (C : in Type_CaseHashi) return Type_TypeCase is
   begin
      --Renvoie C.T le type de la case
      return C.T;
   end ObtenirTypeCase;

   -----------------------
   -- ObtenirCoordonnee --
   -----------------------

   function ObtenirCoordonnee (C : in Type_CaseHashi) return Type_Coordonnee is
   begin
      --Renvoie C.C les coordonées de  la case
      return C.C;
   end ObtenirCoordonnee;

   ----------------
   -- ObtenirIle --
   ----------------

   function ObtenirIle (C : in Type_CaseHashi) return Type_Ile is
   begin
      -- Si la case n'est pas une île
      if not estIle(C.T) then
         --Lève l'exception TYPE_INCOMPATIBLE
         raise TYPE_INCOMPATIBLE;
      end if;
      --Renvoie l'île du pont
      return C.I;
   end ObtenirIle;

   -----------------
   -- ObtenirPont --
   -----------------

   function ObtenirPont (C : in Type_CaseHashi) return Type_Pont is
   begin
      --Si la case n'est pas un pont
      if not estPont(C.T) then
         --Lève l'exception TYPE_INCOMPATIBLE
         raise TYPE_INCOMPATIBLE;
      end if;
      --Renvoie le pont de l'île
      return C.P;
   end ObtenirPont;

   -----------------
   -- modifierIle --
   -----------------

    function modifierIle
     (C : in Type_CaseHashi; I : in Type_Ile) return Type_CaseHashi
   is
      NewC : Type_CaseHashi;
   begin
      if EstPont(C.T) then
         raise TYPE_INCOMPATIBLE;
      end if;
      NewC.c := ObtenirCoordonnee(C);
      NewC.T := NOEUD;
      NewC.I := I;
      return NewC;
   end modifierIle;

   ------------------
   -- modifierPont --
   ------------------

   function modifierPont
     (C : in Type_CaseHashi; p : in Type_Pont) return Type_CaseHashi
   is
      ca : Type_CaseHashi := C;--Je créer une copie de la case
   begin
      -- Si la case n'est ni un pont ni la mer
      if estIle(C.T) then
         --Lève l'exception TYPE_INCOMPATIBLE
         raise TYPE_INCOMPATIBLE;
      end if;
      --Si la case est un pont de valeur "UN"
      if "="(C.P,UN) then
         --La nouvelle case est un pont de valeur "DEUX"
         Ca.T := ARETE;
         Ca.P := DEUX;
      --Sinon si la case est la mer
      elsif estMer(C.T) then
         --La nouvelle case est un pont de valeur "p"
         Ca.T := ARETE;
         Ca.P := p;
      end if;
      --Renvoie la nouvelle case
      return Ca;
   end modifierPont;

   ---------
   -- "=" --
   ---------

   function "=" (C1 : in Type_CaseHashi; C2 : in Type_CaseHashi) return Boolean
   is
   begin
      --Si les cordonnées des deux cases sont les mêmes
      if ObtenirLigne(C1.C) = ObtenirLigne(C2.C) and ObtenirColonne(C1.C) = ObtenirColonne(C2.C) then
         --Si la vauleur des deux cases est la même
         if ValeurTypeCase(C1.T) = ValeurTypeCase(C2.T) then
            --Si les cases sont des îles et qu'elles ont la même valeur
            if estIle(C1.T) and then obtenirValeur(C1.I) = obtenirValeur(C2.I) then
               --Renvoyer Vrai
               return True;
            --Sinon si les cases sont des ponts et qu'ils ont la même valeur
            elsif estPont(C1.T) and then "="(C1.P,C2.P) then
               --Renvoyer Vrai
               return True;
            -- Si c'est la mer
            elsif estMer(C1.T) then
               --Renvoyer Vrai
               return True;
            else
               return False;
            end if;
         end if;
      end if;
      --Si aucun des tests n'est passé renvoyer Faux
      return False;
   end "=";

end CaseHashi;
