clear all 
instrreset

COM_port = 'COM3';

packet_specification = {'single', 'single', 'single'};

% reset 
data = serial_datalog(COM_port,{'single', 'single', 'single'}, 'baudrate', 115200);

% y = data.out{2}(1,:);
% control_signal = data.out{1}(2,:);

% SUBPLOT 1: blue sensor_x signal, red sensor_y signal, orange sensor_z signal
% SUBPLOT 2: , blue control_signal

%time = (0:length(data(:,1))-1) * 0.01; 
%theta_acc = atan2(data(:,2), data(:,3)) * 180 / pi;

%figure;
%subplot(2,1,1);
%plot(time, theta_acc, 'r', 'LineWidth', 1.5); 
%hold on;
%plot(time, data(:,4), 'b', 'LineWidth', 1.5);
%xlabel('Time (s)');
%ylabel('Tilt Angle (deg)');
%legend('Accelerometer Estimate', 'Control Signal');
%title('Camera Stabilization Performance');
%grid on;