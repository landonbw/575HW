function [ciq_grad] = fd_con_grad(obj, con_val0, x)
  Data;
  ciq_grad = zeros(nelem, nelem);
  Elem(:, 3) = x;
  % [~, con_val0] = obj(ndof, nbc, nelem, E, dens, Node, force, bc, Elem);
  % con_val0 = abs(con_val0) - 25000;
  for ii = 1:nelem
    Data;
    fd_step = fd_step*1;
    Elem(:, 3) = x;
    Elem(ii, 3) = complex(Elem(ii, 3), cs_step);
    [~, con_val_for] = obj(ndof, nbc, nelem, E, dens, Node, force, bc, Elem);
    val_sign = sign(real(con_val_for));
    con_val_for = con_val_for - 25000;
    ciq_grad(ii, :) = val_sign .* imag(con_val_for) / cs_step;
    % ciq_grad(ii, :) = (con_val_for - con_val0) / fd_step;
  end
end