import ReactMarkdown from 'react-markdown'
import 'katex/dist/katex.min.css';
import { useRouter } from 'next/router'
import { faCaretRight, faSearch, faFilePdf, faHome } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import matter from 'gray-matter';
import math from 'remark-math'

import TeX from '@matejmazur/react-katex';

import Head from 'next/head'

const gfm = require('remark-gfm')

const renderers = {
    inlineMath: ({value}) => <TeX math={value} />,
    math: ({value}) => <TeX block math={value} />,
    image: ({
        alt,
        src,
        title,
    }) => (
        <img 
            alt={alt} 
            src={src} 
            title={title} 
            style={{ maxWidth: "min(375px, 80vw)" }}  />
    )
}

const PageRenderer = () => {
    const file = require(`../public/Interesting.md`).default;
    let theFile = matter(file)
    //console.log((matter(require(`../../KBBackup3/${course}/${note}.md`).default)).content)

    return <>
        <Head>
            <title>Interesting!</title>
            <meta name="viewport" content="initial-scale=1.0, width=device-width" />
        </Head>
        <ReactMarkdown plugins={[gfm, math]} children={theFile.content} renderers={renderers}/>
    </>
}

export default PageRenderer
