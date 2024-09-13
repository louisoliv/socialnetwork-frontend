<script>
    import { goto } from '$app/navigation'; // Import the SvelteKit navigation function
 
    let Password = '';
    let ConfirmPassword = '';
    let Username = '';
    let Firstname = '';
    let Lastname = '';
    let BirthDate = '';
    let Mail = '';
    let SelectGender = '';
 
    async function handleSubmit(event) {
        event.preventDefault(); // Prevent the default form submission
 
        if (Password !== ConfirmPassword) {
            console.error('Passwords do not match');
            return;
        }
 
        const formData = {
            UserName: Username,
            FirstName: Firstname,
            LastName: Lastname,
            BirthDate: BirthDate,
            Email: Mail,
            Gender: SelectGender,
            Password: Password,
            ConfirmPassword: ConfirmPassword
        };
 
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
                console.log('Registration successful:', result);
                // Redirect to a different page or perform other actions
               // goto('/success');
            } else {
                console.error('Failed to register');
            }
        } catch (error) {
            console.error('Error during registration:', error);
        }
    }
 </script>
 
 <form class="flex flex-col p-5 w-auto md:w-auto sm:w-auto lg:w-[25vw]" on:submit={handleSubmit}>
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
         max="2024-12-31"
         bind:value={BirthDate}
     />
     <select
         class="m-3 rounded-md p-1.5 border-2 border-gray-500"
         name="SelectGender"
         id="SelectGender"
         bind:value={SelectGender}
     >
         <option value="">Select Gender</option>
         <option value="Homme">Homme</option>
         <option value="Femme">Femme</option>
         <option value="Ne pas répondre">Ne pas répondre</option>
     </select>
     <input
         type="email"
         id="Mail"
         class="m-3 rounded-md p-1.5 border-2 border-gray-500"
         placeholder="Email"
         bind:value={Mail}
     />
     <input
         type="password"
         id="Password"
         class="m-3 rounded-md p-1.5 border-2 border-gray-500"
         placeholder="Password"
         bind:value={Password}
     />
     <input
         type="password"
         id="ConfirmPassword"
         class="m-3 rounded-md p-1.5 border-2 border-gray-500"
         placeholder="Confirm Password"
         bind:value={ConfirmPassword}
     />
 
     <button type="submit" class="ml-auto m-3 p-1 border-2 rounded-md bg-blue-500 text-white w-40">
         Sign up baby
     </button>
 </form>
 