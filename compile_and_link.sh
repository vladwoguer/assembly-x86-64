echo "Qual programa deseja compilar?"
read program
nasm -f elf64 $program".nasm"
ld -s -o $program $program".o"
