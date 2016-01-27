function [area,cx,cy] = polycenter(x,y,dim)

if nargin==1 
  error('MATLAB:polycenter:NotEnoughInputs','Not enough inputs.'); 
end

if ~isequal(size(x),size(y)) 
  error('MATLAB:polycenter:XYSizeMismatch','X and Y must be the same size.'); 
end

if nargin==2
    [x,nshifts] = shiftdim(x);
    y = shiftdim(y);
elseif nargin==3
    perm = [dim:max(length(size(x)),dim) 1:dim-1];
    x = permute(x,perm);
    y = permute(y,perm);
end

warn0 = warning('query','MATLAB:divideByZero');
warning('off','MATLAB:divideByZero')
    
siz = size(x);
if ~isempty(x)
    tmp = x(:,:).*y([2:siz(1) 1],:) - x([2:siz(1) 1],:).*y(:,:);
    area = reshape(sum(tmp),[1 siz(2:end)])/2;
    cx = reshape(sum((x(:,:)+x([2:siz(1) 1],:)).*tmp/6),[1 siz(2:end)])./area;
    cy = reshape(sum((y(:,:)+y([2:siz(1) 1],:)).*tmp/6),[1 siz(2:end)])./area;
    area = abs(area);
else
    area = sum(x); % SUM produces the right value for all empty cases
    cx = NaN(size(area));
    cy = cx;
end

warning(warn0.state,'MATLAB:divideByZero')

if nargin==2
   area = shiftdim(area,-nshifts);
   cx = shiftdim(cx,-nshifts);
   cy = shiftdim(cy,-nshifts);
elseif nargin==3
    area = ipermute(area,perm);
    cx = ipermute(cx,perm);
    cy = ipermute(cy,perm);
end
