clc
clear
tic

%% исходные данные
Dir='C:\Project\2012_Diplom\Later';
versn='';
name=['а' 'б' 'в' 'г' 'д' 'е' 'ё' 'ж' 'з' 'и' 'й' 'к' 'л' 'м' 'н' 'о' 'п' 'р' 'с' 'т' 'у' 'ф' 'х' 'ц' 'ч' 'ш' 'щ' 'ы' 'э' 'ю' 'я'];
NBukv=length(name);
dl_bukv=[71 26 17 16 22 19 11 15 21 49 18 29 31 27 33 26 23 30 31 34 18 16 16 20 15 15 12 19 18 11 12];
ext='.wav';
for  nbukv=1:NBukv
 for cBukv=1:dl_bukv(nbukv)  
  file=fullfile(Dir, name(nbukv), [name(nbukv) num2str(cBukv) ext versn]);
  [X,Fs,bits]=wavread(file);
  
 end;
 file
end;