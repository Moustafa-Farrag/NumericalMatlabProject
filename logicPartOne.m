function logicPartOne( method, f, e, interval_1, interval_2, req, epsilon,  handles)
   reset(handles.axes2);
   switch method
    case 'Bisection'
        cla(handles.axes2);
        
        set(handles.uitable4, 'Data', {}, 'RowName', {});
        set(handles.uitable4,'visible', 'off');
        
        set(handles.text7,'visible', 'off');
        set(handles.text8,'visible', 'off');
        set(handles.text10,'visible', 'off');
        set(handles.text12,'visible', 'off');
        
        [Errors , ErrorsCell , X , ul ,time , numOfit ] = bisection (f , interval_2 , interval_1, epsilon , req , handles.axes2 , 1 );
        
        T = table(X, ErrorsCell);
        C = table2cell(T);
        
        OutputFile( T, 'Bisection', numOfit, time );
        
        len = size(ul);
        lowerUpper = ul(len - 1);
        
        set(handles.uitable4,'visible', 'on');
        set(handles.uitable4,'Data',C,'ColumnName',{'X', 'Errors'});
        
        set(handles.text7,'visible', 'on');
        set(handles.text7, 'String', strcat('Result: ', num2str(X(end))));
        
        set(handles.text8,'visible', 'on');
        set(handles.text8, 'String', strcat('Num of iterations: ', num2str(numOfit)));
        
        set(handles.text10,'visible', 'on');
        set(handles.text10, 'String', strcat('Time: ', num2str(time)));
        
        set(handles.text12,'visible', 'on');
        set(handles.text12, 'String', strcat('Iterations: ', num2str(log10(lowerUpper(2) - lowerUpper(1)) - log10(epsilon) / log10(2))));
        
    case 'False-position'
        cla(handles.axes2);
        
        set(handles.uitable4, 'Data', {}, 'RowName', {});
        set(handles.uitable4,'visible', 'off');
        
        set(handles.text7,'visible', 'off');
        set(handles.text8,'visible', 'off');
        set(handles.text10,'visible', 'off');
        set(handles.text12,'visible', 'off');
        
        [Errors , ErrorsCell , numOfit , X , ul, time] = falsi1 (f , interval_2  , interval_1 , epsilon , req , handles.axes2 , 1);
        
        T = table(X, ErrorsCell);
        C = table2cell(T);
        
        OutputFile( T, 'False-position', numOfit, time );
        
        set(handles.uitable4,'visible', 'on');
        set(handles.uitable4,'Data',C,'ColumnName',{'X', 'Errors'});
        
        set(handles.text7,'visible', 'on');
        set(handles.text7, 'String', strcat('Result: ', num2str(X(end))));
        
        set(handles.text8,'visible', 'on');
        set(handles.text8, 'String', strcat('Num of iterations: ', num2str(numOfit)));
        
        set(handles.text10,'visible', 'on');
        set(handles.text10, 'String', strcat('Time: ', num2str(time)));
        
    case 'Fixed point'
        cla(handles.axes2);
        
        set(handles.uitable4, 'Data', {}, 'RowName', {});
        set(handles.uitable4,'visible', 'off');
        
        set(handles.text7,'visible', 'off');
        set(handles.text8,'visible', 'off');
        set(handles.text10,'visible', 'off');
        set(handles.text12,'visible', 'off');
        
        [X , iter , Errors , ErrorsCell , type , time ] = fixedPoint(interval_1,epsilon,req,e , handles.axes2 ,1);
        disp(size(X));
        disp(size(ErrorsCell));
        T = table(X, ErrorsCell);
        C = table2cell(T);
        
        OutputFile( T, 'Fixed point', iter, time );
        
        set(handles.uitable4,'visible', 'on');
        set(handles.uitable4,'Data',C,'ColumnName',{'X', 'Errors'});
        
        set(handles.text7,'visible', 'on');
        set(handles.text7, 'String', strcat('Result: ', num2str(X(end))));
        
        set(handles.text8,'visible', 'on');
        set(handles.text8, 'String', strcat('Num of iterations: ', num2str(iter)));
        
        set(handles.text10,'visible', 'on');
        set(handles.text10, 'String', strcat('Time: ', num2str(time)));
    case 'Newton-Raphson'
        cla(handles.axes2);
        
        set(handles.uitable4, 'Data', {}, 'RowName', {});
        set(handles.uitable4,'visible', 'off');
        
        set(handles.text7,'visible', 'off');
        set(handles.text8,'visible', 'off');
        set(handles.text10,'visible', 'off');
        set(handles.text12,'visible', 'off');
        
        [ErrorsCell , Errors , X , numOfit , time]= newtRaph(interval_1,epsilon,req,e , handles.axes2 , 1);
        
        T = table(X, ErrorsCell);
        C = table2cell(T);
        
        OutputFile( T, 'Newton-Raphson', numOfit, time );
        
        set(handles.uitable4,'visible', 'on');
        set(handles.uitable4,'Data',C,'ColumnName',{'X', 'Errors'});
        
        set(handles.text7,'visible', 'on');
        set(handles.text7, 'String', strcat('Result: ', num2str(X(end))));
        
        set(handles.text8,'visible', 'on');
        set(handles.text8, 'String', strcat('Num of iterations: ', num2str(numOfit)));
        
        set(handles.text10,'visible', 'on');
        set(handles.text10, 'String', strcat('Time: ', num2str(time)));
        
        df = diff(sym(f));
        d = matlabFunction(df);
        dff = diff(sym(df));
        dd = matlabFunction(dff);
        disp(dd(X(end)) / 2 *  d(X(end)));
        set(handles.text12,'visible', 'on');
        set(handles.text12, 'String', strcat('Error: ', num2str(dd(X(end)) / 2 *  d(X(end)))));
        
    case 'Secant'
        cla(handles.axes2);
        
        set(handles.uitable4, 'Data', {}, 'RowName', {});
        set(handles.uitable4,'visible', 'off');
        
        set(handles.text7,'visible', 'off');
        set(handles.text8,'visible', 'off');
        set(handles.text10,'visible', 'off');
        set(handles.text12,'visible', 'off');
        
        [Errors , ErrorsCell , result , numOfit , X, time] = Secant(f, interval_1, interval_2, epsilon, req, handles.axes2, 1);
        
        T = table(X, ErrorsCell);
        C = table2cell(T);
        
        OutputFile( T, 'Secant', numOfit, time );
        
        set(handles.uitable4,'visible', 'on');
        set(handles.uitable4,'Data',C,'ColumnName',{'X', 'Errors'});
        
        set(handles.text7,'visible', 'on');
        set(handles.text7, 'String', strcat('Result: ', num2str(result)));
        
        set(handles.text8,'visible', 'on');
        set(handles.text8, 'String', strcat('Num of iterations: ', num2str(numOfit)));
        
        set(handles.text10,'visible', 'on');
        set(handles.text10, 'String', strcat('Time: ', num2str(time)));
        
    case 'Bierge-Vieta'
        cla(handles.axes2);
        
        set(handles.uitable4, 'Data', {}, 'RowName', {});
        set(handles.uitable4,'visible', 'off');
        
        set(handles.text7,'visible', 'off');
        set(handles.text8,'visible', 'off');
        set(handles.text10,'visible', 'off');
        set(handles.text12,'visible', 'off');
        
        try 
          sym2poly(f);
          
          
        [ result , numOfit , Errors , ErrorsCell , X , time ] = Brige_Vieta(f , interval_1 , epsilon , req);
        
        T = table(X, ErrorsCell);
        C = table2cell(T);
        
        OutputFile( T, 'Bierge-Vieta', numOfit, numOfit );
        
        set(handles.uitable4,'visible', 'on');
        set(handles.uitable4,'Data',C,'ColumnName',{'X', 'Errors'});
        
        set(handles.text7,'visible', 'on');
        set(handles.text7, 'String', strcat('Result: ', num2str(result)));
        
        set(handles.text8,'visible', 'on');
        set(handles.text8, 'String', strcat('Num of iterations: ', num2str(numOfit)));
        
        set(handles.text10,'visible', 'on');
        set(handles.text10, 'String', strcat('Time: ', num2str(time)));
          
        catch ME
        warndlg('Bierge-Vieta requires poly','Warning');
        end
    end


end

