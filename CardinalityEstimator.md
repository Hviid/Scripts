## Old - Multiple single column
EQ_ROWSx / Total ROWS = PropX  
EQ_ROWSy / Total ROWS = PropY  
PropX * PropY * Total ROWS = Estimate

##  New(correlates) - Multiple single column
EQ_ROWSx / Total ROWS = PropX  
EQ_ROWSy / Total ROWS = PropY  
The predicates in the equation are ordered from most selective(fewest rows) => PropLeast to least(most rows) => PropMost
PropLeast * SQRT(PropMost) * Total ROWS = Estimate

## Old - Multi-Column stats
All density * Total ROWS = Estimate

##  New(correlates) - Multi-Column stats
EQ_ROWSx / Total ROWS = PropX
EQ_ROWSy / Total ROWS = PropY
The predicates in the equation are ordered from most selective(fewest rows) => PropLeast to least(most rows)  => PropMost
EQ_ROWSPropLeast * SQRT(PropMost) * Total ROWS = Estimate

### OBS New - No ascending key problem
