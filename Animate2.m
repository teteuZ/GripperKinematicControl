% Shows an animation of the gripper. Receives 3 vectors of joint angles 
% o1, o2, o3 and scalar om4, which is the scissor angle. All angles are in
% radians.

function cview = Animate2( thetaHand,varargin )

nVar = length(varargin);
if nVar ~= 0
    cview = varargin{1};    % viewpoint
end

% Parameters
l1 = 5.7; l2 = 3.8; l3 = 2.2;
l4a = 2.2; l4b = 2.2; l4c = 2.2;

% Posi��es das bases das falanges
xa = -4.45; ya = 0; za = -3.2;      % dedo A
xb = 4.45; yb = -3.65; zb = -3.2;   % dedo B
xc = 4.45; yc = 3.65; zc = -3.2;    % dedo C

% Defini��o dos �ngulos
o1a = -thetaHand(1);
o2a = -thetaHand(2);
o3a = -thetaHand(3);
o4a = -thetaHand(4);
o1b = thetaHand(5);
o2b = thetaHand(6);
o3b = thetaHand(7);
o4b = -thetaHand(8);
o1c = thetaHand(9);
o2c = thetaHand(10);
o3c = thetaHand(11);
o4c = thetaHand(12);

% Posi��es das falanges - dedo A
initdAl4 = [xa ya za];
vecdAl4 = initdAl4 + [0 l4a*sin(o4a) l4a*cos(o4a)];
initdAf1 = vecdAl4;
vecdAf1 = initdAf1 + [-l1*sin(o1a) l1*cos(o1a)*sin(o4a) l1*cos(o1a)*cos(o4a)];
initdAf2 = vecdAf1;
vecdAf2 = initdAf2 + [-l2*sin(o1a+o2a) l2*cos(o1a+o2a)*sin(o4a) l2*cos(o1a+o2a)*cos(o4a)];
initdAf3 = vecdAf2;
vecdAf3 = initdAf3 + [-l3*sin(o1a+o2a+o3a) l3*cos(o1a+o2a+o3a)*sin(o4a) l3*cos(o1a+o2a+o3a)*cos(o4a)];

% Posi��es das falanges - dedo B
initdBl4 = [xb yb zb];
vecdBl4 = initdBl4 + [0 l4b*sin(o4b) l4b*cos(o4b)];
initdBf1 = vecdBl4;
vecdBf1 = initdBf1 + [-l1*sin(o1b) l1*cos(o1b)*sin(o4b) l1*cos(o1b)*cos(o4b)];
initdBf2 = vecdBf1;
vecdBf2 = initdBf2 + [-l2*sin(o1b+o2b) l2*cos(o1b+o2b)*sin(o4b) l2*cos(o1b+o2b)*cos(o4b)];
initdBf3 = vecdBf2;
vecdBf3 = initdBf3 + [-l3*sin(o1b+o2b+o3b) l3*cos(o1b+o2b+o3b)*sin(o4b) l3*cos(o1b+o2b+o3b)*cos(o4b)];

% Posi��es das falanges - dedo B
initdCl4 = [xc yc zc];
vecdCl4 = initdCl4 + [0 l4c*sin(o4c) l4c*cos(o4c)];
initdCf1 = vecdCl4;
vecdCf1 = initdCf1 + [-l1*sin(o1c) l1*cos(o1c)*sin(o4c) l1*cos(o1c)*cos(o4c)];
initdCf2 = vecdCf1;
vecdCf2 = initdCf2 + [-l2*sin(o1c+o2c) l2*cos(o1c+o2c)*sin(o4c) l2*cos(o1c+o2c)*cos(o4c)];
initdCf3 = vecdCf2;
vecdCf3 = initdCf3 + [-l3*sin(o1c+o2c+o3c) l3*cos(o1c+o2c+o3c)*sin(o4c) l3*cos(o1c+o2c+o3c)*cos(o4c)];

% Limpa os objetos gr�ficos passados.
clf(gcf);

% Define cilindro e esfera modelo
[x,y,z] = cylinder(0.5,20);
[x1, y1, z1] = sphere;
axis([-12 12 -12 12 -5 20]);
% axis([-100 100 -100 100 -100 100]);
hold on;
rotate3d on;

% Gr�ficos - Dedo A
f4A = mesh(x + xa,y + ya,z*l4a + za);
rotate(f4A,[1 0 0],rad2deg(-o4a),[xa ya za]);
f1A = mesh(x + vecdAl4(1),y + vecdAl4(2),z*l1 + vecdAl4(3));
rotate(f1A,[1 0 0],rad2deg(-o4a),[vecdAl4(1) vecdAl4(2) vecdAl4(3)]);
rotate(f1A,[0 cos(-o4a) sin(-o4a)],rad2deg(-o1a),[vecdAl4(1) vecdAl4(2) vecdAl4(3)]);
f2A = mesh(x + vecdAf1(1),y + vecdAf1(2),z*l2 + vecdAf1(3));
rotate(f2A,[1 0 0],rad2deg(-o4a),[vecdAf1(1) vecdAf1(2) vecdAf1(3)]);
rotate(f2A,[0 cos(-o4a) sin(-o4a)],rad2deg(-o1a-o2a),[vecdAf1(1) vecdAf1(2) vecdAf1(3)]);
f3A = mesh(x + vecdAf2(1),y + vecdAf2(2),z*l3 + vecdAf2(3));
rotate(f3A,[1 0 0],rad2deg(-o4a),[vecdAf2(1) vecdAf2(2) vecdAf2(3)]);
rotate(f3A,[0 cos(-o4a) sin(-o4a)],rad2deg(-o1a-o2a-o3a),[vecdAf2(1) vecdAf2(2) vecdAf2(3)]);
pA = mesh(x1*0.5+vecdAf3(1),y1*0.5+vecdAf3(2),z1*0.5+vecdAf3(3));

