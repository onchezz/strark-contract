// 'use client'

import {useState} from 'react'


export default function Buttons (){
    const  [counter, setCounter]  = useState(0);
   function increment(){
     setCounter(counter +1);
   }
   
   function decrement(){
     setCounter(counter -1);
   }
    return (
  <>
    <div className="relative dark:drop-shadow-[0_0_0.3rem_#ffffff70] dark:invert">
     Current count is  {counter}
    </div>
    <div className=" w-full justify-center">
    <button className=" w-full justify-center" onClick={increment}> increment </button>
    <button onClick={decrement}> decrement </button>
    </div> 
    </>
    );
}