This is the documentation of myApp. I have created the app to determine how does the weight changes with time. I have used the `ChickWeight` dataframe. You can find details about the dataframe using `?ChickWeight` in R.

## Basic details about the ChickWeight data frame

The ChickWeight data frame has 578 rows and 4 columns which was taken from an experiment on the effect of diet on early growth of chicks.  
The body weights of the chicks were measured at birth and every second day thereafter until day 20. They were also measured on day 21. There were four groups on chicks on different protein diets.

#### Variables

weight[numeric] - giving the body weight of the chick (gm).  
Time[numeric] - giving the number of days since birth when the measurement was made.  
Chick[ordered factor] - levels 18 < ... < 48 giving a unique identifier for the chick(Total 50). The ordering levels groups chicks on the same diet together and orders them according to their final weight (lightest to heaviest) within diet.  
Diet[factor] - levels 1, ..., 4 indicating which experimental diet the chick received.

## Instructions to use

The app first asks to select the **Diet number**. **Diet** is categorized into 4 types, ranging from 1 to 4. From the specified Diet number it then subsets the chicks (Total chicks are numbered from 1 to 50, it subsets the number of chicks from this range) that were feeded with this diet and it asks to select the **Chick number** for which you want to see the relationship between **Time** and **weight** of the chick. It then plots a graph between Time and weight of the chick specified. It also gives you the functionality to view the change in weight for given specific Time range, you can obtain this functionlity through the **slider**. You can view the full information i.e `Chick Number, Time, Weight, Diet` about the chick selected by hovering over the data points plotted on the interactive graph.
