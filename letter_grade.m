function grade = letter_grade( )
x = input('Score : ');
    if( x >= 0 && x <= 100 )
        if (x >= 91 )
            grade = 'A';
            
        elseif ( x >= 81 && x< 91)
            grade = 'B';
            
        elseif (x >= 71 && x < 81 )
            grade = 'C';
            
        elseif ( x >= 61 && x < 91 )
            grade = 'D';
           
        else
            grade = 'F';
            
        end
    end
end

