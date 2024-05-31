{ stdenv
, lib
, requireFile
, unzip
, electron_28
, makeWrapper
, makeDesktopItem
}:

stdenv.mkDerivation rec {
  pname = "foundryvtt";
  version = "12.325";
  src = requireFile {
    name = "FoundryVTT-12.325.zip";
    url = "https://foundryvtt.com";
    sha256 = "21c87538cdf6179387bdaa53dd8afe319d93a3b305dd30cd48ff903fb04dd85d";
  };

  buildInputs = [ unzip ];

  nativeBuildInputs = [ makeWrapper ];

  unpackPhase = ''
    unzip ${src}
  '';

  installPhase = 
  let
    libPath = lib.makeLibraryPath [
      stdenv.cc.cc.lib
    ];
    desktop = makeDesktopItem {
      name = "foundryvtt";
      desktopName = "Foundry VTT";
      exec = "foundryvtt";
      icon = "foundryvtt";
      comment = "Foundry Virtual Tabletop";
      categories = [ "Game" ];
    };
  in
  ''
    mkdir -p $out/{bin,share/{applications,icons/hicolor/{32x32/apps,512x512/apps}}}
    
    mkdir -p $out/opt/foundryvtt
    cp -r resources/app/* $out/opt/foundryvtt

    ln -s $out/opt/foundryvtt/public/icons/vtt.png $out/share/icons/hicolor/32x32/apps/foundryvtt.png
    ln -s $out/opt/foundryvtt/public/icons/vtt-512.png $out/share/icons/hicolor/512x512/apps/foundryvtt.png

    makeWrapper ${electron_28}/bin/electron $out/bin/foundryvtt \
      --argv0 "foundryvtt" \
      --add-flags "$out/opt/foundryvtt" \
      --prefix LD_LIBRARY_PATH : ${libPath}
    ln -s ${desktop}/share/applications/* $out/share/applications
  '';
}
