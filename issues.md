## CONTEXT

##### WHAT USER STORY YOU ARE WORKING ON:

I am working on the user story "As a Admin I want to be able make playlists from RA DJ Charts."  [Pivital Tracker ID#](https://www.pivotaltracker.com/story/show/68318564 "Pivitol Tracker ID")

##### WHAT YOU ARE TRYING TO DO:

I am trying be abel to have admin generate playlists that
any user can play.

##### DETAILED DESCRIPTION OF THE BUG/ERROR:

I've spent hours trying to figure out the best way to do this. I thought it made sense to have nested rought where Playlists belong to Users.  But the problem is that I don't know how to grant other users access to the Playlists I create as admin.  I thought of perhaps creating a seperate tabel called FeaturedLists which would have a same structure as user playlists but showable to anyone.  Is there a better way to do this?  How can I have a dynamic site which allows playlists I make as Admin accessible on the homepage?

## WHAT I'VE TRIED

There is no error message. I don't get errors, I just litereally have no idea how to approach this.  I'm thinking that maybe playists should just exsist on their own, not nested, and not belonging to users.  But this seeems wrong becuase then how can anyone including admin edit those lists.  I'm so hung up here and cannont find anything online close to helping me figure this out.

## QUESTION
What is the best way to approach this?  Create a new table just for admins and restrict access in routes? but make show available to anyone?  Is there a way to pull the playlist dynamically from my user account when any random user lands on my site?