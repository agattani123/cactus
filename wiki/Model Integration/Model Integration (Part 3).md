Sources: [cpp/llama-model-loader.h:1-8](), [cpp/llama-model-loader.cpp:1-8]()

### Model Architecture Retrieval

The `llama_model_loader` class provides two methods for retrieving information about the loaded model architecture:

#### `get_arch_name()`

```cpp
std::string llama_model_loader::get_arch_name() const {
    return arch_name;
}
```

This method returns the name of the loaded model architecture as a string.

Sources: [cpp/llama-model-loader.cpp:1-3]()

#### `get_arch()`

```cpp
enum llm_arch llama_model_loader::get_arch() const {
    return llm_kv.arch;
}
```

This method returns the loaded model architecture as an `llm_arch` enum value.

Sources: [cpp/llama-model-loader.cpp:5-7]()

## Conclusion

The "Model Integration" component, represented by the `llama_model_loader` class, provides a unified interface for loading and accessing the underlying language model architecture. It abstracts away the low-level details of the model implementation, allowing other parts of the system to interact with the model in a consistent and standardized manner.