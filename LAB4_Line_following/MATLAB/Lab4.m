clear all 
instrreset

COM_port = 'COM3';
IP = '147.162.118.149';
Port = 9090;

packet_specification = {'single', 'single', 'single', 'single', 'single', 'single'};


% reset 
data = udp_datalog(IP, Port, packet_specification); 
%data = serial_datalog(COM_port, packet_specification, 'baudrate', 115200); 

figure;
t = data.time;
subplot(3,1,1);
plot(t,data.out{1});
xlabel('Time [s]'); ylabel('w_1 [rad/s]');

subplot(3,1,2);
plot(t,data.out{2});
xlabel('Time [s]'); ylabel('w_2 [rad/s]');

subplot(3,1,3);
plot(t,data.out{3});
xlabel('Time [s]'); ylabel('speed_error [rad/s]');

saveas(gcf, 'plot1', 'jpeg');

figure;
t = data.time;
subplot(2,1,1);
plot(t,data.out{4});
xlabel('Time [s]'); ylabel('speed_error2 [rad/s]');

subplot(2,1,2);
plot(t,data.out{5});
xlabel('Time [s]'); ylabel('yaw_rate [rad/s]');

saveas(gcf, 'plot2', 'jpeg');

% y = data.out{2}(1,:);
% control_signal = data.out{1}(2,:);
% 
% SUBPLOT 1: blue sensor_x signal, red sensor_y signal, orange sensor_z signal
% SUBPLOT 2: , blue control_signal
% 
% time = (0:length(data(:,1))-1) * 0.01; 
% theta_acc = atan2(data(:,2), data(:,3)) * 180 / pi;
% 
% figure;
% plot(time, theta_acc, 'r', 'LineWidth', 1.5); 
% hold on;
% plot(time, data(:,4), 'b', 'LineWidth', 1.5);
% xlabel('Time [s]');
% ylabel('Tilt Angle [deg]');
% legend('Accelerometer Estimate', 'Control Signal');
% title('Camera Stabilization Performance');
% grid on;