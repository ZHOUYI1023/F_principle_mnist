clear;clc;close all;
addpath("./data")
load("mnist_data.txt")
t = mnist_data(:,1);
X = mnist_data(:,2);
Y = nufft(X,t);
Y_log = log(abs(Y)/length(Y));
%  [pks,locs] = findpeaks(Y_log);
locs = [12100;21008;28932;38078];
n = length(t);
f = (0:n-1)/n;
figure(1)
plot(f,Y_log,'r')
hold on
plot(f(locs),Y_log(locs),'rx')
error_list = [];
% figure
% plot(mnist_data(:,1),mnist_data(:,2),'rx')
for ind = 0:19
    file_name = "mnist_data_predict_epoch_" + string(ind) +".txt";
    X1 = load(file_name);
    Y1 = nufft(X1,t);
    Y1_log = log(abs(Y1)/length(Y1));
    figure(2)
    subplot(4,5,ind+1)
    plot(f,Y_log,'r')
    hold on
    plot(f,Y1_log,'b')
    legend("gt","predict")
    title("Epoch"+string(ind+1))
    error = abs((Y1(locs) - Y(locs))./Y(locs));
    error_list = [error_list, error];
%     axis([0.4,1,-8,-2])
end
figure(3)
imagesc(error_list)
axis xy;
set(gca,'ytick',[1,2,3,4]);
xlabel('Epoch')
ylabel('Frequency Index')
% set(gca, 'CLim', [0.05 0.25]);
map=mymap("MPL_RdBu");
colormap(map)
colorbar