# !/bin/bash -e

LLAMA_CPP_COMMIT=b775345d788ac16260e7eef49e11fe57ee5677f7
LLAMA_CPP_DIR=llama.cpp

rm -rf "$LLAMA_CPP_DIR"

git clone --depth 1 https://github.com/ggerganov/llama.cpp.git "$LLAMA_CPP_DIR"
(cd "$LLAMA_CPP_DIR" && git fetch --depth 1 origin $LLAMA_CPP_COMMIT && git checkout $LLAMA_CPP_COMMIT)

cp ./llama.cpp/include/llama.h ./cpp/llama.h
cp ./llama.cpp/include/llama-cpp.h ./cpp/llama-cpp.h

cp ./llama.cpp/ggml/include/ggml.h ./cpp/ggml.h
cp ./llama.cpp/ggml/include/ggml-alloc.h ./cpp/ggml-alloc.h
cp ./llama.cpp/ggml/include/ggml-backend.h ./cpp/ggml-backend.h
cp ./llama.cpp/ggml/include/ggml-cpu.h ./cpp/ggml-cpu.h
cp ./llama.cpp/ggml/include/ggml-cpp.h ./cpp/ggml-cpp.h
cp ./llama.cpp/ggml/include/ggml-opt.h ./cpp/ggml-opt.h
cp ./llama.cpp/ggml/include/ggml-metal.h ./cpp/ggml-metal.h
cp ./llama.cpp/ggml/include/gguf.h ./cpp/gguf.h

cp ./llama.cpp/ggml/src/ggml-metal/ggml-metal.m ./cpp/ggml-metal.m
cp ./llama.cpp/ggml/src/ggml-metal/ggml-metal-impl.h ./cpp/ggml-metal-impl.h

cp ./llama.cpp/ggml/src/ggml-cpu/ggml-cpu.c ./cpp/ggml-cpu/ggml-cpu.c
cp ./llama.cpp/ggml/src/ggml-cpu/ggml-cpu.cpp ./cpp/ggml-cpu/ggml-cpu.cpp
cp ./llama.cpp/ggml/src/ggml-cpu/ggml-cpu-impl.h ./cpp/ggml-cpu/ggml-cpu-impl.h
cp ./llama.cpp/ggml/src/ggml-cpu/ggml-cpu-aarch64.h ./cpp/ggml-cpu/ggml-cpu-aarch64.h
cp ./llama.cpp/ggml/src/ggml-cpu/ggml-cpu-aarch64.cpp ./cpp/ggml-cpu/ggml-cpu-aarch64.cpp
cp ./llama.cpp/ggml/src/ggml-cpu/ggml-cpu-quants.h ./cpp/ggml-cpu/ggml-cpu-quants.h
cp ./llama.cpp/ggml/src/ggml-cpu/ggml-cpu-quants.c ./cpp/ggml-cpu/ggml-cpu-quants.c
cp ./llama.cpp/ggml/src/ggml-cpu/ggml-cpu-traits.h ./cpp/ggml-cpu/ggml-cpu-traits.h
cp ./llama.cpp/ggml/src/ggml-cpu/ggml-cpu-traits.cpp ./cpp/ggml-cpu/ggml-cpu-traits.cpp
cp ./llama.cpp/ggml/src/ggml-cpu/common.h ./cpp/ggml-cpu/common.h

cp ./llama.cpp/ggml/src/ggml-cpu/unary-ops.h ./cpp/ggml-cpu/unary-ops.h
cp ./llama.cpp/ggml/src/ggml-cpu/unary-ops.cpp ./cpp/ggml-cpu/unary-ops.cpp
cp ./llama.cpp/ggml/src/ggml-cpu/binary-ops.h ./cpp/ggml-cpu/binary-ops.h
cp ./llama.cpp/ggml/src/ggml-cpu/binary-ops.cpp ./cpp/ggml-cpu/binary-ops.cpp
cp ./llama.cpp/ggml/src/ggml-cpu/vec.h ./cpp/ggml-cpu/vec.h
cp ./llama.cpp/ggml/src/ggml-cpu/vec.cpp ./cpp/ggml-cpu/vec.cpp
cp ./llama.cpp/ggml/src/ggml-cpu/simd-mappings.h ./cpp/ggml-cpu/simd-mappings.h
cp ./llama.cpp/ggml/src/ggml-cpu/ops.h ./cpp/ggml-cpu/ops.h
cp ./llama.cpp/ggml/src/ggml-cpu/ops.cpp ./cpp/ggml-cpu/ops.cpp

