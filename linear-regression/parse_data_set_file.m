function [Y, InitialMatrix] = parse_data_set_file(file_path)
   input = fopen(file_path, 'r');
   vectors = fscanf(input, "%d", [1 1]);
   predictors = fscanf(input, "%d", [1 1]);
   InitialMatrix = {};
   for i = 1:vectors
     Y(i, 1) = fscanf(input, "%d", [1 1]);
     for j = 1:predictors
       InitialMatrix(j, i) = fscanf(input, "%s", [1 1]);
       num = str2double(InitialMatrix{j, i});
       if ~isnan(num)
          InitialMatrix{j, i} = num;
       end
     endfor
   endfor
   InitialMatrix = InitialMatrix';
   fclose(input);
endfunction
