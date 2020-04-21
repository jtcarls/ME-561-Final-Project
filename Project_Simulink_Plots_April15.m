Type = 'Ramp';

figure

if(Type == 'Ramp')
sgtitle([num2str(RampCarRatio), '-Car Ramp Length,  ', num2str(V), ' m/s Car Velocity, No Controller']);

elseif(Type == 'Drop')
sgtitle(['5ft Dropoff,   ', num2str(V), ' m/s Car Velocity, No Controller']);

end


subplot(3,1,1)
plot(tout,yout(:,1)-5)

if(Type == 'Ramp')
    xline(RampStart,'b--')
    xline(RampEnd+Delay, 'r--')

elseif(Type == 'Drop')
    xline(RampStart,'b--')
    xline(RampStart+Delay, 'r--')    
end

ylabel('$\theta$ (Degrees)','Interpreter','latex');
title('Pitch Angle');
xlim([1.5,4.5]);

subplot(3,1,2)
plot(tout,yout(:,2))
if(Type == 'Ramp')
    xline(RampStart,'b--')
    xline(RampEnd+Delay, 'r--')

elseif(Type == 'Drop')
    xline(RampStart,'b--')
    xline(RampStart+Delay, 'r--')    
end
ylabel('$\dot{\theta}$ (Degrees/s)', 'Interpreter','latex')
title('Pitch Velocity')
xlim([1.5,4.5]);


subplot(3,1,3)
plot(tout,yout(:,3))
if(Type == 'Ramp')
    xline(RampStart,'b--')
    xline(RampEnd+Delay, 'r--')

elseif(Type == 'Drop')
    xline(RampStart,'b--')
    xline(RampStart+Delay, 'r--')    
end
xlabel('$Time (Seconds)$', 'Interpreter','latex');
ylabel('Cr (Ns/m)', 'Interpreter','latex')
title('Rear Damping Constant')
xlim([1.5,4.5]);

saveas(gcf, [pwd, '/Data/SpeedTests/No Controller/2Ramp/Test1',num2str(10*RampCarRatio),'L_', num2str(V),'V_C'],'jpeg')