MODULE CApiTypes;

TYPE

   void* = INTEGER;

   char*          = SHORTCHAR;
   unsigned_char* = char;
   signed_char*   = BYTE;

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