cp -r ./llama.cpp/ggml/src/ggml-cpu/amx ./cpp/ggml-cpu/

cp ./llama.cpp/ggml/src/ggml-cpu/llamafile/sgemm.h ./cpp/ggml-cpu/sgemm.h
cp ./llama.cpp/ggml/src/ggml-cpu/llamafile/sgemm.cpp ./cpp/ggml-cpu/sgemm.cpp

cp ./llama.cpp/ggml/src/ggml.c ./cpp/ggml.c
cp ./llama.cpp/ggml/src/ggml-impl.h ./cpp/ggml-impl.h
cp ./llama.cpp/ggml/src/ggml-alloc.c ./cpp/ggml-alloc.c
cp ./llama.cpp/ggml/src/ggml-backend.cpp ./cpp/ggml-backend.cpp
cp ./llama.cpp/ggml/src/ggml-backend-impl.h ./cpp/ggml-backend-impl.h
cp ./llama.cpp/ggml/src/ggml-backend-reg.cpp ./cpp/ggml-backend-reg.cpp
cp ./llama.cpp/ggml/src/ggml-common.h ./cpp/ggml-common.h
cp ./llama.cpp/ggml/src/ggml-opt.cpp ./cpp/ggml-opt.cpp
cp ./llama.cpp/ggml/src/ggml-quants.h ./cpp/ggml-quants.h
cp ./llama.cpp/ggml/src/ggml-quants.c ./cpp/ggml-quants.c
cp ./llama.cpp/ggml/src/ggml-threading.cpp ./cpp/ggml-threading.cpp
cp ./llama.cpp/ggml/src/ggml-threading.h ./cpp/ggml-threading.h
cp ./llama.cpp/ggml/src/gguf.cpp ./cpp/gguf.cpp

cp ./llama.cpp/src/llama.cpp ./cpp/llama.cpp
cp ./llama.cpp/src/llama-chat.h ./cpp/llama-chat.h
cp ./llama.cpp/src/llama-chat.cpp ./cpp/llama-chat.cpp
cp ./llama.cpp/src/llama-context.h ./cpp/llama-context.h
cp ./llama.cpp/src/llama-context.cpp ./cpp/llama-context.cpp
cp ./llama.cpp/src/llama-mmap.h ./cpp/llama-mmap.h
cp ./llama.cpp/src/llama-mmap.cpp ./cpp/llama-mmap.cpp
cp ./llama.cpp/src/llama-kv-cache.h ./cpp/llama-kv-cache.h
cp ./llama.cpp/src/llama-kv-cache.cpp ./cpp/llama-kv-cache.cpp
cp ./llama.cpp/src/llama-model-loader.h ./cpp/llama-model-loader.h
cp ./llama.cpp/src/llama-model-loader.cpp ./cpp/llama-model-loader.cpp
cp ./llama.cpp/src/llama-model-saver.h ./cpp/llama-model-saver.h
cp ./llama.cpp/src/llama-model-saver.cpp ./cpp/llama-model-saver.cpp
cp ./llama.cpp/src/llama-model.h ./cpp/llama-model.h
cp ./llama.cpp/src/llama-model.cpp ./cpp/llama-model.cpp
cp ./llama.cpp/src/llama-adapter.h ./cpp/llama-adapter.h
cp ./llama.cpp/src/llama-adapter.cpp ./cpp/llama-adapter.cpp
cp ./llama.cpp/src/llama-arch.h ./cpp/llama-arch.h
cp ./llama.cpp/src/llama-arch.cpp ./cpp/llama-arch.cpp
cp ./llama.cpp/src/llama-batch.h ./cpp/llama-batch.h
cp ./llama.cpp/src/llama-batch.cpp ./cpp/llama-batch.cpp
cp ./llama.cpp/src/llama-cparams.h ./cpp/llama-cparams.h
cp ./llama.cpp/src/llama-cparams.cpp ./cpp/llama-cparams.cpp
cp ./llama.cpp/src/llama-hparams.h ./cpp/llama-hparams.h
cp ./llama.cpp/src/llama-hparams.cpp ./cpp/llama-hparams.cpp
cp ./llama.cpp/src/llama-impl.h ./cpp/llama-impl.h
cp ./llama.cpp/src/llama-impl.cpp ./cpp/llama-impl.cpp

