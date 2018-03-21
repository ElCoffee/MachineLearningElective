classdef Perceptron
    
    properties
        w
    end
    methods
        function obj = Perceptron(dim, datasetX, datasetY)
            
            m = length(datasetX);

            obj.w = 0.0000001*ones(1, dim);
            br = false;
            while not(br)
                for i = 1:m
                    p = datasetY(i)*obj.w*datasetX(i, :)';
                    if p < 0
                        obj.w = obj.w + datasetY(i)*datasetX(i, :);
                    else
                        br = true;
                    end
                end
            end
        end
        
        function label = predict(obj, x)
            label = obj.w*x';
        end
        
        
    end
end
    