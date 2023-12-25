users = User.create!([
    {name: "admin", password: "admin", password_confirmation: "admin", access_type: :admin_access}, 
    {name: "user", password: "somepassword", password_confirmation: "somepassword", access_type: :standard_access}, 
    {name: "anotheruser", password: "otherpassword", password_confirmation: "otherpassword", access_type: :standard_access}])

categories = Category.create!([{name: "casual"}, {name: "personal"}])

casual_subjects = categories[0].subjects.create!([
    {title: "General Discussion", description: "Place to chat with friends"},
    {title: "Creative Corner", description: "To share your artwork with friends and peers"}
])

personal_subjects = categories[1].subjects.create!([
    {title: "Project Pitch", description: "Shows us what cool projects you are working on!"}
])

general_posts = casual_subjects[0].posts.create!([
    {title: "First post", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula nisl leo.", user: users[1]},
    {title: "Another post", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula nisl leo.", user: users[2]},
    {title: "And one last post", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula nisl leo.", user: users[1]}
])

creative_posts = casual_subjects[1].posts.create!([
    {title: "Small art corner", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula nisl leo.", user: users[2]}
])

first_comments = general_posts[0].comments.create!([
    {body: "Quisque tellus magna, ullamcorper quis nisl sed, sollicitudin accumsan dui.", user: users[1]},
    {body: "Cras pretium dui et metus vulputate faucibus.", user: users[2]},
    {body: "Aenean lacinia sit amet lacus vel egestas. Donec eget ligula leo.", user: users[2]},
    {body: "Quisque tellus magna, ullamcorper quis nisl sed, sollicitudin accumsan dui.", user: users[1]},
    {body: "Curabitur a dolor neque. Vivamus feugiat congue neque vitae aliquet.", user: users[1]}
])

another_comments = general_posts[1].comments.create!([
    {body: "Cras pretium dui et metus vulputate faucibus.", user: users[2]},
    {body: "Aenean lacinia sit amet lacus vel egestas. Donec eget ligula leo.", user: users[2]}
])

art_comments = creative_posts[0].comments.create!([
    {body: "Maecenas nec dapibus sem. Nunc eget convallis urna, ut gravida felis.", user: users[1]}
])