cp ./llama.cpp/src/llama-vocab.h ./cpp/llama-vocab.h
cp ./llama.cpp/src/llama-vocab.cpp ./cpp/llama-vocab.cpp
cp ./llama.cpp/src/llama-grammar.h ./cpp/llama-grammar.h
cp ./llama.cpp/src/llama-grammar.cpp ./cpp/llama-grammar.cpp
cp ./llama.cpp/src/llama-sampling.h ./cpp/llama-sampling.h
cp ./llama.cpp/src/llama-sampling.cpp ./cpp/llama-sampling.cpp

cp ./llama.cpp/src/unicode.h ./cpp/unicode.h
cp ./llama.cpp/src/unicode.cpp ./cpp/unicode.cpp
cp ./llama.cpp/src/unicode-data.h ./cpp/unicode-data.h
cp ./llama.cpp/src/unicode-data.cpp ./cpp/unicode-data.cpp

cp ./llama.cpp/src/llama-graph.h ./cpp/llama-graph.h
cp ./llama.cpp/src/llama-graph.cpp ./cpp/llama-graph.cpp
cp ./llama.cpp/src/llama-io.h ./cpp/llama-io.h
cp ./llama.cpp/src/llama-io.cpp ./cpp/llama-io.cpp
cp ./llama.cpp/src/llama-memory.h ./cpp/llama-memory.h
cp ./llama.cpp/src/llama-memory.cpp ./cpp/llama-memory.cpp

cp ./llama.cpp/common/log.h ./cpp/log.h
cp ./llama.cpp/common/log.cpp ./cpp/log.cpp
cp ./llama.cpp/common/common.h ./cpp/common.h
cp ./llama.cpp/common/common.cpp ./cpp/common.cpp
cp ./llama.cpp/common/sampling.h ./cpp/sampling.h
cp ./llama.cpp/common/sampling.cpp ./cpp/sampling.cpp
cp ./llama.cpp/common/json-schema-to-grammar.h ./cpp/json-schema-to-grammar.h
cp ./llama.cpp/common/json-schema-to-grammar.cpp ./cpp/json-schema-to-grammar.cpp
cp ./llama.cpp/common/json.hpp ./cpp/json.hpp

cp ./llama.cpp/common/chat.h ./cpp/chat.h
cp ./llama.cpp/common/chat.cpp ./cpp/chat.cpp

cp ./llama.cpp/common/minja/minja.hpp ./cpp/minja/minja.hpp
cp ./llama.cpp/common/minja/chat-template.hpp ./cpp/minja/chat-template.hpp

cp ./llama.cpp/tools/mtmd/mtmd.h ./cpp/tools/mtmd/mtmd.h
cp ./llama.cpp/tools/mtmd/mtmd.cpp ./cpp/tools/mtmd/mtmd.cpp
cp ./llama.cpp/tools/mtmd/clip.h ./cpp/tools/mtmd/clip.h
cp ./llama.cpp/tools/mtmd/clip.cpp ./cpp/tools/mtmd/clip.cpp
cp ./llama.cpp/tools/mtmd/clip-impl.h ./cpp/tools/mtmd/clip-impl.h
cp ./llama.cpp/tools/mtmd/mtmd-helper.cpp ./cpp/tools/mtmd/mtmd-helper.cpp
cp ./llama.cpp/tools/mtmd/mtmd-audio.h ./cpp/tools/mtmd/mtmd-audio.h
cp ./llama.cpp/tools/mtmd/mtmd-audio.cpp ./cpp/tools/mtmd/mtmd-audio.cpp
cp ./llama.cpp/tools/mtmd/miniaudio.h ./cpp/tools/mtmd/miniaudio.h
cp ./llama.cpp/common/stb_image.h ./cpp/tools/mtmd/stb_image.h

