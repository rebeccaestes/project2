# Track 12

A concert-tracking app (similar to Bands In Town) that gathers information about concerts in your area and allows you to mark the ones you're attending.

NOTES:
I started this app thinking I would have just three databases: Users, Concerts, and Attendances. I ended up taking the venues out of the concert table and making a fourth, so that the user wouldn't have to input the venue website and city every time. In a future version I might do this with artists as well, although I don't have any duplicate concerts for an artist. I also made a Friendships database.

All restricted privileges (e.g., only the person who created a concert can edit it) were done with if/then conditions. Additionally, several pages appear very differently for logged-in users and the public, thanks to if/then conditions. I created the admin privileges by seeding myself as a user and reseeding every time I had to migrate or recreate the database, so that I was always assigned ID #1 - the if/then conditions basically required that current_user be either the user who created a concert, or has an ID of 1. This is certainly not ideal code, but I didn't have time to research and figure out a way to do this. (I think cancancan might have covered it, but I had spend that hour rewriting code I lost after breaking my computer ... )

I think I don't have any bugs that actually break the system, but when an administrator edits a venue or a concert through the admin console, things don't redirect very intuitively. I wanted a way for (regular) users to navigate away from the concert form to add/edit a venue, and then get taken back to the concert form. I couldn't figure how to update two tables on one page (or if it's even possible), so instead I nested the venues in the concerts. That way when you went to create a venue, you would still have the concert ID, so you could be redirected back to the edit page. (This didn't work for creating new concerts, so I just added a note about that on the form.)

However, this means that to edit a venue in the admin console, you have to include a dummy concert ID (I use Concert.last, I think) AND you will be redirected there after making your edits. Essentially, I sacrificed easy admin use for easy regular-user use. (Writing this now I think I wrote that code before implementing the admin functions, so I probably could add an if/then statement to the concert controllers that checks if the user is an admin and redirects them to the console instead ... But I guess if I had more time, I would try to implement a REAL admin status instead of burying myself in more conditionals.)

The HTML validator insisted that my google font code was wrong, and also did not like some line related to my city filter that got inserted on the index page (it's line 64). I don't know where that came from so I don't know how to fix it.

I'm not entirely certain that controllers should have methods like the filter_cities I added to the concert controller, but it works, so ... ??
