 Performance Report
Optimization Techniques Applied
Reduced Column Selection:

    Removed unnecessary columns (phone_number, payment_date)

    Only selected fields needed for display

Added Filtering Conditions:

    Limited to bookings from last 6 months

    Added LIMIT 1000 to prevent oversized results

Improved Join Strategy:

    Changed join order based on table sizes

    Used LEFT JOIN only where necessary (Payments)


Added Sorting:
 
    Most recent bookings shown first (better UX)

Index Utilization:

    Assumes proper indexes exist on:
    
    Booking(user_id, property_id, start_date)
    
    User(user_id)
    
    Property(property_id)
    
    Payment(booking_id)
