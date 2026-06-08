clear all 
instrreset

COM_port = 'COM3';
IP = '147.162.118.149';
Port = 9090;

packet_specification = {'single', 'single', 'single', 'single', 'single', 'single'};


% reset 
data = udp_datalog(IP, Port, packet_specification); 
%data = serial_datalog(COM_port, packet_specification, 'baudrate', 115200); 

% PLOT AND SAVE PLOTS

% % Motor 1 and wheel 1
figure;
title("MOTOR 1")
t = data.time;      %% DA MODIFICARE
subplot(3,1,1);
plot(t,data.out{1});
hold on
xlabel('Time [s]'); ylabel('Speed [rpm]');
plot(t,data.out{2});
xlabel('Time [s]'); ylabel('Reference speed [rpm]');
subplot(3,1,2);
plot(t,data.out{3});
xlabel('Time [s]'); ylabel('Speed Error [rpm]');
subplot(3,1,3);
plot(t,data.out{4});
xlabel('Time [s]'); ylabel('Control Action [V]');

saveas(gcf, 'wheel_1_100_2', 'jpeg');
saveas(gcf, 'wheel_1_100_2', 'eps');


%%Motor 2 and wheel 2
% %%
% figure;
% hold on
% title("MOTOR 2")
% t = data.time;     
% subplot(4,1,1);
% plot(t,data.out{1});
% xlabel('Time [s]'); ylabel('Speed [rpm]');
% subplot(4,1,2);
% plot(t,data.out{2});
% xlabel('Time [s]'); ylabel('Reference speed [rpm]');
% subplot(4,1,3);
% plot(t,data.out{3});
% xlabel('Time [s]'); ylabel('Speed Error [rpm]');
% subplot(4,1,4);
% plot(t,data.out{4});
% xlabel('Time [s]'); ylabel('Control Action [V]');
% 
% saveas(gcf, 'wheel_2', 'jpeg');
% saveas(gcf, 'wheel_2', 'eps');


% Yaw rate
figure;
title("Control input")
t = data.time;   
subplot(3,1,1);
plot(t,data.out{5});
xlabel('Time [s]'); ylabel('Yaw Rate [rad/s]');
subplot(3,1,2);
plot(t,data.out{6});
xlabel('Time [s]'); ylabel('Phi Err[rad]');


saveas(gcf, 'yaw_1_100_2', 'jpeg');
saveas(gcf, 'yaw_1_100_2', 'eps');