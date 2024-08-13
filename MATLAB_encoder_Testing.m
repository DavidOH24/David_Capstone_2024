% Clear workspace and command window
clear;

% Establish a connection with the Arduino
a = arduino('COM3', 'Uno', 'BaudRate', 115200, 'Libraries', 'RotaryEncoder');

% Define motor control pins
motorPin1 = 'D13';
motorPin2 = 'D12';
pwmPin = 'D6';

% Define encoder pins
encoder = rotaryEncoder(a, 'D2', 'D3'); % Example encoder pins

% PID control parameters
Kp = 0.1; % Proportional gain
Ki = 0.01; % Integral gain
Kd = 0.05; % Derivative gain

% Desired angle to turn the motor (in degrees)
desiredAngle = 90; % Adjust as needed

% Convert angle to encoder counts
countsPerRev = 45; % Encoder counts per revolution
targetCount = (desiredAngle / 360) * countsPerRev;

% Initialize PID variables
integral = 0;
previousError = 0;
initialCount = readCount(encoder);

% Initialize arrays for plotting
timeArray = [];
currentAngleArray = [];
desiredAngleArray = [];

% Initialize timing
tic;

% Loop to implement PID control and read encoder values
disp('Applying PID control to move motor to the desired angle.');

while true
    % Read current encoder count
    currentCount = readCount(encoder) - initialCount;

    % Calculate the current angle (in degrees)
    currentAngle = (currentCount / countsPerRev) * 360;

    % Calculate the error
    error = targetCount - currentCount;

    % Calculate integral
    integral = integral + error;

    % Calculate derivative
    derivative = error - previousError;

    % Compute PID output
    controlSignal = Kp * error + Ki * integral + Kd * derivative;

    % Clamp control signal to valid PWM range [0, 5] volts
    controlSignal = max(min(controlSignal, 5), -5);

    % Apply control signal to the motor
    if controlSignal > 0
        writeDigitalPin(a, motorPin1, 1);
        writeDigitalPin(a, motorPin2, 0);
        writePWMVoltage(a, pwmPin, controlSignal);
    elseif controlSignal < 0
        writeDigitalPin(a, motorPin1, 0);
        writeDigitalPin(a, motorPin2, 1);
        writePWMVoltage(a, pwmPin, -controlSignal);
    else
        writeDigitalPin(a, motorPin1, 0);
        writeDigitalPin(a, motorPin2, 0);
        writePWMVoltage(a, pwmPin, 0);
    end

    % Store current time and angles for plotting
    currentTime = toc;
    timeArray = [timeArray; currentTime];
    currentAngleArray = [currentAngleArray; currentAngle];
    desiredAngleArray = [desiredAngleArray; desiredAngle];

    % Display encoder count and error
    fprintf('Encoder Count: %d, Current Angle: %.2f, Error: %d\n', currentCount, currentAngle, error);

    % Check if the target count is reached within a tolerance
    if abs(error) < 1 % Adjust tolerance as needed
        writeDigitalPin(a, motorPin1, 0);
        writeDigitalPin(a, motorPin2, 0);
        writePWMVoltage(a, pwmPin, 0);
        break;
    end

    % Update previous error
    previousError = error;

    % Pause for a short period
    pause(0.001);
end

% Clear the connection to the Arduino
clear a;

% Plot the desired angle and current angle over time
figure;
plot(timeArray, desiredAngleArray, 'r--', 'LineWidth', 2);
hold on;
plot(timeArray, currentAngleArray, 'b-', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Angle (degrees)');
title('Desired Angle vs. Current Angle');
legend('Desired Angle', 'Current Angle');
grid on;
