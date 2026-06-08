%clear all 
%instrreset

%COM_port = 'COM3';

%packet_specification = {'single','single','single','single'}
% reset 
%data = serial_datalog(COM_port,packet_specification, 'baudrate', 115200);


%PLOT AND SAVE PLOTS
figure;
hold on
title("Accelerometer's Data")
t = data.time;                              %% DA MODIFICARE L'INTERVALLO
xlabel('Time [s]'); ylabel('acc [m/s^2]');
plot(t(1,130:end)-1.3,data.out{1,1}(1,130:end), "r");
plot(t(1,130:end)-1.3,data.out{1,1}(2,130:end), "b");
plot(t(1,130:end)-1.3,data.out{1,1}(3,130:end), "g");
legend("Acc_x", "Acc_y", "Acc_z")
xlim([0, 2.5])

saveas(gcf, 'Accelerometer_Data', 'jpeg');
%saveas(gcf, 'Accelerometer_Data', 'epsc');
%%

% figure;
% hold on
% title("Gyroscope's Data")
% t = data.time;
% xlabel('Time [s]'); ylabel('ang vel [rad/s]');
% plot(t,data.out{4}, "r");
% plot(t,data.out{5}, "b");
% plot(t,data.out{6}, "g");
% legend("\omega_x", "\omega_y", "\omega_z")     %%prova con \omega_x
% 
% 
% saveas(gcf, 'Gyroscope_Data', 'jpeg');
%saveas(gcf, 'Gyroscope_Data', 'eps');


figure;
hold on
title("Tilt Control")
t = data.time;
xlabel('Time [s]'); ylabel('angle of tilt [deg]');
plot(t(1,130:end)-1.3, data.out{2,1}(1,130:end), "r");
plot(t(1,130:end)-1.3, -data.out{2,1}(1,130:end), "b");
legend("Control Signal", "Theta")
xlim([0, 2.5])

saveas(gcf, 'Tilt', 'jpeg');
%saveas(gcf, 'Tilt', 'epsc');

% 
% figure;
% hold on
% title("Pan Control")
% t = data.time;
% xlabel('Time [s]'); ylabel('angle of pan [deg]');
% plot(t,data.out{3}, "r");
% plot(t,data.out{4}, "b");
% legend("Phi", "Control Signal")
% 
% saveas(gcf, 'Pan', 'jpeg');
% saveas(gcf, 'Pan', 'eps');
