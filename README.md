# Aston University Postgraduate Thesis LaTeX Template
---
## About 

This LaTeX template has been designed for use by students studying at Aston University on the following postgraduate degree programmes:
- Master of Science (MSc)
- Master of Arts (MA)
- Master of Philosophy (MPhil)
- Doctor of Medicine (MD)
- Doctor of Business Administration (DBA)
- Doctor of Optometry (DOptom)
- Doctor of Philosophy (PhD)

### Version
v1.0, 4th May 2023

### Regulation Compliance
The template is compliant with the 2022/23 regulations for the submission of theses, which can be found [here][regulations].

### Author
This template was created by Dr Chloe M. Barnes, Department of Computer Science, Aston University. 

---

## Required Preamble Commands

The template has been designed to comply with the formatting specified in the regulations. As such, a number of commands are available to supply author information that will automatically format the information according to the regulations.

| Command   | Result | Use |
| ------ | ------ | ------ |
| `\fullname{Your Full Name}` | Your Full Name | Specify your full name to be used throughout the thesis.|
| `\initials{Y.~F.~Name}` | Y. F. Name | Specify each of the initials given in your name, separated by `.~` to regulate the spacing. |
|`\thesismonth{April}`| April | Specify the month of thesis submission. |
|`\thesisyear{2023}`| 2023 | Specify the year of thesis submission. |
|`\thesistitle{Your Title}`| Your Title | Specify the title of your thesis, line breaks (`\\`) can be used for formatting if desired. |
|`\thesissubtitle{Your Subtitle}`| Your Subtitle | Specify the subtitle of your thesis, line breaks (`\\`) can be used for formatting if desired. **If a subtitle is not required, leave the parameters to the command as empty, e.g. `\thesissubtitle{}`**.|
|`\thesisvolume{1}`| Volume 1 | Specify the volume number of this part of your thesis. **If only one volume is required, use `\thesisvolume{0}`**.|
|`\thesistype{0}`| PhD Thesis / Doctor of Philosophy | Specify the programme of study for this thesis, which will be used to customise the front matter and footers. The available parameters are: <br> - 0 --> PhD Thesis / Doctor of Philosophy <br> - 1 --> MSc Thesis / Master of Science <br> - 2 --> MA Thesis / Master of Arts <br> - 3 --> MPhil Thesis / Master of Philosophy <br> - 4 --> MD Thesis / Doctor of Medicine <br> - 5 --> DBA Thesis / Doctor of Business Administration <br> - 6 --> DOptom Thesis / Doctor of Optometry |
|`\RomanNumeralstrue` or `\RomanNumeralsfalse`| _i,ii,iii..._ or _1,2,3..._| Specifies whether the preamble (pages before the first page of Chapter 1) will have pages numbered with Arabic (1,2,3...) or Roman (i,ii,iii...) numerals.|
|`thesisdraft` (Document Class option)|| If this document class option is used (i.e. `\documentclass[thesisdraft]{thesis-aston}`), then a page will be generated at the end of the manuscript with draft metrics such as how many comments are left to address. |
|`\thesisbibliography{references}`|| Specify the `.bib` file, which is `references.bib` by default. |

`\smallfont`
`\smallfontspaced`
`\bodyfont`

---

## Environments

This template comes with a number of environments that have been created to make formatting of the thesis easier, and in line with the regulations.

### Front Matter Environments

All elements that preceed the first page of Chapter 1 (e.g. title page, abstract, dedication, table of contents, etc.) must be contained within the `thesisfrontmatter` environment:

```
\begin{thesisfrontmatter}
    % All other front matter environments must be placed inside this environment 
    % in the order in which they appear in the remainder of this section. 
    % This environment only needs to contain other environments (e.g. abstract).
\end{thesisfrontmatter}
```

##### Abstract Environment

The `thesisabstract` environment is __mandatory__, and automatically formats a page with the required author and thesis information: title of the thesis (and subtitle if appropriate), the author's full name, the degree programme and the submission year (all of which is provided through the commands in the preamble, described in the previous section). The abstract page is also generated with a header containing the text _Aston University_, and the usual footer is removed.

Example usage:
```
\begin{thesisabstract} [Some, Keywords, Here]

    This environment takes a list of up to 10 keywords as an argument, which should be separated with commas.
    The abstract body must be placed within the environment. The abstract can be up to 300 words.

\end{thesisabstract}
```

##### Dedication Environment

A dedication is __optional__, and must be placed within the `thesisdedication` environment. This takes no arguments, and automatically centralises the dedication vertically and horizontally on the page. The footer is also automatically generated.

