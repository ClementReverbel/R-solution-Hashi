pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__run_all_tests.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__run_all_tests.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E069 : Short_Integer; pragma Import (Ada, E069, "system__os_lib_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__exceptions_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exception_table_E");
   E038 : Short_Integer; pragma Import (Ada, E038, "ada__containers_E");
   E065 : Short_Integer; pragma Import (Ada, E065, "ada__io_exceptions_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "ada__strings_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__strings__maps_E");
   E056 : Short_Integer; pragma Import (Ada, E056, "ada__strings__maps__constants_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "interfaces__c_E");
   E026 : Short_Integer; pragma Import (Ada, E026, "system__exceptions_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "system__object_reader_E");
   E045 : Short_Integer; pragma Import (Ada, E045, "system__dwarf_lines_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__soft_links__initialize_E");
   E037 : Short_Integer; pragma Import (Ada, E037, "system__traceback__symbolic_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "ada__strings__utf_encoding_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "ada__tags_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "ada__strings__text_buffers_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "ada__streams_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "system__file_control_block_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "system__finalization_root_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "ada__finalization_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "system__file_io_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "system__storage_pools_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "system__finalization_masters_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "ada__strings__unbounded_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "ada__text_io_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "coordonnee_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "orientation_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "pont_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "ile_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "typecase_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "casehashi_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "grille_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "resolution_hashi_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "affichage_E");
   E200 : Short_Integer; pragma Import (Ada, E200, "remplir_grille_hashi_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "a_tester_casehashi_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "a_tester_coordonnees_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "a_tester_grille_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "a_tester_ile_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "a_tester_orientation_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "a_tester_pont_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "a_tester_typecase_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E094 := E094 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "ada__text_io__finalize_spec");
      begin
         F1;
      end;
      E153 := E153 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "ada__strings__unbounded__finalize_spec");
      begin
         F2;
      end;
      E170 := E170 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__finalization_masters__finalize_spec");
      begin
         F3;
      end;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__file_io__finalize_body");
      begin
         E118 := E118 - 1;
         F4;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E025 := E025 + 1;
      Ada.Containers'Elab_Spec;
      E038 := E038 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E065 := E065 + 1;
      Ada.Strings'Elab_Spec;
      E050 := E050 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E052 := E052 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E056 := E056 + 1;
      Interfaces.C'Elab_Spec;
      E075 := E075 + 1;
      System.Exceptions'Elab_Spec;
      E026 := E026 + 1;
      System.Object_Reader'Elab_Spec;
      E077 := E077 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E045 := E045 + 1;
      System.Os_Lib'Elab_Body;
      E069 := E069 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E021 := E021 + 1;
      E013 := E013 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E037 := E037 + 1;
      E008 := E008 + 1;
      Ada.Strings.Utf_Encoding'Elab_Spec;
      E100 := E100 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E106 := E106 + 1;
      Ada.Strings.Text_Buffers'Elab_Spec;
      Ada.Strings.Text_Buffers'Elab_Body;
      E098 := E098 + 1;
      Ada.Streams'Elab_Spec;
      E096 := E096 + 1;
      System.File_Control_Block'Elab_Spec;
      E122 := E122 + 1;
      System.Finalization_Root'Elab_Spec;
      System.Finalization_Root'Elab_Body;
      E121 := E121 + 1;
      Ada.Finalization'Elab_Spec;
      E119 := E119 + 1;
      System.File_Io'Elab_Body;
      E118 := E118 + 1;
      System.Storage_Pools'Elab_Spec;
      E172 := E172 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E170 := E170 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      Ada.Strings.Unbounded'Elab_Body;
      E153 := E153 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E094 := E094 + 1;
      E143 := E143 + 1;
      E147 := E147 + 1;
      E149 := E149 + 1;
      Ile'Elab_Spec;
      E145 := E145 + 1;
      E151 := E151 + 1;
      Casehashi'Elab_Spec;
      E141 := E141 + 1;
      Grille'Elab_Spec;
      E183 := E183 + 1;
      Resolution_Hashi'Elab_Spec;
      E185 := E185 + 1;
      E181 := E181 + 1;
      E200 := E200 + 1;
      A_Tester_Casehashi'Elab_Spec;
      E139 := E139 + 1;
      A_Tester_Coordonnees'Elab_Spec;
      E176 := E176 + 1;
      A_Tester_Grille'Elab_Spec;
      E179 := E179 + 1;
      a_tester_ile'elab_spec;
      E188 := E188 + 1;
      A_Tester_Orientation'Elab_Spec;
      E191 := E191 + 1;
      A_Tester_Pont'Elab_Spec;
      E194 := E194 + 1;
      A_Tester_Typecase'Elab_Spec;
      E197 := E197 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_run_all_tests");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\coordonnee.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\orientation.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\pont.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\ile.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\typecase.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\casehashi.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\grille.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\resolution_hashi.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\affichage.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\remplir_grille_hashi.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\tests_resolution_Hashi.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\types_tests.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\a_tester_CaseHashi.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\a_tester_Coordonnees.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\a_tester_grille.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\a_tester_ile.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\a_tester_orientation.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\a_tester_pont.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\a_tester_TypeCase.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\run_tests_CaseHashi.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\run_tests_Coordonnees.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\run_tests_grille.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\run_tests_iles.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\run_tests_orientation.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\run_tests_ponts.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\run_tests_TypeCase.o
   --   C:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\run_all_tests.o
   --   -LC:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\
   --   -LC:\ADA_TP\sae102\Hashi_Fab_Case_V2_Fonctionnelle_A_COMPLETER_23-24\obj\
   --   -LC:/gnat/2021/lib/gcc/x86_64-w64-mingw32/10.3.1/adalib/
   --   -static
   --   -lgnat
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
