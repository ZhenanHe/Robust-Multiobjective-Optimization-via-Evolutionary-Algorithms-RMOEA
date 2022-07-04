function f = initialize_variables(N,n,func)

for i=1:N
    % Initialize each decision variable
    f1=zeros(1,n);
    for j=1:n
        if j<2
           f1(1,j)=0.025+0.95*rand(1); 
        %elseif j<3
           %f1(1,j)=-0.125+1.10*rand(1); 
        else
           f1(1,j)=-0.975+rand(1)*1.95;
        end
    end
    % Evaluate the objective function
    f(i,:) = evaluate_objective(f1,func);
end

