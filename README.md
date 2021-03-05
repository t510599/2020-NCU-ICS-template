# 2020-NCU-ICS-template

## Requirement
- Windows with `robocopy`
- `7za` in path

## Usage
- create.bat: Create files according to id and files.
- compress.bat: Compress image and code in the folder according to id.

## Folder structure example
```
.
.
├── Assignment
│   └── 1
│       ├── .classpath
│       ├── .project
│       ├── bin
│       ├── src
│       │   ├── a1_109xxxxxx_1
│       │   │   └── Solution.java
│       │   └── a1_109xxxxxx_2
│       │       └── Solution.java
│       ├── a1_109xxxxxx_1.png
│       ├── a1_109xxxxxx_2.png
│       └── 1092作業1.pptx
├── Practice
│   └── 1
│       ├── .classpath
│       ├── .project
│       ├── bin
│       ├── src
│       │   ├── p1_109xxxxxx_1
│       │   │   └── Solution.java
│       │   └── p1_109xxxxxx_2
│       │       └── Solution.java
│       ├── p1_109xxxxxx_1.png
│       ├── p1_109xxxxxx_2.png
│       └── 1092實習1.pptx
├── compress.bat
├── create.bat
└── template-project
    ├── .classpath
    ├── .project
    ├── Solution.java
    ├── bin
    └── src
```

## Notice
To use scripts, please change `109xxxxxx` in filename of template file to your student number, and those in `compress.bat` and `create.bat`.  
Folder can be imported to eclipse directly. ex: `Assignment/1/`.