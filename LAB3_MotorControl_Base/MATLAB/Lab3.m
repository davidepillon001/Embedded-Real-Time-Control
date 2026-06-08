clear all 
instrreset

COM_port = 'COM3';

packet_specification = {'single', 'single', 'single', 'single', 'single', 'single'};


% reset 
data = serial_datalog(COM_port,packet_specification, 'baudrate', 115200);


% PLOT AND SAVE PLOTS
%Motor 1
figure;
hold on
title("MOTOR 1 forward-and-break")
t = data.time;      %% DA MODIFICARE
subplot(3,1,1);
plot(t,data.out{1});
xlabel('Time [s]'); ylabel('Speed [rpm]');

subplot(3,1,2);
plot(t,data.out{2});
xlabel('Time [s]'); ylabel('Speed Error [rpm]');

subplot(3,1,3);
plot(t,data.out{3});
xlabel('Time [s]'); ylabel('Control Action [V]');

saveas(gcf, 'motor_1_fb_60', 'jpeg');
saveas(gcf, 'motor_1_fb_60', 'eps');


%Motor 2
figure;
hold on
title("MOTOR 2 forward-and-break")
t = data.time;      %% DA MODIFICARE
subplot(3,1,1);
plot(t,data.out{4});
xlabel('Time [s]'); ylabel('Speed [rpm]');

subplot(3,1,2);
plot(t,data.out{5});
xlabel('Time [s]'); ylabel('Speed Error [rpm]');

subplot(3,1,3);
plot(t,data.out{6});
xlabel('Time [s]'); ylabel('Control Action [V]');

saveas(gcf, 'motor_2_fb_60', 'jpeg');
saveas(gcf, 'motor_2_fb_60', 'eps');

