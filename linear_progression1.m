vrep=remApi('remoteApi');
vrep.simxFinish(-1); 
 clientID=vrep.simxStart('127.0.0.1',19997,true,true,5000,5);
if (clientID>-1)
       disp('Connected')
       %handle
          [returnCode,snake_joint_v1]=vrep.simxGetObjectHandle(clientID,'snake_joint_v1',vrep.simx_opmode_blocking);
          [returnCode,snake_joint_v2]=vrep.simxGetObjectHandle(clientID,'snake_joint_v2',vrep.simx_opmode_blocking);
          [returnCode,snake_joint_v3]=vrep.simxGetObjectHandle(clientID,'snake_joint_v3',vrep.simx_opmode_blocking);
          [returnCode,snake_joint_v4]=vrep.simxGetObjectHandle(clientID,'snake_joint_v4',vrep.simx_opmode_blocking);
      
       %code 
       for t=1:120
           av1=(pi/3)*sin((pi/6)*t+1*2*pi/3);
           av2=(pi/3)*sin((pi/6)*t+2*2*pi/3);
           av3=(pi/3)*sin((pi/6)*t+3*2*pi/3);
           av4=(pi/3)*sin((pi/6)*t+4*2*pi/3);
           [returnCode]=vrep.simxSetJointTargetPosition(clientID,snake_joint_v1,av1,vrep.simx_opmode_blocking);
           [returnCode]=vrep.simxSetJointTargetPosition(clientID,snake_joint_v2,av2,vrep.simx_opmode_blocking);
           [returnCode]=vrep.simxSetJointTargetPosition(clientID,snake_joint_v3,av3,vrep.simx_opmode_blocking);
           [returnCode]=vrep.simxSetJointTargetPosition(clientID,snake_joint_v4,av4,vrep.simx_opmode_blocking);

           pause(0.04);
       end
    [returnCode]=vrep.simxSetJointTargetPosition(clientID,snake_joint_v1,0,vrep.simx_opmode_blocking);
    [returnCode]=vrep.simxSetJointTargetPosition(clientID,snake_joint_v2,0,vrep.simx_opmode_blocking);
    [returnCode]=vrep.simxSetJointTargetPosition(clientID,snake_joint_v3,0,vrep.simx_opmode_blocking);
    [returnCode]=vrep.simxSetJointTargetPosition(clientID,snake_joint_v4,0,vrep.simx_opmode_blocking);
     
    vrep.simxFinish(-1);
      
end
    vrep.delete();
       
       
