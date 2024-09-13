<script> 
   import { goto } from '$app/navigation'; // Import the SvelteKit navigation function

   let Password
   let ConfirmPassword
   let Username
   let Firstname
   let Lastname
   let BirthDate
   let Mail
   let AboutYslf
   let SelectGender

   async function handleSubmit() {

       const formData = new FormData();
       formData.append('UserName', Username);
       formData.append('FirstName', Firstname);
       formData.append('LastName', Lastname);
       formData.append('BirthDate', BirthDate);
       formData.append('Email', Mail);
       formData.append('AboutMe', AboutYslf);
       formData.append('Gender', SelectGender);
       formData.append('Password', Password);
       formData.append('ConfirmPassword', ConfirmPassword);
    //    formData.append('image', imageValue.files[0]); // Append the image file


        for (let [key, value] of formData.entries()) {
            console.log(`${key}: ${value}`);
        }

       try {
           const response = await fetch('http://localhost:8080/register', {
               method: 'POST',
               headers: {
                'Content-Type': 'application/json' 
            },
               body: JSON.stringify(formData)
           }); 

           if (response.ok) {
               const result = await response.json();
               console.log('File and data uploaded successfully:', result);
           } else {
               console.error('Failed to upload file');
           }
       } catch (error) {
           console.error('Error uploading file:', error);
       }
   }

</script>
<form class="flex flex-col p-5 w-auto md:w-auto sm:w-auto lg-[25vw]">
    <div class="flex m-3 text-blue-500 text-3xl font-bold text-left">Create an account</div>
    
    <input
        type="text"
        id="Username"
        class="m-3 rounded-md p-1.5 border-2 border-gray-500"
        placeholder="Username"
        bind:value={Username}
    />
    <input
        type="text"
        id="Firstname"
        class="m-3 rounded-md p-1.5 border-2 border-gray-500"
        placeholder="Firstname"
        bind:value={Firstname}
    />
    <input
        type="text"
        id="Lastname"
        class="m-3 rounded-md p-1.5 border-2 border-gray-500"
        placeholder="Lastname"
        bind:value={Lastname}
    />

    <input
        type="date"
        id="BirthDate"
        class="m-3 rounded-md p-1.5 border-2 border-gray-500"
        placeholder="BirthDate"
        max="2024-12-31"
        bind:value={BirthDate}
    />

    <select class="m-3 rounded-md p-1.5 border-2 border-gray-500" name="SelectGender" id="SelectGender" bind:value={SelectGender}>
        <option>Homme</option>
        <option>Femme</option>
        <option>Ne pas répondre</option>
    </select>

    <input
        type="email"
        id="Mail"
        class="m-3 rounded-md p-1.5 border-2 border-gray-500"
        placeholder="Mail"
        bind:value={Mail}
    />

    <input
        type="password"
        id="Password"
        class="m-3 rounded-md p-1.5 border-2 border-gray-500"
        placeholder="********"
        bind:value={Password}
    />
    <input
        type="password"
        id="confirmPassword"
        class="m-3 rounded-md p-1.5 border-2 border-gray-500"
        placeholder="********"
        bind:value={ConfirmPassword}
    />

    <button class="ml-auto m-3 p-1 border-2 rounded-md bg-blue-500 text-white w-40" on:click={handleSubmit}>Sign up baby</button>
</form>
