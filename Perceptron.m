classdef Perceptron
    properties
        w
    end
    methods
        function obj = Perceptron(dim, datasetX, datasetY)
            m = length(datasetX);
            obj.w = 0.0*ones(1, dim);
            br = true;
            while br
                br=false;
                i=1;
                bi = true;
                while i<m+1 && bi
                    p = datasetY(i)*obj.w*datasetX(i, :)';
                    if p <= 0
                        obj.w = obj.w + datasetY(i)*datasetX(i, :);
                        bi = false;
                        br = true;
                    end
                    i=i+1;
                end
                
            end
        end       
        function label = predict(obj, x)
            label = sign(obj.w*x');
        end    
    end
end
    