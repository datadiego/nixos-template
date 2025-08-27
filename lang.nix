{ config, pkgs, ... }:

{
  # configuracion de idioma y localización
  time.timeZone="Europe/Madrid";
  i18n.defaultLocale="es_ES.UTF-8";
  i18n.extraLocaleSettings={
    LC_ADDRESS="es_ES.UTF-8";
    LC_IDENTIFICATION="es_ES.UTF-8";
    LC_MEASUREMENT="es_ES.UTF-8";
    LC_MONETARY="es_ES.UTF-8";
    LC_NAME="es_ES.UTF-8";
    LC_NUMERIC="es_ES.UTF-8";
    LC_PAPER="es_ES.UTF-8";
    LC_TELEPHONE="es_ES.UTF-8";
    LC_TIME="es_ES.UTF-8";
  };

  # configuración del teclado
  services.xserver.xkb={
    layout="es";
    variant="";
  };

  # configuración de la consola
  console.keyMap="es";

}
