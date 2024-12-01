{ stdenv
, lib
, fetchFromGitHub
, cmake
, extra-cmake-modules
, plasma-framework
}:

stdenv.mkDerivation rec {
  pname = "quarks-splash-darker";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "tfwe";
    repo = "QuarksSplashDarker";
    rev = "v${version}";
    sha256 = ""; # Add SHA256 hash after first build attempt
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
  ];

  buildInputs = [
    plasma-framework
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/plasma/look-and-feel
    cp -r contents metadata.desktop $out/share/plasma/look-and-feel/${pname}

    runHook postInstall
  '';

  meta = with lib; {
    description = "QuarksSplashDarker KDE Splash Screen Theme for Plasma 6";
    homepage = "https://github.com/tfwe/QuarksSplashDarker";
    license = licenses.gpl3Only;
    platforms = platforms.linux;
    maintainers = with maintainers; [ tfwe ];
  };
}
