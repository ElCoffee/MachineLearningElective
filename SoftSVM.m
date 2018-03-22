classdef SoftSVM
    
    properties
        w
        w_bar
    end
    methods
        function obj = SoftSVM(dim, X, Y, mu, eta)
            
            m = length(X);
            v = 0;

            obj.w = zeros(dim, m);
            for t = 1:m-1
                i = random('unid', m);
                v = 2*mu*obj.w(:, t) - Y(i)*X(i, :)'*(Y(i)*obj.w(:, t)'*X(i, :)' < 1);
                obj.w(:, t+1) = obj.w(:, t) - eta*v;
            end
            obj.w_bar = sum(obj.w, 2)./m;
        end
        
        function label = predict(obj, x)
            label = sign(obj.w_bar'*x');
        end
        
        function w_bar = supporting_vector(obj)
            w_bar = obj.w_bar;
        end        
        
    end
end
    