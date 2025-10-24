# CVision - Computer Vision Laboratory Projects

 

A comprehensive collection of Computer Vision laboratory implementations developed in MATLAB, covering fundamental to advanced topics in image processing, feature detection, stereo vision, and motion analysis.


## 📋 Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Laboratory Assignments](#laboratory-assignments)
  - [Lab 2: Image Processing Fundamentals](#lab-2-image-processing-fundamentals)
  - [Lab 4: Blob Detection](#lab-4-blob-detection)
  - [Lab 5: Template Matching and Corner Detection](#lab-5-template-matching-and-corner-detection)
  - [Lab 6: Epipolar Geometry and Fundamental Matrix](#lab-6-epipolar-geometry-and-fundamental-matrix)
  - [Lab 7: Optical Flow and Change Detection](#lab-7-optical-flow-and-change-detection)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [Contributors](#contributors)
- [License](#license)

## 🔍 Overview

This repository contains practical implementations of core Computer Vision algorithms developed as part of university laboratory coursework. Each lab focuses on specific concepts and techniques, progressing from basic image filtering to complex motion analysis.

## 🛠 Prerequisites

- **MATLAB** R2019b or later
- **Image Processing Toolbox**
- **Computer Vision Toolbox** (for some advanced features)

## 📚 Laboratory Assignments

### Lab 2: Image Processing Fundamentals

**Topics Covered:**
- Noise generation and analysis (Gaussian and Salt & Pepper)
- Image filtering techniques
- Moving average filters (3×3, 7×7)
- Low-pass Gaussian filtering
- Image sharpening using frequency domain techniques
- Fourier Transform analysis

**Key Functions:**
- `gaussianNoise.m` - Adds Gaussian noise to images
- `saltPepperDistribution.m` - Generates salt & pepper noise
- `movingAvarage.m` - Implements moving average filter
- `lpGaussianFilter.m` - Low-pass Gaussian filtering
- `sharperedImg.m` - Image sharpening filter
- `transforedMagnitude.m` - FFT magnitude visualization

**Main Script:** `MainLab2.m`

### Lab 4: Blob Detection

**Topics Covered:**
- Scale-space analysis
- Laplacian of Gaussian (LoG) filters
- Multi-scale blob detection using Lindeberg method (1998)
- Non-maxima suppression in scale-space

**Key Functions:**
- `blobs_detection.m` - Main blob detection algorithm
- `show_all_circles.m` - Visualization of detected blobs

**Implementation Details:**
- Scale-normalized LoG filtering
- Automatic radius estimation for detected blobs
- Threshold-based blob selection

### Lab 5: Template Matching and Corner Detection

**Topics Covered:**
- Template matching for object tracking
- Harris corner detection
- Feature extraction and analysis
- Real-time object detection in image sequences

**Key Functions:**
- `RectDetection.m` - Template matching implementation
- `main.m` - Complete pipeline including:
  - Car tracking in traffic sequences
  - Harris corner detector implementation
  - Edge, corner, and flat region classification
  - Centroid computation using region properties

**Features:**
- Multi-scale template matching analysis
- Performance timing comparison
- Region classification (corners, edges, flat regions)
- Centroid detection for corner features

### Lab 6: Epipolar Geometry and Fundamental Matrix

**Topics Covered:**
- 8-point algorithm for fundamental matrix estimation
- Point normalization techniques
- RANSAC for robust estimation
- Epipolar geometry visualization
- Stereo image matching

**Key Functions:**
- `EightPointsAlgorithm.m` - Basic 8-point algorithm
- `EightPointsAlgorithmN.m` - Normalized 8-point algorithm
- `normalise2dpts.m` - Point normalization
- `ransacF.m` - RANSAC implementation for F-matrix
- `visualizeEpipolarLines.m` - Epipolar line visualization
- `findMatches.m` - Feature matching between image pairs
- `similarity.m` - Similarity measurement

**Datasets:**
- Mire image pairs with ground truth points
- Rubik's cube stereo pairs

**Implementation Notes:**
- Both Andrea and Fabio folders contain independent implementations
- SVD-based matrix decomposition
- Rank-2 constraint enforcement
- Epipole computation from null spaces

### Lab 7: Optical Flow and Change Detection

**Topics Covered:**
- Lucas-Kanade optical flow estimation
- Change detection using running average
- Background modeling
- Motion analysis comparison

**Key Functions:**
- `LucasKanade.m` - Core optical flow algorithm
- `TwoFramesLK.m` - Two-frame optical flow wrapper
- `change_detection.m` - Running average background subtraction
- `MotionAlgoComparison.m` - Comparison script for optical flow vs. change detection

**Video Sequences:**
- `sphere/` - Synthetic rotating sphere
- `statua/` - Moving camera around statue
- `videosurveillance/` - Surveillance footage
- `sflowg/` - Additional test sequences

**Features:**
- Spatial and temporal derivative computation
- Neighborhood-based flow estimation
- Binary change detection maps
- Side-by-side algorithm comparison

## 📁 Project Structure

```
CVision/
├── Lab2/                    # Image processing fundamentals
│   ├── MainLab2.m          # Main execution script
│   ├── Immagini/           # Output images
│   └── [filtering functions]
├── Lab4/                    # Blob detection
│   ├── blobs_detection.m
│   └── ImmCar/             # Car images dataset
├── Lab5/                    # Template matching & corners
│   ├── Andrea/             # Andrea's implementation
│   └── Fabio/              # Fabio's implementation
├── Lab6/                    # Epipolar geometry
│   ├── Andrea/             # Andrea's implementation
│   │   ├── Mire/           # Dataset 1
│   │   └── Rubik/          # Dataset 2
│   └── Fabio/              # Fabio's implementation
│       ├── Mire/
│       └── Rubik/
└── Lab7/                    # Optical flow & change detection
    ├── Code/
    │   ├── ChangeDetection/
    │   ├── MotionComparison/
    │   └── OpticalFlow/
    └── Video/              # Test video sequences
```

## 🚀 Usage

### Running Individual Labs

**Lab 2 - Image Filtering:**
```matlab
cd Lab2
MainLab2
```

**Lab 4 - Blob Detection:**
```matlab
cd Lab4
blobs_detection('your_image.png', 2, 5)  % sigma=2, 5 scales
```

**Lab 5 - Template Matching:**
```matlab
cd Lab5/Fabio
main
```

**Lab 6 - Fundamental Matrix:**
```matlab
cd Lab6/Fabio
% Load point correspondences
load('Mire/Mire1.points')
load('Mire/Mire2.points')
% Run 8-point algorithm
F = EightPointsAlgorithmN(P1, P2)
```

**Lab 7 - Optical Flow:**
```matlab
cd Lab7/Code/OpticalFlow
OpticalFlow  % Processes video sequences
```

### Modifying Parameters

Most functions accept parameters for customization:
- **Filter sizes:** 3×3, 7×7, or custom dimensions
- **Noise levels:** Adjustable variance for Gaussian noise
- **Thresholds:** Detection sensitivity in blob and corner detection
- **Neighborhood size:** Window size for optical flow estimation

## 👥 Contributors

This project was developed collaboratively by:
- **Andrea Chiappe** - Collaborative implementations across all labs
- **Fabio Guelfi** - Collaborative implementations across all labs

Multiple implementations (Andrea/Fabio folders) demonstrate different approaches to solving the same problems.

## 📄 License

This project is part of academic coursework. Please check with the course instructors regarding usage and distribution.

## 🔗 References

- Lindeberg, T. (1998). Feature detection with automatic scale selection.
- Harris, C., & Stephens, M. (1988). A combined corner and edge detector.
- Lucas, B. D., & Kanade, T. (1981). An iterative image registration technique.
- Hartley, R., & Zisserman, A. (2003). Multiple View Geometry in Computer Vision.

## 📝 Notes

- Each lab includes detailed README files with specific instructions
- Test images and datasets are provided within respective lab folders
- Code includes both `.m` scripts and `.mlx` MATLAB Live Scripts for interactive execution
- Some functions generate visualizations automatically - check output folders

---

**Last Updated:** October 2025  
**Repository:** CVision - Computer Vision Laboratory Projects
