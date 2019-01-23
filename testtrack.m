function code = testtrack
% track   Code for the ViRMEn experiment track.
%   code = track   Returns handles to the functions that ViRMEn
%   executes during engine initialization, runtime and termination.


% Begin header code - DO NOT EDIT
code.initialization = @initializationCodeFun;
code.runtime = @runtimeCodeFun;
code.termination = @terminationCodeFun;
% End header code - DO NOT EDIT



% --- INITIALIZATION code: executes before the ViRMEn engine starts.
function vr = initializationCodeFun(vr)
vr.forwardVelocity=1;
vr.transport = 0;
vr.homeStart=tic;


% --- RUNTIME code: executes on every iteration of the ViRMEn engine.
function vr = runtimeCodeFun(vr)

% change the color of the floor (closedWorld)for 1 sec, then transport to
% start
if vr.transport==1    
    pause(1);
    vr.transport = 0;
    vr.position(1:end)=0;
    vr.homeStart=tic;
end

% whether in world 1 (closedWorld) or world 2 (openWorld)
if toc(vr.homeStart)>3
    vr.currentWorld = 2; % open world
else
    vr.currentWorld = 1; % closed world
end

% when subj reaches the end, pause for 2s, then enable the "transporter"
if vr.position(2)>104
    pause(2)
    vr.transport = 1;
    vr.currentWorld = 1;
end
    


% --- TERMINATION code: executes after the ViRMEn engine stops.
function vr = terminationCodeFun(vr)
    %save('vr','-struct','vr');
    

