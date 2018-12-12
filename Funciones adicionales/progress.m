function [] = progress(title,prtg,indent)
%progress(title,prtg) muestra el progreso de la tarea que esta completo al
%prtg% indentado con indent
fprintf([repmat(' ',1,indent),title,' %1.0f%% \n'],prtg);
end

