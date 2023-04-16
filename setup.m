%% ^_^ Welcome to Truss Finite Element Analysis (TrussFEA) software! ^_^ %%
% SETUP file to be run only the first time
%

%% Add all necessary functions to MATLAB path 
% set up the workspace
clear; clc;

originFolder=fileparts(mfilename('fullpath')); %Main folder

% add the function libraries
addpath(fullfile(originFolder,'Functions'));

% add the Software Verification and Examples (with sub-folders)
addpath(genpath(fullfile(originFolder,'Example')));

%% Save path definitions
savepath; 

%% Open the User_Guide
% cd User_Guide;
% open('User_Guide_Tensegrity_Finite_Element_Method_(TsgFEM).pdf');
% cd ..;
disp('Welcome! Please follow the step-by-step instructions in README.');