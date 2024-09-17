<script>
    let users = [];
    let posts = []
    let comments = []

    // Fetch data when the component is mounted
    const fetchUsers = async () => {
        const response = await fetch('https://jsonplaceholder.typicode.com/users');
        users = await response.json();
    };

    const fetchPosts = async () => {
        const response = await fetch('https://jsonplaceholder.typicode.com/posts')
        posts = await response.json();
        console.log("posts: ", posts);
    };

    const fetchComments= async () => {
        const response = await fetch('https://jsonplaceholder.typicode.com/comments')
        comments = await response.json();
        console.log("comments: ", comments);
    };

    fetchUsers();
    fetchPosts()
    fetchComments()

    const findUserName = (userId) => {
        const user = users.find(user => user.id === userId);
        return user ? user.name : 'Unknown User';
    };

</script>


<section class="flex min-h-screen bg-gray-100">
    <section class="flex min-h-screen w-[280px]"> 
        <section class="flex flex-col bg-gray-500 min-h-screen text-xs">1
                <!-- Render the fetched users -->
                        {#if users.length > 0}
                            <ul>
                                {#each users as user}
                                    <li>ID: {user.id} -- Name: {user.name}</li>
                                {/each}
                            </ul>
                        {:else}
                            <p>Loading...</p>
                        {/if} 
        </section>
        <section class="flex flex-col bg-gray-300 min-h-screen w-auto">2</section>
    </section>
    <section class="flex min-h-screen w-full">
        <section class="flex flex-col bg-gray-200 min-h-screen">
                <div></div>
                <section>
                <textarea class="h-7 w-96 m-2" placeholder="Ecrire le contenu du post"></textarea>
                    <div>
                        <!-- Render the fetched posts -->
                        {#if posts.length > 0}
                        {#each posts as post}
                            <div class="flex flex-col bg-white h-auto p-2 m-5">
                                <div class="flex flex-row justify-around p-4">
                                    <div>Username: {findUserName(post.userId)}</div>
                                    <div class="flex">
                                        <div class="w-4 h-5 bg-red-500"></div>
                                        <div class="w-4 h-5 bg-red-900"></div>
                                    </div>
                                    <div class="flex">
                                        <div class="w-4 h-5 bg-red-500"></div>
                                        <div class="w-4 h-5 bg-red-900"></div>
                                    </div>
                                    <!-- <div>Post ID: {post.id}</div> -->
                                </div>
                                <div class="flex p-2">Title: {post.title}</div>
                                <div class="flex bg-gray-300 p-4">Body: {post.body}</div>
                            </div>
                        {/each}
                    {:else}
                        <p>Loading...</p>
                        {/if}
                    </div>
                </section>
        </section>
        <!-- <section class="bg-gray-600 flex flex-col min-h-screen w-[320px]">4</section> -->
    </section>

</section>

