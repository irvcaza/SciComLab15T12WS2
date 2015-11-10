function result = calcError(dt, solution1, solution2)
    result = sqrt((dt./5)*(sum((solution1 - solution2).^2)));
end