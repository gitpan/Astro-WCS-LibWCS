use ExtUtils::MakeMaker;

my ($inc, $libs);

if (exists $ENV{WCSTOOLS}) {
  $inc = "-I$ENV{WCSTOOLS}/libwcs";
  $libs = "-L$ENV{WCSTOOLS}/libwcs -lwcs -lm";
}
else {
  warn("WCSTOOLS environment variable not found, assuming /usr/local/wcstools\n");
  $inc = "-I/usr/local/wcstools/libwcs";
  $libs = "-L/usr/local/wcstools/libwcs -lwcs -lm";
}


# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
	      'NAME'	=> 'Astro::WCS::LibWCS',
	      'VERSION_FROM' => 'LibWCS.pm', # finds $VERSION
	      'LIBS' => [$libs],
	      'INC' => $inc,
	      'DEFINE'	=> '',     # e.g., '-DHAVE_SOMETHING' 
	      'OBJECT' => 'LibWCS.o util.o',
	     );
