function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
    for row = 1:rows(InitialMatrix)
      offset = 0;
      for col = 1:columns(InitialMatrix)
        if ~ischar(InitialMatrix{row, col})
          FeatureMatrix(row, col + offset) = InitialMatrix{row, col};
          continue;
        endif
        if strcmp(InitialMatrix{row, col}, 'yes')
          FeatureMatrix(row, col + offset) = 1;
          continue;
        endif
        if strcmp(InitialMatrix{row, col}, 'no')
          FeatureMatrix(row, col + offset) = 0;
          continue;
        endif
        if strcmp(InitialMatrix{row, col}, 'semi-furnished')
          FeatureMatrix(row, col + offset) = 1;
          FeatureMatrix(row, col + offset + 1) = 0;
          offset += 1;
          continue;
        endif
        if strcmp(InitialMatrix{row, col}, 'furnished')
          FeatureMatrix(row, col + offset) = 0;
          FeatureMatrix(row, col + offset + 1) = 0;
          offset += 1;
          continue;
        endif
        if strcmp(InitialMatrix{row, col}, 'unfurnished')
          FeatureMatrix(row, col + offset) = 0;
          FeatureMatrix(row, col + offset + 1) = 1;
          offset += 1;
          continue;
        endif
      endfor

    endfor
endfunction
