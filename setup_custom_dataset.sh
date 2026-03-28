#!/bin/bash
# Copy the custom dataset from CoR-GS into the FSGS expected structure.
# Run this on your server: bash setup_custom_dataset.sh

FSGS_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC_DIR="/workspace/CoR-GS/custom_Dataset_blender"
DST_DIR="${FSGS_DIR}/dataset/custom_scene"

mkdir -p "${DST_DIR}"

# Copy transforms JSONs
cp "${SRC_DIR}/transforms_train.json" "${DST_DIR}/"
cp "${SRC_DIR}/transforms_test.json"  "${DST_DIR}/"

# Copy all RGB images
cp "${SRC_DIR}"/rgb_*.png "${DST_DIR}/"

# Copy point cloud into the expected location (0_views/dense/fused.ply)
# n_views=0 means "use all views", FSGS looks for "0_views/dense/fused.ply"
mkdir -p "${DST_DIR}/0_views/dense"
cp "${SRC_DIR}/points3d.ply" "${DST_DIR}/0_views/dense/fused.ply"

echo "Dataset copied to ${DST_DIR}"
echo "Contents:"
ls -la "${DST_DIR}/"
echo ""
echo "Point cloud:"
ls -la "${DST_DIR}/0_views/dense/"
