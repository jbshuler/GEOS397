%% 
% John Shuler
%
% GEOS597 Homework #1: GIT, Markdown and MATLAB
%
% Due: 9/02/2016
%% Part 1
% Make a Github account using your @u.boisestate.edu email address. Then, using the Github Desktop
% app, clone the master branch of the GEOS397 project to your local directory. Make a new branch called
% GEOS397 Lastname, where you insert your last name.
%
% *Github account made with email address: jbshuler@gmail.com.
% Could not create branch; Github prevented me from pushing changes to
% repository. I attempted on school machines as well as my own computer.*
%% Part 2
% In your new branch, make an new file in the HW1 directory called HW1 Lastname.md.
% Use Markdown to write a summary of how you would go about ensuring that (if the clas had 10 students)
% you would partner with every other student for the 9 homework sets (you can write some equations if you
% want). Keep in mind that a constraint imposed on this problem is that no two students in the class can have
% repeat partners.
%
% *To ensure that a single student is paired with each of nine other
% students for nine assignments, simply number students 1 through 10. If 
% the student in question is #1, then his/her partner for each week will 
% be as follows:*
%
% *Homework Assignment # - Student # of Partner For That Week:  
% 1-2, 2-3, 3-4... 9-10* 
% 
% *Determining how to ensure that ALL ten students for ALL nine assignments
% have a unique partner proved more than I could handle. And I tried. A lot.
% I arranged ten uniquely numbered students in a circle, used grids, etc. and
% nothing worked.*

%% Parts 3 and 4
% In the same file, list all of the possible variable types in MATLAB that are covered in the MATLAB style
% guide reading assignment. Also, give a description of each type and list why this is a useful type of variable.Based on the reading MatlabStyle1p5.pdf, give an example variable name for each of the variable types you
% identified in Part 3. Then compile (i.e.) save your Markdown file as an html file; also commit your changes
% to your specific GIT branch; DO NOT publish though.
%
% *1. General Variables*
%
% With the notable exception of structures, variable names should be mixed
% case.
%
% e.g. wayPoints or unprocessedData
%
% *2. Variables representing the number of objects:* 
%
% These should contain the prefix _n_ unless specifying number of rows, in
% which case the name should contain _m_. These are helpful for clearly
% denoting that the variable has a discrete value.
%
% e.g. nComputers or mRows
%
% *3. Plural variable*
%
% The best practice is to make all variables singular and to use the suffix
% Array to denote plurals
%
% e.g. pit and pitArray
%
% *4. Variables representing a single entity number:*
% 
% These variables should contain the suffix No. They can also contain i to
% indicate that the variable is an iterator. These help further denote the
% nature of a variable.
%
% e.g. partNo or iSample
%
% *5. Boolean Variables:*
% 
% Boolean variables are used to denote a statement as True or False. They
% should never be negative. These can be used to determine values above or
% below a threshold.
%
% e.g. isOver or isNegative
%
% *6. Variables representing named constants:*
%
% These variables are helpful for recalling single values repeatedly. They
% should be in all caps, with underscores between words.
%
% e.g. PLANCKS_CONSTANT or AIR_TEMPERATURE
%
% *7. Structures and Functions*
% 
% Structures can be used to more efficiently organize data. Their names 
% should begin with a capital letter. Functions are pieces of code that can 
% be called to accept inputs and produce outputs. Their names should be all 
% lower case.
%
% e.g. Streamflow or computeevaporation
