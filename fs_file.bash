#!/bin/bash
#$1 = nom du fichier, $2 = nom de la fonction + param, $3= path, $4/$5 = -putchar/-main
#exemple : bash fs_file.bash ft_putnbr ft_putnbr(int nbr) -putchar -main
strstr() {
  [ "${1#*$2*}" = "$1" ] && return 1
    return 0
	}
txt1=""
txt2=""
if ( strstr $4 '-putchar' !== 0)
	then
	txt1="#include <unistd.h>\n\nvoid\tft_putchar(char c)\n{\n\twrite(1, &c, 1);\n}\n\n"
fi
if (strstr $5 '-putchar' !== 0)
	then
	txt1="#include <unistd.h>\n\nvoid\tft_putchar(char c)\n{\n\twrite(1, &c, 1);\n}\n\n"
fi
if (strstr $4 '-main' !== 0)
	then
	txt2="\n\nint\tmain(void)\n{\n\treturn (0);\n}"
fi
if (strstr $5 '-main' !== 0)
	then
	txt2="\n\nint\tmain(void)\n{\n\treturn (0);\n}"
fi
echo -e "$txt1$2\n{\n\n}$txt2" >> $3$1.c
