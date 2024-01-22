pragma Ada_2012;
package body Resolution_Hashi is

   ---------------------------
   -- rechercherUneIleCible --
   ---------------------------

   procedure rechercherUneIleCible
     (G      : in Type_Grille; C : in Type_CaseHashi; O : in Type_Orientation;
      Trouve :    out Boolean; ile : out Type_CaseHashi)
   is
      Case_actuelle:Type_CaseHashi;
      Case_suivante:Type_CaseHashi;
      Reponse:Boolean;
   begin
      Reponse:=False;
      Trouve:=False;
      Case_actuelle:=C;
      if not estIle(ObtenirTypeCase(C)) then
         raise N_EST_PAS_UNE_ILE;
      end if;
      while not Reponse loop
         Case_suivante:=obtenirSuivant(G,Case_actuelle,O);
         if estPont(ObtenirTypeCase(Case_suivante)) then
            if estMer(ObtenirTypeCase(Case_actuelle)) or estMer(ObtenirTypeCase(obtenirSuivant(G,Case_suivante,O))) then
               Trouve:=False;
               Reponse:=True;
            else
               Case_actuelle:=Case_suivante;
            end if;
         elsif estMer(ObtenirTypeCase(Case_suivante)) then
            Case_actuelle:=Case_suivante;
         else
            if ObtenirValeur(ObtenirIle(Case_suivante))=0 then
               Trouve:=False;
               Reponse:=True;
            else
               Trouve:=True;
               Reponse:=True;
               ile:=obtenirSuivant(G,Case_actuelle,O);
            end if;
         end if;
         Case_actuelle:=Case_suivante;
      end loop;
   exception
      when PAS_DE_SUIVANT =>
         Trouve:=False;
         Reponse:=True;
   end rechercherUneIleCible;

   ----------------------------------
   -- construireTableauSuccesseurs --
   ----------------------------------

   procedure construireTableauSuccesseurs
     (G : in     Type_Grille; C : in Type_CaseHashi; s : out Type_Tab_Successeurs;
      NbPonts :    out Integer; NbNoeuds : out Integer)
   is
      Trouve:Boolean;
      Ile:Type_CaseHashi;
   begin
      NbPonts:=0;
      NbNoeuds:=0;
      rechercherUneIleCible(G,C,NORD,Trouve,Ile);
      s(1).Orient:=NORD;
      if Trouve then
         s(1).Element:=Ile;
         if ObtenirValeur(ObtenirIle(Ile))=1 or ObtenirValeur(ObtenirIle(C))=1 then
            NbPonts:=NbPonts+1;
         else
            NbPonts:=NbPonts+2;
         end if;
         NbNoeuds:=NbNoeuds+1;
      else
         s(1).Element:=ConstruireCase(ConstruireCoordonnees(0,0));
      end if;
      rechercherUneIleCible(G,C,SUD,Trouve,Ile);
      s(2).Orient:=SUD;
      if Trouve then
         s(2).Element:=Ile;
         if ObtenirValeur(ObtenirIle(Ile))=1 or ObtenirValeur(ObtenirIle(C))=1 then
            NbPonts:=NbPonts+1;
         else
            NbPonts:=NbPonts+2;
         end if;
         NbNoeuds:=NbNoeuds+1;
      else
         s(2).Element:=ConstruireCase(ConstruireCoordonnees(0,0));
      end if;
      rechercherUneIleCible(G,C,EST,Trouve,Ile);
      s(3).Orient:=EST;
      if Trouve then
         s(3).Element:=Ile;
         if ObtenirValeur(ObtenirIle(Ile))=1 or ObtenirValeur(ObtenirIle(C))=1 then
            NbPonts:=NbPonts+1;
         else
            NbPonts:=NbPonts+2;
         end if;
         NbNoeuds:=NbNoeuds+1;
      else
         s(3).Element:=ConstruireCase(ConstruireCoordonnees(0,0));
      end if;
      rechercherUneIleCible(G,C,OUEST,Trouve,Ile);
      s(4).Orient:=OUEST;
      if Trouve then
         s(4).Element:=Ile;
         if ObtenirValeur(ObtenirIle(Ile))=1 or ObtenirValeur(ObtenirIle(C))=1 then
            NbPonts:=NbPonts+1;
         else
            NbPonts:=NbPonts+2;
         end if;
         NbNoeuds:=NbNoeuds+1;
      else
         s(4).Element:=ConstruireCase(ConstruireCoordonnees(0,0));
      end if;
   end construireTableauSuccesseurs;

   ------------------------
   -- construireLeChemin --
   ------------------------

   procedure construireLeChemin
     (G     : in out Type_Grille; source : in out Type_CaseHashi;
      cible : in out Type_CaseHashi; pont : in Type_Pont;
      o     : in     Type_Orientation)
   is
      repetition:Integer;
      ile:Type_Ile;
      valeur:Integer;
      case_actuelle:Type_CaseHashi;
      nv_case:Type_CaseHashi;
   begin
      if o=NORD then
         repetition:=ObtenirLigne(ObtenirCoordonnee(source))-ObtenirLigne(ObtenirCoordonnee(cible))-1;
      elsif o=SUD then
         repetition:=ObtenirLigne(ObtenirCoordonnee(cible))-ObtenirLigne(ObtenirCoordonnee(source))-1;
      elsif o=EST then
         repetition:=ObtenirColonne(ObtenirCoordonnee(cible))-ObtenirColonne(ObtenirCoordonnee(source))-1;
      else
         repetition:=ObtenirColonne(ObtenirCoordonnee(source))-ObtenirColonne(ObtenirCoordonnee(cible))-1;
      end if;
      case_actuelle:=source;
      for i in 1..repetition loop
         case_actuelle:=obtenirSuivant(G,case_actuelle,o);
         nv_case:=modifierPont(case_actuelle,pont);
         G:=modifierCase(G,nv_case);
      end loop;
      valeur:=ObtenirValeur(ObtenirIle(source))-ObtenirValeur(pont);
      if valeur>0 then
         ile:=ConstruireIle(valeur);
      else
         ile:=ConstruireIle(1);
         ile:=modifierIle(ile,1);
      end if;
      source:=ModifierIle(source,ile);
      G:=modifierCase(G,source);
      --On fait pareil avec cible
      valeur:=ObtenirValeur(ObtenirIle(cible))-ObtenirValeur(pont);
      if valeur>0 then
         ile:=ConstruireIle(valeur);
      else
         ile:=ConstruireIle(1);
         ile:=modifierIle(ile,1);
      end if;
      cible:=ModifierIle(cible,ile);
      G:=modifierCase(G,cible);
   end construireLeChemin;

   -------------------
   -- ResoudreHashi --
   -------------------

   procedure ResoudreHashi (G : in out Type_Grille; Trouve : out Boolean) is
      coordonnee_actuelle:Type_Coordonnee;
      case_actuelle:Type_CaseHashi;
      tab_s:Type_Tab_Successeurs;
      nbponts:Integer;
      nbvoisins:Integer;
      case_vide:Type_CaseHashi;
      pont:Type_Pont;
      Grille_bloquee:Type_Grille;
   begin
      Grille_bloquee:=ConstruireGrille(nbLignes(G),nbColonnes(G));
      case_vide:=ConstruireCase(ConstruireCoordonnees(0,0));
      Trouve:=estComplete(G);
      while not Trouve and not egal(G,Grille_bloquee) loop
         Grille_bloquee:=G;
         for i in 1..nbLignes(G) loop
            for j in 1..nbColonnes(G) loop
               coordonnee_actuelle:=ConstruireCoordonnees(i,j);
               case_actuelle:=ObtenirCase(G,coordonnee_actuelle);
               if EstIle(ObtenirTypeCase(case_actuelle)) then
                  construireTableauSuccesseurs(G,case_actuelle,tab_s,nbponts,nbvoisins);
                  if nbponts=ObtenirValeur(ObtenirIle(case_actuelle)) then
                     for k in tab_s'Range loop
                        if tab_s(k).Element/=case_vide then
                           if ObtenirValeur(ObtenirIle(tab_s(k).Element))=1 or ObtenirValeur(ObtenirIle(case_actuelle))=1 then
                              pont:=UN;
                           else
                              pont:=DEUX;
                           end if;
                           construireLeChemin(G,case_actuelle,tab_s(k).Element,pont,tab_s(k).Orient);
                        end if;
                     end loop;
                  elsif ObtenirValeur(ObtenirIle(case_actuelle))=7 then
                     pont:=UN;
                     for k in tab_s'Range loop
                        construireLeChemin(G,case_actuelle,tab_s(k).Element,pont,tab_s(k).Orient);
                     end loop;
                  elsif ObtenirValeur(ObtenirIle(case_actuelle))=5 and nbvoisins=3 then
                     pont:=UN;
                     for k in tab_s'Range loop
                        if tab_s(k).Element/=case_vide then
                           construireLeChemin(G,case_actuelle,tab_s(k).Element,pont,tab_s(k).Orient);
                        end if;
                     end loop;
                  elsif ObtenirValeur(ObtenirIle(case_actuelle))=3 and nbvoisins=2 then
                     pont:=UN;
                     for k in tab_s'Range loop
                        if tab_s(k).Element/=case_vide then
                           construireLeChemin(G,case_actuelle,tab_s(k).Element,pont,tab_s(k).Orient);
                        end if;
                     end loop;
                  end if;
               end if;
            end loop;
         end loop;
         Trouve:=estComplete(G);
      end loop;
   end ResoudreHashi;

end Resolution_Hashi;
