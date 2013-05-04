function [IDX] = image_seg(I, k, types)
% This function is used for segmenting an image
% @param I the input image, only gray scale image is allowed
% @param k the image should be segemented into k parts
% @param type the type of features used
% @return IDX is the index assigned to each pixel
  if nargin < 2
    error('Error: Not Enough Argument.')
  end

  if nargin == 2
    types = {'Intensity'};
  end

  [p q] = size(I);
  IDX1 = spectral_clustering_segmentation(I, k, types);
  IDX = reshape(IDX1, p, q);
end

%% TODO S is a matrix of cells,
%% each colum is a factor of wij
%% the 2-norm of S{i}{f_number} - S{j}{f_number} is D(i,j)
function A = feature_fusion(D, d_max)
  % W(i,j) = W(i,j) * exp( (D{i,j}/sigma)^2 ) ->
  % norm(i1-i2, j1-j2) in range/not in range
  [n, n, k] = size(D);
  A = (D(:, :, 1) ./ (d_max(1) / 6)) .^ 2;
  for i = 2:k
    A = A + (D(:, :, i) ./ (d_max(i) / 6)) .^ 2;
  end
  A = exp(-A);
end

function IDX = spectral_clustering_segmentation(I, k, types)
  disp('A')
  F = feature_extractor(I, types);
  disp('B')
  [D, d_max] = compute_similarity(F);
  disp('C')
  A = feature_fusion(D, d_max);
  disp('D')
  %A = positional_filtering(A, F);
  disp('E')
  IDX = spectral_clustering_from_affinity_mat(A, k);
  disp('F')
end

function A = positional_filtering(A, F)
  %% deal with position feature
  [p q k] = size(F);
  n = p*q;
  pos_max = norm([n, n] - [1 1]);
  for i = 1:n
    for j = 1:n
      [p_xi p_yi] = get_index(i, p, q);
      [p_xj p_yj] = get_index(j, p, q);
      d = norm([p_xi p_yi] - [p_xj p_yj]);
      if d > pos_max / 5
        A(i, j) = 0;
      else
        A(i, j) = A(i, j) * exp( -(d/( pos_max./6 )).^2 );
      end
    end
  end
end



