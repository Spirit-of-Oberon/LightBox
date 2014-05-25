MODULE CApiTypes;
IMPORT SYSTEM;
TYPE

   size_t* = INTEGER; (* should be unsigned int *)

   p_void* = POINTER TO RECORD [untagged] END;

   char*          = SHORTCHAR;
   unsigned_char* = char;
   signed_char*   = BYTE;

   p_char*   = POINTER TO ARRAY [untagged] OF char;
   p_p_char* = POINTER TO ARRAY [untagged] OF p_char;
   
   wchar*     = CHAR;

   p_wchar*   = POINTER TO ARRAY [untagged] OF wchar;
   p_p_wchar* = POINTER TO ARRAY [untagged] OF p_wchar;

   int*          = INTEGER;
   signed_int*   = int;
   signed*       = signed_int;
   unsigned_int* = INTEGER;
   unsigned*     = unsigned_int;

   short_int*          = SHORTINT;
   short*              = short_int;
   signed_short_int*   = short_int;
   unsigned_short_int* = CHAR;
   
   long_int*               = INTEGER;
   long*                   = long_int;
   signed_long_int*        = long_int;
   unsigned_long_int*      = INTEGER;
   long_long_int*          = LONGINT; (* C99 *)
   unsigned_long_long_int* = LONGINT; (* C99 *)

   float*  = SHORTREAL;
   double* = REAL;

   (* TODO *)

(*
   long_double
   _Bool 
   float_Complex
   float_Imaginary
   double_Complex
   double_Imaginary
   long_double_Complex
   long_double_Imaginary
*)

END CApiTypes.