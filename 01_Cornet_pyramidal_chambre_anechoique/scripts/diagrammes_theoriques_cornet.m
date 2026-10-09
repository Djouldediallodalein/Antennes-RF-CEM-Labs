clear all
close all

f = 2e9;
c0 = 299792458;
lambda = c0/f;
k = 2*pi/lambda;

rho_1 = 0.356;
rho_2 = 0.305;
a = 0.085;
b = 0.045;
a1 = 0.264;
b1 = 0.204;
dynamic = 40;

% ******************************************************
% *************  PLAN H (Phi = 0°)  ********************
% ******************************************************
theta_0 = linspace(-pi,pi,200);
phi_0 = 0;

kx_prime = k.*sin(theta_0).*cos(phi_0)+pi/a1;
kx_second = k.*sin(theta_0).*cos(phi_0)-pi/a1;

t1_prime = sqrt(1/(pi*k*rho_2))*(-k*a1/2-kx_prime*rho_2);
t2_prime = sqrt(1/(pi*k*rho_2))*(k*a1/2-kx_prime*rho_2);
t1_second = sqrt(1/(pi*k*rho_2))*(-k*a1/2-kx_second*rho_2);
t2_second = sqrt(1/(pi*k*rho_2))*(k*a1/2-kx_second*rho_2);

ky = k.*sin(theta_0).*sin(phi_0);
t1 = sqrt(1/(pi*k*rho_1))*(-k*b1/2-ky*rho_1);
t2 = sqrt(1/(pi*k*rho_1))*(k*b1/2-ky*rho_1);

I1 = 1/2*sqrt(pi*rho_2/k).*exp(1i*(kx_prime.^2)*rho_2/(2*k)).*( (fresnelc(t2_prime)-fresnelc(t1_prime))-1i*(fresnels(t2_prime)-fresnels(t1_prime))  )...
  +1/2*sqrt(pi*rho_2/k).*exp(1i*(kx_second.^2)*rho_2/(2*k)).*( (fresnelc(t2_second)-fresnelc(t1_second))-1i*(fresnels(t2_second)-fresnels(t1_second))  );

I2 = 1/2*sqrt(pi*rho_1/k).*exp(1i*(ky.^2)*rho_1/(2*k)).*( (fresnelc(t2)-fresnelc(t1))-1i*(fresnels(t2)-fresnels(t1))  );

E_theta_0 = 1i*k/(4*pi).*sin(phi_0).*(1+cos(theta_0)).*I1.*I2;
E_phi_0 = 1i*k/(4*pi).*cos(phi_0).*(cos(theta_0)+1).*I1.*I2;

E_tot_0 = sqrt(E_theta_0.*conj(E_theta_0) + E_phi_0.*conj(E_phi_0));
E_max_0 = max(E_tot_0);

% ******************************************************
% ************  PLAN E (Phi = 90°)  ********************
% ******************************************************
theta_90 = linspace(-pi,pi,200);
phi_90 = pi/2;

kx_prime = k.*sin(theta_90).*cos(phi_90)+pi/a1;
kx_second = k.*sin(theta_90).*cos(phi_90)-pi/a1;

t1_prime = sqrt(1/(pi*k*rho_2))*(-k*a1/2-kx_prime*rho_2);
t2_prime = sqrt(1/(pi*k*rho_2))*(k*a1/2-kx_prime*rho_2);
t1_second = sqrt(1/(pi*k*rho_2))*(-k*a1/2-kx_second*rho_2);
t2_second = sqrt(1/(pi*k*rho_2))*(k*a1/2-kx_second*rho_2);

ky = k.*sin(theta_90).*sin(phi_90);
t1 = sqrt(1/(pi*k*rho_1))*(-k*b1/2-ky*rho_1);
t2 = sqrt(1/(pi*k*rho_1))*(k*b1/2-ky*rho_1);

I1 = 1/2*sqrt(pi*rho_2/k).*exp(1i*(kx_prime.^2)*rho_2/(2*k)).*( (fresnelc(t2_prime)-fresnelc(t1_prime))-1i*(fresnels(t2_prime)-fresnels(t1_prime))  )...
  +1/2*sqrt(pi*rho_2/k).*exp(1i*(kx_second.^2)*rho_2/(2*k)).*( (fresnelc(t2_second)-fresnelc(t1_second))-1i*(fresnels(t2_second)-fresnels(t1_second))  );

I2 = 1/2*sqrt(pi*rho_1/k).*exp(1i*(ky.^2)*rho_1/(2*k)).*( (fresnelc(t2)-fresnelc(t1))-1i*(fresnels(t2)-fresnels(t1))  );

E_theta_90 = 1i*k/(4*pi).*sin(phi_90).*(1+cos(theta_90)).*I1.*I2;
E_phi_90 = 1i*k/(4*pi).*cos(phi_90).*(cos(theta_90)+1).*I1.*I2;

E_tot_90 = sqrt(E_theta_90.*conj(E_theta_90) + E_phi_90.*conj(E_phi_90));
E_max_90 = max(E_tot_90);

% ******************************************************
% *****************  AFFICHAGE  ************************
% ******************************************************

% --- Figure 1 : Comparaison des CO-POLARISATIONS ---
figure(1);
plot(rad2deg(theta_0), 20*log10(abs(E_phi_0)/E_max_0 + eps), 'b', 'LineWidth', 1.5);
hold on;
plot(rad2deg(theta_90), 20*log10(abs(E_theta_90)/E_max_90 + eps), 'r', 'LineWidth', 1.5);
grid on;
ylim([-dynamic 0]); % Dynamique limitée à 40 dB
xlabel('Theta [degrés]');
ylabel('Amplitude relative [dB]');
title('Comparaison des Co-polarisations (Plans E et H)');
legend('Plan H (\Phi = 0°)', 'Plan E (\Phi = 90°)', 'Location', 'best');

% --- Figure 2 : Comparaison des CROSS-POLARISATIONS ---
figure(2);
plot(rad2deg(theta_0), 20*log10(abs(E_theta_0)/E_max_0 + eps), 'b--', 'LineWidth', 1.5);
hold on;
plot(rad2deg(theta_90), 20*log10(abs(E_phi_90)/E_max_90 + eps), 'r--', 'LineWidth', 1.5);
grid on;
% Pas de limite en ordonnée : l'axe s'ajuste aux niveaux très bas
xlabel('Theta [degrés]');
ylabel('Amplitude relative [dB]');
title('Comparaison des Cross-polarisations Théoriques');
legend('Cross-pol Plan H', 'Cross-pol Plan E', 'Location', 'best');