{ ... }:
# SSH setup
{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "yes";
    };
    ports = [ 22 ];
  };
}

users.users.${userSettings.username}.authorizedKeys.keys = [
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDEj9hwAq8TPc3Ni4ETsxTLHIYaqSOBPuyT6KClXSJAdTjJp8Hpq3mr6jrNs7Q4az/033RpLbmRpUFRSxIOdkv9IaEb68E0ripv5X3supJPKLLrp02ibrXWe3LKjOgxyCg4tx/XSo7eS+4dN61kPFg0/Sa7t3vRoSJyfgAxobeSD2/Ri/wmN+gt3iHPP3/U2yVSYb+OvYjc2dETbC/fjYh1znyOxmc/FjCKBmsFFkLWs2FSRsbPiI977SnDQqyBHHV7KuP2VnoYPdGi390X0eYwoEkOH+qPUVksa02JrM8nsmhE2hksQjZWOliPpVvZaj7115xtE5/rrAFezppTevKLLbK82QYz6aQCA1qgRbIdihz4l81QNLQzykP6zi70LZ1Xt4FDbkpSBJE/fiJb6PbXPa6O/8FeKz5s5poOLg4UutldKB/2U936uUS3OKS7j32VHiRffHarYjJpC4yTHCwpUWw1RWjAkMCy7jX0FegDYxNs3afbfmk7RoY+chs5Urk= emea103695"
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDUQJZ5pM0x9/0gxrVS90Yea/xOJ8SBfcB7vSNV1s4eL5VA2EaM/NmW2UrTR6KxSMbY6GLQfrL1itEtNpDjJP2nUrL9OLaTqVy7DnhyyLVCJkymT5XcvN2G8157S9lzVpCj3jkalJoizRUHoAzsOdnTudrto/EiMRPzu8aGPP1yVAYCU8ke6U8PyjjRCexamwcC5uEJoJ9U9FhveGr2kzPpm2UBHggPcEcVbwBtjF42fL+gfIR6NltE2KsX7D8REBOKxE9OTmx/QeIK5QCKwHHBMwYqMCsROLmG6Zb0H2zZ+GSVR8AQpMidDci4REGK2WTXOYda3Vx0EGoCIRSAM01y3C0sTYeLGCdBOUNCzDB/olfHsERneaByx9nf+czXokxfVuAeht+jDI+6gpr6uJo8VuiN0rkSYeYLIAlXD74SdzRjFRPqPe76L3tnBClnLYVbLyck8oMcU1gS2sdNJpIU4PqoOrQZjCoFf+h0mZHGNfMZFxcezE5n75VnykrjbXk= cribb"
]