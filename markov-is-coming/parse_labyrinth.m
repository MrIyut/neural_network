function labyrinth = parse_labyrinth (file_path)
   input = fopen(file_path, 'r');
   lin = fscanf(input, "%d", [1 1]);
   col = fscanf(input, "%d", [1 1]);
   labyrinth = fscanf(input, "%d", [lin, col])';
   fclose(input);
endfunction