files_add_lm_prefix=(
  "./cpp/llama-impl.h"
  "./cpp/llama-impl.cpp"
  "./cpp/llama-vocab.h"
  "./cpp/llama-vocab.cpp"
  "./cpp/llama-grammar.h"
  "./cpp/llama-grammar.cpp"
  "./cpp/llama-sampling.h"
  "./cpp/llama-sampling.cpp"
  "./cpp/llama-adapter.h"
  "./cpp/llama-adapter.cpp"
  "./cpp/llama-arch.h"
  "./cpp/llama-arch.cpp"
  "./cpp/llama-batch.h"
  "./cpp/llama-batch.cpp"
  "./cpp/llama-chat.h"
  "./cpp/llama-chat.cpp"
  "./cpp/llama-context.h"
  "./cpp/llama-context.cpp"
  "./cpp/llama-kv-cache.h"
  "./cpp/llama-kv-cache.cpp"
  "./cpp/llama-model-loader.h"
  "./cpp/llama-model-loader.cpp"
  "./cpp/llama-model-saver.h"
  "./cpp/llama-model-saver.cpp"
  "./cpp/llama-model.h"
  "./cpp/llama-model.cpp"
  "./cpp/llama-mmap.h"
  "./cpp/llama-mmap.cpp"
  "./cpp/llama-hparams.h"
  "./cpp/llama-hparams.cpp"
  "./cpp/llama-cparams.h"
  "./cpp/llama-cparams.cpp"
  "./cpp/llama-graph.h"
  "./cpp/llama-graph.cpp"
  "./cpp/llama-io.h"
  "./cpp/llama-io.cpp"
  "./cpp/llama-memory.h"
  "./cpp/llama-memory.cpp"
  "./cpp/log.h"
  "./cpp/log.cpp"
  "./cpp/llama.h"
  "./cpp/llama.cpp"
  "./cpp/sampling.cpp"
  "./cpp/ggml-cpu/sgemm.h"
  "./cpp/ggml-cpu/sgemm.cpp"
  "./cpp/common.h"
  "./cpp/common.cpp"
  "./cpp/json-schema-to-grammar.h"
  "./cpp/chat.cpp"
  "./cpp/ggml-common.h"
  "./cpp/ggml.h"
  "./cpp/ggml.c"
  "./cpp/gguf.h"
  "./cpp/gguf.cpp"
  "./cpp/ggml-impl.h"
  "./cpp/ggml-cpp.h"
  "./cpp/ggml-opt.h"
  "./cpp/ggml-opt.cpp"
  "./cpp/ggml-metal.h"
  "./cpp/ggml-metal.m"
  "./cpp/ggml-metal-impl.h"
  "./cpp/ggml-quants.h"
  "./cpp/ggml-quants.c"
  "./cpp/ggml-alloc.h"
  "./cpp/ggml-alloc.c"
  "./cpp/ggml-backend.h"
  "./cpp/ggml-backend.cpp"
  "./cpp/ggml-backend-impl.h"
  "./cpp/ggml-backend-reg.cpp"
  "./cpp/ggml-cpu.h"
  "./cpp/ggml-cpu/ggml-cpu-impl.h"
  "./cpp/ggml-cpu/ggml-cpu.c"
  "./cpp/ggml-cpu/ggml-cpu.cpp"
  "./cpp/ggml-cpu/ggml-cpu-aarch64.h"
  "./cpp/ggml-cpu/ggml-cpu-aarch64.cpp"
  "./cpp/ggml-cpu/ggml-cpu-quants.h"
  "./cpp/ggml-cpu/ggml-cpu-quants.c"
  "./cpp/ggml-cpu/ggml-cpu-traits.h"
  "./cpp/ggml-cpu/ggml-cpu-traits.cpp"
  "./cpp/ggml-cpu/common.h"
  "./cpp/ggml-threading.h"
  "./cpp/ggml-threading.cpp"
  "./cpp/ggml-cpu/amx/amx.h"
  "./cpp/ggml-cpu/amx/amx.cpp"
  "./cpp/ggml-cpu/amx/mmq.h"
  "./cpp/ggml-cpu/amx/mmq.cpp"
  "./cpp/ggml-cpu/amx/common.h"
  "./cpp/ggml-cpu/unary-ops.h"
  "./cpp/ggml-cpu/unary-ops.cpp"
  "./cpp/ggml-cpu/binary-ops.h"
  "./cpp/ggml-cpu/binary-ops.cpp"
  "./cpp/ggml-cpu/vec.h"
  "./cpp/ggml-cpu/vec.cpp"
  "./cpp/ggml-cpu/simd-mappings.h"
  "./cpp/ggml-cpu/ops.h"
  "./cpp/ggml-cpu/ops.cpp"
  "./cpp/tools/mtmd/mtmd.h"
  "./cpp/tools/mtmd/mtmd.cpp"
  "./cpp/tools/mtmd/clip.h"
  "./cpp/tools/mtmd/clip.cpp"
  "./cpp/tools/mtmd/clip-impl.h"
  "./cpp/tools/mtmd/mtmd-helper.cpp"
  "./cpp/tools/mtmd/mtmd-audio.h"
  "./cpp/tools/mtmd/mtmd-audio.cpp"
)

