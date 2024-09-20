export async function fetchUsers() {
    const response = await fetch('https://jsonplaceholder.typicode.com/users');
    return await response.json();
}

export async function fetchAlbums() {
    const response = await fetch('https://jsonplaceholder.typicode.com/albums');
    return await response.json();
}

export async function fetchPhotos() {
    const response = await fetch('https://jsonplaceholder.typicode.com/photos');
    return await response.json();
}

export async function fetchPosts() {
    const response = await fetch('https://jsonplaceholder.typicode.com/posts');
    return await response.json();
}

export async function fetchComments() {
    const response = await fetch('https://jsonplaceholder.typicode.com/comments');
    return await response.json();
}
