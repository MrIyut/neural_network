function [Y, InitialMatrix] = parse_csv_file(file_path)
    input = fopen(file_path, 'r');
    headers = fgetl(input);
    predictors = numel(strfind(headers, ','));

    InitialMatrix = {};
    num_row = 1;
    while ~feof(input)
      line = fgetl(input);
      data = strsplit(line, ',');
      Y(num_row, 1) = str2double(data(1, 1));
      for j = 1:predictors
        InitialMatrix(j, num_row) = data(1, j + 1);
        num = str2double(InitialMatrix{j, num_row});
        if ~isnan(num)
          InitialMatrix{j, num_row} = num;
        end
      endfor
      num_row += 1;
    endwhile
    InitialMatrix = InitialMatrix';
    fclose(input);
endfunction
