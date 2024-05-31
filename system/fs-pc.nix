{ ... }:
{
  fileSystems."/mnt/c" = {
    device = "/dev/disk/by-uuid/28A25E2CA25DFEAE";
    fsType = "ntfs-3g";
    options = [ "uid=1000" "gid=100" "rw" "user" "exec" "umask=000" "nofail" ];
  };
  fileSystems."/mnt/d" = {
    device = "/dev/disk/by-uuid/1D2E3B786219B66D";
    fsType = "ntfs-3g";
    options = [ "uid=1000" "gid=100" "rw" "user" "exec" "umask=000" "nofail" ];
  };
#  fileSystems."/mnt/e" = {
#    device = "/dev/disk/by-uuid/F4EEEE03EEEDBDCC";
#    fsType = "ntfs-3g";
#    options = [ "uid=1000" "gid=100" "rw" "user" "exec" "umask=000" "nofail" ];
#  };
}
