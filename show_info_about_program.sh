echo "Qual programa deseja visualizar?"
read program
echo "Tipo do arquivo:"
file $program
echo "Dependencias:"
ldd $program
echo "Code:"
objdump -dM intel $program
