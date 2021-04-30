# Array_Monkey_Patching

## Iteration Exercises
We're going to implement some Array methods. There are descriptions for each method, but it may help to also consult the official Ruby docs for Enumerable and Array. These are good resources in general, and useful reading during this first week.

Note: Unlike in the prepwork, there are no specs to compare against. You'll have to test your code in pry.

Learning Goals
- Be able to create directories and files from the command line
- Know how to extend classes
- Know how to use pry to test methods
- Be able to write methods that take a block as an argument
- Get comfortable reasoning about how enumerable methods work with arrays
- Start by opening the terminal and changing your directory to the Desktop using the cd command. 
- Create a new directory for your work using the mkdir command and then open a new file in VS Code called enumerables.rb using the code command.

```Ruby
  def my_flatten
        flattened = []

        self.my_each do |ele|
            if ele.is_a?(Array)
                flattened.concat(ele.my_flatten)
            else
                flattened << ele
            end
        end

        flattened
    end
```
