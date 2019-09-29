AC_PREREQ(2.52)

AC_INIT([Apertium English-Catalan], [1.0.0], [marc.riera.irigoyen@gmail.com], [apertium-eng-cat], [http://wiki.apertium.org/wiki/Apertium-eng-cat])
AM_INIT_AUTOMAKE

AC_PROG_LN_S
AC_PROG_AWK

PKG_CHECK_MODULES(APERTIUM, apertium >= 3.6.0)
PKG_CHECK_MODULES(LTTOOLBOX, lttoolbox >= 3.5.0)
PKG_CHECK_MODULES(CG3, cg3 >= 1.3.0)
PKG_CHECK_MODULES(APERTIUM_LEX_TOOLS, apertium-lex-tools >= 0.2.2)
PKG_CHECK_MODULES(APERTIUM_ANAPHORA, apertium-anaphora >= 0.0.2)

AC_PATH_PROGS(ZCAT, [gzcat zcat], [false])
AS_IF([test x$ZCAT = xfalse], [AC_MSG_ERROR([You don't have zcat nor gzcat installed])])

m4_ifdef([AP_CHECK_LING],[],[AC_MSG_ERROR([AP_CHECK_LING not defined, is apertium.m4 in ACLOCAL_PATH? See: http://wiki.apertium.org/wiki/Installation_troubleshooting])])

AP_CHECK_LING([1], [apertium-eng])
AP_CHECK_LING([2], [apertium-cat])

AP_MKINCLUDE

AC_CONFIG_FILES([Makefile])
AC_OUTPUT

