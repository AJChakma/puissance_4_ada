with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Text_Io; use Ada.Text_Io;
with Ada.Unchecked_Deallocation;

package body Liste_Generique is

    -- On utilise des listes doublement chainees
    type Cellule is record
        Val : Element;
        Prec : Liste;
        Suiv : Liste;
    end record;


    -- Procedure de liberation d'une Cellule
    procedure Libere_Cell is new Ada.Unchecked_Deallocation(Cellule,Liste);

    -- Création et Initialisation à null
    function Creer_Liste return Liste is
    begin
        return null;
    end Creer_Liste;

    -- Test si la liste est Vide
    function Est_Vide (L : in Liste) return Boolean is
    begin
        return (L = null);
    end Est_Vide;


    -- Liberation de toute la liste
    procedure Libere_Liste(L : in out Liste)
        S : Liste;
    begin
        if (Est_Vide(L)) then
            raise Liste_Vide;
        end if;
        S := L.Suiv;
        while (S /= null) loop
            Libere_Cell(L);
            L := S;
            S := S.Suiv;
        end loop;
        Libere_Cell(L);
    end Libere_Liste;
