classdef Perceptron
    
    properties
        w
    end
    methods
        function obj = Perceptron(dim, datasetX, datasetY)
            obj.w = zeros(dim, 1);
            datasetX = datasetX';
            m = length(datasetX);
            
            keep = true;
            while keep
                keep2 = true;
                i = 1;
                while and(keep2, i <= m)
                    p = datasetY(i)*obj.w(:, 1)'*datasetX(:, i);
                    if p <= 0
                        obj.w(:, 1) = obj.w(:, 1) + datasetY(i)*datasetX(:, i);
                        keep2 = false;
                    end
                    i = i + 1;
                end
                if(keep2 == true)
                    keep = false;
                end
            end
        end
        
        function label = predict(obj, x)
            label = sign(obj.w(:, 1)'*x');
        end
        
        
    end
end
    