# https://vllm.readthedocs.io/en/latest/getting_started/quickstart.html
from vllm import LLM, SamplingParams
import time

def get_prompts(test_case_name):
    if test_case_name == "textx4":
        prompts = [
            "Hello, my name is",
            "The president of the United States is",
            "The capital of France is",
            "The future of AI is",
        ]
        return prompts
    elif test_case_name == "textx1000":
        def back_decode(index):
            # indexing AAA to ZZZ with index. AAA = 0 and ZZZ = 26**3 - 1
            return ''.join([chr(ord('A') + i) for i in [index // 26**2, index // 26 % 26, index % 26]])

        prompts = [back_decode(i) for i in range(1000)]
        return prompts
    elif test_case_name == "3x1":
        prompts = ["vrefvcwefe:::"]
        return prompts



if __name__ == "__main__":
    sampling_params = SamplingParams(temperature=0.8, top_p=0.95, max_tokens=1024)

    #llm = LLM(model="/data/shared/llama-hf/llama-2-70b-hf", tensor_parallel_size=2) # need two A100-80Gß
    llm = LLM(model="/data/shared/llama-hf/llama-2-7b-hf") # need 1 24G
    # llm = LLM(model="test_model_3x1") # need 1 24G
    start_time = time.time()
    outputs = llm.generate(prompts, sampling_params)

    # Print the outputs.
    for output in outputs:
        prompt = output.prompt
        generated_text = output.outputs[0].text
        print(f"Prompt: {prompt!r}, Generated text: {generated_text!r}")

    end_time = time.time()
    print(f"Total time: {end_time - start_time:.2f} seconds for {len(prompts)} prompts, max tokens = 1024.")
