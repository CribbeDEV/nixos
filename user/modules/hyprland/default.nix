{ pkgs, ... }:
# modules/hyprland/default.nix

{
  imports = [
    ../foot
  ];

  home.packages = with pkgs; [
    gnome.gdm
      rofi-wayland
      libnotify
      dunst
      drm_info
      waybar
      swww
      wdisplays
      wlroots
      wl-clipboard
      wlr-randr
      xdg-desktop-portal-wlr
      grimblast
      playerctl
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

wayland.windowManager.hyprland = {
    enable = true;
#    systemdIntegration = true;
#    nvidiaPatches = true;
    extraConfig = ''
monitor=DP-3,3440x1440@100,3440x0,1
monitor=DP-5,1920x1080@60,2360x0,1,transform,3
monitor=eDP-1,1920x1080@60,4240x1440,1

# exec-once = waybar & hyprpaper & firefox

# source = ~/.path/to/file.conf

# Variables
$terminal = st
$browser = firefox
$fileManager = thunar
$menu = rofi -show drun

# Some default env vars.
env = XCURSOR_SIZE,24
env = QT_QPA_PLATFORMTHEME,qt5ct # change to qt6ct if you have that
#env = WLR_DRM_DEVICES,/dev/dri/renderD128
#env = WLR_DRM_DEVICES,/dev/dri/card0
#env = WLR_DRM_DEVICES,/dev/dri/card1
#env = WLR_DRM_DEVICES,/dev/dri/by-patch/platform-evdi.0-card

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
    kb_layout = dk
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 1

    touchpad {
        natural_scroll = no
    }

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
#    force_no_accel = true
    accel_profile = flat
}

general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    gaps_in = 10
    gaps_out = 20
    border_size = 2
    col.active_border = rgba(3498dbee) rgba(3498dbee) 45deg
    col.inactive_border = rgba(595959aa)

    layout = master

    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing = false
}

decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    rounding = 10
    
    blur {
        enabled = true
        size = 3
        passes = 1
    }

    drop_shadow = yes
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
}

animations {
    enabled = yes

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = yes # you probably want this
}

master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_is_master = false
}

gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = on
}

misc {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    force_default_wallpaper = -1 # Set to 0 or 1 to disable the anime mascot wallpapers
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
#device:epic-mouse-v1 {
#    sensitivity = -0.5
#}

# Example windowrule v1
# windowrule = float, ^(kitty)$
# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
#windowrulev2 = nomaximizerequest, class:.* # You'll probably like this.


# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, X, exec, $terminal
bind = SUPER_SHIFT , B, exec, $browser
bind = SUPER_SHIFT, Q, killactive, 
bind = $mainMod, C, exit, 
bind = $mainMod, E, exec, $fileManager
bind = $mainMod, F, togglefloating, 
bind = $mainMod, R, exec, $menu
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, J, togglesplit, # dwindle

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Example special workspace (scratchpad)
bind = $mainMod, S, togglespecialworkspace, magic
bind = $mainMod SHIFT, S, movetoworkspace, special:magic

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

bind = SUPER SHIFT, H, movewindow, l
bind = SUPER SHIFT, L, movewindow, r
bind = SUPER SHIFT, K, movewindow, u
bind = SUPER SHIFT, J, movewindow, d

bind = $mainMod, l, resizeactive, 50 0
bind = $mainMod, h, resizeactive, -50 0
bind = $mainMod, k, resizeactive, 0 -50
bind = $mainMod, j, resizeactive, 0 50

''
#  wayland.windowManager.hyprland = {
#    enable = true;
#    xwayland.enable = true;
#    settings = {
#      "$mod" = "SUPER";
#      bind =
#        [
#        "$mod SHIFT, B, exec, firefox"
#        "$mod SHIFT, Q, killactive"
#        "$mod X, exec, kitty"
#        ", Print, exec, grimblast copy area"
#        ];
#    };
#    extraConfig = ''
#      env = WLR_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0;
#    '';
#  };

}
