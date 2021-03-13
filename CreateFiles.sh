FILES_ARRAY=()

appendFiles() {
	files=$@
	for file in $files; do FILES_ARRAY+=($file); done
}
removeExtension() {
	file=$@
	dir="${file%.*}"
	echo "$dir"
}
executeHDFSCommands() {
	for cmd in "$@"; do
		echo "$cmd"
		output=$(eval "$cmd")
	done
}

createFolderCMD(){
	path="$@"
	cmd="hdfs dfs -mkdir -p ${path}"
	echo "$cmd"
}

createFileCMD(){
	path="$1"
	file="$2"
	cmd="hdfs dfs -put ${file} ${path}"
	echo "$cmd"
}

uploadHDFS() {
	for file in "${FILES_ARRAY[@]}"; do
		dir_name="$(removeExtension $file)"
		ruta_final="$RUTA_DESTINO$dir_name"
		create_folder="$(createFolderCMD $ruta_final)"
		create_file="$(createFileCMD $ruta_final $file)"
		executeHDFSCommands "$create_folder" "$create_file"
		echo "Archivo ${file} creado en $ruta_final"
	done

}
read -e -p "Ingresar ruta destino hdfs: " RUTA_DESTINO
read -e -p "Ingresar files separados por espacio: " FILES_INGRESADOS 

appendFiles $FILES_INGRESADOS
echo ----------------------------------------------------
echo ----------------------------------------------------
uploadHDFS
echo ----------------------------------------------------
echo -------------Todos los archivos subidos-------------
