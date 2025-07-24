<details>
<summary>Relevant source files</summary>

The following files were used as context for generating this wiki page:

- [flutter/lib/vlm.dart](https://github.com/agattani123/cactus/blob/main/flutter/lib/vlm.dart)
- [flutter/lib/types.dart](https://github.com/agattani123/cactus/blob/main/flutter/lib/types.dart)
- [flutter/lib/context.dart](https://github.com/agattani123/cactus/blob/main/flutter/lib/context.dart)
- [flutter/lib/telemetry.dart](https://github.com/agattani123/cactus/blob/main/flutter/lib/telemetry.dart)
- [flutter/lib/remote.dart](https://github.com/agattani123/cactus/blob/main/flutter/lib/remote.dart)
- [flutter/lib/chat.dart](https://github.com/agattani123/cactus/blob/main/flutter/lib/chat.dart)
</details>

# Vision-Language Models

## Introduction

Vision-Language Models (VLMs) are a core component of the Cactus project, enabling the integration of multimodal AI capabilities into applications. VLMs combine computer vision and natural language processing to analyze and generate content involving both text and images. This wiki page provides an overview of the VLM functionality within the Cactus project, covering its architecture, data flow, and key components.

The VLM module supports both local and remote execution modes, allowing developers to choose between on-device processing or leveraging cloud-based services. It also provides features like token streaming, temperature control, and top-k/top-p sampling for fine-tuning the generated output. [Learn more about the Cactus Context module](#cactus-context).

Sources: [vlm.dart](), [types.dart]()

## Initialization and Context

The VLM module relies on the `CactusContext` class for initialization and configuration. The `CactusContext.init()` method is responsible for setting up the necessary resources and parameters for VLM operations.

```dart
vlm._context = await CactusContext.init(initParams);
```

If an error occurs during initialization, the `CactusTelemetry` module is used to log and handle the error.

```dart
CactusTelemetry.error(e, initParams);
```

Sources: [vlm.dart:3](), [context.dart](), [telemetry.dart]()

## Execution Modes

The VLM module supports four execution modes, controlled by the `mode` parameter:

1. **Local**: Performs all processing on the local device.
2. **Remote**: Offloads processing to a remote server or cloud service.
3. **LocalFirst**: Attempts local processing first, falling back to remote if local fails.
4. **RemoteFirst**: Attempts remote processing first, falling back to local if remote fails.

```dart
result = await _handleLocalCompletion(messages, imagePaths, maxTokens, temperature, topK, topP, stopSequences, onToken);
result = await _handleRemoteCompletion(messages, imagePaths, maxTokens, temperature, topK, topP, stopSequences, onToken);
```

If an invalid mode is provided, an `ArgumentError` is thrown.

```dart
throw ArgumentError('Invalid mode: $mode. Must be "local", "remote", "localfirst", or "remotefirst"');
```

Sources: [vlm.dart:12-13,16,20,24,28]()

## Completion Handling

The VLM module provides two main methods for handling completion requests: `_handleLocalCompletion` and `_handleRemoteCompletion`. These methods are responsible for executing the VLM task based on the specified mode and parameters.

### Local Completion

The `_handleLocalCompletion` method is called when the execution mode is set to "local" or "localfirst". It likely involves running the VLM model on the local device, potentially utilizing hardware acceleration or optimized libraries.

```dart
result = await _handleLocalCompletion(messages, imagePaths, maxTokens, temperature, topK, topP, stopSequences, onToken);
```

Sources: [vlm.dart:16,28]()

### Remote Completion

The `_handleRemoteCompletion` method is called when the execution mode is set to "remote" or "remotefirst". It likely involves sending the input data to a remote server or cloud service for processing and receiving the generated output.

```dart
result = await _handleRemoteCompletion(messages, imagePaths, maxTokens, temperature, topK, topP, stopSequences, onToken);
```

Sources: [vlm.dart:12,20,24](), [remote.dart]()

## Error Handling

The VLM module includes error handling mechanisms to gracefully handle exceptions and errors that may occur during execution.

```dart
lastError = e is Exception ? e : Exception(e.toString());
```

If the VLM module is not initialized before attempting to use its functionality, a `CactusException` is thrown.

```dart
throw CactusException('CactusVLM not initialized');
```

Sources: [vlm.dart:18,22,26,30]()

## History Management

The VLM module likely maintains a history of previous messages and interactions, managed by the `_historyManager` component. This history can be reset as needed.

```dart
_historyManager.reset();
```

Sources: [vlm.dart:32](), [chat.dart]()

## Sequence Parameters

The VLM module supports various parameters for controlling the generation of output sequences, such as:

- `maxTokens`: The maximum number of tokens to generate.
- `temperature`: A value controlling the randomness of the generated output.
- `topK`: Limits the output to the top-k most probable tokens at each step.
- `topP`: Limits the output to the top-p percent most probable tokens at each step.
- `stopSequences`: A list of sequences that, when encountered, will cause the generation to stop.

These parameters can be adjusted to fine-tune the output quality and characteristics based on the specific use case.

Sources: [vlm.dart:12,16,20,24,28](), [types.dart]()

## Token Streaming

The VLM module likely supports token streaming, which allows for real-time generation and processing of output tokens as they become available. This is evident from the `onToken` callback parameter present in the completion handling methods.

```dart
result = await _handleLocalCompletion(messages, imagePaths, maxTokens, temperature, topK, topP, stopSequences, onToken);
result = await _handleRemoteCompletion(messages, imagePaths, maxTokens, temperature, topK, topP, stopSequences, onToken);
```

The `onToken` callback can be used to process or display the generated tokens as they are produced, enabling interactive or streaming applications.

Sources: [vlm.dart:16,20,24,28]()

## Conclusion

The Vision-Language Models (VLM) module is a crucial component of the Cactus project, enabling multimodal AI capabilities that combine computer vision and natural language processing. It provides a flexible architecture with support for local and remote execution modes, as well as various parameters for fine-tuning the generated output. The VLM module integrates with other components like `CactusContext`, `CactusTelemetry`, and `_historyManager` to ensure a seamless and robust experience for developers working with multimodal AI applications.