BIN_DIR="$HOME/.emacs.d/bin"
INSTALL_DIR="$HOME/.local/bin"
EXECUTABLES="$(ls $BIN_DIR)"
set -x
if [ ! -d $INSTALL_DIR ]; then
   printf "Creating directory $INSTALL_DIR"
   mkdir -p $INSTALL_DIR
fi
echo $EXECUTABLES
for exec in $EXECUTABLES; do
    printf "Creating symbolic link $INSTALL_DIR/$executable\n"
    ln -sf $BIN_DIR/$exec $INSTALL_DIR/$exec
done
printf "Dont forget to add $INSTALL_DIR to PATH\n"
