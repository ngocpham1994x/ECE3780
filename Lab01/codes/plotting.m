
% part 2: Creating function for taking input data and plotting

function plotting(infile); 

% declare variables
data = load(infile);
real = data(:,1);
imaginary = data(:,2);
complex_arr = real + imaginary*j ;
absolute = abs(complex_arr);

% plot data
% range = 1:size(real,1);  % uncessary, no need to get number of rows of
% the array


% subplot() is used to plot 3 graphs in one sheet
figure;
subplot(3,1,1);plot(real);  ylabel('Real'); xlim([0 250]);ylim([-100 100]); 
subplot(3,1,2);plot(imaginary); ylabel('Imaginary'); xlim([0 250]);ylim([-100 100]); 
subplot(3,1,3);plot(absolute);xlabel("Sample Index"); ylabel('Absolute'); xlim([0 250]);ylim([0 150]); 

end