Example usage:
```
\begin{thesisdedication}

    To whomever I dedicate this thesis to,\\
    Thank you.

\end{thesisdedication}
```

##### Acknowledgements Environment

Acknowledgements are __optional__, and can be either personal or for collaborators -- or both. This is specified using the argument:
`[0]:` Personal Acknowledgements
`[1]:` Collaborator Acknowledgements
If both personal and collaborator acknowledgements are required, two `thesisacknowledgements` environments are necessary in order for both to be formatted correctly with the appropriate argument.

Example __personal__ usage:
```
\begin{thesisacknowledgements}[0]

    This is a section for personal acknowledgements; the body must be placed within the environment.

\end{thesisacknowledgements}
```

Example __collaborator__ usage:
```
\begin{thesisacknowledgements}[1]

    This is a section for collaborator acknowledgements; the body must be placed within the environment.

\end{thesisacknowledgements}
```

##### Publications and PublicationType Environments

The __optional__ `publications` environment can be used to list any publications that have been submitted or reviewed during the degree programme. Publications are specified using the `\publication` command, using the name specified in the `references.bib` file. 

Further, the __optional__ `publicationtype` environment can be used to distinguish between papers that have been published as part of the thesis, and those that have been published during the studies but are unrelated to the thesis itself. If this is not applicable, the `publicationtype` environment can be omitted. This environment takes one argument that specifies:
`[0]:` that the papers are arising from the thesis.
`[1]:` that the papers are unrelated to the thesis.

Example usage with publications arising from the thesis:
```
\begin{publications}
    \publication{Barnes2019CHARIOTTestbed}
    \publication{Barnes2019saso}
    \publication{Barnes2019SISSY} 
    \publication{Barnes2020CoevolutionaryTasks} 
    \publication{Barnes2020BeyondAgents}
\end{publications}
```

Example usage with a range of publications both arising from, and outside of, the studies:
```
\begin{publications}
    \begin{publicationtype}[0] % Thesis publications 
        \publication{Barnes2019CHARIOTTestbed}
        \publication{Barnes2019saso}
        \publication{Barnes2019SISSY} 
        \publication{Barnes2020CoevolutionaryTasks} 
        \publication{Barnes2020BeyondAgents}
    \end{publicationtype}
    \begin{publicationtype}[1] % Other publications
        \publication{Ghouri2020AAgents}
        \publication{Robinson2021CentralisedAgents}
    \end{publicationtype}
\end{publications}
```

### Chapter Publications Environment

It is possible to list the publications that are based off of work presented within a specific chapter of the thesis using the __optional__ `chapter-publications` environment. If the chapter is not related to any published or submitted papers, this environment can be omitted. This environment takes one argument that specifies how many papers have been __published__ that are based off of the work presented in the chosen chapter. The options are:
`[0]:` No published papers, but some unpublished papers.
`[1]:` One published paper, and any number of unpublished papers.
`[2]:` Two or more published papers, and any number of unpublished papers.

The environment uses two commands to specify the papers that are related to the work presented within the chapter:
`\chappub{name}:` Specify the .bib entry name for a chosen paper that has been published or has been accepted.
`\chapnotpub{name}:` Specify that some of the work has been submitted or is under review at a particular location, if it has not yet been accepted.

##### One Publication 
Example usage:
```
\begin{chapter-publications}[1]
\chappub{Barnes2019saso}
\end{chapter-publications}
```
![Image][1]

##### Two Publications
Example usage:
```
\begin{chapter-publications}[2]
\chappub{Barnes2019saso}
\chappub{Barnes2020BeyondAgents}
\end{chapter-publications}
```
##### One Unpublished Paper
Example usage:
```
\begin{chapter-publications}[0]
\chapnotpub{The work presented in this chapter has been adapted from work submitted for publication at X.}
\end{chapter-publications}
```

##### Two Publications and One Unpublished Paper

Example usage:
```
\begin{chapter-publications}[2]
\chappub{Barnes2019saso}
\chappub{Barnes2020BeyondAgents}
\chapnotpub{Part of the work in this chapter is also under review at Journal Name.}
\end{chapter-publications}
```

##### Appendices

Example usage:

---

## Change Log

| Date   | Notes |
| ------ | ------ |
| 04/05/23 | First version of project. |

---





[regulations]: https://www.aston.ac.uk/graduate-school/current-students-and-supervisors/regulations
[1]: https://github.com/itscholey/Aston-University-Postgraduate-Thesis-Template/blob/main/thesis-template-1-pub.PNG