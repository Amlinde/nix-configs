{ stdenv
, requireFile
, electron_28
, makeWrapper
, lib
, stdenv
}:

stdenv.mkDerivation rec {
  pname = "foundryvtt";
  version = "11.315";
  src = requireFile {
    name = "FoundryVTT-11.315.zip";
    url = "https://foundryvtt.com";
    sha256 = "21337fq27qmnacy1ncqw9dcpwm8wz73q";
  };

  buildInputs = [ unzip makeWrapper ];

  unpackPhase = ''
    unzip ${src}
  '';

  installPhase = 
  let
    libPath = lib.makeLibraryPath [
      stdenv.cc.cc.lib
    ];
  in
  ''
    mkdir -p $out/{bin,share/icons/hicolor/{32x32/apps,512x512/apps}}
    
    mkdir -p $out/opt/foundryvtt
    cp -r resources/app $out/opt/foundryvtt

    ln -s $out/opt/foundryvtt/public/icons/vtt.png $out/share/icons/hicolor/32x32/apps/foundryvtt.png
    ln -s $out/opt/foundryvtt/public/icons/vtt-512.png $out/share/icons/hicolor/512x512/apps/foundryvtt.png

    makeWrapper ${electron}/bin/electron $out/bin/foundryvtt \
      --argv0 "foundryvtt" \
      --add-flags "$out/opt/foundryvtt" \
      --prefix LD_LIBRARY_PATH : ${libPath}
  '';

  desktopItems = [
    (makeDesktopItem {
      name = "foundryvtt";
      desktopName = "Foundry VTT";
      exec = "foundryvtt";
      icon = "foundryvtt";
      comment = "Foundry Virtual Tabletop";
      categories = [ "Games" ];
    })
  ];
}
