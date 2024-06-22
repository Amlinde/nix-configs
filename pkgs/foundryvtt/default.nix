{ stdenv
, lib
, requireFile
, unzip
, electron_30
, makeWrapper
, makeDesktopItem
}:

stdenv.mkDerivation rec {
  pname = "foundryvtt";
  version = "12.327";
  src = requireFile {
    name = "FoundryVTT-12.327.zip";
    url = "https://foundryvtt.com";
    sha256 = "b8ba2b12fefb69daa4960b61e97bdd49bdd36d54788886e46a90a130bbac52b7";
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

    makeWrapper ${electron_30}/bin/electron $out/bin/foundryvtt \
      --argv0 "foundryvtt" \
      --add-flags "$out/opt/foundryvtt" \
      --prefix LD_LIBRARY_PATH : ${libPath}
    ln -s ${desktop}/share/applications/* $out/share/applications
  '';
}
