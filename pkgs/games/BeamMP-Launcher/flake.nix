{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux =
    	with import nixpkgs { system = "x86_64-linux"; };
    	      stdenv.mkDerivation rec {
    	        pname = "BeamMP-Launcher";
    	        version = "2.4.0";
    	        src = fetchFromGitHub {
    	            owner = "BeamMP";
    	            repo = pname;
    	            rev = "v${version}";
    	            hash = "sha256-aAQmgK03a3BY4YWuDyTmJzcePchD74SXfbkHwnaOYW8=";
    	          };
    	        nativeBuildInputs = [
    	        	cmake
    	        	gcc
					vcpkg
					httplib
					nlohmann_json
					zlib.dev
					openssl.dev
					curl.dev
    	        ];
    	        
    	        configurePhase = "ls; cmake -DCMAKE_BUILD_TYPE=Release . -B bin -DVCPKG_TARGET_TRIPLET=x64-linux";
				buildPhase = "cmake --build bin --parallel --config Release";
    	        installPhase = "mkdir -p $out/bin; cp bin/BeamMP-Launcher $out/bin/";
    	      };

  };
}
