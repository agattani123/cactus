<details>
<summary>Relevant source files</summary>

The following files were used as context for generating this wiki page:

- [cpp/cactus.h](https://github.com/agattani123/cactus/blob/main/cpp/cactus.h)
- [cpp/llama.h](https://github.com/agattani123/cactus/blob/main/cpp/llama.h)
- [cpp/ggml.h](https://github.com/agattani123/cactus/blob/main/cpp/ggml.h)
- [cpp/mtmd.h](https://github.com/agattani123/cactus/blob/main/cpp/mtmd.h)
- [cpp/outetts.h](https://github.com/agattani123/cactus/blob/main/cpp/outetts.h)

</details>

# Backend Systems

## Introduction

The "Backend Systems" in this project refer to the core components and functionalities responsible for handling language model operations, such as loading models, generating text completions, and managing conversational contexts. These systems are implemented in C++ and provide a foundation for building applications that leverage large language models.

The key components of the Backend Systems include the `cactus_context` class, which encapsulates the state and operations related to a specific language model instance, and various utility functions for tokenization, sampling, and output formatting.

Sources: [cpp/cactus.h]()

## Architecture Overview

The Backend Systems follow a modular architecture, with the `cactus_context` class serving as the central component. This class manages the lifecycle of a language model instance, including loading the model, initializing sampling parameters, and handling text generation.

```mermaid
classDiagram
    class cactus_context {
        -is_predicting: bool
        -is_interrupted: bool
        -has_next_token: bool
        -generated_text: std::string
        -generated_token_probs: std::vector<completion_token_output>
        -num_prompt_tokens: size_t
        -num_tokens_predicted: size_t
        -n_past: size_t
        -n_remain: size_t
        -embd: std::vector<llama_token>
        -params: common_params
        -llama_init: common_init_result
        -model: llama_model*
        -loading_progress: float
        -is_load_interrupted: bool
        -ctx: llama_context*
        -ctx_sampling: common_sampler*
        -templates: common_chat_templates_ptr
        -n_ctx: int
        -truncated: bool
        -stopped_eos: bool
        -stopped_word: bool
        -stopped_limit: bool
        -stopping_word: std::string
        -incomplete: bool
        -lora: std::vector<common_adapter_lora_info>
        -context_full: bool
        -guide_tokens: std::vector<llama_token>
        -next_token_uses_guide_token: bool
        -mtmd_wrapper: cactus_context_mtmd*
        -has_multimodal: bool
        -mtmd_bitmap_past_hashes: std::vector<std::string>
        -vocoder_wrapper: cactus_context_vocoder*
        -has_vocoder: bool
        -audio_tokens: std::vector<llama_token>
        -conversation_active: bool
        -last_chat_template: std::string
        +~cactus_context()
        +rewind()
        +initSampling(): bool
        +loadModel(common_params &params_): bool
        +validateModelChatTemplate(bool use_jinja, const char *name) const: bool
        +getFormattedChatWithJinja(const std::string &messages, const std::string &chat_template, const std::string &json_schema, const std::string &tools, const bool &parallel_tool_calls, const std::string &tool_choice) const: common_chat_params
        +getFormattedChat(const std::string &messages, const std::string &chat_template) const: std::string
        +truncatePrompt(std::vector<llama_token> &prompt_tokens)
        +loadPrompt()
        +loadPrompt(const std::vector<std::string> &media_paths)
        +setGuideTokens(const std::vector<llama_token> &tokens)
        +beginCompletion()
        +endCompletion()
        +nextToken(): completion_token_output
        +findStoppingStrings(const std::string &text, const size_t last_token_size, const stop_type type): size_t
        +doCompletion(): completion_token_output
        +getEmbedding(common_params &embd_params): std::vector<float>
        +bench(int pp, int tg, int pl, int nr): std::string
        +applyLoraAdapters(std::vector<common_adapter_lora_info> lora): int
        +removeLoraAdapters()
        +getLoadedLoraAdapters(): std::vector<common_adapter_lora_info>
        +tokenize(const std::string &text, const std::vector<std::string> &media_paths): cactus_tokenize_result
        +initMultimodal(const std::string &mmproj_path, bool use_gpu): bool
        +isMultimodalEnabled() const: bool
        +isMultimodalSupportVision() const: bool
        +isMultimodalSupportAudio() const: bool
        +releaseMultimodal()
        +processMedia(const std::string &prompt, const std::vector<std::string> &media_paths)
        +initVocoder(const std::string &vocoder_model_path): bool
        +isVocoderEnabled() const: bool
        +getTTSType() const: tts_type
        +getFormattedAudioCompletion(const std::string &speaker_json_str, const std::string &text_to_speak): std::string
        +getAudioCompletionGuideTokens(const std::string &text_to_speak): std::vector<llama_token>
        +decodeAudioTokens(const std::vector<llama_token> &tokens): std::vector<float>
        +releaseVocoder()
    }
```

The `cactus_context` class interacts with other components, such as the `llama_context` and `llama_model` classes, which handle low-level operations related to the language model itself. Additionally, the Backend Systems provide support for multimodal input (e.g., images, audio) through the `mtmd_context` and `outetts` components.

Sources: [cpp/cactus.h]()

## Model Loading and Initialization

The `cactus_context` class provides methods for loading and initializing a language model. The `loadModel` method is responsible for loading the model parameters and initializing the `llama_context` and `llama_model` instances.

```mermaid
sequenceDiagram
    participant Client
    participant cactus_context
    participant llama_context
    participant llama_model

    Client->>cactus_context: loadModel(params)
    cactus_context->>llama_model: Create instance
    llama_model-->>cactus_context: model
    cactus_context->>llama_context: Create instance
    llama_context-->>cactus_context: ctx
    cactus_context-->>Client: Success/Failure
```

The `initSampling` method is used to initialize the sampling parameters for text generation, such as temperature and top-k sampling.

Sources: [cpp/cactus.h:49-52](), [cpp/cactus.h:57-58]()

## Text Generation and Completion

The Backend Systems provide functionality for generating text completions based on a given prompt. The `beginCompletion` and `endCompletion` methods are used to mark the start and end of a completion session, respectively.

```mermaid
sequenceDiagram
    participant Client
    participant cactus_context
    participant llama_context

    Client->>cactus_context: beginCompletion()
    cactus_context->>cactus_context: Initialize completion state
    Client->>cactus_context: nextToken()
    loop Until stopping condition
        cactus_context->>llama_context: llama_sample_token()
        llama_context-->>cactus_context: token, probs
        cactus_context-->>Client: token, probs
    end
    Client->>cactus_context: endCompletion()
    cactus_context->>cactus_context: Clean up completion state
```

The `nextToken` method is responsible for generating the next token in the completion sequence. It interacts with the `llama_context` to perform the actual token sampling and generation.

Sources: [cpp/cactus.h:70-71](), [cpp/cactus.h:73](), [cpp/cactus.h:75-76]()

## Tokenization and Output Formatting

The Backend Systems provide utility functions for tokenizing input text and formatting the generated output. The `tokenize` method is used to convert input text into a sequence of tokens that can be processed by the language model.

```mermaid
sequenceDiagram
    participant Client
    participant cactus_context

    Client->>cactus_context: tokenize(text, media_paths)
    cactus_context->>cactus_context: Tokenize text
    cactus_context->>cactus_context: Process media paths
    cactus_context-->>Client: cactus_tokenize_result
```

The `tokens_to_output_formatted_string` and `tokens_to_str` functions are used to convert the generated token sequences back into human-readable text.

Sources: [cpp/cactus.h:13-14](), [cpp/cactus.h:89]()

## Multimodal Support

The Backend Systems provide support for multimodal input, such as images and audio, through the `mtmd_context` and `outetts` components. The `initMultimodal` method is used to initialize the multimodal context, and the `processMedia` method is used to process media files (e.g., images) as part of the input prompt.

```mermaid
sequenceDiagram
    participant Client
    participant cactus_context
    participant mtmd_context

    Client->>cactus_context: initMultimodal(mmproj_path, use_gpu)
    cactus_context->>mtmd_context: Create instance
    mtmd_context-->>cactus_context: mtmd_ctx
    cactus_context-->>Client: Success/Failure

    Client->>cactus_context: processMedia(prompt, media_paths)
    cactus_context->>mtmd_context: Process media
    mtmd_context-->>cactus_context: Media representations
    cactus_context->>cactus_context: Incorporate media into prompt
```

The Backend Systems also provide support for text-to-speech (TTS) functionality through the `outetts` component. The `initVocoder` method is used to initialize the vocoder model, and the `getFormattedAudioCompletion` method is used to generate audio output from text.

Sources: [cpp/cactus.h:98-102](), [cpp/cactus.h:104-105](), [cpp/cactus.h:106-107](), [cpp/cactus.h:108](), [cpp/cactus.h:110-111](), [cpp/cactus.h:113-116]()

## Conversation Management

The Backend Systems provide functionality for managing conversational contexts and chat templates. The `getFormattedChatWithJinja` and `getFormattedChat` methods are used to format the conversation history and prompts according to specified chat templates.

```mermaid
sequenceDiagram
    participant Client
    participant cactus_context

    Client->>cactus_context: getFormattedChatWithJinja(messages, template, schema, tools, parallel_tool_calls, tool_choice)
    cactus_context->>cactus_context: Format conversation using Jinja template
    cactus_context-->>Client: common_chat_params

    Client->>cactus_context: getFormattedChat(messages, template)
    cactus_context->>cactus_context: Format conversation using basic template
    cactus_context-->>Client: std::string
```

The `validateModelChatTemplate` method is used to validate the compatibility of a chat template with the loaded language model.

Sources: [cpp/cactus.h:61-68](), [cpp/cactus.h:69]()

## Adapter and Prompt Management

The Backend Systems provide functionality for managing language model adapters (e.g., LoRA) and prompts. The `applyLoraAdapters` and `removeLoraAdapters` methods are used to apply and remove LoRA adapters, respectively.

```mermaid
sequenceDiagram
    participant Client
    participant cactus_context
    participant llama_model

    Client->>cactus_context: applyLoraAdapters(lora_adapters)
    cactus_context->>llama_model: Apply LoRA adapters
    llama_model-->>cactus_context: Success/Failure
    cactus_context-->>Client: Result

    Client->>cactus_context: removeLoraAdapters()
    cactus_context->>llama_model: Remove LoRA adapters
    llama_model-->>cactus_context: Success
    cactus_context-->>Client: Success
```

The `truncatePrompt` and `loadPrompt` methods are used to manage the prompt tokens that are used as input to the language model.

Sources: [cpp/cactus.h:78-79](), [cpp/cactus.h:80](), [cpp/cactus.h:81-82](), [cpp/cactus.h:83]()

## Utility Functions

The Backend Systems provide various utility functions for tasks such as finding stopping strings, getting embeddings, and benchmarking.

- `findStoppingStrings`: Used to find stopping strings (e.g., end-of-sequence tokens) in the generated text.
- `getEmbedding`: Used to generate embeddings for a given input text.
- `bench`: Used for benchmarking the language model performance.

Sources: [cpp/cactus.h:77](), [cpp/cactus.h:84](), [cpp/cactus.h:85]()

## Conclusion

The Backend Systems in this project provide a comprehensive set of functionalities for working with large language models. The `cactus_context` class serves as the central component, managing the lifecycle of a language model instance and providing methods for text generation, tokenization, multimodal input processing, and conversation management. The Backend Systems also include support for adapter management, prompt handling, and various utility functions for tasks such as finding stopping strings, generating embeddings, and benchmarking.