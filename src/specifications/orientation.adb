pragma Ada_2012;
package body Orientation is

   -----------------------
   -- ValeurOrientation --
   -----------------------

   function ValeurOrientation (o : in Type_Orientation) return Integer is
   begin
    -- Utiliser un cas pour mapper chaque orientation à sa valeur correspondante.
      case o is
         when NORD  => return -1;
         when SUD   => return 1;
         when EST   => return -2;
         when OUEST => return 2;
         when others => return 0;  -- Gestion de cas inattendus
      end case;
   end ValeurOrientation;

   ------------------------
   -- orientationInverse --
   ------------------------

   function orientationInverse
     (o : in Type_Orientation) return Type_Orientation
   is
   begin
    -- Utiliser un cas pour mapper chaque orientation à sa valeur inverse.
      case o is
         when NORD  => return SUD;
         when SUD   => return NORD;
         when EST   => return OUEST;
         when OUEST => return EST;
         when others => return o;  -- Gestion de cas inattendus
      end case;
   end orientationInverse;

end Orientation;
