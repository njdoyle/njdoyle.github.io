#! /bin/sh

CURRENT_WEIGHT=0;

for WEIGHT in Thin ExtraLight Light Regular Medium SemiBold Bold ExtraBold; do
for STYLE  in "normal" "italic"; do

	[ "$WEIGHT" = "Regular" ] && [ "$STYLE" = "italic" ] && WEIGHT="";
	case "$STYLE" in
		normal) STYLE_FILE="${WEIGHT}"      ;;
		italic) STYLE_FILE="${WEIGHT}Italic";;
	esac;

cat <<EOF
@font-face {
	font-family: "JetBrains Mono";
	font-weight: $(($CURRENT_WEIGHT + 1)) $(($CURRENT_WEIGHT + 125));
	font-style: $STYLE;
	src: url("JetBrainsMono/JetBrainsMono-$STYLE_FILE.woff2") format("woff2");
}
EOF

done;
CURRENT_WEIGHT=$(($CURRENT_WEIGHT + 125));
done;
