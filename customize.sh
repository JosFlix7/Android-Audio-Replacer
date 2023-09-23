AUTOMOUNT=true
SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false

ui_print "*******************************************************"
ui_print "   Some DerpFest Sounds."
ui_print "   By JosFlix7"
ui_print "*******************************************************"

ui_print "- Descomprimiendo modulo."
unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2

ui_print "- Detectando ubicación de audios."
if [ -d "/system/media/audio" ]; then
  MEDIA_DIR="$MODPATH/system/media"
  mkdir -p "$MEDIA_DIR"
  mv -f "$MODPATH"/audio "$MEDIA_DIR"
elif [ -d "/system/product/audio" ]; then
  MEDIA_DIR="$MODPATH/system/product"
  mkdir -p "$MEDIA_DIR"
  mv -f "$MODPATH"/audio "$MEDIA_DIR"
elif [ -d "/system/product/media/audio" ]; then
  MEDIA_DIR="$MODPATH/system/product/media"
  mkdir -p "$MEDIA_DIR"
  mv -f "$MODPATH"/audio "$MEDIA_DIR"
fi

ui_print "- Ajustando permisos."
set_perm_recursive $MODPATH 0 0 0755 0644
