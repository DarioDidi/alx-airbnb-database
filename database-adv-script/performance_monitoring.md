Identified Bottlenecks:

    The rating calculation query was performing full table scans
    
    Some complex JOINs were not using optimal join order
    
    Certain aggregate functions were recalculating for entire tables

Implemented Solutions:

    Created a composite index on (property_id, rating) in the Review table
    
    Added query hints to force better join order in critical queries
    
    Created a summary table for property ratings that refreshes nightly
