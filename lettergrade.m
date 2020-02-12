% Returns a letter grade given a score.
function grade = lettergrade(score)
    if score < 0 || score > 100
        grade = "-";
        warning("Score " + score + "% is out of bounds");
    else
        if score >= 90
            grade = "A";
        elseif score >= 80
            grade = "B";
        elseif score >= 70
            grade = "C";
        elseif score >= 60
            grade = "D";
        else % score<60
            grade = "F";
        end
    end
end