% dedo 
% f1A = mesh(x+xa,y+ya,z*l1+za);
% rotate(f1A,[0 1 0],rad2deg(-o1a),[xa ya za]);
% f2A = mesh(x + vecdAf1(1),y + vecdAf1(2),z*l2 + vecdAf1(3));
% rotate(f2A,[0 1 0],rad2deg(-o1a-o2a),[vecdAf1(1) vecdAf1(2) vecdAf1(3)]);
% f3A = mesh(x + vecdAf2(1),y + vecdAf2(2),z*l3 + vecdAf2(3));
% rotate(f3A,[0 1 0],rad2deg(-o1a-o2a-o3a),[vecdAf2(1) vecdAf2(2) vecdAf2(3)]);
% pA = mesh(x1*0.5+vecdAf3(1),y1*0.5+vecdAf3(2),z1*0.5+vecdAf3(3));

% Gr�ficos - Dedo B
f4B = mesh(x + xb,y + yb,z*l4b + zb);
rotate(f4B,[1 0 0],rad2deg(-o4b),[xb yb zb]);
f1B = mesh(x + vecdBl4(1),y + vecdBl4(2),z*l1 + vecdBl4(3));
rotate(f1B,[1 0 0],rad2deg(-o4b),[vecdBl4(1) vecdBl4(2) vecdBl4(3)]);
rotate(f1B,[0 cos(-o4b) sin(-o4b)],rad2deg(-o1b),[vecdBl4(1) vecdBl4(2) vecdBl4(3)]);
f2B = mesh(x + vecdBf1(1),y + vecdBf1(2),z*l2 + vecdBf1(3));
rotate(f2B,[1 0 0],rad2deg(-o4b),[vecdBf1(1) vecdBf1(2) vecdBf1(3)]);
rotate(f2B,[0 cos(-o4b) sin(-o4b)],rad2deg(-o1b-o2b),[vecdBf1(1) vecdBf1(2) vecdBf1(3)]);
f3B = mesh(x + vecdBf2(1),y + vecdBf2(2),z*l3 + vecdBf2(3));
rotate(f3B,[1 0 0],rad2deg(-o4b),[vecdBf2(1) vecdBf2(2) vecdBf2(3)]);
rotate(f3B,[0 cos(-o4b) sin(-o4b)],rad2deg(-o1b-o2b-o3b),[vecdBf2(1) vecdBf2(2) vecdBf2(3)]);
pB = mesh(x1*0.5+vecdBf3(1),y1*0.5+vecdBf3(2),z1*0.5+vecdBf3(3));

% Gr�ficos - Dedo C
f4C = mesh(x + xc,y + yc,z*l4c + zc);
rotate(f4C,[1 0 0],rad2deg(-o4c),[xc yc zc]);
f1C = mesh(x + vecdCl4(1),y + vecdCl4(2),z*l1 + vecdCl4(3));
rotate(f1C,[1 0 0],rad2deg(-o4c),[vecdCl4(1) vecdCl4(2) vecdCl4(3)]);
rotate(f1C,[0 cos(-o4c) sin(-o4c)],rad2deg(-o1c),[vecdCl4(1) vecdCl4(2) vecdCl4(3)]);
f2C = mesh(x + vecdCf1(1),y + vecdCf1(2),z*l2 + vecdCf1(3));
rotate(f2C,[1 0 0],rad2deg(-o4c),[vecdCf1(1) vecdCf1(2) vecdCf1(3)]);
rotate(f2C,[0 cos(-o4c) sin(-o4c)],rad2deg(-o1c-o2c),[vecdCf1(1) vecdCf1(2) vecdCf1(3)]);
f3C = mesh(x + vecdCf2(1),y + vecdCf2(2),z*l3 + vecdCf2(3));
rotate(f3C,[1 0 0],rad2deg(-o4c),[vecdCf2(1) vecdCf2(2) vecdCf2(3)]);
rotate(f3C,[0 cos(-o4c) sin(-o4c)],rad2deg(-o1c-o2c-o3c),[vecdCf2(1) vecdCf2(2) vecdCf2(3)]);
pC = mesh(x1*0.5+vecdCf3(1),y1*0.5+vecdCf3(2),z1*0.5+vecdCf3(3));

if exist('cview','var')
    view(cview);
end

grid on;
pause(0.001);
[az,el] = view;
cview = [az el];

end
