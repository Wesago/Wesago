import React from 'react';
import Layout from '@theme/Layout';
import Misago1 from '../../static/img/misago-forum.png';
import Misago2 from '../../static/img/misago-thread.png';

export default function Home() {
  return (
    <Layout>

      <div className="relative pb-20">

        {/* Illustration bg */}
        <div className="absolute left-1/2 transform -translate-x-1/2 bottom-0 pointer-events-none -z-1
        " aria-hidden="true">
          <div className="dark:hidden hideOnMobile">
            <svg width="1360" height="578" viewBox="0 0 1360 578" xmlns="http://www.w3.org/2000/svg">
              <defs>
                <linearGradient x1="50%" y1="0%" x2="50%" y2="100%" id="illustration-01">
                  <stop stopColor="#FFF" offset="0%" />
                  <stop stopColor="#fb923c" offset="77.402%" />
                  <stop stopColor="#F97316" offset="100%" />
                </linearGradient>
              </defs>
              <g fill="url(#illustration-01)" fillRule="evenodd">
                <circle cx="1102" cy="128" r="100" />
                <circle cx="250" cy="410" r="50" />
              </g>
            </svg>
          </div>
        </div>

        {/* Banner content */}
        <div className="max-w-6xl mx-auto px-4 sm:px-6">
          <div className="pt-32 pb-12 md:pt-40 md:pb-10">
            <div className="text-center pb-12 md:pb-16">
              <h1 className="text-5xl md:text-6xl font-extrabold leading-tighter tracking-tighter mb-4" data-aos="zoom-y-out">Let us introduce you <span className="bg-clip-text text-transparent bg-gradient-to-r from-orange-600 to-orange-400">Wesago</span></h1>
              <div className="max-w-3xl mx-auto">
                <p className="text-xl text-gray-600 mt-8 mb-8" data-aos="zoom-y-out" data-aos-delay="150">Do you have any problem? Do you want to know something about your department or course at the university? Ask on Wesago and someone will help you :)</p>
                <div className="max-w-xs mx-auto sm:max-w-none sm:flex sm:justify-center" data-aos="zoom-y-out" data-aos-delay="300">
                  <div>
                    <a className="px-8 py-3 shadow-lg font-medium inline-flex items-center justify-center border border-transparent rounded leading-snug transition duration-150 ease-in-out text-white hover:text-white bg-orange-600 hover:bg-orange-700 w-full mb-4 sm:w-auto sm:mb-0 hover:no-underline" href="#0">Go to Wesago</a>
                  </div>
                  <div>
                    <a className="px-8 py-3 shadow-lg font-medium inline-flex items-center justify-center border border-transparent rounded leading-snug transition duration-150 ease-in-out dark:bg-gray-700 text-white bg-gray-900 hover:bg-gray-800 hover:no-underline w-full sm:w-auto sm:ml-4" href="https://github.com/Wesago">Github</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>


      {/* What is Wesago */}
      <div className="py-16 bg-orange-100 dark:bg-gray-800 rounded-lg shadow-lg">
        <div className="max-w-3xl mx-auto text-center pb-6">
          <p className="text-3xl font-extrabold leading-tight tracking-tighter mb-4">What is Wesago?</p>
          <p className="text-xl text-gray-600 dark:text-gray-500 px-5 md:px-0 lg:px-0">
            Wesago is a modern forum for students and teachers at the University of Aveiro. It is a place where you can ask questions about your department, subjects, or anything else that you want to know. You can, <b><u>and should</u></b>, help others by answering their questions.
          </p>
        </div>

        <div className="md:grid md:grid-cols-2 w-4/5 mx-auto gap-6">
          <div className='flex flex-col justify-center'>
                <img className="rounded-lg shadow-2xl" src={Misago1} alt="Wesago" />
          </div>

          <div className="flex flex-col justify-center pt-5 md:pt-0 lg:pt-0">
                <img className="rounded-lg shadow-2xl" src={Misago2} alt="Wesago" />
          </div>
        </div>
      </div>


      {/* Functionalies */}
      <div className="relative max-w-6xl mx-auto px-4 sm:px-6 pt-12 md:pt-20 pb-32">

          <div className="max-w-3xl mx-auto text-center pb-12 md:pb-10">
            <p className="text-3xl font-extrabold leading-tight tracking-tighter mb-4">What can you do with Wesago?</p>
            <p className="text-xl text-gray-600 dark:text-gray-500">
              With Wesago you can...
            </p>
          </div>

          {/* Items */}
          <div className="max-w-sm mx-auto grid gap-6 md:grid-cols-2 lg:grid-cols-3 items-start md:max-w-2xl lg:max-w-none">

            {/* 1st item */}
            <div className="relative flex flex-col items-center p-6 bg-white dark:bg-gray-800 rounded shadow-xl">
              <svg className="w-16 h-16 p-1 -mt-1 mb-2" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg">
                <g fill="none" fillRule="evenodd">
                  <rect className="fill-current text-orange-600" width="64" height="64" rx="32" />
                  <g strokeWidth="2">
                    <path className="stroke-current text-orange-300" d="M34.514 35.429l2.057 2.285h8M20.571 26.286h5.715l2.057 2.285" />
                    <path className="stroke-current text-white" d="M20.571 37.714h5.715L36.57 26.286h8" />
                    <path className="stroke-current text-orange-300" strokeLinecap="square" d="M41.143 34.286l3.428 3.428-3.428 3.429" />
                    <path className="stroke-current text-white" strokeLinecap="square" d="M41.143 29.714l3.428-3.428-3.428-3.429" />  
                  </g>
                </g>
              </svg>
              <p className="text-xl font-bold leading-snug tracking-tight mb-1">Create categories</p>
              <p className="text-gray-600 text-center dark:text-gray-500">Create categories with an unlimited number and depth of subcategories</p>
            </div>

            {/* 2nd item */}
            <div className="relative flex flex-col items-center p-6 bg-white dark:bg-gray-800 rounded shadow-xl">
              <svg className="w-16 h-16 p-1 -mt-1 mb-2" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg">
                <g fill="none" fillRule="evenodd">
                  <rect className="fill-current text-orange-600" width="64" height="64" rx="32" />
                  <g strokeWidth="2" transform="translate(19.429 20.571)">
                    <circle className="stroke-current text-white" strokeLinecap="square" cx="12.571" cy="12.571" r="1.143" />
                    <path className="stroke-current text-white" d="M19.153 23.267c3.59-2.213 5.99-6.169 5.99-10.696C25.143 5.63 19.514 0 12.57 0 5.63 0 0 5.629 0 12.571c0 4.527 2.4 8.483 5.99 10.696" />
                    <path className="stroke-current text-orange-300" d="M16.161 18.406a6.848 6.848 0 003.268-5.835 6.857 6.857 0 00-6.858-6.857 6.857 6.857 0 00-6.857 6.857 6.848 6.848 0 003.268 5.835" />
                  </g>
                </g>
              </svg>
              <p className="text-xl font-bold leading-snug tracking-tight mb-1">Create public threads</p>
              <p className="text-gray-600 text-center dark:text-gray-500">Create public threads and start a discussion with the community</p>
            </div>

            {/* 3rd item */}
            <div className="relative flex flex-col items-center p-6 bg-white dark:bg-gray-800 rounded shadow-xl">
              <svg className="w-16 h-16 p-1 -mt-1 mb-2" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg">
                <g fill="none" fillRule="evenodd">
                  <rect className="fill-current text-orange-600" width="64" height="64" rx="32" />
                  <g strokeWidth="2">
                    <path className="stroke-current text-orange-300" d="M34.743 29.714L36.57 32 27.43 43.429H24M24 20.571h3.429l1.828 2.286" />
                    <path className="stroke-current text-white" strokeLinecap="square" d="M34.743 41.143l1.828 2.286H40M40 20.571h-3.429L27.43 32l1.828 2.286" />
                    <path className="stroke-current text-orange-300" d="M36.571 32H40" />
                    <path className="stroke-current text-white" d="M24 32h3.429" strokeLinecap="square" />
                  </g>
                </g>
              </svg>
              <p className="text-xl font-bold leading-snug tracking-tight mb-1">Create private threads</p>
              <p className="text-gray-600 text-center dark:text-gray-500">Create private threads and talk with your friends privately</p>
            </div>

            {/* 4th item */}
            <div className="relative flex flex-col items-center p-6 bg-white dark:bg-gray-800 rounded shadow-xl">
              <svg className="w-16 h-16 p-1 -mt-1 mb-2" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg">
                <g fill="none" fillRule="evenodd">
                  <rect className="fill-current text-orange-600" width="64" height="64" rx="32" />
                  <g strokeWidth="2">
                    <path className="stroke-current text-white" d="M32 37.714A5.714 5.714 0 0037.714 32a5.714 5.714 0 005.715 5.714" />
                    <path className="stroke-current text-white" d="M32 37.714a5.714 5.714 0 015.714 5.715 5.714 5.714 0 015.715-5.715M20.571 26.286a5.714 5.714 0 005.715-5.715A5.714 5.714 0 0032 26.286" />
                    <path className="stroke-current text-white" d="M20.571 26.286A5.714 5.714 0 0126.286 32 5.714 5.714 0 0132 26.286" />
                    <path className="stroke-current text-orange-300" d="M21.714 40h4.572M24 37.714v4.572M37.714 24h4.572M40 21.714v4.572" strokeLinecap="square" />
                  </g>
                </g>
              </svg>
              <p className="text-xl font-bold leading-snug tracking-tight mb-1">Create pools</p>
              <p className="text-gray-600 text-center dark:text-gray-500">Create pools and ask the community about their opinion</p>
            </div>

            {/* 5th item */}
            <div className="relative flex flex-col items-center p-6 bg-white dark:bg-gray-800 rounded shadow-xl">
              <svg className="w-16 h-16 p-1 -mt-1 mb-2" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg">
                <g fill="none" fillRule="evenodd">
                  <rect className="fill-current text-orange-600" width="64" height="64" rx="32" />
                  <g strokeWidth="2">
                    <path className="stroke-current text-white" d="M19.429 32a12.571 12.571 0 0021.46 8.89L23.111 23.11A12.528 12.528 0 0019.429 32z" />
                    <path className="stroke-current text-orange-300" d="M32 19.429c6.943 0 12.571 5.628 12.571 12.571M32 24a8 8 0 018 8" />
                    <path className="stroke-current text-white" d="M34.286 29.714L32 32" />
                  </g>
                </g>
              </svg>
              <p className="text-xl font-bold leading-snug tracking-tight mb-1">Follow users</p>
              <p className="text-gray-600 text-center dark:text-gray-500">Follow users and get notifications when they create a new thread</p>
            </div>

            {/* 6th item */}
            <div className="relative flex flex-col items-center p-6 bg-white dark:bg-gray-800 rounded shadow-xl">
              <svg className="w-16 h-16 p-1 -mt-1 mb-2" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg">
                <g fill="none" fillRule="evenodd">
                  <rect className="fill-current text-orange-600" width="64" height="64" rx="32" />
                  <g strokeWidth="2" strokeLinecap="square">
                    <path className="stroke-current text-white" d="M29.714 40.358l-4.777 2.51 1.349-7.865-5.715-5.57 7.898-1.147L32 21.13l3.531 7.155 7.898 1.147L40 32.775" />
                    <path className="stroke-current text-orange-300" d="M44.571 43.429H34.286M44.571 37.714H34.286" />
                  </g>
                </g>
              </svg>
              <p className="text-xl font-bold leading-snug tracking-tight mb-1">Easy search</p>
              <p className="text-gray-600 text-center dark:text-gray-500">Search for threads, categories, and users with a simple and easy search</p>
            </div>

          </div>

      </div>

    </Layout>
  );
}
