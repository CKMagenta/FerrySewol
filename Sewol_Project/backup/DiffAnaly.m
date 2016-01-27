function diff = DiffAnaly(Fun, xi)
% two-point central difference formula
diff = (Fun(xi*1.05) - Fun(xi*0.95)) / (xi*1.05 - xi*0.95);
end