classdef Perceptron
    
    properties
        w
    end
    methods
        function obj = Perceptron(dim, datasetX, datasetY)
            % Implements the perceptron algorithm for datasetX of dimension dim
            % and labels datasetY. The results is a p
            
            m = length(datasetX);

            w = zeros(1, dim);
            br = false;
            while not(br)
                for i = 1:m
                    p = datasetY(i)*w*datasetX(i, :)';
                    if p < 0
                        w = w + datasetY(i)*datasetX(i, :);
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
    