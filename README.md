# Ollama API on Hugging Face

## Overview
This project demonstrates how to create an `API` for an `LLM model` using Ollama and deploy it on Hugging Face for global access.

## Steps to Deploy on Hugging Face

1. **Create a New Space**  
   - Go to Hugging Face → Spaces → New Space.  
   - Choose “Docker” as the SDK.

2. **Clone the Space**  
   - Clone the space to upload your files.  
   - Open your project folder in the terminal and run:  
     ```sh
     git clone your_space_url
     ```

3. **Upload Your Files to the Space**  
   - Copy `app.py`, `Dockerfile`, and `requirements.txt` from this repository to your project folder.  
   - You can change the model used in Ollama. For example, I used `gemma2:9b-instruct-q5_0`.  
   - If you use a different model, update the model name in both `Dockerfile` and `app.py`.  
   - Be careful when using large models, as Hugging Face Spaces run on CPUs.

4. **Commit and Push**  
   - Commit and push the files to your Hugging Face Space.  
   - Your Space will automatically build and start.  
   - Check the `Build logs` tab for any errors.

5. **Test Your API**  
   - Access the URL of your newly deployed Space at:  
     ```
     https://username-space_name.hf.space/docs
     ```
   - Use `/` for a quick check and `/chat` to test the LLM call.

## URL for This Repository  
You can find the API for this repo [here](https://ahmedsaqr28-gemma2-9b-withollama.hf.space/docs)