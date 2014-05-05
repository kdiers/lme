function [Y,mri] = fs_read_Y(Y_fname)
% [Y,mri] = fs_read_Y(Y_fname)
% 
% Reads Freesurfer's .mgh or .mgz data files (eg. cortical thickness data 
% files generated with mris_preproc).
%
% Input
% Y_fname: A Freesurfer's cortical data file.
%
% Output
% Y: Data matrix (nmxnv, nm total # of maps, nv #vertices). 
% mri: Mri structure.
%
% $Revision: 1.1.1.1 $  $Date: 2012/02/02 11:25:52 $
% Original Author: Jorge Luis Bernal Rusiel 
% CVS Revision Info:
%    $Author: jbernal$
%    $Date: 2012/02/02 11:25:52 $
%    $Revision: 1.1 $
%

if nargin < 1
    error('Too few inputs');
end;
mri = struct('M',[],'mr_parms',[],'volsz',[]);
[Y,M,mr_parms,volsz] = load_mgh(Y_fname);
if (isempty(M))
    error(['Can not load ' Y_fname ' as an mgh or mgz file']);
end;
mri.M = M;
mri.mr_parms = mr_parms;
mri.volsz = volsz;
nv = volsz(1)*volsz(2)*volsz(3);
Y = reshape(Y,[nv volsz(4)])';