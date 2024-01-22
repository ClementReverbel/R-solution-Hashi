pragma Ada_2012;
package body Orientation is

   -----------------------
   -- ValeurOrientation --
   -----------------------

   function ValeurOrientation (o : in Type_Orientation) return Integer is
   begin
    -- Retorune la valeur correspondante de l'orientation.
      return Integer(o);
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