OS=$(uname)
for file in "${files_add_lm_prefix[@]}"; do

  if [ "$OS" = "Darwin" ]; then
    sed -i '' 's/GGML_/LM_GGML_/g' $file
    sed -i '' 's/ggml_/lm_ggml_/g' $file
    sed -i '' 's/GGUF_/LM_GGUF_/g' $file
    sed -i '' 's/gguf_/lm_gguf_/g' $file
    sed -i '' 's/GGMLMetalClass/LMGGMLMetalClass/g' $file
  else
    sed -i 's/GGML_/LM_GGML_/g' $file
    sed -i 's/ggml_/lm_ggml_/g' $file
    sed -i 's/GGUF_/LM_GGUF_/g' $file
    sed -i 's/gguf_/lm_gguf_/g' $file
    sed -i 's/GGMLMetalClass/LMGGMLMetalClass/g' $file
  fi
done

files_iq_add_lm_prefix=(
  "./cpp/ggml-quants.h"
  "./cpp/ggml-quants.c"
  "./cpp/ggml.c"
)

for file in "${files_iq_add_lm_prefix[@]}"; do 

  if [ "$OS" = "Darwin" ]; then
    sed -i '' 's/iq2xs_init_impl/lm_iq2xs_init_impl/g' $file
    sed -i '' 's/iq2xs_free_impl/lm_iq2xs_free_impl/g' $file
    sed -i '' 's/iq3xs_init_impl/lm_iq3xs_init_impl/g' $file
    sed -i '' 's/iq3xs_free_impl/lm_iq3xs_free_impl/g' $file
  else
    sed -i 's/iq2xs_init_impl/lm_iq2xs_init_impl/g' $file
    sed -i 's/iq2xs_free_impl/lm_iq2xs_free_impl/g' $file
    sed -i 's/iq3xs_init_impl/lm_iq3xs_init_impl/g' $file
    sed -i 's/iq3xs_free_impl/lm_iq3xs_free_impl/g' $file
  fi
done

echo "Replacement completed successfully!"

# Apply patch
patch -p0 -d ./cpp < ./cpp/patches/common.h.patch
patch -p0 -d ./cpp < ./cpp/patches/common.cpp.patch
patch -p0 -d ./cpp < ./cpp/patches/chat.h.patch
patch -p0 -d ./cpp < ./cpp/patches/chat.cpp.patch
patch -p0 -d ./cpp < ./cpp/patches/log.cpp.patch
patch -p0 -d ./cpp < ./cpp/patches/ggml-metal.m.patch
patch -p0 -d ./cpp < ./cpp/patches/ggml.c.patch
patch -p0 -d ./cpp < ./cpp/patches/ggml-quants.c.patch
patch -p0 -d ./cpp < ./cpp/patches/llama-mmap.cpp.patch
rm -rf ./cpp/*.orig

if [ "$OS" = "Darwin" ]; then

  cd llama.cpp/ggml/src/ggml-metal
  ln -sf ../ggml-common.h .

  xcrun --sdk iphoneos metal -c ggml-metal.metal -o ggml-metal.air -DGGML_METAL_USE_BF16=1
  xcrun --sdk iphoneos metallib ggml-metal.air   -o ggml-llama.metallib
  rm ggml-metal.air
  mv ./ggml-llama.metallib ../../../../cpp/ggml-llama.metallib

  xcrun --sdk iphonesimulator metal -c ggml-metal.metal -o ggml-metal.air -DGGML_METAL_USE_BF16=1
  xcrun --sdk iphonesimulator metallib ggml-metal.air   -o ggml-llama.metallib
  rm ggml-metal.air
  mv ./ggml-llama.metallib ../../../../cpp/ggml-llama-sim.metallib

  rm ggml-common.h

  cd -

  # cd example/ios
  # echo export NODE_BINARY=$(command -v node) > .xcode.env.local
fi
