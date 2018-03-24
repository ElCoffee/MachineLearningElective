function newSet = phi(origSet)
    n = length(origSet);
    newSet = ones(n, 10);
    for i = 1:n
        x = origSet(i, 1);
        y = origSet(i, 2);
        z = origSet(i, 3);
        newSet(i, :) = [1, x, y, z, x*x, y*y, z*z, x*y, x*z, y*z];
    end
end