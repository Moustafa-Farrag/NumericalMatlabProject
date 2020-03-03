function OutputFile( tableOfResults, method, numOfIt, time )

writetable(tableOfResults,'OutputPart1.txt');

fid = fopen('OutputPart1.txt', 'a');
fprintf(fid, strcat('\nMethod: ', method, '\n'));
fprintf(fid, strcat('\nNumber of iterations: ', num2str(numOfIt), '\n'));
fprintf(fid, strcat('\nExecution time: ', num2str(time), '\n'));
fclose(fid);


end

