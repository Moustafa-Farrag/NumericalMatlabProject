function OutputAllMethods( matrix, it1, it2, it3, it4, it5, it6, t1, t2, t3, t4, t5, t6 )

writetable(matrix,'OutputAllMethods.txt');

fid = fopen('OutputAllMethods.txt', 'a');
fprintf(fid, '\nMethods: Bisection, False-Position, Fixed Point, Newton-Raphson, Secant, Bierge-Vieta\n');
fprintf(fid, strcat('\nNumber of iterations: ', num2str(it1), ',', num2str(it2), ',', num2str(it3), ',',  num2str(it4), ',',  num2str(it5), ',',  num2str(it6), '\n'));
fprintf(fid, strcat('\nTime: ', num2str(t1), ',', num2str(t2), ',', num2str(t3), ',',  num2str(t4), ',',  num2str(t5), ',',  num2str(t6), '\n'));
fclose(fid);

end

