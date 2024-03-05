{ ... }:
{
  fileSystems."/mnt/c" = {
    device = "/dev/nvme0n1p2";
    fsType = "ntfs-3g";
    options = [ "uid=1000" "gid=100" "rw" "user" "exec" "umask=000" ];
  };
  fileSystems."/mnt/d" = {
    device = "/dev/sda1";
    fsType = "ntfs-3g";
    options = [ "uid=1000" "gid=100" "rw" "user" "exec" "umask=000" ];
  };
  fileSystems."/mnt/e" = {
    device = "/dev/nvme1n1p1";
    fsType = "ntfs-3g";
    options = [ "uid=1000" "gid=100" "rw" "user" "exec" "umask=000" ];
  };
  fileSystems."/mnt/f" = {
    device = "/dev/sdb1";
    fsType = "ntfs-3g";
    options = [ "uid=1000" "gid=100" "rw" "user" "exec" "umask=000" ];
  };
}
